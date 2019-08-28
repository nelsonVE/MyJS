var Sequelize = require('sequelize')
var sequelize = require('../bin/connection')

const Model = Sequelize.Model

class Category extends Model {}

Category.init({
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
    modelName: 'category',
    underscored: true
})

Category.belongsTo(Category)
Category.hasMany(Category)

Category.sync()

module.exports = Category