const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const path = require("path");
const indexRouter = require("./index");

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());
app.use(cors());

// MySQL Connection
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "6350",
  database: "College",
});

// Connect to MySQL
connection.connect((err) => {
  if (err) {
    console.error("Error connecting to MySQL:", err);
    return;
  }
  console.log("Connected to MySQL database");
}); 

// Include routes defined in index.js
app.use(indexRouter);

// Route to fetch courses based on department and semester
app.get("/courses", (req, res) => {
  const { Department, Semester } = req.query;
  const query = `SELECT Course_Code, Instructor_Name, Email, Course_Type FROM courses WHERE Department LIKE '%${Department}%' AND Semester LIKE '%${Semester}%'`;
  connection.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching courses:", err);
      res.status(500).json({ error: "Internal server error" });
      return;
    }
    res.json({ courses: results });
  });
});

// Route to handle form submissions
app.post('/submit', (req, res) => {
    const { Student_ID, Course_Codes } = req.body;

    const courseData = Course_Codes.map(courseCode => ([Student_ID, courseCode]));

    connection.query('INSERT INTO course_enrollment (Student_ID, Course_Code) VALUES ?', [courseData], (err, result) => {
        if (err) {
            console.error('Error inserting course data:', err);
            res.status(500).send('Error inserting course data');
            return;
        }
        console.log('Data inserted into MySQL table');
        res.send('Data inserted into MySQL table');
    });
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
