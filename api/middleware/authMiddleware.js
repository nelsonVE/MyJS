exports.check_login = (req, res, next) => {
    console.log(req.session.username)
    
    if(req.session.username)
        return res.redirect('/')

    next()
}