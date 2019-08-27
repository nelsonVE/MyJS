var express = require('express');
var router = express.Router();
const loginController = require('../controllers/loginController');

router.get('/', function(req, res, next) {
  res.render('login');
});

router.post('/verify', loginController.check_login)

module.exports = router;
