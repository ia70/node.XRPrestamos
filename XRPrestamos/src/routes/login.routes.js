'use strict';
const express = require('express');
const router = express.Router();

const pool = require('../database');
const tabla = "usuario";
const primary_key = "id_usuario";

//->>>>>    LISTA         ------------------------------------------------------------------
router.get('/', async (req, res) => {
    try {
        const data = await pool.query('SELECT * FROM ' + tabla + ' WHERE id_usuario=' + req.body.id_usuario + ' AND password=' + req.body.password);
        console.log(data);
        res.status(200).send({
          login: true,
          datos: data
        });
    } catch (e) {
        res.status(400).send(e);
    }
});

module.exports = router;