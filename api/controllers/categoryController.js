const Category = require('../models/Category')

exports.get_all_categories = Category.findAll().then(categories => {
    return categories
})