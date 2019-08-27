var express = require('express');
var userController = require('../controllers/userController')
var router = express.Router();
const userMiddleware = require('../middleware/userMiddleware')

router.get('/', function(req, res, next) {
  res.render('tos');
})

router.get('/step-one', userController.signup)

router.post('/verify', userController.verify_register)

router.get('/successful', userController.successful_signup)

module.exports = router;