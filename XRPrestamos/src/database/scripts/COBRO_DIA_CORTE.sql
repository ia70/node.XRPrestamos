DROP PROCEDURE IF EXISTS COBRO_DIA_CORTE;
DELIMITER //
CREATE PROCEDURE COBRO_DIA_CORTE()
BEGIN

		-- DECLARACION DE VARIABLES ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	DECLARE done 								INT DEFAULT FALSE;
	
	DECLARE id_ruta													INT DEFAULT 0;
	DECLARE ruta_descripcion								VARCHAR(500) DEFAULT "";
	DECLARE	id_usuario											VARCHAR(30) DEFAULT "";
	DECLARE	total_recolectado								DECIMAL(10,2) DEFAULT 0;
	DECLARE	total_deberia_recolectar_dia		DECIMAL(10,2) DEFAULT 0;
	DECLARE	total_recolectado_sin_extras		DECIMAL(10,2) DEFAULT 0;
	DECLARE	monto_abonos										DECIMAL(10,2) DEFAULT 0;
	DECLARE	monto_extras										DECIMAL(10,2) DEFAULT 0;
	DECLARE	monto_normal										DECIMAL(10,2) DEFAULT 0;
	DECLARE	monto_no_pagos									DECIMAL(10,2) DEFAULT 0;
	DECLARE	monto_defici_abonos							DECIMAL(10,2) DEFAULT 0;
	DECLARE	monto_defici_total_dia					DECIMAL(10,2) DEFAULT 0;

	DECLARE	Total_clientes_a_visitar				INT DEFAULT 0;
	DECLARE	total_clientes_visitados				INT DEFAULT 0;
	DECLARE	total_clientes_no_pago					INT DEFAULT 0;
	DECLARE	total_clientes_pago							INT DEFAULT 0;
	DECLARE	total_clientes_abonaron					INT DEFAULT 0;
	DECLARE	total_clientes_extra						INT DEFAULT 0;
	DECLARE	total_clientes_no_vicitaron 		INT DEFAULT 0;
	DECLARE monto_remanente						DECIMAL(10,2); 
	-- ----------------------------   
	-- AGREGAR ESTE CAMPO, AGREGAR BOTON RENOVAR EN COBRO PARA REALIZAR ESTE CALCULO
	-- AGREGAR ELEMENTO 6 - RENOVACION A ID_ESTADA_CREDITO

	
	-- DECLARACION DEL CURSOR ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/*
 a  cobro_dia
 b  ruta
 c  abono
 d  credito

*/

	DEClARE curLista 
		CURSOR FOR 
				SELECT 
					b.id_ruta, 
					b.descripcion AS "ruta_descripcion", 
					a.id_usuario, 
					SUM(c.monto) AS "total_recolectado", 
					SUM(d.monto_pago) AS "total_deberia_recolectar_dia", 
					SUM(IF(c.id_tipo_pago != 3, c.monto, d.monto_pago)) AS "total_recolectado_sin_extras", 
					SUM(IF(c.id_tipo_pago = 2, c.monto,0)) AS "monto_abonos", 
					SUM(IF(c.id_tipo_pago = 3, c.monto - d.monto_pago, 0)) AS "monto_extras" , 
					SUM(IF(c.id_tipo_pago = 1, c.monto, 0)) AS "monto_normal", 
					SUM(IF(c.id_tipo_pago = 4, d.monto_pago, 0)) AS "monto_no_pagos", 
					SUM(IF(c.id_tipo_pago = 2, d.monto_pago - c.monto, 0)) AS "monto_defici_abonos", 
					SUM(SUM(IF(c.id_tipo_pago = 4, d.monto_pago, 0)) + SUM(IF(c.id_tipo_pago = 2, d.monto_pago - c.monto, 0))) AS "monto_defici_dia"

					FROM ruta b
					INNER JOIN cobro_dia AS a ON a.id_ruta = b.id_ruta
					INNER JOIN credito AS d ON d.folio_credito = a.folio_credito
					LEFT JOIN abono AS c ON c.folio_credito = a.folio_credito

					WHERE GROUP BY b.id_ruta;
		-- FIN CURSOR -----------------------------------------------------------------------------------------------------------------------
		

	-- DECLARACION DE ERROR PARA FOR(CURSOR) ----------------------------------------------------------------------------------------------
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;


		-- TABLA TEMPORAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	CREATE TEMPORARY TABLE IF NOT EXISTS ttcobrodia3 ( 
		id_ruta													INT PRIMARY KEY,
		ruta_descripcion								VARCHAR(500),
		id_usuario											VARCHAR(30),
		total_recolectado								DECIMAL(10,2),
		total_deberia_recolectar_dia		DECIMAL(10,2),
		total_recolectado_sin_extras		DECIMAL(10,2),
		monto_abonos										DECIMAL(10,2),
		monto_extras										DECIMAL(10,2),
		monto_normal										DECIMAL(10,2),
		monto_no_pagos									DECIMAL(10,2),
		monto_defici_abonos							DECIMAL(10,2),
		monto_defici_total_dia					DECIMAL(10,2),

		Total_clientes_a_visitar				INT,
		total_clientes_visitados				INT,
		total_clientes_no_pago					INT,
		total_clientes_pago							INT,
		total_clientes_abonaron					INT,
		total_clientes_extra						INT,
		total_clientes_no_vicitaron 		INT
	); 
		-- FIN TABLA TEMPORAL ----------------------------------------------------------------------------------------------------------------
		
	


	-- Se inicializa el cursor
	OPEN curLista;

	-- INICIO DE CICLO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	ciclo: LOOP
		FETCH curLista INTO 
													var_folio_credito,
													var_id_ruta,
													var_ine, 
													var_nombre, 
													var_alias, 
													var_telefono, 
													var_monto_credito, 
													var_pagos_total, 
													var_monto_total, 
													var_monto_pago, 
													var_fecha_entrega, 
													var_atrasos_no, 
													var_atrasos_monto, 
													var_extras_no, 
													var_extras_monto;
		
		IF done THEN 
			LEAVE ciclo;
		END IF;
		
		# **************************************************************************************************************************************************************************
		
		SET var_pagado = (SELECT SUM(monto) FROM abono WHERE folio_credito = var_folio_credito);
		IF var_pagado IS NULL THEN
			SET var_pagado = 0;
		END IF;
		SET var_restante_no = (SELECT (var_pagos_total - COUNT(id_abono)) FROM abono WHERE folio_credito = var_folio_credito);
		IF var_restante_no IS NULL THEN
			SET var_restante_no = 0;
		END IF;
		SET var_restante_monto = var_restante_no * var_monto_pago;
		IF var_restante_monto IS NULL THEN
			SET var_restante_monto = 0;
		END IF;
		SET var_restante_total = var_monto_total - var_pagado;
		IF var_restante_total IS NULL THEN
			SET var_restante_total = 0;
		END IF;
		SET var_abono_hoy = (SELECT SUM(monto) FROM abono WHERE folio_credito= var_folio_credito AND fecha_abono = CURDATE());
		IF var_abono_hoy IS NULL THEN
			SET var_abono_hoy = 0;
		END IF;
		SET var_id_tipo_pago_aux = (SELECT COUNT(id_tipo_pago) FROM abono WHERE folio_credito= var_folio_credito AND fecha_abono = CURDATE());
		
		
		
		IF (var_pagos_total * var_monto_pago) <= var_pagado THEN
			SET var_id_tipo_pago = 6;
		ELSEIF var_id_tipo_pago_aux = 0 THEN
			SET var_id_tipo_pago = 5;
		ELSEIF var_abono_hoy = 0 THEN
			SET var_id_tipo_pago = 4;
		ELSEIF var_abono_hoy > var_monto_pago THEN
			SET var_id_tipo_pago = 3;
		ELSEIF var_abono_hoy = var_monto_pago THEN
			SET var_id_tipo_pago = 1;
		ELSE
			SET var_id_tipo_pago = 2;
		END IF;
		
		SET var_descripcion = (SELECT descripcion FROM tipo_pago WHERE id_tipo_pago = var_id_tipo_pago);
		
		-- SE INSERTAN LOS DATOS EN LA TABLA TEMPORAL
		INSERT INTO ttcobrodia3 VALUES(
																			var_folio_credito,
																			var_id_ruta,
																			var_ine, 
																			var_nombre, 
																			var_alias, 
																			var_telefono, 
																			var_monto_credito, 
																			var_pagos_total, 
																			var_monto_total, 
																			var_monto_pago, 
																			var_fecha_entrega, 
																			var_pagado, 
																			var_atrasos_no, 
																			var_atrasos_monto, 
																			var_extras_no, 
																			var_extras_monto, 
																			var_restante_no, 
																			var_restante_monto, 
																			var_restante_total, 
																			var_abono_hoy, 
																			var_id_tipo_pago, 
																			var_descripcion
																		);
		
		# *************************************************************************************************************************************************************************
		
	END LOOP ciclo;
	-- FIN DE CICLO ---------------------------------------------------------------------------------------------------------------------
	CLOSE curLista;
	
	SELECT * FROM ttcobrodia3;
	DROP TABLE ttcobrodia3;

END // 
DELIMITER;