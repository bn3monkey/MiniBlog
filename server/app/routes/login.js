const express = require('express')
const router = express.Router()
const encryptor = require('bcrypt');

const db = require('../db/db')
const session = require('../db/session')

router.use(session)

const logIn = async (req,res) => {
    console.log("try to login")
    console.log(req.session)
    if (req.session.user) {
        console.log("already log-in")
        return res.status(200).json({
            code : -2, 
            result : "already log-in"
        })
    }

    console.log(req.body)
    const email = req.body.email
    console.log(email)
    const result = await db.query(
        "SELECT email, password from BlogUser where email=$1",
        [email]
    )
    console.log(result);

    if (result.rowCount < 1)
    {
        console.log("wrong id")
        return res.status(200).json({
            code : -1, 
            result : "Wrong email or password"
        })
    }
    console.log(result.rows[0])

    const encryptedPassword = result.rows[0].password
    const password = req.body.password
    const check = await encryptor.compare(password, encryptedPassword)
    if (check) {
        // login 성공한 경우
        console.log("log in success")
        req.session.user = {
            email : email,
            isLogined: true
        }
        const session_result = await req.session.save()
        return res.status(200).json({
            code : 0, 
            result : "log-in success"
        })
    }
    else
    {
        console.log("wrong password")
        return res.status(200).json({
            code : -1, 
            result : "Wrong email or password"
        })
    }
}

const logOut = async (req, res) => {
    console.log("try to log-out")
    console.log(req.session)
    if (req.session.user) {
        const session_result = await req.session.destroy()
        return res.status(200).json({
            code : 0,
            result : "logout-success"
        })
    }
    else {
        console.log("log-in 안 되있음")
        return res.status(200).json({
            code : -1,
            result : "Need to log-in"
        })
    }
}

const bodyParser = require("body-parser")
const parser = bodyParser.urlencoded({extended:false})

router.post('/login', express.json(), logIn);
router.post('/logout', express.json(), logOut);
module.exports = router;