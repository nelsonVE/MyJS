var Sequelize = require('sequelize')
var sequelize = require('../bin/connection')

const Model = Sequelize.Model

class Country extends Model {}

Country.init({
    shortname: {
        type: Sequelize.CHAR(2),
        allowNull: false
    },
    name: {
        type: Sequelize.STRING,
        allowNull: false
    }
},  {
    sequelize,
    modelName: 'country'
})

Country.sync()

module.exports = Country