const express = require('express')
const router = express.Router()

const db = require('../db/db')
const session = require('../db/session')
const thumbnail = require('../db/thumbnail')

const fs = require('fs/promises')

changeThumbnail = thumbnail.single('thumbnail')
router.use(session)

const listPost = async(req, res) => {
    console.log("List Post")
    console.log(req.session)
    if (req.session.user) {
        console.log(req.query)
        console.log(req.query.search)
        const searchQuery = req.query.search == undefined ? null : req.query.search
        console.log(searchQuery)
        let result = null
        if (searchQuery == null)
        {
            console.log("Search Pattern none")
            result = await db.query(
                "SELECT title, views, creation_date, thumbnail from Post"
            )
            
        }
        else
        {
            console.log("Search Pattern exists")
            const searchPattern = '%' + searchQuery + '%'
            console.log(searchPattern)
            result = await db.query(
                "SELECT title, views, creation_date, thumbnail from Post where title like $1",
                [searchPattern]
            )
        }
        
        if (result.rowCount < 1)
        {
            console.log("wrong query")
            return res.status(200).json({
                code : -1, 
                result : "Wrong query"
            })
        }

        
        const posts = result.rows
        console.log(posts)

        return res.status(200).send(posts)
        
    }
    else {
        console.log("log-in 안 되있음")
        return res.status(200).json({
            code : -1,
            result : "Need to log-in"
        })
    }
}

router.get('/post', listPost)
module.exports = router;