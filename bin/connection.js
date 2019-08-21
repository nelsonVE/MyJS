var mysql = require('mysql');
require('dotenv').config();

var connection = mysql.createConnection({
    host    : process.env.HOST,
    database: process.env.DB,
    user    : process.env.USUARIO,
    password: process.env.PASS,
  });
  
  console.log('Iniciando conexión con el servidor MySQL en '+process.env.HOST+'.')
  connection.connect((err) => {
    if(err){
      console.error('Ha ocurrido un error al intentar conectar con la base de datos: '+err.stack);
      return;
    }
  
    console.log('Conectado a la base de datos exitósamente. Thread ID: '+connection.threadId);
  });