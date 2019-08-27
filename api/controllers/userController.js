const User = require('../models/User')
var countryController = require('../controllers/countryController')
var genderController = require('../controllers/genderController')
const bcrypt = require('bcrypt')

async function usernameExists(username){
    let count = User.count({
        where: {
            username: username
        }
    })
    console.log('Count: '+count)
    return count
}

async function emailExists(email){
    let count = User.count({
        where: {
            email: email
        }
    })
    return count
}

async function createUser(username, password, email, gender, country){
    User.create({
        username: username,
        password: bcrypt.hashSync(password, 10),
        email: email,
        verified: false
    }).then((user) => {
        user.setCountry(country) // Associates the created user with the selected country
        user.setGender(gender)
        console.log('User '+username+' created succesfully')
    }).catch(err => {
        console.error('An error has ocurred: '+err)
    })
}

exports.signup = async (req, res, next) => {
    res.render('signup', {
        countries: countryController.get_all_countries,
        genders: genderController.get_all_genders
    })
}

exports.successful_signup = (req, res, next) => {
    res.render('successful')
}

exports.verify_register = async (req, res) => {
    let errors = []
    let email = await emailExists(req.body.email) // Wait for the query
    let username = await usernameExists(req.body.username)

    if(username > 0){
        errors.push('Username already in use')
    }
    
    if(email > 0){
        errors.push('Email already in use')
    }

    if(req.body.password !== req.body.repassword){
        errors.push('Passwords do not match')
    }

    if(req.body.country == '0'){
        errors.push('Select a country')
    }

    if(req.body.gender == '0'){
        errors.push('Select a gender')
    }

    console.log(errors)
    if(errors.length > 0){
        return res.render('signup', {
            errors,
            countries: countryController.get_all_countries,
            genders: genderController.get_all_genders
        })
    }

    createUser(req.body.username, req.body.password, req.body.email, req.body.gender, req.body.country).then(() => {
        // Send confirmation e-mail here.
        res.redirect('successful')
    })
}