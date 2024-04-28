var express = require("express");
var app = express();
var cors = require("cors");
const path = require("path"); // Import path module
const bodyParser = require("body-parser");
app.use(cors());
const router = express.Router();

// Define your routes here
router.get('/', (req, res) => {
    res.send('Hello from index.js');
});

app.use(express.static(path.join(__dirname, 'FrontEND')));



// Export the router
module.exports = router;

const pool = require('./db'); // Import the pool variable

app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.json());

app.get('/contact', function (req, res) {
    res.render('contact', { qs: req.query });
});

app.get("/", (req, res) => {
    res.send("working");
});

app.get("/student", (req, res) => {
    pool.query('SELECT * FROM student', (err, results, fields) => {
        if (err) {
            console.error('Error fetching student data:', err);
            res.status(500).send("Internal Server Error");
        } else {
            res.json(results);
        }
    });
});

app.get("/courses", (req, res) => {
    pool.query('SELECT * FROM courses', (err, results, fields) => {
        if (err) {
            console.error('Error fetching course data:', err);
            res.status(500).send("Internal Server Error");
        } else {
            res.json(results);
        }
    });
});

app.get("/view-courses", (req, res) => {
    const userEmail = req.query.username; // Assuming email is passed as a query parameter

    console.log(`Fetching courses for user ${userEmail}`);

    // Execute MySQL query to select courses associated with the provided email
    pool.query('SELECT * FROM courses WHERE Email = ?', [userEmail], (err, results, fields) => {
        if (err) {
            console.error('Error fetching course data:', err);
            res.status(500).send("Internal Server Error");
        } else {
            res.json(results);
            console.log(results);
        }
    });
});

app.get("/search", (req, res) => {
    const query = req.query.query;
    const searchQuery = '%' + query + '%';
    const sql = `SELECT * FROM student WHERE Student_Name LIKE ? OR Student_ID LIKE ? OR Branch LIKE ? OR Batch LIKE ? OR Gender LIKE ? OR Email LIKE ?`;
    const values = [searchQuery, searchQuery, searchQuery, searchQuery, searchQuery, searchQuery];

    pool.query(sql, values, (err, studentResults) => {
        if (err) {
            console.error("Error fetching student data:", err);
            return res.status(500).send("Internal Server Error");
        }

        pool.query(`SELECT * FROM courses WHERE Course_Code LIKE ? OR Instructor_Name LIKE ? OR School LIKE ? OR Email LIKE ?`, values, (err, courseResults) => {
            if (err) {
                console.error("Error fetching course data:", err);
                return res.status(500).send("Internal Server Error");
            }

            const results = {
                students: studentResults,
                courses: courseResults
            };
            res.json(results);
        });
    });
});

app.post("/submit-form", (req, res) => {
    const { studentID, studentName, branch, batch, gender, email, cgpa } = req.body;

    pool.query('INSERT INTO student (Student_ID, Student_Name, Branch, Batch, Gender, Email, CGPA) VALUES (?, ?, ?, ?, ?, ?, ?)',
        [studentID, studentName, branch, batch, gender, email, cgpa],
        (err, results) => {
            if (err) {
                console.error('Error adding student:', err);
                return res.status(500).send("Internal Server Error");
            }
            console.log('Student added successfully');
            res.json({ message: 'Student added successfully' });
        });
});

app.post("/submit-course", (req, res) => {
    const { courseCode, school, instructorName, email } = req.body;

    pool.query('INSERT INTO courses (Course_Code, School, Instructor_Name, Email) VALUES (?, ?, ?, ?)',
        [courseCode, school, instructorName, email],
        (err, results) => {
            if (err) {
                console.error('Error adding course:', err);
                return res.status(500).send("Internal Server Error");
            }
            console.log('Course added successfully');
            res.json({ message: 'Course added successfully' });
        });
});

