const pg = require('pg');
const fs = require('fs');
const path = require('path');

const dbConfigFile = fs.readFileSync(path.resolve(__dirname, '../config/dbconfig.json'));
const dbConfigData = JSON.parse(dbConfigFile);
console.log(dbConfigData);

const dbPasswordFile = fs.readFileSync(path.resolve(__dirname, '../config/dbpassword.json'));
const dbPasswordData = JSON.parse(dbPasswordFile);
console.log(dbPasswordData);

const db = new pg.Client(
    {
        user: dbConfigData.user,
        database: dbConfigData.database,
        port : dbConfigData.port,
        host : dbConfigData.host,
        password : dbPasswordData.password,
        ssl : dbConfigData.ssl.rejectUnauthorized
    }
)

db.connect( err => {
    if (err)
    {
        console.log(err);
        throw err;
    }
})

module.exports = db;