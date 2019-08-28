const User = require('../models/User')
const bcrypt = require('bcrypt')

exports.check_login = (req, res) => {
    var errors = []
    User.findOne({
        where: {
            username: req.body.username
        }
    }).then((user) => {
        if(!user)
            errors.push('That username doesn\'t exists in our database')
        
        if(user && !bcrypt.compareSync(req.body.password, user.password))
            errors.push('The username/password is incorrect')

        if(errors.length > 0)
            return res.render('login', {
                errors
            })
        
        session = req.session
        session.username = user.username
        session.userid = user.id
        res.redirect('/')
    })
}

