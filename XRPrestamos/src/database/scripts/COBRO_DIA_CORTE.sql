DROP PROCEDURE IF EXISTS COBRO_DIA_CORTE;
DELIMITER //
CREATE PROCEDURE COBRO_DIA_CORTE()
BEGIN
/*
	Añadir registro tipo_pago: 7 - Renovacion
*/
		SELECT 
					b.id_ruta,
					b.descripcion AS "ruta_descripcion",
					a.id_usuario,
					SUM(c.monto) AS "total_recolectado",
					SUM(d.monto_pago) AS "total_deberia_recolectar_dia",
					SUM(IF(c.id_tipo_pago != 3, c.monto, d.monto_pago)) AS "total_recolectado_sin_extras",
					SUM(IF(c.id_tipo_pago = 2, c.monto,0)) AS "monto_abonos",
					SUM(IF(c.id_tipo_pago = 3, c.monto - d.monto_pago, 0)) AS "monto_extras",
					SUM(IF(c.id_tipo_pago = 1, c.monto, 0)) AS "monto_normal",
					SUM(IF(c.id_tipo_pago = 4, d.monto_pago, 0)) AS "monto_no_pagos",
					SUM(IF(c.id_tipo_pago = 2, d.monto_pago - c.monto, 0)) AS "monto_defici_abonos",
					SUM(IF(c.id_tipo_pago = 4, c.monto, IF(c.id_tipo_pago = 2, d.monto_pago - c.monto,0))) AS "monto_defici_total",
					SUM(IF(c.id_tipo_pago = 7,IF(c.monto >= d.monto_pago, c.monto - d.monto_pago,c.monto),0)) AS "monto_remanente",

					COUNT(a.folio_credito) AS "total_cli_visitar",
					COUNT(c.id_abono) AS "total_cli_visitados",
					SUM(IF(c.id_tipo_pago = 4, 1, null)) AS "total_cli_no_pago",
					SUM(IF(c.id_tipo_pago = 1, 1, null)) AS "total_cli_pago",
					SUM(IF(c.id_tipo_pago = 2, 1, null)) AS "total_cli_abonaron",
					SUM(IF(c.id_tipo_pago = 3, 1, null)) AS "total_cli_extra",
					(COUNT(a.id_ruta) - COUNT(c.id_abono)) AS "total_cli_no_vicitaron"

					FROM ruta b
					INNER JOIN cobro_dia AS a ON a.id_ruta = b.id_ruta
					INNER JOIN credito AS d ON d.folio_credito = a.folio_credito
					LEFT JOIN abono AS c ON c.folio_credito = a.folio_credito
					GROUP BY a.id_ruta;
END // 
DELIMITER;