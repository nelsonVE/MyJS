const User = require('../models/User')
const UserRole = require('../models/UserRole')
const Role = require('../models/Role')
const bcrypt = require('bcrypt')

exports.check_login = async (req, res) => {
    var errors = []
    User.findOne({
        where: {
            username: req.body.username
        }
    }).then(async (user) => {
        if(!user)
            errors.push('That username doesn\'t exists in our database')
        
        if(user && !bcrypt.compareSync(req.body.password, user.password))
            errors.push('The username/password is incorrect')

        if(errors.length > 0)
            return res.render('login/login', {
                errors
            })
        
        Role.max('level', {
            include: [{
                model: User,
                where:{
                    id: user.id
                }
            }]
        }).then(role => {
            console.log(`» [LOGIN] User ${user.username} has logged in with level ${role}`)
            session = req.session
            session.username = user.username
            session.userid = user.id
            session.level = role
            res.redirect('/')
        })
    })
}

