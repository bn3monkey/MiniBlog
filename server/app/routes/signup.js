
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

const db = require('../db/db')


uploadProfile = profile.single('profile')

const createUser = async (req, res, next) => {
    const emailRegex = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
    if (!emailRegex.test(req.body.email))
    {
        return res.status(200).json(
            {
                code : -2, 
                result : "Not email format"
            }
        )
    }

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

    const userExistsResult = await db.query(
        `SELECT * FROM BlogUser where email=$1`,
        [user[0]]
    )
    console.log(userExistsResult)

    if ( userExistsResult.rowCount >= 1 )
    {
        return res.status(200).json(
            {
                code : -1, 
                result : "user already exsits"
            }
        )
    }

    const createUserResult = await db.query(
        `INSERT INTO BlogUser(email, name, password, profile, is_superuser) values ($1, $2, $3, $4, $5)`,
        user
    )
    console.log(createUserResult)

    return res.status(200).json({
        code : 0, 
        result : "success"
    })
}

router.post('/signup', uploadProfile, createUser);
module.exports = router;

