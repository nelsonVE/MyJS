var Gender = require('../models/Gender')

Gender.findOrCreate({
    where:{
        name: 'Male'
    }
})

Gender.findOrCreate({
    where:{
        name: 'Female'
    }
})

Gender.findOrCreate({
    where:{
        name: 'Other'
    }
})

Gender.sync()

module.exports = Gender