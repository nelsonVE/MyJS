var express = require('express')
const forumController = require('../controllers/forumController')
var router = express.Router()

/* GET home page. */
router.get('/', forumController.view_forums)

module.exports = router
