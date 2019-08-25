const User = require('../models/User')

function getAllUsers(){
    return User.findAll().then((users) => {
        return users
    }
    )
}