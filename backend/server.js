// server.js
const express = require('express');
const cors = require('cors'); // <--- 1. Importar cors(solo en caso de conexion con frontend)
const mysql = require('mysql2/promise'); // Usamos la versión con promesas 
const app = express();
const PORT = 3000;

// ================================
// MIDDLEWARES
// ================================
app.use(cors()); // <--- 2. Usar cors(solo en caso de conexion con frontend)
app.use(express.json()); 
app.use(express.urlencoded({ extended: true })); 

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',      
  password: '',      
  database: 'examen',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});


// GET /estado 

app.get('/usuarios', async (req, res) => {
  try {
    // Ejecutamos la consulta SQL
    const [rows] = await pool.query('SELECT * FROM usuarios');
    res.json(rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al obtener usuarios' });
  }
});

app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});

// POST /datos 
app.post('/datos', async (req, res) => {
  const { RU, nombre, ap_paterno, ap_materno, fecha_nacimiento, universidad } = req.body;

  try {
    
    const [result] = await pool.query(
      'INSERT INTO usuarios (RU, nombre, ap_paterno, ap_materno, fecha_nacimiento, universidad) VALUES (?, ?, ?, ?, ?, ?)',
      [RU, nombre, ap_paterno, ap_materno, fecha_nacimiento, universidad]
    );

    res.json({  
      mensaje: 'Usuario registrado en Base de Datos',
      idInsertado: result.insertId, // ID que generó la base de datos
      datos: { RU, nombre, ap_paterno, ap_materno, fecha_nacimiento, universidad }
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al guardar en BD' });
  }
});