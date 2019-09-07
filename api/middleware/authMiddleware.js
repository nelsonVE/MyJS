exports.check_login = (req, res, next) => {
    
    if(req.session.username)
        return res.redirect('/')

    next()
}

exports.check_adminlogin = (req, res, next) => {
    console.log(req.session.username)
    
    if(!req.session.username || req.session.level < 3) // Check if the user is logged in or his admin level is under 3
        return res.redirect('/')

    next()
}