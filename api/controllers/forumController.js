const Forum = require('../models/Forum')
const Category = require('../models/Category')

exports.get_all_forums =
    Forum.findAll().then(forums => {
        return forums
    })

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
}