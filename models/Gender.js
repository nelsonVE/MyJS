var Sequelize = require('sequelize')
var sequelize = require('../bin/connection')

const Model = Sequelize.Model

class Gender extends Model {}

Gender.init({
    name: {
        type: Sequelize.STRING,
        allowNull: false
    }
},  {
    sequelize,
    modelName: 'gender'
})

Gender.sync()

module.exports = Gender

require('../migrations/genderMigration') // Inserts genders in the table.