app.get('/enrolled-students', (req, res) => {
    const courseCode = req.query.course;

    const query = `SELECT student.Student_ID, student.Student_Name, student.Branch, student.Batch, student.Email
        FROM student
        INNER JOIN course_enrollment ON student.Student_ID = course_enrollment.Student_ID
        WHERE course_enrollment.Course_code = ?`;

    pool.query(query, [courseCode], (err, results) => {
        if (err) {
            console.error('Error fetching enrolled students:', err);
            res.status(500).send('Error fetching enrolled students.');
            return;
        }
        res.json(results);
    });
});

app.get('/filter', (req, res) => {
    const { branch, batch, gender, cgpaMin, cgpaMax } = req.query;

    let sql = 'SELECT * FROM student WHERE 1=1';
    const values = [];

    if (branch) {
        sql += ' AND Branch = ?';
        values.push(branch);
    }
    if (batch) {
        sql += ' AND Batch = ?';
        values.push(batch);
    }
    if (gender) {
        sql += ' AND Gender = ?';
        values.push(gender);
    }
    if (cgpaMin && cgpaMax) {
        sql += ' AND CGPA BETWEEN ? AND ?';
        values.push(parseFloat(cgpaMin), parseFloat(cgpaMax));
    }

    pool.query(sql, values, (err, results) => {
        if (err) {
            console.error('Error executing query:', err);
            res.status(500).json({ error: 'Internal server error' });
            return;
        }
        res.json(results);
    });
});

app.post('/login', (req, res) => {
    const username = req.body.username;
    const password = req.body.password;
    const userType = req.body.userType;

    const sql = 'SELECT * FROM users WHERE username = ? AND password_hash = ?';
    pool.query(sql, [username, password], (err, results) => {
        if (err) {
            console.error('Error querying database: ' + err);
            return res.status(500).json({ error: 'Internal Server Error' });
        }

        if (results.length === 0) {
            // No user found with the provided credentials
            return res.status(401).json({ error: 'Unknown Username' });
        }

        const user = results[0];
        // Check if the user's role matches the provided userType
        if (user.role !== userType) {
            return res.status(401).json({ error: 'Incorrect User Type' });
        }

        // If everything is correct, return success
        res.json({ success: true, user: user });
    });
});



