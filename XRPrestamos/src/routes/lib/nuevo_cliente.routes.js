'use strict';
const express = require('express');
const router = express.Router();
const { access } = require('../../lib/security');

const pool = require('../../database');
const tabla = "persona";
const primary_key = "id_usuario";



//->>>>>    LISTA         ------------------------------------------------------------------
router.get('/', async (req, res) => {
    try {
        const data = await pool.query('SELECT * FROM ' + tabla);
        res.status(200).send({ [tabla]: data });
    } catch (e) {
        res.status(400).send(e);
    }
});

//->>>>>    AGREGAR     --------------------------------------------------------------------
router.post('/', async (req, res) => {
    try {
        var persona = req.body.persona;
        var aval = req.body.aval;
        var establecimiento = req.body.establecimiento;
        var user = req.body.user;
        var data_user = {
            id_usuario: persona.id_usuario,
            id_sucursal: user.sucursal,
            password: '12345',
            id_rol: 3,
            usuario_padre: user.user,
            id_estado: 5
        };

        if (await !access(user.hash, user.user)) {
            res.status(400).send("Sesión inválida!");
        } else {

            const d_per = await pool.query('INSERT INTO persona SET ?', [persona]);
            const d_aval = await pool.query('INSERT INTO aval SET ?', [aval]);
            const d_est = await pool.query('INSERT INTO usuario_establecimiento SET ?', [establecimiento]);
            const d_user = await pool.query('INSERT INTO usuario SET ?', [data_user]);

            var respuesta = {
                persona: [d_per],
                aval: [d_aval],
                establecimiento: [d_est]
            };

            res.status(200).send(respuesta);
        }
    } catch (e) {
        res.status(400).send(e);
    }
});

//->>>>>    EDITAR      --------------------------------------------------------------------
router.put('/', async (req, res) => {
    try {
        const data = await pool.query('UPDATE ' + tabla + ' SET ? WHERE ' + primary_key + ' = ?', [req.body, req.body[primary_key]]);
        res.status(200).send({ [tabla]: data });
    } catch (e) {
        res.status(400).send(e);
    }
});

//->>>>>    ELIMINAR    --------------------------------------------------------------------
router.delete('/', async (req, res) => {
    try {
        const data = await pool.query('DELETE FROM ' + tabla + ' WHERE ' + primary_key + ' = ?', [req.body[primary_key]]);
        res.status(200).send({ [tabla]: data });
    } catch (e) {
        res.status(400).send(e);
    }
});

module.exports = router;