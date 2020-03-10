'use strict';
const express = require('express');
const router = express.Router();

const pool = require('../database');
const tabla = "usuario";

const keys = require('../keys');
require('../cipher');


//->>>>>    LISTA         ------------------------------------------------------------------
router.get('/', async (req, res) => {
    let usr = "";
    let pwd = "";

    try {
        urs = decode(keys.security.client_password, req.query.urs);
        pwd = decode(keys.security.client_password, req.query.pwd);
    } catch (e) {
        console.error(e);
    }


    try {
        const data = await pool.query('SELECT * FROM ' + tabla + ' WHERE id_usuario="' + usr + '" AND password="' + pwd + '"');

        if (JSON.stringify(data) == '[]') {
            res.status(400).send({
                login: false
            });
        } else {
            res.status(200).send({
                login: true
            });
        }
    } catch (e) {
        res.status(400).send({ login: false });
    }
});

module.exports = router;