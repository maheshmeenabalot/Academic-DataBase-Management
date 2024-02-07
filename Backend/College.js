


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


connection.query('SELECT * FROM student', function (error, results, fields) {
    if (error)
        throw error;
    // console.log(results);
    // console.log("flag1");
    
    results.forEach(result => {
        console.log(result);
    });
});



connection.end((err) => {
    if (err) {
      console.error('Error closing database connection:', err);
      return;
    }
    console.log('Database connection closed successfully!');
});
  