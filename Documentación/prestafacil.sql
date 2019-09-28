-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.1.37-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para prestafacil
CREATE DATABASE IF NOT EXISTS `prestafacil` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `prestafacil`;

-- Volcando estructura para tabla prestafacil.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_clientes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_clientes` varchar(150) NOT NULL DEFAULT '',
  `alias_clientes` varchar(50) NOT NULL DEFAULT '',
  `telefono_clientes` varchar(15) NOT NULL DEFAULT '',
  `direccion_clientes` varchar(150) NOT NULL DEFAULT '',
  `renta_direccion_clientes` varchar(3) NOT NULL DEFAULT '' COMMENT '¿Pregunta?',
  `direccion_local_clientes` varchar(150) NOT NULL DEFAULT '',
  `renta_direccion_local_clientes` varchar(3) NOT NULL DEFAULT '' COMMENT '¿Pregunta?',
  `estatus_clientes` varchar(10) DEFAULT 'ACTIVO',
  `id_rutas` int(11) NOT NULL DEFAULT '0',
  `id_tipo_negocio` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_clientes`),
  KEY `FK_rutas_clientes` (`id_rutas`),
  KEY `FK_tipo_negocio_clientes` (`id_tipo_negocio`),
  CONSTRAINT `FK_rutas_clientes` FOREIGN KEY (`id_rutas`) REFERENCES `rutas` (`id_rutas`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tipo_negocio_clientes` FOREIGN KEY (`id_tipo_negocio`) REFERENCES `tipo_negocio` (`id_tipo_negocio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla prestafacil.clientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id_clientes`, `nombre_clientes`, `alias_clientes`, `telefono_clientes`, `direccion_clientes`, `renta_direccion_clientes`, `direccion_local_clientes`, `renta_direccion_local_clientes`, `estatus_clientes`, `id_rutas`, `id_tipo_negocio`) VALUES
	(2, 'Jose del Carmen', 'Chkm', '9982396022', 'La unica', 'no', 'La chida', 'si', 'PRESTAMO', 1, 1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla prestafacil.cobradores
CREATE TABLE IF NOT EXISTS `cobradores` (
  `id_cobradores` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cobradores` varchar(150) NOT NULL DEFAULT '',
  `password_cobradores` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_cobradores`),
  UNIQUE KEY `nombre_cobradores` (`nombre_cobradores`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Esta tabla es la que sera utilizada para la informacion de los cobradores y al mismo tiempo como la de usuarios\r\n';

-- Volcando datos para la tabla prestafacil.cobradores: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cobradores` DISABLE KEYS */;
INSERT INTO `cobradores` (`id_cobradores`, `nombre_cobradores`, `password_cobradores`) VALUES
	(1, 'Emma', 'jijiji'),
	(2, 'Jose', 'jajaja'),
	(5, 'JOSE2.0', '321');
/*!40000 ALTER TABLE `cobradores` ENABLE KEYS */;

-- Volcando estructura para tabla prestafacil.pagos_registrados
CREATE TABLE IF NOT EXISTS `pagos_registrados` (
  `id_pagos_registrados` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_pagos_registrados` date DEFAULT NULL,
  `fecha_registrado_pagos_registrados` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estatus_pagos_registrados` varchar(20) DEFAULT 'POR PAGAR',
  `cantidad_pagos_registrados` decimal(10,2) NOT NULL DEFAULT '0.00',
  `id_prestamo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pagos_registrados`),
  KEY `FK_prestamo_pagos_registrados` (`id_prestamo`),
  CONSTRAINT `FK_prestamo_pagos_registrados` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo` (`id_prestamo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COMMENT='Aqui se guardaran todos los registros de los pagos realizados por cada cliente';

-- Volcando datos para la tabla prestafacil.pagos_registrados: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `pagos_registrados` DISABLE KEYS */;
INSERT INTO `pagos_registrados` (`id_pagos_registrados`, `fecha_pagos_registrados`, `fecha_registrado_pagos_registrados`, `estatus_pagos_registrados`, `cantidad_pagos_registrados`, `id_prestamo`) VALUES
	(27, '2019-09-30', '2019-09-26 15:52:03', 'POR PAGAR', 2400.00, 6),
	(28, '2019-10-01', '2019-09-26 15:52:03', 'POR PAGAR', 2400.00, 6),
	(29, '2019-10-02', '2019-09-26 15:52:03', 'POR PAGAR', 2400.00, 6),
	(30, '2019-10-03', '2019-09-26 15:52:03', 'POR PAGAR', 2400.00, 6),
	(31, '2019-10-04', '2019-09-26 15:52:03', 'POR PAGAR', 2400.00, 6);
/*!40000 ALTER TABLE `pagos_registrados` ENABLE KEYS */;

-- Volcando estructura para tabla prestafacil.prestamo
CREATE TABLE IF NOT EXISTS `prestamo` (
  `id_prestamo` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad_prestamo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fecha_inicio_prestamo` date DEFAULT NULL,
  `cantidad_dias_prestamo` int(11) NOT NULL DEFAULT '0',
  `estatus_prestamo` varchar(15) DEFAULT 'ACTIVO',
  `id_clientes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_prestamo`),
  KEY `FK_clientes_prestamo` (`id_clientes`),
  CONSTRAINT `FK_clientes_prestamo` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='En esta tabla se guardaran los prestamos que haya tenido cada cliente y que tengan actualmente';

-- Volcando datos para la tabla prestafacil.prestamo: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
INSERT INTO `prestamo` (`id_prestamo`, `cantidad_prestamo`, `fecha_inicio_prestamo`, `cantidad_dias_prestamo`, `estatus_prestamo`, `id_clientes`) VALUES
	(6, 10000.00, '2019-09-30', 5, 'ACTIVO', 2);
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;

-- Volcando estructura para tabla prestafacil.rel_rutas_cobradores
CREATE TABLE IF NOT EXISTS `rel_rutas_cobradores` (
  `id_rel_rutas_cobradores` int(11) NOT NULL AUTO_INCREMENT,
  `id_rutas` int(11) NOT NULL DEFAULT '0',
  `id_cobradores` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rel_rutas_cobradores`),
  KEY `FK_rutas_rrc` (`id_rutas`),
  KEY `FK_cobradores_rrc` (`id_cobradores`),
  CONSTRAINT `FK_cobradores_rrc` FOREIGN KEY (`id_cobradores`) REFERENCES `cobradores` (`id_cobradores`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_rutas_rrc` FOREIGN KEY (`id_rutas`) REFERENCES `rutas` (`id_rutas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='En esta tabla relacionamos las rutas con los cobradores, ya que varias rutas le pueden pertenecer a un cobrador y mas de un cobrador pueden tener una misma ruta por el tema de los supervisores o sea los que tendran gente a su cargo';

-- Volcando datos para la tabla prestafacil.rel_rutas_cobradores: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `rel_rutas_cobradores` DISABLE KEYS */;
INSERT INTO `rel_rutas_cobradores` (`id_rel_rutas_cobradores`, `id_rutas`, `id_cobradores`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 2);
/*!40000 ALTER TABLE `rel_rutas_cobradores` ENABLE KEYS */;

-- Volcando estructura para tabla prestafacil.rutas
CREATE TABLE IF NOT EXISTS `rutas` (
  `id_rutas` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rutas` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_rutas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Aquí se iran almacenando las rutas de cobro';

-- Volcando datos para la tabla prestafacil.rutas: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `rutas` DISABLE KEYS */;
INSERT INTO `rutas` (`id_rutas`, `nombre_rutas`) VALUES
	(1, 'R1Mercado'),
	(2, 'R2CalleJuarez'),
	(3, 'testRuta');
/*!40000 ALTER TABLE `rutas` ENABLE KEYS */;

-- Volcando estructura para tabla prestafacil.tipo_negocio
CREATE TABLE IF NOT EXISTS `tipo_negocio` (
  `id_tipo_negocio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_negocio` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_negocio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla prestafacil.tipo_negocio: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_negocio` DISABLE KEYS */;
INSERT INTO `tipo_negocio` (`id_tipo_negocio`, `nombre_tipo_negocio`) VALUES
	(1, 'Fruteria');
/*!40000 ALTER TABLE `tipo_negocio` ENABLE KEYS */;

-- Volcando estructura para procedimiento prestafacil.AgregarClientes
DELIMITER //
CREATE DEFINER=`prestamos`@`localhost` PROCEDURE `AgregarClientes`(
	IN `InNombreClientes` VARCHAR(150),
	IN `InAlias` VARCHAR(50),
	IN `InTelefono` VARCHAR(15),
	IN `InDireccion` VARCHAR(150),
	IN `InRentaDireccion` VARCHAR(3),
	IN `InDireccionLocal` VARCHAR(150),
	IN `InRentaDireccionLocal` VARCHAR(3),
	IN `InIdRutas` INT,
	IN `InIdTipoNegocio` INT


)
BEGIN
	INSERT INTO clientes(clientes.nombre_clientes, clientes.alias_clientes, clientes.telefono_clientes, clientes.direccion_clientes, clientes.renta_direccion_clientes, clientes.direccion_local_clientes, clientes.renta_direccion_local_clientes, clientes.id_rutas, clientes.id_tipo_negocio) VALUES(InNombreClientes, InAlias, InTelefono, InDireccion, InRentaDireccion, InDireccionLocal, InRentaDireccionLocal, InIdRutas, InIdTipoNegocio);
	SELECT 'SUCCESS' AS RESPUESTA;
END//
DELIMITER ;

-- Volcando estructura para procedimiento prestafacil.AgregarCobradores
DELIMITER //
CREATE DEFINER=`prestamos`@`localhost` PROCEDURE `AgregarCobradores`(
	IN `InNombreCobradores` VARCHAR(150),
	IN `InPasswordCobradores` VARCHAR(150)


)
BEGIN
	IF NOT EXISTS (SELECT cobradores.nombre_cobradores FROM cobradores WHERE cobradores.nombre_cobradores = InNombreCobradores) THEN
		# INSERTAR UN NUEVO COBRADOR.
		INSERT INTO cobradores(cobradores.nombre_cobradores, cobradores.password_cobradores) VALUES(InNombreCobradores, InPasswordCobradores);
		SELECT 'SUCCESS' AS RESPUESTA;
	ELSE
		SELECT 'ERROR' AS RESPUESTA;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento prestafacil.AgregarPrestamo
DELIMITER //
CREATE DEFINER=`prestamos`@`localhost` PROCEDURE `AgregarPrestamo`(
	IN `InCantidadPrestamo` DECIMAL(10,2),
	IN `InFechaInicio` DATE,
	IN `InCantidadDias` INT,
	IN `InIdClientes` INT









)
    COMMENT 'En esta rutina se agregara un prestamo para un cliente, esto constara de registrar en la tabla prestamos y generar los pagos pendientes del clientes ya sea en 24 o 30 días.'
BEGIN
	DECLARE CONTADOR, ID_PRESTAMO INT;
	DECLARE CANTIDAD_PRESTAMO DECIMAL(10,2);
	DECLARE DIANUEVO DATE;
	SET CONTADOR = 1;	
	
	# REGISTRAR UN NUEVO PRESTAMO
	INSERT INTO prestamo(prestamo.cantidad_prestamo, prestamo.fecha_inicio_prestamo, prestamo.cantidad_dias_prestamo, prestamo.id_clientes) VALUES (InCantidadPrestamo, InFechaInicio, InCantidadDias, InIdClientes);
	SET ID_PRESTAMO = (SELECT LAST_INSERT_ID());
	
	# ACTUALIZAR EL ESTATUS DEL CLIENTE A "PRESTAMO"
	UPDATE clientes SET clientes.estatus_clientes = 'PRESTAMO' WHERE clientes.id_clientes = InIdClientes;
	
	# GENERAR TODOS LOS PAGOS CON SUS ESTATUS
	SET DIANUEVO = InFechaInicio;
	SET CANTIDAD_PRESTAMO = (InCantidadPrestamo / InCantidadDias) * 1.20;
	WHILE CONTADOR <= InCantidadDias DO
		INSERT INTO pagos_registrados(pagos_registrados.fecha_pagos_registrados, pagos_registrados.cantidad_pagos_registrados, pagos_registrados.id_prestamo) VALUES(DIANUEVO, CANTIDAD_PRESTAMO, ID_PRESTAMO);		
		SET CONTADOR = CONTADOR + 1;
		SET DIANUEVO = (SELECT ADDDATE(DIANUEVO, INTERVAL 1 DAY));
	END WHILE;
END//
DELIMITER ;

-- Volcando estructura para procedimiento prestafacil.AgregarRutas
DELIMITER //
CREATE DEFINER=`prestamos`@`localhost` PROCEDURE `AgregarRutas`(
	IN `InNombreRuta` VARCHAR(150)
)
BEGIN
	IF NOT EXISTS (SELECT rutas.nombre_rutas FROM rutas WHERE rutas.nombre_rutas = InNombreRuta) THEN
		# INSERTAR UNA NUEVA RUTA.
		INSERT INTO rutas(rutas.nombre_rutas) VALUES(InNombreRuta);
		SELECT 'SUCCESS' AS RESPUESTA;
	ELSE
		SELECT 'ERROR' AS RESPUESTA;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento prestafacil.AgregarTipoNegocio
DELIMITER //
CREATE DEFINER=`prestamos`@`localhost` PROCEDURE `AgregarTipoNegocio`(
	IN `InNombreTipoNegocio` VARCHAR(150)

)
BEGIN
	IF NOT EXISTS (SELECT tipo_negocio.nombre_tipo_negocio FROM tipo_negocio WHERE tipo_negocio.nombre_tipo_negocio = InNombreTipoNegocio) THEN
		# INSERTAR UN NUEVO TIPO DE NEGOCIO.
		INSERT INTO tipo_negocio(tipo_negocio.nombre_tipo_negocio) VALUES(InNombreTipoNegocio);
		SELECT 'SUCCESS' AS RESPUESTA;
	ELSE
		SELECT 'ERROR' AS RESPUESTA;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento prestafacil.ConsultarAgregarPrestamo
DELIMITER //
CREATE DEFINER=`prestamos`@`localhost` PROCEDURE `ConsultarAgregarPrestamo`()
    COMMENT 'Aquí hare la consulta para extraer los datos para agregar un nuevo prestamo al cliente'
BEGIN

END//
DELIMITER ;

-- Volcando estructura para procedimiento prestafacil.EditarClientes
DELIMITER //
CREATE DEFINER=`prestamos`@`localhost` PROCEDURE `EditarClientes`(
	IN `InID` INT,
	IN `InNombreClientes` VARCHAR(150),
	IN `InAlias` VARCHAR(50),
	IN `InTelefono` VARCHAR(15),
	IN `InDireccion` VARCHAR(150),
	IN `InRentaDireccion` VARCHAR(3),
	IN `InDireccionLocal` VARCHAR(150),
	IN `InRentaDireccionLocal` VARCHAR(3),
	IN `InIdRutas` INT,
	IN `InIdTipoNegocio` INT
)
BEGIN
	UPDATE clientes
	SET clientes.nombre_clientes = InNombreClientes,
		clientes.alias_clientes = InAlias,
		clientes.telefono_clientes = InTelefono,
		clientes.direccion_clientes = InDireccion,
		clientes.renta_direccion_clientes = InRentaDireccion,
		clientes.direccion_local_clientes = InDireccionLocal,
		clientes.renta_direccion_local_clientes = InRentaDireccionLocal,
		clientes.id_rutas = InIdRutas,
		clientes.id_tipo_negocio = InIdTipoNegocio
	WHERE clientes.id_clientes = InID;
	SELECT 'SUCCESS' AS RESPUESTA;
END//
DELIMITER ;

-- Volcando estructura para procedimiento prestafacil.EditarCobradores
DELIMITER //
CREATE DEFINER=`prestamos`@`localhost` PROCEDURE `EditarCobradores`(
	IN `InID` INT,
	IN `InNombreCobrador` VARCHAR(150),
	IN `InPasswordCobrador` VARCHAR(150)

)
BEGIN
	UPDATE cobradores 
		SET cobradores.nombre_cobradores = InNombreCobrador,
		cobradores.password_cobradores = InPasswordCobrador
	WHERE cobradores.id_cobradores = InID;
	SELECT 'SUCCESS' AS RESPUESTA;
END//
DELIMITER ;

-- Volcando estructura para procedimiento prestafacil.EditarRutas
DELIMITER //
CREATE DEFINER=`prestamos`@`localhost` PROCEDURE `EditarRutas`(
	IN `InID` INT,
	IN `InNombreRuta` INT

)
BEGIN
	UPDATE rutas
	SET rutas.nombre_rutas = InNombreRuta
	WHERE rutas.id_rutas = InID;
	SELECT 'SUCCESS' AS RESPUESTA;
END//
DELIMITER ;

-- Volcando estructura para procedimiento prestafacil.EditarTipoNegocio
DELIMITER //
CREATE DEFINER=`prestamos`@`localhost` PROCEDURE `EditarTipoNegocio`(
	IN `InID` INT,
	IN `InNombreTipoNegocio` VARCHAR(150)
)
BEGIN
	UPDATE tipo_negocio
	SET tipo_negocio.nombre_tipo_negocio = InNombreTipoNegocio
	WHERE tipo_negocio.id_tipo_negocio = InID;
	SELECT 'SUCCESS' AS RESPUESTA;
END//
DELIMITER ;

-- Volcando estructura para procedimiento prestafacil.pruebas
DELIMITER //
CREATE DEFINER=`prestamos`@`localhost` PROCEDURE `pruebas`()
BEGIN
	DECLARE CONTADOR, TOTAL_CICLOS INT;
	
	SET TOTAL_CICLOS = 4;
	SET CONTADOR = 1;
	
	WHILE CONTADOR <= TOTAL_CICLOS DO
		SELECT CONTADOR;
		SET CONTADOR = CONTADOR + 1;
	END WHILE;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
