var Sequelize = require('sequelize')
var sequelize = require('../bin/connection')
const User = require('./User')
const Role = require('./Role')

const Model = Sequelize.Model

class UserRole extends Model {}
/*
    Many-to-Many relationship user roles in the forum.
    A single user can be a part of many roles
*/
UserRole.init({
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    }
},  {
    sequelize,
    modelName: 'roleUser',
    underscored: true
})

Role.belongsToMany(User, {
    through: UserRole
})

User.belongsToMany(Role, {
    through: UserRole
})

UserRole.sync()

module.exports = UserRole