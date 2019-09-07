var express = require('express');
const adminController = require('../controllers/adminController')
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.render('admin/index');
});

router.get('/users/', adminController.view_users)

module.exports = router;