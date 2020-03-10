'use strict';
const express = require('express');
const router = express.Router();

const pool = require('../database');
const tabla = "usuario";

const cipher = require('../cipher.js');
const keys = require('../keys');

//->>>>>    LISTA         ------------------------------------------------------------------
router.get('/', async (req, res) => {

    var usr = cipher.decode(keys.security.client_password, decodeURI(req.query.usr));
    var pwd = cipher.decode(keys.security.client_password, decodeURI(req.query.pwd));

    try {
        let data = await pool.query('SELECT * FROM ' + tabla + ' WHERE id_usuario="' + usr + '" AND password="' + pwd + '"');

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
        res.status(400).send({ 
            login: false
         });
    }
});

module.exports = router;