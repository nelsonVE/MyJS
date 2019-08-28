exports.logout = (req, res, next) => {
    console.log('Ok...')
    if(req.session){
        req.session.destroy(err => {
            if(err){
                next(err)
            } else {
                res.redirect('/')
            }
        })
    }
}