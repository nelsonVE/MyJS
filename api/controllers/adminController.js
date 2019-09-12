const User = require('../models/User')
const Forum = require('../models/Forum')
const Category = require('../models/Category')
const forumController = require('../controllers/forumController')
const categoryController = require('../controllers/categoryController')
require('dotenv').config()

exports.view_users = (req, res, next) => {
    User.findAll()
        .then(users => {
            res.render('admin/user/view', {
                users,
                token: req.session._token
            })
        })
}

exports.view_user = (req, res, next) => {
    User.findByPk(req.params.id)
        .then(user => {
            res.render('admin/user/edit', {
                user
            })
        })
}

exports.save_user = (req, res, next) => {
    User.update({
        name: req.body.name,
        username: req.body.username,
        email: req.body.email,
        verified: req.body.verified
    },{
        where:{
            id: req.body._id
        }
    }).then(updated => {
        if(updated == 1){
            return res.redirect('..')
        } else {
            return res.redirect('..')
        }
    })
}

exports.delete_user = (req, res, next) => {
    if(req.body._token !== process.env.API_KEY){
        console.log('ERROR: THE API KEY DOESNT MATCH')
        return res.redirect('/')
    }

    if(req.body._id == req.session.userid){
        console.log('ERROR: You cannot delete yourself')
        return res.redirect('.')
    }

    User.destroy({
        where:{
            id: req.body._id
        }
    }).then(deleted => {
        if(deleted !== 1){
            console.log(`ERROR: Cannot delete the user id ${req.body._id}`)
            return res.redirect('.')
        }
        else
        {   
            console.log(`[INFO] » The user id ${req.body._id} has been deleted successfully`)
            return res.redirect('.')
        }
    })
}

exports.view_forums = async (req, res, next) => {
    Category.findAll().then(categories => {
        Forum.findAll().then(forums => {
            return res.render('admin/forum/view', {
                categories,
                forums,
                token: req.session._token
            })
        })
    })
}

exports.create_forum_view = (req, res, next) => {
    Category.findAll().then(categories => {
        return res.render('admin/forum/create', {
            categories
        })
    })
}

exports.edit_forum_view = (req, res, next) => {
    if(req.query.type == 1){ // 1 = Type: forum
        Forum.findByPk(req.query.id).then(forum => {
            Category.findAll().then(categories => {
                res.render('admin/forum/edit', {
                    forum,
                    type: req.query.type,
                    categories
                })
            })
        })
    }
    else // 0 = Type: Category
    {
        Category.findByPk(req.query.id).then(category => {
            Category.findAll().then(categories => {
                res.render('admin/forum/edit', {
                    categories,
                    forum: category,
                    type: req.query.type
                })
            })
        })
    }
}

exports.edit_forum = (req, res, next) => {
    if(req.body._type == 1){ // 1 = Type: forum
        Forum.update({
            name: req.body.name,
            description: req.body.description,
            categoryId: req.body.category
        },{
            where:{
                id: req.body._id
            },            
        })
    }
    else // 0 = Type: Category
    {
        Category.update({
            name: req.body.name,
            description: req.body.description
        },{
            where:{
                id: req.body._id
            },            
        })
    }
    return res.redirect('.')
}

exports.delete_forum = (req, res, next) => {
    if(req.body._token !== process.env.API_KEY){
        console.log('ERROR: THE API KEY DOESNT MATCH')
        console.log(`${req.body._token} vs ${process.env.API_KEY}`)
        return res.redirect('/')
    }
    if(req.body._type == 1){
        Forum.destroy({
            where:{
                id: req.body._id
            }
        }).then(deleted => {
            if(deleted !== 1){
                console.log(`ERROR: Cannot delete the forum id ${req.body._id}`)
                return res.redirect('.')
            }
            else
            {   
                console.log(`[INFO] » The forum id ${req.body._id} has been deleted successfully`)
                return res.redirect('.')
            }
        })
    } else {
        Category.destroy({
            where:{
                id: req.body._id
            }
        }).then(deleted => {
            if(deleted !== 1){
                console.log(`ERROR: Cannot delete the category id ${req.body._id}`)
                return res.redirect('.')
            }
            else
            {   
                console.log(`[INFO] » The category id ${req.body._id} has been deleted successfully`)
                return res.redirect('.')
            }
        })
    }
}