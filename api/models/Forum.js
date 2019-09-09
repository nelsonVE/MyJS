var Sequelize = require('sequelize')
var sequelize = require('../bin/connection')
const Category = require('./Category')

const Model = Sequelize.Model

class Forum extends Model {}

Forum.init({
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
    modelName: 'forum',
    underscored: true
})

Forum.belongsTo(Category)

Category.hasMany(Forum)
Forum.hasMany(Forum, {as: 'Subforum'})

Forum.sync()

module.exports = Forum