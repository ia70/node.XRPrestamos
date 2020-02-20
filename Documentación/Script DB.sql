-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema XRPrestamos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema XRPrestamos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `XRPrestamos` DEFAULT CHARACTER SET utf8 ;
USE `XRPrestamos` ;

-- -----------------------------------------------------
-- Table `XRPrestamos`.`tipo_inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`tipo_inmueble` (
  `id_tipo_inmueble` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NULL,
  PRIMARY KEY (`id_tipo_inmueble`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`estados` (
  `id_estado` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`pais` (
  `id_pais` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`provincia` (
  `id_provincia` INT NOT NULL AUTO_INCREMENT,
  `id_pais` INT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_provincia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`ciudad` (
  `id_ciudad` INT NOT NULL,
  `id_provinvia` INT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_ciudad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`personas` (
  `id_persona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `apellido_paterno` VARCHAR(20) NULL,
  `apellido_materno` VARCHAR(20) NULL,
  `direccion` VARCHAR(300) NULL,
  `id_ciudad` INT NOT NULL,
  `id_tipo_inmueble` INT NOT NULL,
  `telefono` VARCHAR(12) NULL,
  `correo` VARCHAR(100) NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_persona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`empresa` (
  `empresa_rfc` VARCHAR(13) NOT NULL,
  `razon_social` VARCHAR(250) NULL,
  `direccion` VARCHAR(500) NULL,
  `id_ciudad` INT NULL,
  `cp` INT NULL,
  `telefono` VARCHAR(12) NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`empresa_rfc`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`sucursal` (
  `id_sucursal` INT NOT NULL AUTO_INCREMENT,
  `empresa_rfc` VARCHAR(13) NOT NULL,
  `nombre` VARCHAR(120) NULL,
  `direccion` VARCHAR(500) NULL,
  `id_ciudad` INT NULL,
  `cp` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_sucursal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `id_sucursal` INT NOT NULL,
  `id_persona` INT NOT NULL,
  `alias` VARCHAR(50) NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`roles` (
  `id_rol` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NOT NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`empleados` (
  `empleado_rfc` VARCHAR(13) NOT NULL,
  `id_persona` INT NOT NULL,
  `id_rol` INT NOT NULL,
  `empleado_padre` VARCHAR(13) NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`empleado_rfc`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`usuario` (
  `id_usuario` VARCHAR(20) NOT NULL,
  `id_sucursal` INT NULL DEFAULT 0,
  `password` VARCHAR(100) NULL,
  `empleado_rfc` VARCHAR(13) NOT NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`periodo` (
  `id_periodo` INT NOT NULL AUTO_INCREMENT,
  `anio` INT NOT NULL,
  `mes` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_periodo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`capital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`capital` (
  `id_capital` INT NOT NULL AUTO_INCREMENT,
  `id_sucursal` INT NOT NULL,
  `id_periodo` INT NOT NULL,
  `descripcion` VARCHAR(100) NULL,
  `monto` DECIMAL(10,2) NULL,
  `fecha` DATE NULL,
  PRIMARY KEY (`id_capital`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`estado_prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`estado_prestamo` (
  `id_estado_prestamo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(20) NULL,
  PRIMARY KEY (`id_estado_prestamo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`tipo_plazo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`tipo_plazo` (
  `id_tipo_plazo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_plazo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`prestamos_plazos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`prestamos_plazos` (
  `id_prestamos_plazo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NULL,
  `cantidad` INT NULL,
  `id_tipo_plazo` INT NOT NULL,
  PRIMARY KEY (`id_prestamos_plazo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`prestamos` (
  `id_prestamo` INT NOT NULL AUTO_INCREMENT,
  `empleado_rfc` VARCHAR(13) NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_periodo` INT NOT NULL,
  `id_prestamos_plazo` INT NOT NULL,
  `monto_prestado` DECIMAL(10,2) NULL,
  `monto_pago` DECIMAL(10,2) NULL,
  `monto_total` DECIMAL(10,2) NULL,
  `fecha_prestamo` DATE NOT NULL,
  `fecha_inicio_cobro` DATE NULL,
  `fecha_fin_cobro` DATE NULL,
  `fecha_pago_ultimo` DATE NULL,
  `fecha_siguiente_pago` DATE NULL,
  `pagos_total` INT NULL,
  `pagos_pagados` DECIMAL(10,2) NULL,
  `pagos_atrasados` DECIMAL(10,2) NULL,
  `id_estado_prestamo` INT NOT NULL,
  `id_estado` INT NOT NULL,
  `tipo` INT NULL COMMENT 'Tipo de operqación:\n1- Nuevo prestamo, cliente nuevo\n2- Renovación tarjeta\n3- Nueva tarjeta a cliente Con prestamo activo\n4- Moroso',
  `fecha` DATE NULL,
  PRIMARY KEY (`id_prestamo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`rutas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`rutas` (
  `id_ruta` INT NOT NULL AUTO_INCREMENT,
  `id_sucursal` INT NOT NULL,
  `descripcion` VARCHAR(500) NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_ruta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`abonos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`abonos` (
  `id_abono` INT NOT NULL,
  `id_prestamo` INT NOT NULL,
  `id_periodo` INT NOT NULL,
  `monto` DECIMAL(10,2) NULL,
  `tipo_pago` INT NULL COMMENT 'Tipo de pago:\n1- Pago normal completo\n2- No pagó\n3- Abono almenos un pago completo y más\n4- Abono menos del pago completo',
  `no_pago_adelantado` DECIMAL(10,2) NULL,
  `fecha_abono` DATE NOT NULL,
  PRIMARY KEY (`id_abono`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`colonia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`colonia` (
  `id_colonia` INT NOT NULL AUTO_INCREMENT,
  `id_ciudad` INT NULL,
  `nombre` VARCHAR(50) NULL,
  PRIMARY KEY (`id_colonia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`permisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`permisos` (
  `id_permiso` INT NOT NULL AUTO_INCREMENT,
  `id_rol` INT NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_permiso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`actividad_economica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`actividad_economica` (
  `id_actividad_economica` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_actividad_economica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`cliente_establecimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`cliente_establecimiento` (
  `id_cliente_establecimiento` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `nombre` VARCHAR(100) NULL,
  `direccion` VARCHAR(300) NULL,
  `alias_establecimiento` VARCHAR(50) NULL,
  `id_ciudad` INT NOT NULL,
  `id_actividad_economica` INT NOT NULL,
  `id_tipo_inmueble` INT NOT NULL,
  `id_estado` INT NOT NULL,
  `rutas_id_ruta` INT NOT NULL,
  PRIMARY KEY (`id_cliente_establecimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`empleado_ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`empleado_ruta` (
  `id_empleado_ruta` INT NOT NULL AUTO_INCREMENT,
  `rutas_id_ruta` INT NOT NULL,
  `empleado_rfc` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`id_empleado_ruta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`conceptos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`conceptos` (
  `id_concepto` INT NOT NULL,
  `area` VARCHAR(250) NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_concepto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`egresos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`egresos` (
  `id_egresos` INT NOT NULL,
  `id_sucursal` INT NULL,
  `id_periodo` INT NULL,
  `empleado_rfc` VARCHAR(13) NULL,
  `id_concepto` INT NULL,
  `emisor` VARCHAR(45) NULL,
  `concepto` VARCHAR(500) NULL,
  `empresa` VARCHAR(120) NULL,
  `monto` DECIMAL(10,2) NULL,
  `hora` VARCHAR(20) NULL,
  `folio_ticket` VARCHAR(50) NULL,
  `fecha` DATE NULL,
  PRIMARY KEY (`id_egresos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`tipo_inmueble`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`tipo_inmueble` (`id_tipo_inmueble`, `descripcion`) VALUES (1, 'Propio');
INSERT INTO `XRPrestamos`.`tipo_inmueble` (`id_tipo_inmueble`, `descripcion`) VALUES (2, 'Renta');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`estados`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`estados` (`id_estado`, `descripcion`) VALUES (1, 'Activo');
INSERT INTO `XRPrestamos`.`estados` (`id_estado`, `descripcion`) VALUES (2, 'Inactivo');
INSERT INTO `XRPrestamos`.`estados` (`id_estado`, `descripcion`) VALUES (3, 'Suspendido');
INSERT INTO `XRPrestamos`.`estados` (`id_estado`, `descripcion`) VALUES (4, 'Eliminado');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`pais`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`pais` (`id_pais`, `nombre`) VALUES (1, 'México');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`provincia`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`provincia` (`id_provincia`, `id_pais`, `nombre`) VALUES (1, 1, 'Tabasco');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`ciudad`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`ciudad` (`id_ciudad`, `id_provinvia`, `nombre`) VALUES (1, 1, 'Comalcalco');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`personas`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`personas` (`id_persona`, `nombre`, `apellido_paterno`, `apellido_materno`, `direccion`, `id_ciudad`, `id_tipo_inmueble`, `telefono`, `correo`, `id_estado`) VALUES (1, 'Daniel', 'Pérez', 'Cortéz', 'Colonia Centro', 1, 1, '9141198098', 'pcd510@hotmail.com', 1);
INSERT INTO `XRPrestamos`.`personas` (`id_persona`, `nombre`, `apellido_paterno`, `apellido_materno`, `direccion`, `id_ciudad`, `id_tipo_inmueble`, `telefono`, `correo`, `id_estado`) VALUES (2, 'Angel', 'Castillo', 'López', 'Colonia Centro', 1, 1, '9331036538', 'ejemplo@hotmail.com', 1);
INSERT INTO `XRPrestamos`.`personas` (`id_persona`, `nombre`, `apellido_paterno`, `apellido_materno`, `direccion`, `id_ciudad`, `id_tipo_inmueble`, `telefono`, `correo`, `id_estado`) VALUES (3, 'Maria Elena', 'Gonzalez', 'Ovando', 'Colonia Centro', 1, 1, '9332514561', 'marielena@hotmail.com', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`empresa`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`empresa` (`empresa_rfc`, `razon_social`, `direccion`, `id_ciudad`, `cp`, `telefono`, `id_estado`) VALUES ('RFC45GENERICO', 'CDJ COP Asociados', 'Colonia Centro', 1, 86300, '9331452145', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`sucursal`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`sucursal` (`id_sucursal`, `empresa_rfc`, `nombre`, `direccion`, `id_ciudad`, `cp`, `telefono`, `id_estado`) VALUES (1, 'RFC45GENERICO', 'Comalcalco', 'Colonia Centro', 1, '86300', '9331490521', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`clientes`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`clientes` (`id_cliente`, `id_sucursal`, `id_persona`, `alias`, `id_estado`) VALUES (1, 1, 3, 'Mari Pollo', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`roles` (`id_rol`, `descripcion`, `id_estado`) VALUES (1, 'Administrador', 1);
INSERT INTO `XRPrestamos`.`roles` (`id_rol`, `descripcion`, `id_estado`) VALUES (2, 'Cobrador', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`empleados`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`empleados` (`empleado_rfc`, `id_persona`, `id_rol`, `empleado_padre`, `id_estado`) VALUES ('PECD910112QN9', 1, 1, NULL, 1);
INSERT INTO `XRPrestamos`.`empleados` (`empleado_rfc`, `id_persona`, `id_rol`, `empleado_padre`, `id_estado`) VALUES ('SDFSDFSDFSDFF', 2, 2, '1', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`usuario` (`id_usuario`, `id_sucursal`, `password`, `empleado_rfc`, `id_estado`) VALUES ('admin', 1, 'admin', 'PECD910112QN9', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`periodo`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `anio`, `mes`) VALUES (1, 2020, 'Enero');
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `anio`, `mes`) VALUES (2, 2020, 'Febrero');
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `anio`, `mes`) VALUES (3, 2020, 'Marzo');
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `anio`, `mes`) VALUES (4, 2020, 'Abril');
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `anio`, `mes`) VALUES (5, 2020, 'Mayo');
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `anio`, `mes`) VALUES (6, 2020, 'Junio');
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `anio`, `mes`) VALUES (7, 2020, 'Julio');
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `anio`, `mes`) VALUES (8, 2020, 'Agosto');
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `anio`, `mes`) VALUES (9, 2020, 'Septiembre');
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `anio`, `mes`) VALUES (10, 2020, 'Octubre');
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `anio`, `mes`) VALUES (11, 2020, 'Noviembre');
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `anio`, `mes`) VALUES (12, 2020, 'Diciembre');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`estado_prestamo`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`estado_prestamo` (`id_estado_prestamo`, `descripcion`) VALUES (1, 'Activo');
INSERT INTO `XRPrestamos`.`estado_prestamo` (`id_estado_prestamo`, `descripcion`) VALUES (2, 'Inactivo');
INSERT INTO `XRPrestamos`.`estado_prestamo` (`id_estado_prestamo`, `descripcion`) VALUES (3, 'Renovado');
INSERT INTO `XRPrestamos`.`estado_prestamo` (`id_estado_prestamo`, `descripcion`) VALUES (4, 'Condonado');
INSERT INTO `XRPrestamos`.`estado_prestamo` (`id_estado_prestamo`, `descripcion`) VALUES (5, 'Congelado');
INSERT INTO `XRPrestamos`.`estado_prestamo` (`id_estado_prestamo`, `descripcion`) VALUES (6, 'Moroso');
INSERT INTO `XRPrestamos`.`estado_prestamo` (`id_estado_prestamo`, `descripcion`) VALUES (7, 'Recuperación');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`tipo_plazo`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`tipo_plazo` (`id_tipo_plazo`, `descripcion`) VALUES (1, 'Día');
INSERT INTO `XRPrestamos`.`tipo_plazo` (`id_tipo_plazo`, `descripcion`) VALUES (2, 'Semana');
INSERT INTO `XRPrestamos`.`tipo_plazo` (`id_tipo_plazo`, `descripcion`) VALUES (3, 'Mes');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`prestamos_plazos`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`prestamos_plazos` (`id_prestamos_plazo`, `descripcion`, `cantidad`, `id_tipo_plazo`) VALUES (1, '24 Días', 24, 1);
INSERT INTO `XRPrestamos`.`prestamos_plazos` (`id_prestamos_plazo`, `descripcion`, `cantidad`, `id_tipo_plazo`) VALUES (2, '30 Días', 30, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`rutas`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`rutas` (`id_ruta`, `id_sucursal`, `descripcion`, `id_estado`) VALUES (1, 1, 'R2-Motorizada', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`colonia`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`colonia` (`id_colonia`, `id_ciudad`, `nombre`) VALUES (1, 1, 'Centro');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`actividad_economica`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`actividad_economica` (`id_actividad_economica`, `descripcion`) VALUES (1, 'Taqueria');
INSERT INTO `XRPrestamos`.`actividad_economica` (`id_actividad_economica`, `descripcion`) VALUES (2, 'Carniceria');
INSERT INTO `XRPrestamos`.`actividad_economica` (`id_actividad_economica`, `descripcion`) VALUES (3, 'Reparación de Celulares');
INSERT INTO `XRPrestamos`.`actividad_economica` (`id_actividad_economica`, `descripcion`) VALUES (4, 'Pollos aliñados');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`cliente_establecimiento`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`cliente_establecimiento` (`id_cliente_establecimiento`, `id_cliente`, `nombre`, `direccion`, `alias_establecimiento`, `id_ciudad`, `id_actividad_economica`, `id_tipo_inmueble`, `id_estado`, `rutas_id_ruta`) VALUES (1, 1, 'Polleria Mercado', 'Mercado', 'Mari Pollo Mercado', 1, 4, 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`empleado_ruta`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`empleado_ruta` (`id_empleado_ruta`, `rutas_id_ruta`, `empleado_rfc`) VALUES (2, 1, 'SDFSDFSDFFD');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
