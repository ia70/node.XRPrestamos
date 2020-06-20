DROP PROCEDURE IF EXISTS COBRO_DIA;
 DELIMITER //
CREATE PROCEDURE COBRO_DIA(IN usuario VARCHAR(100))
	BEGIN
		-- a Persona
		-- b Credito
		-- c Abono
		-- d Cobro_dia

		SELECT D.folio_credito,a.ine, a.alias, CONCAT_WS(' ', a.nombre, a.apellido_paterno, a.apellido_materno) AS "nombre", b.monto_pago, c.id_tipo_pago, c.monto
			FROM credito b
			INNER JOIN cobro_dia AS d ON d.folio_credito = b.folio_credito
			INNER JOIN persona AS a ON a.ine = d.ine
			LEFT JOIN abono AS c ON c.folio_credito = d.folio_credito AND DATE(c.fecha_reg) = CURDATE()

WHERE d.id_usuario = usuario;
	END //
DELIMITER ;