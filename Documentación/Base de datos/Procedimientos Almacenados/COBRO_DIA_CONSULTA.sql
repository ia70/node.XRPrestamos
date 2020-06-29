DROP PROCEDURE IF EXISTS COBRO_DIA_CONSULTA;
 DELIMITER //
CREATE PROCEDURE COBRO_DIA_CONSULTA(IN _credito VARCHAR(50))
	BEGIN
		-- a Persona
		-- b Credito
		-- c Abono
		-- d Cobro_dia

		-- CAMPOS -----------------------------------------------
		
		/* 
		
		1 - folio_credito
		2 - ine
		3 - nombre (nombre completo)
		4 - alias
		5 - telefono
		6 - monto_credito
		7 - monto_total
		8 - monto_pago
		9 - fecha_entrega
		10 - pagado
		11 - atrasos_no
		12 - atrasos_monto
		13 - extra_no
		14 - extra_monto
		15 - restante_no
		16 - restante_monto
		17 - restante_total
		18 - abono_hoy
		19 - id_tipo_pago
		20 - descripcion
		
		*/
		
		SELECT 
					d.folio_credito,
					a.ine,
					CONCAT_WS(' ', a.nombre, a.apellido_paterno, a.apellido_materno) AS "nombre",
					a.alias,
					a.telefono,
					b.monto_credito,
					b.monto_total,
					b.monto_pago,
					b.fecha_entrega,
					SUM(c.monto) AS "pagado",
					COUNT(IF(c.id_tipo_pago = 4,c.id_tipo_pago,NULL)) AS "atrasos_no",
					SUM(IF(c.id_tipo_pago = 4, b.monto_pago,IF(c.id_tipo_pago = 2, b.monto_pago - c.monto, 0))) AS "atrasos_monto",
					COUNT(IF(c.id_tipo_pago = 3,c.id_tipo_pago,NULL)) AS "extras_no",
					SUM(IF(c.id_tipo_pago = 3, c.monto - b.monto_pago, 0)) AS "extras_monto",
					(b.pagos_total - COUNT(c.id_abono)) AS "restante_no",
					((b.pagos_total - COUNT(c.id_abono)) * b.monto_pago) AS "restante_monto",
					(b.monto_total - SUM(c.monto)) AS "restante_total",
					SUM(IF(c.fecha_abono = CURDATE(), c.monto, 0)) AS "abono_hoy",
					IF(c.id_tipo_pago != NULL, c.id_tipo_pago, 5) AS 		"id_tipo_pago",
					e.descripcion
				
		FROM credito b
		INNER JOIN cobro_dia AS d ON d.folio_credito = b.folio_credito
		INNER JOIN persona AS a ON a.ine = d.ine
		LEFT JOIN abono AS c ON c.folio_credito = d.folio_credito
		INNER JOIN tipo_pago AS e ON e.id_tipo_pago = IF(c.id_tipo_pago != NULL, c.id_tipo_pago, 5)

		WHERE b.folio_credito = _credito GROUP BY b.folio_credito ORDER BY a.alias;
	END //
DELIMITER ;