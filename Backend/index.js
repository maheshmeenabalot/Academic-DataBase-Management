var express = require("express");
var app = express();
var cors= require("cors");
app.use(cors());



const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
// app.use(express.json());

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
                console.log(results);
            });
        });
        
       
    });
    
    




var port = process.env.port || 5000
app.listen(port, function (req, res) {
    console.log(`server started at port ${port}`);
});

