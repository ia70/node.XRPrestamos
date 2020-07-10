'use strict';
const express = require('express');
const router = express.Router();

const pool = require('../../database');
const { access } = require('../../lib/security');
const { calcular_abono } = require('../../routes/functions/calcular_abono');

//->>>>>    AGREGAR     --------------------------------------------------------------------
router.post('/', async (req, res) => {
    try {
        if (await access(req.body.hash, req.body.user)) {
            let r_d_solicitud = false;

            let persona = req.body.persona;
            let credito = req.body.credito;
            let abonos = req.body.abonos;

            //--> PERSONA -----------------------------------------------------------------
            console.log(persona[1]);
            console.log(persona[0]);
            if (telefono != "") {
                let query = await pool.query('UPDATE persona SET ? WHERE ine = ?', [persona[1], persona[0]]);
            }

            //--> CREDITO ------------------------------------------------------------------ 
            let periodo = await pool.query('SELECT GET_PERIODO(?)', [credito.fecha_entrega]);

            credito.id_periodo = periodo;
            if (credito.folio_credito == "") {
                credito.folio_credito = credito.fecha_entrega + await pool.query('SELECT COUNT(folio_credito) FROM credito WHERE fecha_entrega=?', [credito.fecha_entrega]);
            }

            console.log("PERIODO: " + periodo);
            console.log("FOLIO_CREDITO: " + credito.folio_credito);

            let datos = [];

            datos = await pool.query('INSERT INTO credito SET ?', [credito]);


            if (JSON.stringify(datos) != '[]') {
                r_d_solicitud = true;
            }
            let respuesta = {
                response: r_d_solicitud,
                session: true,
                solicitud: datos[0]
            };

            //--> ABONOS ------------------------------------------------------------------
            if (abonos.length > 0) {
                let total = abonos.length;
                let i = 0;
                for (i; i < total; i++) {
                    abonos[i].folio_credito = credito.folio_credito;
                    calcular_abono(abonos[i]);
                }
            }
            // FIN ABONOS -----------------------------------------------------------------


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