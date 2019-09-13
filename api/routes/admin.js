var express = require('express');
const adminController = require('../controllers/adminController')
const forumController = require('../controllers/forumController')
var router = express.Router();

router.get('/', function(req, res, next) {
  res.render('admin/index');
});

// - GET routes
router.get('/users/', adminController.view_users)
router.get('/users/edit/:id', adminController.view_user)
router.get('/forums/', adminController.view_forums)
router.get('/forums/create', adminController.create_forum_view)
router.get('/forums/edit', adminController.edit_forum_view)

// - POST routes
router.post('/users/delete/', adminController.delete_user) // Using POST method to give a token and avoid vulnerabilities
router.post('/users/edit/save/', adminController.save_user)
router.post('/forums/create', forumController.create_forum)
router.post('/forums/save', adminController.edit_forum)
router.post('/forums/delete', adminController.delete_forum)

module.exports = router;