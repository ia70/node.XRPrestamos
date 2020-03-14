'use strict';
const express = require('express');
const router = express.Router();

const d_persona = require('../data/d_persona');


//->>>>>    LISTA         ------------------------------------------------------------------
router.get('/', async (req, res) => {
    let db = new d_persona();
    try {
        res.status(200).send({ [tabla]: db.lista() });
    } catch (e) {
        res.status(400).send(e);
    }
});

//->>>>>    AGREGAR     --------------------------------------------------------------------
router.post('/', async (req, res) => {
    try {
        const data = await pool.query('INSERT INTO ' + tabla + ' SET ?', [req.body]);
        res.status(200).send({ [tabla]: data });
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