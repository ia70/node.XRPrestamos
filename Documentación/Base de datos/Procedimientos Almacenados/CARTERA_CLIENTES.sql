DROP PROCEDURE IF EXISTS CARTERA_CLIENTES;
 DELIMITER //
CREATE PROCEDURE CARTERA_CLIENTES(IN usuario VARCHAR(30))
   BEGIN
		SELECT e.alias, e.nombre, e.apellido_paterno, e.apellido_materno, f.monto_total, SUM(g.monto) AS "pagado", (f.monto_total - SUM(g.monto)) AS "restante" FROM usuario a
		INNER JOIN usuario_ruta AS b ON b.id_usuario = a.id_usuario
		INNER JOIN ruta AS c ON c.id_ruta = b.id_ruta
		INNER JOIN usuario_establecimiento AS d ON d.id_ruta = c.id_ruta
		INNER JOIN persona AS e ON e.ine = d.ine
		RIGHT JOIN credito AS f ON f.ine = e.ine
		LEFT JOIN abono AS g ON g.folio_credito = f.folio_credito

		WHERE a.id_usuario = usuario GROUP BY f.folio_credito;
   END //
DELIMITER ;