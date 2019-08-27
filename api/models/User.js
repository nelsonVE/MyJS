var Sequelize = require('sequelize')
var sequelize = require('../bin/connection')
var Gender = require('./Gender')
var Country = require('./Country')

const Model = Sequelize.Model

class User extends Model {}

User.init({
    username: {
        type: Sequelize.STRING,
        allowNull: false
    },
    name: {
        type: Sequelize.STRING,
        allowNull: true
    },
    email: {
        type: Sequelize.STRING,
        allowNull: false
    },
    password: {
        type: Sequelize.STRING,
        allowNull: false
    },
    birthdate: {
        type: Sequelize.DATE,
        allowNull: true
    },
    verified: {
        type: Sequelize.BOOLEAN,
        allowNull: false
    },
    avatar_url: {
        type: Sequelize.STRING,
        allowNull: true
    }
},  {
    sequelize: sequelize,
    modelName: 'user',
    underscored: true
})

User.belongsTo(Gender)
User.belongsTo(Country)

Country.hasMany(User)
Gender.hasMany(User)

module.exports = User