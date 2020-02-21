'use strict';
const express = require('express');
const router = express.Router();

const pool = require('../database');

//->>>>>    LISTA         ------------------------------------------------------------------
router.get('/', async (req, res) => {
    const usuarios = await pool.query('SELECT * FROM usuario');
    res.json({ usuarios });
});

//->>>>>    AGREGAR     --------------------------------------------------------------------
router.post('/', async (req, res) => {
    const { id_usuario, id_sucursal, password, empleado_rfc, id_estado } = req.body;
    const newReg = {
        id_usuario,
        id_sucursal,
        password,
        empleado_rfc,
        id_estado
    };
    await pool.query('INSERT INTO usuario SET ?', [newReg]);
    res.send(200, {
        renponse: [
            {
                response: "¡Registro agregado!"
            }
        ]
    });
});

//->>>>>    EDITAR      --------------------------------------------------------------------
router.put('/', async (req, res) => {
    const { id_usuario, id_sucursal, password, empleado_rfc, id_estado } = req.body;
    const ediReg = {
        id_sucursal,
        password,
        empleado_rfc,
        id_estado
    };
    await pool.query('UPDATE usuario SET ? WHERE id_usuario = ?', [ediReg, id_usuario]);
    res.send(200, {
        renponse: [
            {
                response: "¡Registro editado!"
            }
        ]
    });
});

//->>>>>    ELIMINAR    --------------------------------------------------------------------
router.delete('/', async (req, res) => {
    const { id_usuario } = req.body;
    await pool.query('DELETE FROM usuario WHERE id_usuario = ?', [id_usuario]);
    res.send(200, {
        renponse: [
            {
                response: "¡Registro eliminado!"
            }
        ]
    });
});

module.exports = router;