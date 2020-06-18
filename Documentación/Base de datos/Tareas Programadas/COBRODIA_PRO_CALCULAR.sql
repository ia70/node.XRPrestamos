DROP FUNCTION IF EXISTS COBRODIA_PROC_CALCULAR;
DELIMITER //
CREATE PROCEDURE COBRODIA_PROC_CALCULAR ()
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE emailAddress varchar(100) DEFAULT "";

	-- declare cursor for employee email
	DEClARE curLista 
		CURSOR FOR 
			SELECT email FROM employees;

	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

	OPEN curLista;

	getEmail: LOOP
		FETCH curLista INTO emailAddress;
		IF finished = 1 THEN 
			LEAVE getEmail;
		END IF;
		-- build email list
		SET emailList = CONCAT(emailAddress,";",emailList);
	END LOOP getEmail;
	CLOSE curLista;

END //
DELIMITER ;