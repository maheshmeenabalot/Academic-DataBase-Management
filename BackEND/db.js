// db.js

const mysql = require('mysql');

const pool = mysql.createPool({
    connectionLimit: 10,
    host : 'localhost',
    database: 'College',
    user : 'root',
    password: 'Root@423'
});

module.exports = pool;
