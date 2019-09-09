var express = require('express');
const adminController = require('../controllers/adminController')
var router = express.Router();

router.get('/', function(req, res, next) {
  res.render('admin/index');
});

// - GET routes
router.get('/users/', adminController.view_users)
router.get('/users/edit/:id', adminController.view_user)
router.get('/forums/', adminController.view_forums)

// - POST routes
router.post('/users/delete/', adminController.delete_user) // Using POST method to give a token and avoid vulnerabilities
router.post('/users/edit/save/', adminController.save_user)

module.exports = router;