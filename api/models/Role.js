var Sequelize = require('sequelize')
var sequelize = require('../bin/connection')
const User = require('./User')

const Model = Sequelize.Model

class Role extends Model {}
/*
    LEVELS:
    - 1: User permissions.
    - 2: Moderator permissions. (Can only moderate the forum)
    - 3: Admin permissions. (Access to almost everything, including the forum settings)
*/
Role.init({
    name:{
        type: Sequelize.STRING,
        allowNull: false
    },
    description:{
        type: Sequelize.STRING,
        allowNull: true
    },
    level: {
        type: Sequelize.SMALLINT,
        allowNull: false
    }
},  {
    sequelize,
    modelName: 'role',
    underscored: true
})

Role.sync().then(() => {
    Role.findOrCreate({
        where:{
            name: 'Administrator', // Create the admin role if it doesn't exists
            level: 3
        }
    })
    Role.findOrCreate({
        where:{
            name: 'User', // Create the user role if it doesn't exists
            level: 1
        }
    })
})

Role.sync()

module.exports = Role