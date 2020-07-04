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

            // CALCULAR CAMPOS ABONO --------------------------------------------------------------------------------------------------------------
            if (info.restante_total <= solicitud.monto) {
                solicitud.id_tipo_pago = 6;
                solicitud.no_pagos = solicitud.monto / info.monto_pago;
                // Modificar tabla credito
                let db_credito = await pool.query('UPDATE credito SET estado_credito=5, estado=2 WHERE folio_credito = ?', [info.folio_credito]);
            } else if (solicitud.monto > info.monto_pago) {
                solicitud.id_tipo_pago = 3;
                solicitud.no_pagos = solicitud.monto / info.monto_pago;
            } else if (solicitud.monto == info.monto_pago) {
                solicitud.id_tipo_pago = 1;
                solicitud.no_pagos = 1;
            } else if (solicitud.monto > 0) {
                solicitud.id_tipo_pago = 2;
                solicitud.no_pagos = solicitud.monto / info.monto_pago;
            } else {
                solicitud.id_tipo_pago = 4;
                solicitud.no_pagos = 0;
            }

            let queryAbono = await pool.query('INSERT INTO abono SET ?', [solicitud]);


            // CALCULO DE ESTADISTICAS -------------------------------------------------------------------------------------------------------------
            let estadistica = await pool.query('SELECT * FROM estadistica_cliente WHERE folio_credito = ?', [solicitud.folio_credito]);
            let estadistica_existe = true;
            
            if (estadistica == "") {
                estadistica_existe = false;
                estadistica = {
                    folio_credito: info.folio_credito,
                    ine: info.ine,
                    monto_credito: info.monto_credito,
                    fecha_entrega: info.fecha_entrega,
                    pagos_total: info.pagos_total,
                    no_pagos: info.pagos_total - (info.restante_no - 1),
                    no_abonos: (solicitud.id_tipo_pago == 2 ? 1 : 0),
                    no_adelantos: (solicitud.id_pago == 3 ? info.extras_no + 1 : info.extras_no),
                    no_atrasos: (solicitud.id_tipo_pago == 4 ? info.atrasos_no + 1 : (solicitud.id_tipo_pago == 2 ? solicitud.monto / info.monto_pago : 0))
                };
            } else {
                // NO_PAGOS
                estadistica.no_pagos += info.pagos_total - (info.restante_no + 1);

                // NO_ABONOS
                if (solicitud.id_tipo_pago == 2) {
                    estadistica.no_abonos += 1;
                }

                // NO_ATRASOS
                if (solicitud.id_tipo_pago == 4) {
                    estadistica.no_atrasos += 1;
                } else if (solicitud.id_tipo_pago == 2) {
                    estadistica.no_atrasos += (solicitud.monto / info.monto_pago);
                }

                // NO_ADELANTOS
                if (solicitud.id_tipo_pago == 3) {
                    let cal_extra = info.monto_pago - solicitud.monto;
                    if ((info.extras_monto + cal_extra) > info.atrasos_monto) {
                        estadistica.no_adelantos += cal_extra / info.monto_pago;
                    }
                }
            }



            // INSERTAR O ACTUALIZAR BASE DE DATOS DE ESTADISTICA
            if (estadistica_existe) {
                let queryEstadistica = await pool.query('UPDATE estadistica_cliente SET ? WHERE folio_credito = ?', [estadistica[0], info.folio_credito]);
            } else {
                let queryEstadistica = await pool.query('INSERT INTO estadistica_cliente SET ?', [estadistica]);
            }


            // FIN CALCULO ESTADISTICA -------------------------------------------------------------------------------------------------------------


            let queryDataAbono = await pool.query('CALL COBRO_DIA_CONSULTA(?)', solicitud.folio_credito);

            if (queryAbono.affectedRows > 0) {
                db_res = true;
            }

            let respuesta = {
                response: db_res,
                data: queryDataAbono[0],
                session: true
            };

            res.status(200).send(respuesta);

        } else {
            res.status(400).send({
                session: false
            });
        }
    } catch (e) {
        console.log(e);
        res.status(400).send({
            response: false,
            session: true,
            error: e
        });
    }
});

module.exports = router;