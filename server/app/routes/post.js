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
        console.log(req.query.section)
        console.log(req.query.tag)

        const searchQuery = req.query.search == undefined ? null : req.query.search
        console.log(searchQuery)
        const sectionQuery = req.query.section == undefined ? null : req.query.section
        console.log(sectionQuery)
        const tagsQuery =req.query.tag == undefined ? null : 
                            Array.isArray(req.query.tag) ? req.query.tag : [req.query.tag]
        console.log(tagsQuery)
       
        let result = null
        if (searchQuery == null)
        {
            console.log("Search Pattern none")
            if (sectionQuery == null)
            {
                console.log("Section Pattern none")
                if (tagsQuery == null)
                {
                    console.log("Tags Pattern none")
                    result = await db.query(
                        "SELECT title, views, creation_date, thumbnail, TIP.tag_names \
                        FROM POST as P \
                        INNER JOIN ( \
                            SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names \
                            FROM Tags_in_post as inner_tip \
                            INNER JOIN (SELECT id, name FROM Tag) as t \
                            ON inner_tip.tag_id = t.id \
                            GROUP BY inner_tip.post_id \
                        ) as TIP \
                        ON P.id = TIP.post_id"
                    )
                }
                else
                {
                    console.log("Tags Pattern exists")
                    return res.status(200).json({
                        code : -1, 
                        result : "Tags cannot use without Section"
                    })
                }
            }
            else
            {
                console.log("Section Pattern exists")
                if (tagsQuery == null)
                {
                    console.log("Tags Pattern none")
                    result = await db.query(
                        "SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names \
                        FROM POST as P \
                        INNER JOIN ( \
                            SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names \
                            FROM Tags_in_post as inner_tip \
                            INNER JOIN (SELECT id, name FROM Tag) as t \
                            ON inner_tip.tag_id = t.id \
                            GROUP BY inner_tip.post_id \
                        ) as TIP \
                        ON P.id = TIP.post_id \
                        INNER JOIN (SELECT id FROM Section WHERE name=$1) as S \
                        ON P.section_id = S.id",
                        [sectionQuery]
                    )
                }
                else
                {
                    console.log("Tags Pattern exists")
                    result = await db.query(
                        "SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names \
                        FROM POST as P \
                        INNER JOIN ( \
                            SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names \
                            FROM Tags_in_post as inner_tip \
                            INNER JOIN (SELECT id, name FROM Tag WHERE name = ANY ($1)) as t \
                            ON inner_tip.tag_id = t.id \
                            GROUP BY inner_tip.post_id \
                        ) as TIP \
                        ON P.id = TIP.post_id \
                        INNER JOIN (SELECT id FROM Section WHERE name = $2) as S \
                        ON P.section_id = S.id",
                        [tagsQuery, sectionQuery]
                    )
                }
            }           
        }
        else
        {
            console.log("Search Pattern exists")
            const searchPattern = '%' + searchQuery + '%'
            console.log(searchPattern)
            if (sectionQuery == null)
            {
                console.log("Section Pattern none")
                if (tagsQuery == null)
                {
                    console.log("Tags Pattern none")
                    result = await db.query(
                        "SELECT title, views, creation_date, thumbnail, TIP.tag_names \
                        FROM POST as P \
                        INNER JOIN ( \
                            SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names \
                            FROM Tags_in_post as inner_tip \
                            INNER JOIN (SELECT id, name FROM Tag) as t \
                            ON inner_tip.tag_id = t.id \
                            GROUP BY inner_tip.post_id \
                        ) as TIP \
                        ON P.id = TIP.post_id\
                        where title like $1",
                        [searchPattern]
                    )
                }
                else
                {
                    console.log("Tags Pattern exists")
                    return res.status(200).json({
                        code : -1, 
                        result : "Tags cannot use without Section"
                    })
                }
            }
            else
            {
                console.log("Section Pattern exists")
                if (tagsQuery == null)
                {
                    console.log("Tags Pattern none")
                    result = await db.query(
                        "SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names \
                        FROM POST as P \
                        INNER JOIN ( \
                            SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names \
                            FROM Tags_in_post as inner_tip \
                            INNER JOIN (SELECT id, name FROM Tag) as t \
                            ON inner_tip.tag_id = t.id \
                            GROUP BY inner_tip.post_id \
                        ) as TIP \
                        ON P.id = TIP.post_id \
                        INNER JOIN (SELECT id FROM Section WHERE name=$1) as S \
                        ON P.section_id = S.id \
                        where P.title like $2",
                        [sectionQuery, searchPattern]
                    )
                }
                else
                {
                    console.log("Tags Pattern exists")
                    result = await db.query(
                        "SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names \
                        FROM POST as P \
                        INNER JOIN ( \
                            SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names \
                            FROM Tags_in_post as inner_tip \
                            INNER JOIN (SELECT id, name FROM Tag WHERE name = ANY ($1)) as t \
                            ON inner_tip.tag_id = t.id \
                            GROUP BY inner_tip.post_id \
                        ) as TIP \
                        ON P.id = TIP.post_id \
                        INNER JOIN (SELECT id FROM Section WHERE name = $2) as S \
                        ON P.section_id = S.id \
                        WHERE P.title like $3",
                        [tagsQuery, sectionQuery, searchPattern]
                    )
                }
            }
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

const retrievePost = async(req, res) => {
    console.log("Retrieve Post")
    console.log(req.session)
    if (req.session.user) {
        const id = req.params.id
        console.log(id)
        const result = await db.query(
            "SELECT P.title, P.views, P.creation_date, P.thumbnail, P.content, TIP.tag_names \
            FROM ( \
                SELECT id, title, views, creation_date, thumbnail, content FROM Post \
                WHERE id = $1\
            ) as P \
            INNER JOIN ( \
                SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names \
                FROM Tags_in_post as inner_tip \
                INNER JOIN (SELECT id, name FROM Tag) as t \
                ON inner_tip.tag_id = t.id \
                GROUP BY inner_tip.post_id \
            ) as TIP \
            ON P.id = TIP.post_id",
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

        
        const post = result.rows[0]
        console.log(post)

        return res.status(200).send(post)
    }
    else {
        console.log("log-in 안 되있음")
        return res.status(200).json({
            code : -1,
            result : "Need to log-in"
        })
    }
}

const getThumbnail = async (req, res) => {
    console.log("Post Thumbnail")
    console.log(req.session)
    if (req.session.user) {
        const id = req.params.id
        console.log(id)
        const result = await db.query(
            "SELECT thumbnail FROM Post WHERE id=$1",
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

        
        const post = result.rows[0]
        console.log(post)
        console.log(post.thumbnail)

        return res.sendFile(post.thumbnail)
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
router.get('/post/:id', retrievePost)
router.get('/post/:id/thumbnail', getThumbnail)
module.exports = router;