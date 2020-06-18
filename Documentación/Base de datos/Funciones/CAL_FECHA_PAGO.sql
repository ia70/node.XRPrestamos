DROP FUNCTION IF EXISTS COBRODIA_CAL_FECHA_PAGO;
DELIMITER //
CREATE FUNCTION COBRODIA_CAL_FECHA_PAGO (fecha_pago DATE, tipo_cobro INT)
	RETURNS VARCHAR(20)
BEGIN 
	DECLARE fecha DATE;

	CASE tipo_cobro
		WHEN 1 THEN # AGREGAR UN DIA A LA FECHA
			SET fecha = DATE_ADD(fecha_pago, INTERVAL 1 DAY);
			RETURN fecha;
			-- --------------------------------------------------------------------------------------------------
		WHEN 2 THEN #
			SET fecha = DATE_ADD(fecha_pago, INTERVAL 7 DAY);
			RETURN fecha;
			-- --------------------------------------------------------------------------------------------------
		WHEN 3 THEN # 
			SET fecha = DATE_ADD(fecha_pago, INTERVAL 14 DAY);
			RETURN fecha;
			-- --------------------------------------------------------------------------------------------------
		WHEN 4 THEN # 
			SET fecha = DATE_ADD(fecha_pago, INTERVAL 15 DAY);
			RETURN fecha;
			-- --------------------------------------------------------------------------------------------------
		WHEN 5 THEN # 
			SET fecha = DATE_ADD(fecha_pago, INTERVAL 1 MONTH);
			RETURN fecha;
			-- --------------------------------------------------------------------------------------------------
		END CASE;

END//
DELIMITER;