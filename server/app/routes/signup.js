
const pg = require('pg');
const fs = require('fs');
const path = require('path');


const multer = require('multer')
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, path.resolve(__dirname, '../profile'))
    },
    filename: function (req, file, cb) {
      cb(null, file.fieldname + '-' + Date.now())
    }
  })

const profile = multer({storage : storage})
const encryptor = require('bcrypt');
const { closeComplete } = require('pg-protocol/dist/messages');
const express = require('express')
const router = express.Router()

const dbConfigFile = fs.readFileSync(path.resolve(__dirname, '../config/dbconfig.json'));
const dbConfigData = JSON.parse(dbConfigFile);
console.log(dbConfigData);

const dbPasswordFile = fs.readFileSync(path.resolve(__dirname, '../config/dbpassword.json'));
const dbPasswordData = JSON.parse(dbPasswordFile);
console.log(dbPasswordData);

const client = new pg.Client(
    {
        user: dbConfigData.user,
        database: dbConfigData.database,
        port : dbConfigData.port,
        host : dbConfigData.host,
        password : dbPasswordData.password,
        ssl : dbConfigData.ssl.rejectUnauthorized
    }
)

client.connect( err => {
    if (err)
    {
        console.log(err);
        throw err;
    }
})

uploadProfile = profile.single('profile')

const createUser = async (req, res, next) => {
    const password = req.body.password
    const encryptedPassword = encryptor.hashSync(password, 10)

    const profileFile = req.file
    console.log(profileFile)
    const profilePath = req.file.path
    console.log(profilePath)
   
    const isSuperUser = false

    const user = [
        req.body.email,
        req.body.name,
        encryptedPassword,
        profilePath,
        isSuperUser
    ]

    console.log(user)

   
    const userExistsResult = await client.query(
        `SELECT * FROM BlogUser where email=$1`,
        [user[0]]
    )
    console.log(userExistsResult)

    if (userExistsResult.rowCount >= 1)
    {
        return res.status(200).json({code : -1, result : "user already exsits"})
    }

    const createUserResult = await client.query(
        `INSERT INTO BlogUser(email, name, password, profile, is_superuser) values ($1, $2, $3, $4, $5)`,
        user
    )
    console.log(createUserResult)

    return res.status(200).json({code : 0, result : "success"})
}

router.post('/signup', uploadProfile, createUser);
module.exports = router;

