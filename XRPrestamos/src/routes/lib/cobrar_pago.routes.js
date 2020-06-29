'use strict';
const express = require('express');
const router = express.Router();
const { access } = require('../../lib/security');

const pool = require('../../database');

//->>>>>    AGREGAR     --------------------------------------------------------------------
router.post('/', async (req, res) => {
    try {
        var solicitud = req.body.solicitud;
        var info = req.body.info;
        var user = req.body.user;
        var db_res = false;

        if (await access(user.hash, user.user)) {

            // CALCULOS DE INFORMACION DE ABONO

            /*
                1 - Carcular campos de abono
                2 - Insertar/Modificar abono 
                3 - Insertar/Modificar estadistica
                4 - Modificar credito

                solicitud: {
                    folio_credito: this.state.info_credito.folio_credito,
                    monto: _monto,
                    no_pagos: 0,
                    id_tipo_pago: 0,
                    fecha_abono: Fecha.getShortDate(),
                    id_estado: 1,
                    fecha_reg: Fecha.getDateTime()
                },
            */

            // CALCULAR CAMPOS ABONO E INSERTAR
            if (solicitud.monto > info.monto_pago) {
                solicitud.id_tipo_pago = 3;
                solicitud.no_pagos = Math.trunc(solicitud.monto / info.monto_pago);
            } else if (solicitud.monto > 0) {
                solicitud.id_tipo_pago = 2;
                solicitud.no_pagos = 1;
            } else {
                solicitud.id_tipo_pago = 4;
                solicitud.no_pagos = 1;
            }

            //const queryAbono = await pool.query('INSERT INTO abono SET ?', [solicitud]);


            let estadistica = await pool.query('SELECT * FROM estadistica_cliente WHERE folio_credito = ?', solicitud.folio_credito);

            if(estadistica.values.length == 0){
                console.log("ENTRO");
                estadistica = {
                    folio_credito : info.folio_credito,
                    ine : info.ine,
                    monto_credito : info.monto_credito,
                    fecha_entrega : info.fecha_entrega,
                    pagos_total : info.pagos_total,
                    no_pagos : 0,
                    no_abonos : 0,
                    no_adelantos : 0,
                    no_atrasos : 0
                };
            }

            console.log(estadistica);

            //const queryConsultaEstadistica = await pool.query('UPDATE estadistica_cliente SET ? WHERE folio_credito = ?', [, req.body[primary_key]]);
            //const queryConsultaEstadistica = await pool.query('SELECT * FROM estadistica_cliente WHERE folio_credito = ?', "11");
            //console.log(queryConsultaEstadistica);
            //if(queryConsultaEstadistica.)

/*

            const query = await pool.query('CALL COBRO_DIA_CONSULTA(?)', solicitud.folio_credito);
            //const query = await pool.query('INSERT INTO abono SET ?', [solicitud]);
            if (query.affectedRows > 0) {
                db_res = true;
            }

            let respuesta = {
                response: db_res,
                data: query,
                session: true
            };
*/
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