app.get('/student/:username', (req, res) => {
    const username = req.params.username;

    const query = `SELECT * FROM student_profile WHERE Student_ID = ?`;
    pool.query(query, [username], (err, results) => {
        if (err) {
            console.error('Error querying MySQL:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        if (results.length === 0) {
            return res.status(404).json({ error: 'Student not found' });
        }

        // Extract student details from the query results
        const studentDetails = results[0];
        res.json(studentDetails);
    });
});





app.get('/profile', (req, res) => {
    const sql = "SELECT * FROM student_profile WHERE Student_ID = ?";
    const username = req.query.username; // Change parameter name to 'username'

    pool.query(sql, [username], (err, result) => {
        if (err) {
            console.error('Error executing SQL query:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        if (result.length === 0) {
            return res.status(404).json({ error: 'Student not found' });
        }
        res.json(result[0]);
    });
});


app.post('/updateProfile', (req, res) => {
    const { Student_ID, Address, Father_Mobile } = req.body;
    const sql = "UPDATE student_profile SET Address = ?,Father_Mobile=? WHERE Student_ID = ?";
    pool.query(sql, [Address, Father_Mobile, Student_ID], (err, result) => {
        if (err) {
            console.error('Error updating profile:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        res.json({ message: 'Profile updated successfully' });
    });
});

app.post('/get_courses_with_grades', (req, res) => {
    const studentId = req.body.studentId;
    const sql = `SELECT courses.Course_Code, courses.Instructor_Name, courses.Course_Type, courses.Semester,courses.Credit, grades.grade
                 FROM courses 
                 INNER JOIN course_enrollment ON courses.Course_Code = course_enrollment.Course_Code 
                 LEFT JOIN grades ON courses.Course_Code = grades.course_code AND course_enrollment.Student_ID = grades.student_id
                 WHERE course_enrollment.Student_ID = ?`;
    // Use pool.query to execute SQL queries
    pool.query(sql, [studentId], (err, results) => {
        if (err) {
            console.error('Error fetching courses with grades:', err);
            res.status(500).json({ error: 'Internal server error' });
            return;
        }
        res.json(results);
    });
});


app.get("/get-reg-courses", (req, res) => {
    const { Department, Semester } = req.query;
    const query = `SELECT Course_Code, Instructor_Name, Email, Course_Type FROM courses WHERE Department LIKE '%${Department}%' AND Semester LIKE '%${Semester}%'`;
    pool.query(query, (err, results) => {
        if (err) {
            console.error("Error fetching courses:", err);
            res.status(500).json({ error: "Internal server error" });
            return;
        }
        res.json({ courses: results });
    });
});


app.post('/submit-course-reg', (req, res) => {
    const { Student_ID, Course_Codes } = req.body;

    const courseData = Course_Codes.map(courseCode => ([Student_ID, courseCode]));

    pool.query('INSERT INTO course_enrollment (Student_ID, Course_Code) VALUES?', [courseData], (err, result) => {
        if (err) {
            console.error('Error inserting course data:', err);
            res.status(500).send('Error inserting course data');
            return;
        }
        console.log('Data inserted into MySQL table');
        res.send('Data inserted into MySQL table');
    });
});

// Endpoint to fetch the list of instructors
app.get("/instructors", (req, res) => {
    // Execute MySQL query to select all instructors from the database
    pool.query('SELECT * FROM instructor', (err, results) => {
        if (err) {
            console.error('Error fetching instructors:', err);
            return res.status(500).send("Internal Server Error");
        }
        res.json(results); // Send the list of instructors as JSON response
    });
});

app.post("/submit-instructor", (req, res) => {
    const { instructorName, instructorEmail, school } = req.body;

    // Execute MySQL query to insert instructor data into the database
    pool.query('INSERT INTO instructor (Instructor_Name, Instructor_Email, School) VALUES (?, ?, ?)',
        [instructorName, instructorEmail, school],
        (err, results) => {
            if (err) {
                console.error('Error adding instructor:', err);
                return res.status(500).send("Internal Server Error");
            }
            console.log('Instructor added successfully');
            res.json({ message: 'Instructor added successfully' });
        });
});




app.get('/course_reg', (req, res) => {
    res.sendFile(path.join(__dirname, '..', 'FrontEND', './Components/course_reg.html'));
});

app.get('/profile', (req, res) => {
    res.sendFile(path.join(__dirname, '..', 'FrontEND', './Components/profile.html'));
});

app.get('/add-Instructor', (req, res) => {
    res.sendFile(path.join(__dirname, '..', 'FrontEND', './Components/add-Instructor.html'));
});



app.get('/student/:id', (req, res) => {
    const studentID = req.params.id;

    // Query to fetch student data from the database
    const query = `SELECT * FROM student WHERE Student_ID = ?`;

    // Execute the query using MySQL pool
    pool.query(query, [studentID], (error, results) => {
        if (error) {
            console.error('Error fetching student data:', error);
            res.status(500).json({ error: 'Internal server error' });
            return;
        }

        // Check if student data exists
        if (results.length === 0) {
            res.status(404).json({ error: 'Student not found' });
            return;
        }

        // Send student data as JSON response
        res.json(results[0]);
    });
});

app.get('/get-student-profile', (req, res) => {
    // Extract studentId from the query parameters
    const studentId = req.query.studentId;

    // SQL query to retrieve the student's profile data based on their Student_ID
    const sql = 'SELECT Branch FROM student_profile WHERE Student_ID = ?';

    // Execute the SQL query
    pool.query(sql, [studentId], (error, results) => {
        if (error) {
            console.error('Error fetching student profile:', error);
            res.status(500).json({ error: 'Internal server error' });
        } else {
            if (results.length > 0) {
                // Extract department (Branch) from the query results
                const department = results[0].Branch;

                // Send the department data as JSON response
                res.json({ department });
            } else {
                res.status(404).json({ error: 'Student profile not found' });
            }
        }
    });
});



var port = process.env.PORT || 5000
app.listen(port, function (req, res) {
    console.log(`server started at port ${port}`);
});
