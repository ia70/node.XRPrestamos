const pool = require('../../database');

async function calcular_abono(abono) {
    try {
        let info = await pool.query('CALL COBRO_DIA_CONSULTA(?)', abono.folio_credito);


         // CALCULAR CAMPOS ABONO --------------------------------------------------------------------------------------------------------------
         if (info.restante_total <= abono.monto) {
            abono.id_tipo_pago = 6;
            abono.no_pagos = abono.monto / info.monto_pago;
            // Modificar tabla credito
            let db_credito = await pool.query('UPDATE credito SET estado_credito=5, estado=2 WHERE folio_credito = ?', [info.folio_credito]);
        } else if (abono.monto > info.monto_pago) {
            abono.id_tipo_pago = 3;
            abono.no_pagos = abono.monto / info.monto_pago;
        } else if (abono.monto == info.monto_pago) {
            abono.id_tipo_pago = 1;
            abono.no_pagos = 1;
        } else if (abono.monto > 0) {
            abono.id_tipo_pago = 2;
            abono.no_pagos = abono.monto / info.monto_pago;
        } else {
            abono.id_tipo_pago = 4;
            abono.no_pagos = 0;
        }

        let queryAbono = await pool.query('INSERT INTO abono SET ?', [abono]);


        // CALCULO DE ESTADISTICAS -------------------------------------------------------------------------------------------------------------
        let estadistica = await pool.query('SELECT * FROM estadistica_cliente WHERE folio_credito = ?', [abono.folio_credito]);
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
                no_abonos: (abono.id_tipo_pago == 2 ? 1 : 0),
                no_adelantos: (abono.id_pago == 3 ? info.extras_no + 1 : info.extras_no),
                no_atrasos: (abono.id_tipo_pago == 4 ? info.atrasos_no + 1 : (abono.id_tipo_pago == 2 ? abono.monto / info.monto_pago : 0))
            };
        } else {
            // NO_PAGOS
            estadistica.no_pagos += info.pagos_total - (info.restante_no + 1);

            // NO_ABONOS
            if (abono.id_tipo_pago == 2) {
                estadistica.no_abonos += 1;
            }

            // NO_ATRASOS
            if (abono.id_tipo_pago == 4) {
                estadistica.no_atrasos += 1;
            } else if (abono.id_tipo_pago == 2) {
                estadistica.no_atrasos += (abono.monto / info.monto_pago);
            }

            // NO_ADELANTOS
            if (abono.id_tipo_pago == 3) {
                let cal_extra = info.monto_pago - abono.monto;
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
        if (queryAbono.affectedRows > 0) {
            return true;
        }
        return false;
    } catch (error) {
        return false;
    }
}

module.exports = { calcular_abono };