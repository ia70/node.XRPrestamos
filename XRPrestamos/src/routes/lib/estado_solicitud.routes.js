'use strict';
const express = require('express');
const router = express.Router();

const pool = require('../../database');
const { access } = require('../../lib/security');

//->>>>>    AGREGAR     --------------------------------------------------------------------
router.post('/', async (req, res) => {
    try {
        if (await access(req.body.hash, req.body.user)) {
            let r_d_cartera = false;

            const d_car = await pool.query('CALL lista_solicitudes(?)', [req.body.user]);

            if (JSON.stringify(d_car) != '[]') {
                r_d_cartera = true;
            }
            let respuesta = {
                response: r_d_cartera,
                session: true,
                cartera: d_car[0]
            };

            res.status(200).send(respuesta);

        } else {
            res.status(400).send({
                session: false
            });
        }
    } catch (e) {
        res.status(400).send({
            response: false,
            session: true,
            error: e
        });
    }
});

module.exports = router;