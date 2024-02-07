var mysql = require('mysql');
var connection = mysql.createConnection({
    host : 'localhost',
    database: 'College',
    user : 'root',
    password: '5050'
});

connection.connect(function(err) {
    if (err) {
        console.error('Error connecting: ' + err.stack);
        return;
    }

    console.log('Connected as id ' + connection.threadId);
});

connection.query('SELECT * FROM student', function (error, results, fields) {
    if (error)
        throw error;
    results.forEach(result => {
        console.log(result);
    });
});

connection.query('SELECT * FROM courses', function (error, results, fields) {
    if (error)
        throw error;
    results.forEach(result => {
        console.log(result);
    });
});
