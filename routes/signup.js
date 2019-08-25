var express = require('express');
var userController = require('../controllers/userController')
var countryController = require('../controllers/countryController')
var genderController = require('../controllers/genderController')
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('tos');
});

router.get('/step-one', function(req, res, next) {
  
  res.render('signup', {
    countries: countryController.get_all_countries,
    genders: genderController.get_all_genders
  });
});

module.exports = router;