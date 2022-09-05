// const mongoose = require('mongoose');

// async function connect() {
//     try {
//         await mongoose.connect('mongodb://localhost:27017/quan_ban_hang_dev');
//         console.log('connect successfully !!');
//     } catch (error) {
//         console.log('connect failure !!');
//     }
// }

// module.exports = { connect };
require('dotenv').config();
const mysql = require('mysql');

const conn = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USERNAME,
    password: "",
    database: process.env.DB_DATABASE_NAME,
  });

module.exports = conn;
