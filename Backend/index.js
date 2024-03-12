var express = require("express");
var app = express();
var cors= require("cors");
const bodyParser = require("body-parser");
// var http = require('http');
app.use(cors());

app.set('view engine', 'ejs');


app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
 app.use(express.json());

// var urlencodedParser = bodyParser.urlencoded({ extended: false });

var mysql = require('mysql');
var connection = mysql.createConnection({
    host : 'localhost',
    database: 'College',
    user : 'root',
    password: 'Root@423'
});
connection.connect(function(err) {
    if (err) {
        console.error('Error connecting: ' + err.stack);
        return;
    }
    console.log('Connected as id ' + connection.threadId);
});

app.get('/contact', function (req, res) {
    res.render('contact', { qs: req.query });
});

    app.get("/",(req,res)=>{
        res.send("working");
    });
    
    app.get("/student", (req,res)=>{
        
        connection.query('SELECT * FROM student', function async (err, results, fields) {
            res.json(results);
        });
    });

    app.get("/courses", (req,res)=>{
        
        connection.query('SELECT * FROM courses', function async (err, results, fields) {
            res.json(results);
        });
    });


    app.get("/search", (req, res) => {
        const query = req.query.query;
        console.log("Received search query:", query);
        
        // Perform search in both tables (students and courses)
        connection.query(`SELECT * FROM student WHERE Student_Name LIKE '%${query}%' OR Student_ID LIKE '%${query}' OR Branch LIKE '%${query}' OR Batch LIKE '%${query}' OR Gender LIKE '%${query}' OR Email LIKE '%${query}'`, (err, studentResults) => {
            if (err) {
                console.error("Error fetching student data:", err);
                return res.status(500).send("Internal Server Error");
            }
    
            console.log("Student Results:", studentResults);
    
            connection.query(`SELECT * FROM courses WHERE Course_Code LIKE '%${query}%' OR Instructor_Name LIKE '%${query}%' OR School LIKE '%${query}%' OR Email LIKE '%${query}%'`, (err, courseResults) => {
                if (err) {
                    console.error("Error fetching course data:", err);
                    return res.status(500).send("Internal Server Error");
                }
    
                console.log("Course Results:", courseResults);
    
                const results = {
                    students: studentResults,
                    courses: courseResults
                };
                res.json(results);
               // console.log(results);
            });
        });
        
       
    });


    // app.get("/search1", (req, res) => {
    //     const searchText = req.query.query;
    //     console.log("Received search query:", searchText);
        
    //     // Split the search text into individual keywords
    //     const keywords = searchText.split(" ");
    
    //     // Initialize WHERE clauses for different search criteria
    //     const whereClauses = [];
    
    //     // Check for specific search criteria and build WHERE clauses accordingly
    //     keywords.forEach(keyword => {
    //         // Check if keyword represents CPI greater than 5
    //         if (keyword.toLowerCase() === "cpi>5") {
    //             whereClauses.push("CPI > 5");
    //         }
    
    //         // Check if keyword represents students in the CSE branch
    //         if (keyword.toLowerCase() === "cse") {
    //             whereClauses.push("Branch = 'CSE'");
    //         }
    
    //         // Check if keyword represents students of the 2020 batch
    //         if (keyword.toLowerCase() === "2020") {
    //             whereClauses.push("Batch = 2020");
    //         }
    //     });
    
    //     // Combine WHERE clauses using AND operator
    //     const whereClause = whereClauses.join(" AND ");
    
    //     // Construct the final SQL query
    //     let sqlQuery = 'SELECT * FROM students';
    //     if (whereClause) {
    //         sqlQuery += ' WHERE ' + whereClause;
    //     }
    
    //     // Execute the SQL query
    //     connection.query(sqlQuery, (err, results) => {
    //         if (err) {
    //             console.error("Error fetching student data:", err);
    //             return res.status(500).send("Internal Server Error");
    //         }
    
    //         res.json(results);
    //         console.log(results);
    //     });
    // });

    app.get("/search1", (req, res) => {
        const sqlQuery = req.query.sql;
        console.log("Received SQL query:", sqlQuery);
    
        // Execute the SQL query
        connection.query(sqlQuery, (err, results) => {
            if (err) {
                console.error("Error executing SQL query:", err);
                return res.status(500).send("Internal Server Error");
            }
    
            res.json(results);
            console.log(results);
        });
    });
    

// sasadvfv
      app.post("/submit-form", (req, res) => {
        const { studentID, studentName, branch, batch, gender, email ,cgpa} = req.body;

        connection.query('INSERT INTO students (Student_ID, Student_Name, Branch, Batch, Gender, Email,CGPA) VALUES (?, ?, ?, ?, ?, ?, ?)', 
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
    //ad course
    app.post("/submit-course", (req, res) => {
        const { courseCode, school, instructorName, email } = req.body;
    
        connection.query('INSERT INTO courses (Course_Code, School, Instructor_Name, Email) VALUES (?, ?, ?, ?)', 
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
    
        // Fetch enrolled students for the given course code from the database
        const query = `
            SELECT student.Student_ID, student.Student_Name, student.Branch, student.Batch, student.Email
            FROM student
            INNER JOIN course_enrollment ON student.Student_ID = course_enrollment.Student_ID
            WHERE course_enrollment.Course_code = ?`;
        
        connection.query(query, [courseCode], (err, results) => {
            if (err) {
                console.error('Error fetching enrolled students:', err);
                res.status(500).send('Error fetching enrolled students.');
                return;
            }
            res.json(results);
            console.log(results);
        });
    });
    
    




    app.get('/filter', (req, res) => {
        const { branch, batch, gender, cgpaMin, cgpaMax } = req.query;
    
        // Construct SQL query based on filter parameters
        let sql = 'SELECT * FROM students WHERE 1=1';
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
        
        // Execute the SQL query
        connection.query(sql, values, (err, results) => {
            if (err) {
                console.error('Error executing query:', err);
                res.status(500).json({ error: 'Internal server error' });
                return;
            }
            res.json(results);      
            console.log(results);
        });
    });
    
    


var port = process.env.port || 5000
app.listen(port, function (req, res) {
    console.log(`server started at port ${port}`);
});

