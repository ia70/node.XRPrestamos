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
-- Table `XRPrestamos`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`estado` (
  `id_estado` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`empresa` (
  `id_empresa` VARCHAR(13) NOT NULL,
  `razon_social` VARCHAR(250) NULL,
  `direccion` VARCHAR(500) NULL,
  `id_ciudad` INT NULL,
  `cp` INT NULL,
  `telefono` VARCHAR(12) NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_empresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`sucursal` (
  `id_sucursal` INT NOT NULL AUTO_INCREMENT,
  `id_empresa` VARCHAR(13) NOT NULL,
  `nombre` VARCHAR(120) NULL,
  `direccion` VARCHAR(500) NULL,
  `id_ciudad` INT NULL,
  `cp` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_sucursal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`usuario` (
  `id_usuario` VARCHAR(20) NOT NULL,
  `id_sucursal` INT NULL DEFAULT 0,
  `password` VARCHAR(100) NULL,
  `id_rol` INT NULL,
  `alias` VARCHAR(20) NULL,
  `usuario_padre` VARCHAR(20) NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`estado_credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`estado_credito` (
  `id_estado_credito` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(20) NULL,
  PRIMARY KEY (`id_estado_credito`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`periodo` (
  `id_periodo` INT NOT NULL AUTO_INCREMENT,
  `id_sucursal` INT NULL,
  `anio` INT NOT NULL,
  `mes` VARCHAR(10) NOT NULL,
  `capital_inicio` DECIMAL(10,2) NULL,
  `capital_fin` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id_periodo`))
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
-- Table `XRPrestamos`.`plazo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`plazo` (
  `id_plazo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NULL,
  `cantidad` INT NULL,
  `id_tipo_plazo` INT NOT NULL,
  PRIMARY KEY (`id_plazo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`tipo_inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`tipo_inmueble` (
  `id_tipo_inmueble` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NULL,
  PRIMARY KEY (`id_tipo_inmueble`))
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
-- Table `XRPrestamos`.`colonia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`colonia` (
  `id_colonia` INT NOT NULL AUTO_INCREMENT,
  `id_ciudad` INT NULL,
  `nombre` VARCHAR(50) NULL,
  PRIMARY KEY (`id_colonia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`calle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`calle` (
  `id_calle` INT NOT NULL,
  `id_colonia` INT NULL,
  `nombre` VARCHAR(150) NULL,
  PRIMARY KEY (`id_calle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`persona` (
  `id_usuario` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(50) NULL,
  `apellido_paterno` VARCHAR(20) NULL,
  `apellido_materno` VARCHAR(20) NULL,
  `id_calle` INT NULL,
  `no_casa` VARCHAR(10) NULL,
  `referencias` VARCHAR(250) NULL,
  `foto_casa` LONGBLOB NULL,
  `telefono` VARCHAR(12) NULL,
  `correo` VARCHAR(100) NULL,
  `foto` LONGBLOB NULL,
  `ine_clave` VARCHAR(150) NULL,
  `ine_img` LONGBLOB NULL,
  `id_tipo_inmueble` INT NOT NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`credito` (
  `id_credito` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` VARCHAR(20) NOT NULL COMMENT 'Usuario quien registra el credito',
  `id_usuario_cliente` VARCHAR(20) NOT NULL COMMENT 'Usuario a quien se le otorga el credito',
  `id_periodo` INT NOT NULL,
  `id_plazo` INT NOT NULL,
  `monto_credito` DECIMAL(10,2) NULL,
  `monto_pago` DECIMAL(10,2) NULL,
  `monto_total` DECIMAL(10,2) NULL,
  `fecha_credito` DATE NOT NULL,
  `fecha_inicio_cobro` DATE NULL,
  `fecha_fin_cobro` DATE NULL,
  `fecha_ultimo_pago` DATE NULL,
  `fecha_siguiente_pago` DATE NULL,
  `pagos_total` INT NULL,
  `pagos_pagados` DECIMAL(10,2) NULL,
  `pagos_adelantados` DECIMAL(10,2) NULL,
  `pagos_parciales` INT NULL,
  `pagos_atrasados` DECIMAL(10,2) NULL,
  `id_estado_credito` INT NOT NULL,
  `id_estado` INT NOT NULL,
  `tipo` INT NULL COMMENT 'Tipo de operqación:\n1- Nuevo cliente\n2- Renovación credito\n3- Nuevo credito a cliente Con credito activo\n4- Moroso',
  `fecha` DATE NULL,
  PRIMARY KEY (`id_credito`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`ruta` (
  `id_ruta` INT NOT NULL AUTO_INCREMENT,
  `id_sucursal` INT NOT NULL,
  `descripcion` VARCHAR(500) NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_ruta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`abono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`abono` (
  `id_abono` INT NOT NULL,
  `id_credito` INT NOT NULL,
  `monto` DECIMAL(10,2) NULL,
  `tipo_pago` INT NULL COMMENT 'Tipo de pago:\n1- Pago normal completo\n2- Pago exedente\n3- Pago parcial\n4- Sin pago',
  `no_pago_adelantado` DECIMAL(10,2) NULL COMMENT 'Cantidad de pagos adelantados',
  `fecha_abono` DATE NOT NULL,
  PRIMARY KEY (`id_abono`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`rol` (
  `id_rol` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NOT NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`permiso` (
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
-- Table `XRPrestamos`.`usuario_establecimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`usuario_establecimiento` (
  `id_usuario_establecimiento` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(100) NULL,
  `id_calle` INT NULL,
  `numero_ext` VARCHAR(10) NULL,
  `referencias` VARCHAR(250) NULL,
  `alias_establecimiento` VARCHAR(50) NULL,
  `id_actividad_economica` INT NOT NULL,
  `id_tipo_inmueble` INT NOT NULL,
  `id_ruta` INT NOT NULL,
  `disponibilidad_hr_inicio` VARCHAR(30) NULL COMMENT 'Hora de paertura de local | Hora de inicio de disponibilidad',
  `disponibilidad_hr_fin` VARCHAR(30) NULL COMMENT 'Hora de cierre de local | Hora de fin de disponibilidad',
  `coordenadas` VARCHAR(100) NULL,
  `foto` LONGBLOB NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_usuario_establecimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`usuario_ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`usuario_ruta` (
  `id_usuario_ruta` INT NOT NULL AUTO_INCREMENT,
  `id_ruta` INT NOT NULL,
  `id_usuario` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_usuario_ruta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `XRPrestamos`.`capital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `XRPrestamos`.`capital` (
  `id_capital` INT NOT NULL AUTO_INCREMENT,
  `id_sucursal` INT NULL,
  `id_periodo` INT NULL,
  `id_usuario` VARCHAR(20) NULL,
  `id_concepto` INT NULL,
  `tipo` VARCHAR(10) NULL COMMENT '- Ingreso\n- Egreso',
  `emisor` VARCHAR(45) NULL,
  `concepto` VARCHAR(500) NULL,
  `empresa` VARCHAR(120) NULL,
  `monto` DECIMAL(10,2) NULL,
  `hora` VARCHAR(20) NULL,
  `folio_ticket` VARCHAR(50) NULL,
  `comprobante` LONGBLOB NULL,
  `fecha` DATE NULL COMMENT 'Fecha del Ingreso/Egreso',
  `fecha_reg` DATE NULL COMMENT 'Fecha en que se registro',
  PRIMARY KEY (`id_capital`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`estado`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`estado` (`id_estado`, `descripcion`) VALUES (1, 'Activo');
INSERT INTO `XRPrestamos`.`estado` (`id_estado`, `descripcion`) VALUES (2, 'Inactivo');
INSERT INTO `XRPrestamos`.`estado` (`id_estado`, `descripcion`) VALUES (3, 'Suspendido');
INSERT INTO `XRPrestamos`.`estado` (`id_estado`, `descripcion`) VALUES (4, 'Eliminado');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`empresa`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`empresa` (`id_empresa`, `razon_social`, `direccion`, `id_ciudad`, `cp`, `telefono`, `id_estado`) VALUES ('RFC45GENERICO', 'CDJ COP Asociados', 'Colonia Centro', 1, 86300, '9331452145', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`sucursal`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`sucursal` (`id_sucursal`, `id_empresa`, `nombre`, `direccion`, `id_ciudad`, `cp`, `telefono`, `id_estado`) VALUES (1, 'RFC45GENERICO', 'Comalcalco', 'Calle Reforma', 1, '86300', '9331490521', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`usuario` (`id_usuario`, `id_sucursal`, `password`, `id_rol`, `alias`, `usuario_padre`, `id_estado`) VALUES ('admin', 1, 'admin', 1, 'Administrador', NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`estado_credito`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`estado_credito` (`id_estado_credito`, `descripcion`) VALUES (1, 'Activo');
INSERT INTO `XRPrestamos`.`estado_credito` (`id_estado_credito`, `descripcion`) VALUES (2, 'Inactivo');
INSERT INTO `XRPrestamos`.`estado_credito` (`id_estado_credito`, `descripcion`) VALUES (3, 'Renovado');
INSERT INTO `XRPrestamos`.`estado_credito` (`id_estado_credito`, `descripcion`) VALUES (4, 'Condonado');
INSERT INTO `XRPrestamos`.`estado_credito` (`id_estado_credito`, `descripcion`) VALUES (5, 'Congelado');
INSERT INTO `XRPrestamos`.`estado_credito` (`id_estado_credito`, `descripcion`) VALUES (6, 'Moroso');
INSERT INTO `XRPrestamos`.`estado_credito` (`id_estado_credito`, `descripcion`) VALUES (7, 'Recuperación');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`periodo`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `id_sucursal`, `anio`, `mes`, `capital_inicio`, `capital_fin`) VALUES (1, 1, 2020, 'Enero', 0, 0);
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `id_sucursal`, `anio`, `mes`, `capital_inicio`, `capital_fin`) VALUES (2, 1, 2020, 'Febrero', 0, 0);
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `id_sucursal`, `anio`, `mes`, `capital_inicio`, `capital_fin`) VALUES (3, 1, 2020, 'Marzo', 0, 0);
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `id_sucursal`, `anio`, `mes`, `capital_inicio`, `capital_fin`) VALUES (4, 1, 2020, 'Abril', 0, 0);
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `id_sucursal`, `anio`, `mes`, `capital_inicio`, `capital_fin`) VALUES (5, 1, 2020, 'Mayo', 0, 0);
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `id_sucursal`, `anio`, `mes`, `capital_inicio`, `capital_fin`) VALUES (6, 1, 2020, 'Junio', 0, 0);
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `id_sucursal`, `anio`, `mes`, `capital_inicio`, `capital_fin`) VALUES (7, 1, 2020, 'Julio', 0, 0);
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `id_sucursal`, `anio`, `mes`, `capital_inicio`, `capital_fin`) VALUES (8, 1, 2020, 'Agosto', 0, 0);
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `id_sucursal`, `anio`, `mes`, `capital_inicio`, `capital_fin`) VALUES (9, 1, 2020, 'Septiembre', 0, 0);
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `id_sucursal`, `anio`, `mes`, `capital_inicio`, `capital_fin`) VALUES (10, 1, 2020, 'Octubre', 0, 0);
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `id_sucursal`, `anio`, `mes`, `capital_inicio`, `capital_fin`) VALUES (11, 1, 2020, 'Noviembre', 0, 0);
INSERT INTO `XRPrestamos`.`periodo` (`id_periodo`, `id_sucursal`, `anio`, `mes`, `capital_inicio`, `capital_fin`) VALUES (12, 1, 2020, 'Diciembre', 0, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`tipo_plazo`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`tipo_plazo` (`id_tipo_plazo`, `descripcion`) VALUES (1, 'Día');
INSERT INTO `XRPrestamos`.`tipo_plazo` (`id_tipo_plazo`, `descripcion`) VALUES (2, 'Semana');
INSERT INTO `XRPrestamos`.`tipo_plazo` (`id_tipo_plazo`, `descripcion`) VALUES (3, 'Mes');
INSERT INTO `XRPrestamos`.`tipo_plazo` (`id_tipo_plazo`, `descripcion`) VALUES (4, 'Periodo');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`plazo`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`plazo` (`id_plazo`, `descripcion`, `cantidad`, `id_tipo_plazo`) VALUES (1, '24 Días', 24, 1);
INSERT INTO `XRPrestamos`.`plazo` (`id_plazo`, `descripcion`, `cantidad`, `id_tipo_plazo`) VALUES (2, '30 Días', 30, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`tipo_inmueble`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`tipo_inmueble` (`id_tipo_inmueble`, `descripcion`) VALUES (1, 'Propio');
INSERT INTO `XRPrestamos`.`tipo_inmueble` (`id_tipo_inmueble`, `descripcion`) VALUES (2, 'Renta');
INSERT INTO `XRPrestamos`.`tipo_inmueble` (`id_tipo_inmueble`, `descripcion`) VALUES (3, 'Fijo');
INSERT INTO `XRPrestamos`.`tipo_inmueble` (`id_tipo_inmueble`, `descripcion`) VALUES (4, 'Ambulante');

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
INSERT INTO `XRPrestamos`.`ciudad` (`id_ciudad`, `id_provinvia`, `nombre`) VALUES (2, 1, 'Paraiso');
INSERT INTO `XRPrestamos`.`ciudad` (`id_ciudad`, `id_provinvia`, `nombre`) VALUES (3, 1, 'Cunduacan');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`colonia`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`colonia` (`id_colonia`, `id_ciudad`, `nombre`) VALUES (1, 1, 'Centro');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`calle`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`calle` (`id_calle`, `id_colonia`, `nombre`) VALUES (1, 1, 'Sin Definir');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`persona`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`persona` (`id_usuario`, `nombre`, `apellido_paterno`, `apellido_materno`, `id_calle`, `no_casa`, `referencias`, `foto_casa`, `telefono`, `correo`, `foto`, `ine_clave`, `ine_img`, `id_tipo_inmueble`, `id_estado`) VALUES ('admin', 'Daniel', 'Pérez', 'Cortéz', Colonia Centro, NULL, NULL, NULL, '9141198098', 'pcd510@hotmail.com', NULL, NULL, NULL, 1, 1);
INSERT INTO `XRPrestamos`.`persona` (`id_usuario`, `nombre`, `apellido_paterno`, `apellido_materno`, `id_calle`, `no_casa`, `referencias`, `foto_casa`, `telefono`, `correo`, `foto`, `ine_clave`, `ine_img`, `id_tipo_inmueble`, `id_estado`) VALUES ('cobrador_1', 'Angel', 'Castillo', 'López', Colonia Centro, NULL, NULL, NULL, '9331036538', 'ejemplo@hotmail.com', NULL, NULL, NULL, 1, 1);
INSERT INTO `XRPrestamos`.`persona` (`id_usuario`, `nombre`, `apellido_paterno`, `apellido_materno`, `id_calle`, `no_casa`, `referencias`, `foto_casa`, `telefono`, `correo`, `foto`, `ine_clave`, `ine_img`, `id_tipo_inmueble`, `id_estado`) VALUES ('cliente_1', 'Maria Elena', 'Gonzalez', 'Ovando', Colonia Centro, NULL, NULL, NULL, '9332514561', 'marielena@hotmail.com', NULL, NULL, NULL, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`ruta`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`ruta` (`id_ruta`, `id_sucursal`, `descripcion`, `id_estado`) VALUES (1, 1, 'R2-Motorizada', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`rol`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`rol` (`id_rol`, `descripcion`, `id_estado`) VALUES (1, 'Administrador', 1);
INSERT INTO `XRPrestamos`.`rol` (`id_rol`, `descripcion`, `id_estado`) VALUES (2, 'Cobrador', 1);
INSERT INTO `XRPrestamos`.`rol` (`id_rol`, `descripcion`, `id_estado`) VALUES (3, 'Cliente', 1);
INSERT INTO `XRPrestamos`.`rol` (`id_rol`, `descripcion`, `id_estado`) VALUES (4, 'Master', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`permiso`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`permiso` (`id_permiso`, `id_rol`, `descripcion`, `id_estado`) VALUES (1, 1, 'Registrar Cliente', 1);

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
INSERT INTO `XRPrestamos`.`actividad_economica` (`id_actividad_economica`, `descripcion`) VALUES (5, 'Estética');
INSERT INTO `XRPrestamos`.`actividad_economica` (`id_actividad_economica`, `descripcion`) VALUES (6, 'Pochi');
INSERT INTO `XRPrestamos`.`actividad_economica` (`id_actividad_economica`, `descripcion`) VALUES (7, 'Taxista');
INSERT INTO `XRPrestamos`.`actividad_economica` (`id_actividad_economica`, `descripcion`) VALUES (8, 'Antojitos');
INSERT INTO `XRPrestamos`.`actividad_economica` (`id_actividad_economica`, `descripcion`) VALUES (9, 'Comerciante');
INSERT INTO `XRPrestamos`.`actividad_economica` (`id_actividad_economica`, `descripcion`) VALUES (10, 'Tienda de Electrónica');

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`usuario_establecimiento`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`usuario_establecimiento` (`id_usuario_establecimiento`, `id_usuario`, `nombre`, `id_calle`, `numero_ext`, `referencias`, `alias_establecimiento`, `id_actividad_economica`, `id_tipo_inmueble`, `id_ruta`, `disponibilidad_hr_inicio`, `disponibilidad_hr_fin`, `coordenadas`, `foto`, `id_estado`) VALUES (1, '1', 'Polleria Mercado', 1, 'Mercado', NULL, 'Mari Pollo Mercado', 4, 1, 1, '8:00', '18:00', NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `XRPrestamos`.`usuario_ruta`
-- -----------------------------------------------------
START TRANSACTION;
USE `XRPrestamos`;
INSERT INTO `XRPrestamos`.`usuario_ruta` (`id_usuario_ruta`, `id_ruta`, `id_usuario`) VALUES (1, 1, 'admin');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
