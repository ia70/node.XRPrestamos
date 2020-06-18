DROP PROCEDURE IF EXISTS FILTRAR_CLIENTES;
 DELIMITER //
CREATE PROCEDURE FILTRAR_CLIENTES(IN filtro VARCHAR(100))
	BEGIN
		SELECT a.ine, concat_ws(' ',a.alias, " - ", a.nombre, a.apellido_paterno, a.apellido_materno) AS "nombre" FROM persona a
		INNER JOIN usuario AS b ON b.ine = a.ine
		WHERE b.id_rol = 3 AND concat_ws(' ', a.ine, a.alias, a.nombre, a.apellido_paterno, a.apellido_materno) 
		LIKE CONCAT('%',filtro,'%') ORDER BY nombre ASC LIMIT 10;
	END //
DELIMITER ;