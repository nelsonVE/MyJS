const createError = require('http-errors')
const express = require('express')
const session = require('express-session')
const path = require('path')
const cookieParser = require('cookie-parser')
const logger = require('morgan')
const indexRouter = require('./api/routes/index')
const usersRouter = require('./api/routes/users')
const signupRouter = require('./api/routes/signup')
const loginRouter = require('./api/routes/login')
const logoutRouter = require('./api/routes/logout')
const adminRouter = require('./api/routes/admin')
var authMiddleware = require('./api/middleware/authMiddleware')
require('dotenv').config();

var app = express()

// view engine setup
app.set('views', path.join(__dirname, '/api/views'))
app.set('view engine', 'twig')
app.set("twig options", {
  allow_async: true
})

app.use(logger('dev'))
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(express.static(path.join(__dirname, 'public')))
app.use(session({
  secret: process.env.SESSION_KEY,
  resave: true,
  saveUninitialized: true
}))

app.use((req, res, next) => {
  res.locals.session = req.session
  next()
})

app.use('/', indexRouter)
app.use('/users', authMiddleware.check_login, usersRouter)
app.use('/signup', authMiddleware.check_login, signupRouter)
app.use('/login', authMiddleware.check_login, loginRouter)
app.use('/logout', logoutRouter)
app.use('/myjs-admin', authMiddleware.check_adminlogin, adminRouter)

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404))
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message
  res.locals.error = req.app.get('env') === 'development' ? err : {}

  // render the error page
  res.status(err.status || 500)
  res.render('error')
});

module.exports = app