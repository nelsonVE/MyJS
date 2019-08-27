const Sequelize = require('sequelize')
require('dotenv').config();

const conn = new Sequelize(process.env.DB, process.env.USUARIO, process.env.PASS, {
  host: process.env.HOST,
  dialect: process.env.DRIVER
})

conn.authenticate()
    .then(() => {
        console.log('Connected to '+process.env.HOST+' with '+process.env.USUARIO)
      }
    )
    .catch((err) => {
        console.error('Unable to connect to '+process.env.HOST+'. Error: ', err)
      }
    )

module.exports = conn
