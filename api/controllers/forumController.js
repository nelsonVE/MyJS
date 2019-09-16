const userController = require('../controllers/userController')
const Forum = require('../models/Forum')
const Post = require('../models/Post')
const Category = require('../models/Category')
const postController = require('../controllers/postController')

async function get_forum_post_count(forumid){
    return Post.count({
        where:{
            forumId: forumid
        }
    })
}

async function get_last_post(forumid){
    return Post.findOne({
        where: {
            forumId: forumid
        },
        order: [
            ['posted_in', 'DESC']
        ]
    })
}

exports.get_all_forums =
    Forum.findAll().then(forums => {
        return forums
    })

exports.view_forums = async (req, res, next) => {
    var post_return = []
    Category.findAll().then(categories => {
        Forum.findAll().then(forums => {
            Post.findAll().then(async(posts) => {
                for(const forum of forums){
                    let post = posts.find(({ forumId }) => forumId === forum.id)
                    let forum_temp = []
                    forum_temp.id = forum.id
                    forum_temp.name = forum.name
                    forum_temp.description = forum.description
                    forum_temp.categoryId = forum.categoryId
                    forum_temp.forumId = forum.forumId
                    if(post){
                        const last_post = await get_last_post(post.forumId)
                        const user = await userController.get_username(last_post.userId)
                        forum_temp.post_count = await get_forum_post_count(forum.id)                        
                        forum_temp.last_post_title = last_post.title
                        forum_temp.last_post_date = last_post.posted_in                        
                        forum_temp.last_post_username = user.username
                    }
                    post_return.push(forum_temp)
                }
                console.log(post_return)
                res.render('index/index', {
                    forums: post_return,
                    categories
                })
            })
        })
    })
}

exports.create_forum = (req, res, next) => {
    var errors = []

    if(req.body.type == 1 && req.body.category == 0){
        errors.push('You can\'t create a new forum without category')
    }

    if(req.body.type == 0 && req.body.category > 0){
        errors.push('You can\'t create a category inside another one')
    }

    if(errors.length > 0){
        Category.findAll().then(categories => {
            return res.render('admin/forum/create', {
                categories,
                errors
            })
        })
    }
    if(req.body.type == 1){
        Forum.create({
            name: req.body.name,
            description: req.body.description,
            categoryId: req.body.category
        }).then(ready => {
            if(ready)
                return res.redirect('..')
        }).catch(err => {
            console.error(`An error has ocurred in forumController on create_forum: ${err}`)
        })
    } else {
        Category.create({
            name: req.body.name,
            description: req.body.description
        }).then(ready => {
            if(ready)
                return res.redirect('..')
        }).catch(err => {
            console.error(`An error has ocurred in forumController on create_forum: ${err}`)
        })
    }
}

exports.view_posts = async (req, res, next) => {
    const posts = await postController.get_forum_posts(req.query.id, req.query.page)
    const users = await userController.get_all_users()
    const max_posts_per_page = 10
    const posts_count = await postController.get_posts_count(req.query.id)

    var pages = Math.floor(posts_count / max_posts_per_page)

    if((posts_count % max_posts_per_page) > 0){ // check if we need another page
        pages += 1 // if we have 12 posts, we'll need 2 pages, one with 10 and another with 2
    }

    return res.render('forum/view', {
        posts,
        users,
        pages,
        actual_page: Number(req.query.page)
    })
}

exports.view_post = async (req, res, next) => {
    const post = await postController.get_post(req.query.id)

    if(!post)
        return res.redirect('/')
    
    const user = await userController.get_user_by_id(post.userId)
    const user_posts = await postController.get_user_post_count(post.userId)

    return res.render('forum/post/view', {
        post,
        user,
        user_posts
    })
}