// require('dotenv').config();
// const mysql2 = require('mysql2');
//
//
// const db = mysql2.createConnection({
//     host: process.env.DB_HOST,
//     user: process.env.DB_USER,
//     password: process.env.DB_PASSWORD,
//     database: process.env.DB_NAME
// });
//
// db.connect(err => {
//     if (err) {
//         console.error('Database connection failed: ' + err.stack);
//         return;
//     }
//     console.log('Connected to database.');
// });
//
//
// module.exports = db;



require('dotenv').config();
const mysql2 = require('mysql2/promise');

const db = mysql2.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

module.exports = db;
