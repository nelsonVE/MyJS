var Sequelize = require('sequelize')
var sequelize = require('../bin/connection')
const User = require('./User')

const Model = Sequelize.Model

class Role extends Model {}

Role.init({
    name:{
        type: Sequelize.STRING,
        allowNull: false
    },
    description:{
        type: Sequelize.STRING,
        allowNull: true
    }
},  {
    sequelize,
    modelName: 'role',
    underscored: true
})

Role.belongsToMany(User, {
    through: 'user_role',
    foreignKey: 'role_id'
})

User.belongsToMany(Role, {
    through: 'user_role',
    foreignKey: 'user_id'
})

Role.sync()

module.exports = Role