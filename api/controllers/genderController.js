const Gender = require('../models/Gender')

exports.get_all_genders = Gender.findAll()
.then(genders => {
  return genders
})
