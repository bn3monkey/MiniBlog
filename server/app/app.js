const express = require('express');
const pg = require('pg');
const fs = require('fs');

const hostname = '127.0.0.1';
const port = 8080;

const dbConfigFile = fs.readFileSync('./config/dbconfig.json');
const dbConfigData = JSON.parse(dbConfigFile);
console.log(dbConfigData);

const dbPasswordFile = fs.readFileSync('./config/dbpassword.json');
const dbPasswordData = JSON.parse(dbPasswordFile);
console.log(dbPasswordData);


const app = express();

app.get('/', (req,res)=>{
    res.send('Do you know fucking kimchi?');
});

app.post('/signup', (req,res) => {
    res.send('SANS PAYPRUS PPAP');
});

app.listen(port ,hostname, ()=>{
    console.log(`Do you know fucking kimchi??`);
});


