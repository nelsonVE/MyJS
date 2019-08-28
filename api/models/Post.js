var Sequelize = require('sequelize')
var sequelize = require('../bin/connection')
const Forum = require('./Forum')
const User = require('./User')

const Model = Sequelize.Model

class Post extends Model {}

Post.init({
    title:{
        type: Sequelize.STRING,
        allowNull: false
    },
    content:{
        type: Sequelize.STRING,
        allowNull: false
    },
    posted_in: {
        type: Sequelize.DATE,
        allowNull: true,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP')
    }
},  {
    sequelize,
    modelName: 'post',
    underscored: true,
    timestamps: false
})

Post.belongsTo(Forum)
Post.belongsTo(User)

User.hasMany(Post)
Forum.hasMany(Post)

Post.sync()

module.exports = Post