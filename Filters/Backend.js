const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
const PORT = process.env.PORT || 3000;

// Configure body parser middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Create MySQL connection
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '5050',
    database: 'college'
});

// Connect to MySQL
connection.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
        return;
    }
    console.log('Connected to MySQL');
});

// Serve static files from the public directory
app.use(express.static('public'));

// Handle POST request from the webpage
app.post('/filter', (req, res) => {
    const { branch, batch, gender, cgpaMin, cgpaMax } = req.body;

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
    });
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});

