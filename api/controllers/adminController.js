const User = require('../models/User')

exports.view_users = (req, res, next) => {
    User.findAll()
        .then(users => {
            res.render('admin/users', {
                users
            })
        })
}