var express = require('express')
var router = express.Router()
const forumController = require('../controllers/forumController')
const postController = require('../controllers/postController')

router.get('/view', forumController.view_posts)
router.get('/post/view', forumController.view_post)

module.exports = router