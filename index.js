var app = require('./app.js')

var puerto = 3000

app.listen(puerto, () => {
    console.log("Server started at port: "+puerto)
})