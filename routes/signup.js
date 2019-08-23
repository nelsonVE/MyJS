var express = require('express');
var User = require('../models/User')
var Country = require('../models/Country')
var Gender = require('../models/Gender')
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('tos');
});

router.get('/step-one', function(req, res, next) {
  res.render('signup', {
    genders: Gender.findAll(),
    contries: Countries.findAll()
  });
});

module.exports = router;