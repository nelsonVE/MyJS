const Country = require('../models/Country')

exports.get_all_countries = Country.findAll()
.then(countries => {
  return countries
})