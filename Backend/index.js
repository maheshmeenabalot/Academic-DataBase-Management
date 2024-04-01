var express = require("express");
var app = express();
var cors= require("cors");
const bodyParser = require("body-parser");
app.use(cors());

app.set('view engine', 'ejs');

const pool = require('./db'); // Import the pool variable

app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.json());

app.get('/contact', function (req, res) {
    res.render('contact', { qs: req.query });
});

app.get("/",(req,res)=>{
    res.send("working");
});

app.get("/student", (req,res)=>{
    pool.query('SELECT * FROM student', (err, results, fields) => {
        if (err) {
            console.error('Error fetching student data:', err);
            res.status(500).send("Internal Server Error");
        } else {
            res.json(results);
        }
    });
});

app.get("/courses", (req,res)=>{
    pool.query('SELECT * FROM courses', (err, results, fields) => {
        if (err) {
            console.error('Error fetching course data:', err);
            res.status(500).send("Internal Server Error");
        } else {
            res.json(results);
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
    const { studentID, studentName, branch, batch, gender, email ,cgpa} = req.body;

    pool.query('INSERT INTO student (Student_ID, Student_Name, Branch, Batch, Gender, Email, CGPA) VALUES (?, ?, ?, ?, ?, ?, ?)', 
        [studentID, studentName, branch, batch, gender, email,cgpa], 
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

    const sql = 'SELECT * FROM users WHERE username = ? AND password_hash = ?';
    pool.query(sql, [username, password], (err, results) => {
        if (err) {
            console.error('Error querying database: ' + err);
            return res.status(500).json({ error: 'Internal Server Error' });
        }

        if (results.length === 0) {
            return res.status(401).json({ error: 'Authentication Failed' });
        }

        const user = results[0];
        res.json({ success: true, user: user });
    });
});    

app.get('/student/:username', (req, res) => {
    const username = req.params.username;

    const query = `SELECT * FROM student WHERE Student_ID = ?`;
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
    const sql ="SELECT * FROM student WHERE Student_ID = ?";
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

// Endpoint to handle profile update
app.post('/updateProfile', (req, res) => {
    const updatedData = req.body; // Assuming the updated data is sent in the request body

    // Update the profile in the database
    const sql = `UPDATE student SET 
                    Student_Name = ?,
                    Email = ?,
                    Address = ?,
                    Mother_Name = ?,
                    Father_Name = ?,
                    Father_Mobile = ?,
                    Photo = ?,
                    Blood_Group = ?
                 WHERE Student_ID = ?`;

    const { Student_Name, Email, Address, Mother_Name, Father_Name, Father_Mobile, Photo, Blood_Group, Student_ID } = updatedData;

    pool.query(sql, [Student_Name, Email, Address, Mother_Name, Father_Name, Father_Mobile, Photo, Blood_Group, Student_ID], (err, result) => {
        if (err) {
            console.error('Error updating profile:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        res.json({ message: 'Profile updated successfully' });
    });
});

app.post('/updateProfile', (req, res) => {
    const { Student_ID, Student_Name, Email, Address } = req.body;
    const sql = "UPDATE student SET Student_Name = ?, Email = ?, Address = ? WHERE Student_ID = ?";
    pool.query(sql, [Student_Name, Email, Address, Student_ID], (err, result) => {
        if (err) {
            console.error('Error updating profile:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
        res.json({ message: 'Profile updated successfully' });
    });
});

  


var port = process.env.PORT || 5000
app.listen(port, function (req, res) {
    console.log(`server started at port ${port}`);
});
