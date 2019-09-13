var app = require('./app.js')
require('dotenv').config()

app.listen(process.env.PORT, () => {
    console.log("MyJS Forum v1.0 BETA started at port: "+process.env.PORT)
})