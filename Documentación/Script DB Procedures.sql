DROP PROCEDURE IF EXISTS cartera_clientes;
 DELIMITER //
CREATE PROCEDURE cartera_clientes(IN usuario VARCHAR(30))
   BEGIN
		SELECT e.alias, e.nombre, e.apellido_paterno, e.apellido_materno, f.monto_total, SUM(g.monto) AS "pagado", (f.monto_total - SUM(g.monto)) AS "restante" FROM usuario a
		INNER JOIN usuario_ruta AS b ON b.id_usuario = a.id_usuario
		INNER JOIN ruta AS c ON c.id_ruta = b.id_ruta
		INNER JOIN usuario_establecimiento AS d ON d.id_ruta = c.id_ruta
		INNER JOIN persona AS e ON e.ine = d.ine
		RIGHT JOIN credito AS f ON f.ine = e.ine
		LEFT JOIN abono AS g ON g.id_credito = f.id_credito

		WHERE a.id_usuario = usuario GROUP BY f.id_credito;
   END //
DELIMITER ;

DROP PROCEDURE IF EXISTS filtrar_clientes;
 DELIMITER //
CREATE PROCEDURE filtrar_clientes(IN filtro VARCHAR(100))
	BEGIN
		SELECT a.ine, concat_ws(' ',a.alias, " - ", a.nombre, a.apellido_paterno, a.apellido_materno) AS "nombre" FROM persona a
		INNER JOIN usuario AS b ON b.ine = a.ine
		WHERE b.id_rol = 3 AND concat_ws(' ', a.ine, a.alias, a.nombre, a.apellido_paterno, a.apellido_materno) 
		LIKE CONCAT('%',filtro,'%') ORDER BY nombre ASC LIMIT 10;
	END //
DELIMITER ;

DROP PROCEDURE IF EXISTS lista_solicitudes;
 DELIMITER //
CREATE PROCEDURE lista_solicitudes(IN usuario VARCHAR(100))
	BEGIN
		SELECT a.ine, a.alias, CONCAT_WS(' ', a.nombre, a.apellido_paterno, a.apellido_materno) AS "nombre", b.monto, b.pagos, b.id_estado_solicitud 
		FROM persona a INNER JOIN solicitud AS b ON b.ine = a.ine
		WHERE b.id_usuario = usuario;
	END //
DELIMITER ;