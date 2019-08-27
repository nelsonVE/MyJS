var express = require('express');
var signupController = require('../controllers/signupController')
var router = express.Router();

router.get('/', function(req, res, next) {
  res.render('tos', { session: req.session });
})

router.get('/step-one', signupController.signup)
router.post('/verify', signupController.verify_register)
router.get('/successful', signupController.successful_signup)

module.exports = router;