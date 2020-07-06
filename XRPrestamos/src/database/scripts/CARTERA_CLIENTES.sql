DROP PROCEDURE IF EXISTS CARTERA_CLIENTES;
 DELIMITER //
CREATE PROCEDURE CARTERA_CLIENTES(IN usuario VARCHAR(30))
   BEGIN
		-- a Persona
		-- b Credito
		-- c Abono
		-- d Usuario_establecimiento
		-- e Usuario_ruta
		-- f Usuario

		SELECT a.alias, CONCAT_WS(' ', a.nombre, a.apellido_paterno, a.apellido_materno) AS "nombre", b.monto_total, SUM(c.monto) AS "pagado", (b.monto_total - SUM(c.monto)) AS "restante" FROM credito b
			INNER JOIN usuario_establecimiento AS d ON d.id_usuario_establecimiento = b.id_usuario_establecimiento
			INNER JOIN persona AS a ON a.ine = d.ine
			INNER JOIN usuario_ruta AS e ON e.id_ruta = d.id_ruta
			INNER JOIN usuario AS f ON f.id_usuario = e.id_usuario
			JOIN abono AS c 
			WHERE f.id_usuario = usuario AND b.id_estado_credito = 1
			GROUP BY b.folio_credito;
   END //
DELIMITER ;