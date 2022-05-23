const express = require('express')
const router = express.Router()

const db = require('../db/db')
const session = require('../db/session')
const profile = require('../db/profile')

const fs = require('fs/promises')

changeProfile = profile.single('profile')
router.use(session)

const getUserProfile = async (req, res) => {
    console.log("User Profile")
    console.log(req.session)
    if (req.session.user) {
        const id = req.params.id
        console.log(id)
        const result = await db.query(
            "SELECT profile from BlogUser where id=$1",
            [id]
        )
        
        if (result.rowCount < 1)
        {
            console.log("wrong id")
            return res.status(200).json({
                code : -1, 
                result : "Wrong id"
            })
        }

        
        const user = result.rows[0]
        console.log(user)
        console.log(user.profile)

        return res.sendFile(user.profile)
    }
    else {
        console.log("log-in 안 되있음")
        return res.status(200).json({
            code : -1,
            result : "Need to log-in"
        })
    }
}

const getUser = async(req, res) => {
    console.log("User Info")
    console.log(req.session)
    if (req.session.user) {
        const id = req.params.id
        console.log(id)
        const result = await db.query(
            "SELECT email, name from BlogUser where id=$1",
            [id]
        )
        // console.log(result)
        if (result.rowCount < 1)
        {
            console.log("wrong id")
            return res.status(200).json({
                code : -1, 
                result : "Wrong id"
            })
        }

        
        const user = result.rows[0]
        console.log(user)
        
        return res.status(200).json({
            "email" : user.email,
            "name" : user.name
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

const changeUserProfile = async(req, res) => {
    console.log("Change Profile")
    console.log(req.session)
    if (req.session.user) {
        const email = req.session.user.email
        console.log(email)

        const result = await db.query(
            "SELECT profile from BlogUser where email=$1",
            [email]
        )
        // console.log(result)
        if (result.rowCount < 1)
        {
            console.log("wrong email")
            return res.status(200).json({
                code : -1, 
                result : "Wrong email"
            })
        }

        const currentUser = result.rows[0]
        const currentProfile = currentUser.profile
        console.log(currentProfile)

        const newProfile = req.file.path
        console.log(newProfile)

        const result2 = await db.query(
            "UPDATE BlogUser SET profile = $1 WHERE email = $2",
            [newProfile, email]
        )

        console.log(result2)

        await fs.unlink(currentProfile)

        return res.status(200).json({
            code : 0, 
            result : "success"
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

router.get('/user/:id', getUser);
router.get('/user/:id/profile', getUserProfile)

router.put('/profile', changeProfile, changeUserProfile)

module.exports = router;