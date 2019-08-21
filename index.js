var app = require('./app.js')

var puerto = 3000

app.listen(puerto, () => {
    console.log("Servidor iniciado en el puerto: "+puerto)
})