const Post = require('../models/Post')
const userController = require('../controllers/userController')

async function get_forum_posts(forumid, page){
    const pageSize = 10 // Number of posts per page
    page = page ? page-1 : 0 // If the page isn't specified we'll asume 1

    const offset = page * pageSize // Begin per page. Ex: Page 3: 3 * 10 = 30
    const limit = offset + pageSize // End per page. Ex: 30 + 10 = 40

    // Now we'll retrieve all posts from 30 to 40 in our database
    return Post.findAll({
        where:{
            forumId: forumid
        },
        limit: limit,
        offset: offset,
        order: [
            ['posted_in', 'DESC']
        ]
    })
}

async function get_post(postid){
    return Post.findByPk(postid)
}

async function get_user_post_count(userid){
    return Post.count({
        where:{
            userId: userid
        }
    })
}

async function get_posts_count(forumid){
    return Post.count({
        where:{
            forumId: forumid
        }
    })
}

module.exports = {
    get_forum_posts: get_forum_posts,
    get_posts_count: get_posts_count,
    get_user_post_count: get_user_post_count,
    get_post: get_post
}