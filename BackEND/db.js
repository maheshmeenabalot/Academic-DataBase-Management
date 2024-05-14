// db.js

const mysql = require('mysql');
// const mysql = require('mysql2/promise');
const pool = mysql.createPool({
    connectionLimit: 10,
    host : 'localhost',
    database: 'College_db',
    user : 'root',
    password: '6350'
});

module.exports = pool;