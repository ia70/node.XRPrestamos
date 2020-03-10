'use strict';
const express = require('express');
const router = express.Router();

const pool = require('../database');
const tabla = "usuario";

const cipher = require('../cipher.js');
const keys = require('../keys');

//->>>>>    LISTA         ------------------------------------------------------------------
router.get('/', async (req, res) => {
    var urs_ = cipher.decode(keys.security.client_password, decodeURI(req.query.urs));
    var pwd_ = cipher.decode(keys.security.client_password, decodeURI(req.query.pwd));

    try {
        let data = await pool.query('SELECT * FROM ' + tabla + ' WHERE id_usuario="' + usr_ + '" AND password="' + pwd_ + '"');

        if (JSON.stringify(data) == '[]') {
            res.status(400).send({
                login: false,
                usr: usr
            });
        } else {
            res.status(200).send({
                login: true,
                usr: usr
            });
        }
    } catch (e) {
        res.status(400).send({ login: false });
    }
});

module.exports = router;