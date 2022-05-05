const fs = require('fs')
const {Pool} = require('pg')
const Session = require('express-session')
const PgSession = require('express-pg-session')(Session)

const path = require('path');
const { builtinModules } = require('module');

const dbConfigFile = fs.readFileSync(path.resolve(__dirname, '../config/dbconfig.json'));
const dbConfigData = JSON.parse(dbConfigFile);
console.log(dbConfigData);

const dbPasswordFile = fs.readFileSync(path.resolve(__dirname, '../config/dbpassword.json'));
const dbPasswordData = JSON.parse(dbPasswordFile);
console.log(dbPasswordData);

const cookiePasswordFile = fs.readFileSync(path.resolve(__dirname, '../config/sessionpassword.json'));
const cookiePasswordData = JSON.parse(cookiePasswordFile);
console.log(cookiePasswordData);

const pool = new Pool(
    {
        user: dbConfigData.user,
        database: dbConfigData.database,
        port : dbConfigData.port,
        host : dbConfigData.host,
        password : dbPasswordData.password,
        ssl : dbConfigData.ssl.rejectUnauthorized
    }
)

const session = Session({
    store : new PgSession({
        pool : pool
    }),
    secret : cookiePasswordData.password,
    resave:false,
    saveUninitialized : true
})

module.exports = session;