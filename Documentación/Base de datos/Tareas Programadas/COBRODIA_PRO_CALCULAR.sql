DROP PROCEDURE IF EXISTS COBRODIA_PROC_CALCULAR;
DELIMITER //
CREATE PROCEDURE COBRODIA_PROC_CALCULAR ()
BEGIN

	-- DECLARACION DE VARIABLES ---------------------------------------------------------------------------------------
	DECLARE done INT DEFAULT FALSE;								-- Control de error de FOR(CURSOR)
	DECLARE var_folio varchar(50) DEFAULT "";			-- Folio del credito
	DECLARE var_id_tipo INT DEFAULT 0;						-- Tipo de cobro del credito
	DECLARE var_fecha DATE;												-- Fecha del siguiente pago
	DECLARE var_ruta INT DEFAULT 0;								-- Ruta
	DECLARE var_usuario VARCHAR(30) DEFAULT ""; 	-- Usuario (cobrador)

	-- DECLARACION DEL CURSOR -----------------------------------------------------------------------------------------
	DEClARE curLista 
		CURSOR FOR 
			SELECT a.folio_credito, a.id_tipo_cobro, a.fecha_siguiente_pago, b.id_ruta, c.id_usuario FROM credito a
				INNER JOIN usuario_establecimiento AS b ON b.id_usuario_establecimiento = a.id_usuario_establecimiento
				INNER JOIN usuario_ruta AS c ON c.id_ruta = b.id_ruta
				WHERE a.fecha_siguiente_pago <= CURDATE() ORDER BY a.folio_credito ASC;

	-- DECLARACION DE ERROR PARA FOR(CURSOR) --------------------------------------------------------------------------
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	-- Se inicializa el cursor
	OPEN curLista;

	-- Se inicia ciclo repetitivo -------------------------------------------------------------------------------------
	ciclo: LOOP
		FETCH curLista INTO fol_credito, id_tipo, fecha;
		IF done THEN 
			LEAVE ciclo;
		END IF;
		
		IF fecha < CURDATE() THEN
			SET fecha = COBRODIA_CAL_FECHA_PAGO(fecha,id_tipo);
			UPDATE credito SET fecha_siguiente_pago = fecha WHERE folio_credito = fol_credito;
		END IF
		
		IF fecha = CURDATE() THEN
			
		END IF
		
	END LOOP ciclo;
	CLOSE curLista;

END //
DELIMITER ;