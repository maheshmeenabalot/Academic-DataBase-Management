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
    password: '6350'
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
    
    app.get("/details", (req,res)=>{
        
        connection.query('SELECT * FROM courses', function async (err, results, fields) {
            res.json(results);
        });
    });



var port = process.env.port || 3000
app.listen(port, function (req, res) {
    console.log(`server started at port ${port}`);
});

