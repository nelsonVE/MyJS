var express = require('express');
var user = require('../models/userModule')
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('tos');
});

router.get('/step-one', function(req, res, next) {
  user.create({
    name: 'Nelson',
    username: 'nelson8390',
    password: '123456789abcdef',
    gender: 1,
    country: 10,
    birthdate: '03/11/1996',
    email: 'nelsonmggomes@gmail.com',
    verified: false
  })

  user.sync()
  res.render('signup');
});

router.get('/test', function(req, res, next) {
  user.sync()
  res.send('Usuario insertado ¡?¡?¡?¡?¡')
});

module.exports = router;