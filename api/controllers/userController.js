const User = require('../models/User')

async function get_username(userid){
    return User.findOne({
        where: {
            id: userid
        }
    })
}

module.exports = {
    get_username: get_username
}