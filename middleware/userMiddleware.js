const { body } = require('express-validator')

exports.verify = () => {
    return [
        body('username', 'Please enter an username').isString(),
        body('email', 'Please enter a valid e-mail address').isEmail()
    ]
}