'use strict';
const express = require('express');
const router = express.Router();

const pool = require('../database');

//->>>>>    LISTA         ------------------------------------------------------------------
router.get('/', async (req, res) => {
    try {
        const usuarios = await pool.query('SELECT * FROM usuario');
        res.status(200).send({"usuarios": usuarios});
    } catch (e) {
        res.status(400).send(e);
    }
});

//->>>>>    AGREGAR     --------------------------------------------------------------------
router.post('/', async (req, res) => {
    const error = false;
    const { id_usuario, id_sucursal, password, empleado_rfc, id_estado } = req.body;
    const newReg = {
        id_usuario,
        id_sucursal,
        password,
        empleado_rfc,
        id_estado
    };

    try {
        await pool.query('INSERT INTO usuario SET ?', [newReg]);
        res.status(200).send(
            {
                response: "¡Registro agregado!"
            }
        );
    } catch (e) {
        res.status(400).send(e);
    }
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
    try {
        await pool.query('UPDATE usuario SET ? WHERE id_usuario = ?', [ediReg, id_usuario]);
        res.send(200, {
            renponse: [
                {
                    response: "¡Registro editado!"
                }
            ]
        });
    } catch (e) {
        res.status(400).send(e);
    }
});

//->>>>>    ELIMINAR    --------------------------------------------------------------------
router.delete('/', async (req, res) => {
    try {
        await pool.query('DELETE FROM usuario WHERE id_usuario = ?', [req.body.id_usuario]);
        res.send(200, {
            renponse: [
                {
                    response: "¡Registro eliminado!"
                }
            ]
        });
    } catch (e) {
        res.status(400).send(e);
    }
});

module.exports = router;