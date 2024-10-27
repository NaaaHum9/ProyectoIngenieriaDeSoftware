const express = require('express');
const mysql = require('mysql2');
const app = express();

// Conexión a MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'tu_password',
  database: 'tu_base_de_datos'
});

db.connect((err) => {
  if (err) throw err;
  console.log('Conectado a MySQL');
});

// Middleware para servir archivos estáticos
app.use(express.static('public'));

// Ruta de ejemplo
app.get('/', (req, res) => {
  res.send('Hola Mundo!');
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor corriendo en el puerto ${PORT}`);
});
