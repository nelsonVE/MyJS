const User = require('../models/User')
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