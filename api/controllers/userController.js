const User = require('../models/User')

async function get_username(userid){
    return User.findOne({
        where: {
            id: userid
        }
    })
}

async function get_all_users(){
    return User.findAll()
}

async function get_user_by_id(userid){
    return User.findByPk(userid)
}

module.exports = {
    get_username: get_username,
    get_all_users: get_all_users,
    get_user_by_id: get_user_by_id
}