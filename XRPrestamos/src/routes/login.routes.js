'use strict';
const express = require('express');
const router = express.Router();

const pool = require('../database');
const tabla = "usuario";

const cipher = require('../cipher.js');
const keys = require('../keys');
const fecha = require('../lib/util').getDateTime;

//->>>>>    LISTA         ------------------------------------------------------------------
router.get('/', async (req, res) => {

    var usr = cipher.decode(keys.security.client_password, decodeURIComponent(req.query.usr));
    var pwd = cipher.decode(keys.security.client_password, decodeURIComponent(req.query.pwd));

    try {
        let data = await pool.query('SELECT * FROM ' + tabla + ' WHERE id_usuario="' + usr + '" AND password="' + pwd + '" AND id_estado=1');

        if (JSON.stringify(data) == '[]') {
            res.status(400).send({
                login: false,
                user: null,
                rol: null,
                sucursal: null,
                hash: null
            });
        } else {
            var id = fecha() + '_' + usr;
            var hash = encodeURIComponent(cipher.encode(keys.security.main_password, id));

            try {
                login(hash, usr);
            } catch (e) {
                console.log(e);
            }

            res.status(200).send({
                login: true,
                user: usr,
                sucursal: data[0].id_sucursal,
                rol: data[0].id_rol,
                hash: hash
            });
        }
    } catch (e) {
        console.log(e);
        res.status(400).send({
            login: false,
            user: null,
            hash: null
        });
    }
});

async function login(hash, user) {
    let data = await pool.query('SELECT * FROM sesion WHERE id_usuario="' + user + '" AND id_estado=1');
    if (JSON.stringify(data) != '[]') {
        data = await pool.query('UPDATE sesion SET id_estado=2, fin_sesion="' + fecha() + '" WHERE id_usuario="' + user + '" AND id_estado=1');
    }
    try {
        data = await pool.query('INSERT INTO sesion VALUES("' + hash + '", "' + user + '", "' + fecha() + '", "' + fecha() + '", null, 1)');
    } catch (e) {
        console.log(e);
        return false;
    }
    return true;
}

module.exports = router;