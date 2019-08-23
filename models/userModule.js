var Sequelize = require('sequelize')
var sequelize = require('../bin/connection')

const Model = Sequelize.Model

class User extends Model {}

User.init({
    username: {
        type: Sequelize.STRING,
        allowNull: false
    },
    name: {
        type: Sequelize.STRING,
        allowNull: false
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
        allowNull: false
    },
    verified: {
        type: Sequelize.BOOLEAN,
        allowNull: false
    },
    avatar_url: {
        type: Sequelize.STRING,
        allowNull: true
    },
    gender_id: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    country_id: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
},  {
    sequelize: sequelize,
    modelName: 'user'
})

module.exports = User