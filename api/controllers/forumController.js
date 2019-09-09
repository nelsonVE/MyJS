const Forum = require('../models/Forum')

exports.get_all_forums = Forum.findAll().then(forums => {
    return forums
})