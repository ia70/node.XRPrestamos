DROP PROCEDURE IF EXISTS COBRODIA_PROC_CALCULAR;
DELIMITER //
CREATE PROCEDURE COBRODIA_PROC_CALCULAR ()
BEGIN

	-- DECLARACION DE VARIABLES ---------------------------------------------------------------------------------------
	DECLARE done INT DEFAULT FALSE;								-- Control de error de FOR(CURSOR)
	DECLARE var_folio VARCHAR(50) DEFAULT "";			-- Folio del credito
	DECLARE var_id_tipo INT DEFAULT 0;						-- Tipo de cobro del credito
	DECLARE var_fecha DATE;												-- Fecha del siguiente pago
	DECLARE var_ruta INT DEFAULT 0;								-- Ruta
	DECLARE var_usuario VARCHAR(30) DEFAULT ""; 	-- Usuario (cobrador)
	DECLARE var_no_abonos INT DEFAULT 0;
	DECLARE var_fecha_abono DATE DEFAULT "";
	DECLARE var_estadistica_existe INT DEFAULT 0;
	
	DECLARE var_ine VARCHAR(100) DEFAULT "";
	DECLARE var_monto_prestamo DECIMAL(10,2) DEFAULT 0;
	DECLARE var_fecha_entrega DATE DEFAULT "";
	DECLARE var_no_pagos INT DEFAULT 0;
	DECLARE var_folio_credito VARCHAR(50);
 
	-- DECLARACION DEL CURSOR -----------------------------------------------------------------------------------------
	DEClARE curLista 
		CURSOR FOR 
			SELECT a.folio_credito, a.id_tipo_cobro, a.fecha_siguiente_pago, b.id_ruta, c.id_usuario, COUNT(d.monto) AS "no_abonos" FROM credito a
				INNER JOIN usuario_establecimiento AS b ON b.id_usuario_establecimiento = a.id_usuario_establecimiento
				INNER JOIN usuario_ruta AS c ON c.id_ruta = b.id_ruta
				LEFT JOIN abono AS d ON d.folio_credito = a.folio_credito
				WHERE a.fecha_siguiente_pago <= CURDATE() AND a.id_estado_credito = 1 ORDER BY a.folio_credito ASC;



-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	DEClARE curLista2 
			CURSOR FOR 
				SELECT a.folio_credito, d.ine, c.monto_credito, c.fecha_entrega, c.pagos_total
				FROM cobro_dia a
				INNER JOIN credito AS c ON c.folio_credito = a.folio_credito
				INNER JOIN usuario_establecimiento AS d ON d.id_usuario_establecimiento = c.id_usuario_establecimiento
				LEFT JOIN abono AS b ON b.folio_credito = a.folio_credito AND b.fecha_abono = DATE(DATE_SUB( NOW(), INTERVAL 1 DAY))
				WHERE b.fecha_abono IS NULL;

	-- DECLARACION DE ERROR PARA FOR(CURSOR) --------------------------------------------------------------------------
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	SET var_fecha_abono = (DATE_SUB( NOW(), INTERVAL 1 DAY));
	OPEN curLista2;
	
	ciclo2: LOOP
			FETCH curLista2 INTO var_folio_credito, var_ine, var_monto_prestamo, var_fecha_entrega, var_no_pagos;
			
			IF done THEN 
				LEAVE ciclo2;
			END IF;
			
				INSERT INTO abono VALUES(var_folio_credito, 0, 0, 4, var_fecha_abono, 1, NOW());
				
				SET var_estadistica_existe = (SELECT COUNT(ine) FROM estadistica_cliente WHERE folio_credito = var_folio_credito);
				IF var_estadistica_existe > 0 THEN
					UPDATE estadistica_cliente SET no_pagos = (no_pagos + 1) WHERE folio_credito = var_folio_credito;
				ELSE
					INSERT INTO estadistica_cliente VALUES(var_folio_credito, var_ine, var_monto_prestamo, var_fecha_entrega, var_no_pagos, 0, 0, 0, 1);
				END IF;
			
		END LOOP ciclo2;
		CLOSE curLista2;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	-- Se inicializa el cursor
	OPEN curLista;
	
	-- Borrar datos anteriores de la tabla COBRO_DIA
	TRUNCATE TABLE cobro_dia;

	-- Se inicia ciclo repetitivo -------------------------------------------------------------------------------------
	ciclo: LOOP
		FETCH curLista INTO var_folio, var_id_tipo, var_fecha, var_ruta, var_usuario, var_no_abonos;
		
		IF done THEN 
			LEAVE ciclo;
		END IF;
		
		IF var_fecha < CURDATE() THEN
			SET var_fecha = COBRODIA_CAL_FECHA_PAGO(var_fecha, var_id_tipo);
			UPDATE credito SET fecha_siguiente_pago = var_fecha WHERE folio_credito = var_folio;
		END IF;
		
		IF var_fecha = CURDATE() THEN
			INSERT INTO cobro_dia VALUES(var_folio, var_ine, var_ruta, var_usuario);
		END IF;
		
	END LOOP ciclo;
	CLOSE curLista;

END //
DELIMITER ;