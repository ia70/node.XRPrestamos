/*
 Navicat Premium Data Transfer

 Source Server         : Servidor Comalcalco Local
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : 192.168.2.50:3306
 Source Schema         : xrprestamos

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 13/07/2020 20:07:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS xrprestamos_tests;
USE xrprestamos_tests;
-- ----------------------------
-- Table structure for abono
-- ----------------------------
DROP TABLE IF EXISTS `abono`;
CREATE TABLE `abono`  (
  `id_abono` int(11) NOT NULL AUTO_INCREMENT,
  `folio_credito` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `monto` decimal(10, 2) NOT NULL,
  `no_pagos` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Cantidad de pagos (adelantado - atrasado)',
  `id_tipo_pago` int(11) NOT NULL COMMENT 'Tipo de pago:\n1- Pago normal completo\n2- Pago parcial\n3- Extra\n4- No pago\n5- Sin visitar',
  `fecha_abono` date NOT NULL,
  `id_estado` int(11) NOT NULL,
  `fecha_reg` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_abono`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of abono
-- ----------------------------
BEGIN;
INSERT INTO `abono` VALUES (34, '2020-06-22#0', 100.00, 1.00, 1, '2020-06-23', 1, '2020-07-13 06:25:57'), (35, '2020-06-22#0', 100.00, 1.00, 1, '2020-06-24', 1, '2020-07-13 06:25:57'), (36, '2020-06-22#0', 100.00, 1.00, 1, '2020-06-25', 1, '2020-07-13 06:25:57'), (37, '2020-06-22#0', 100.00, 1.00, 1, '2020-06-27', 1, '2020-07-13 06:25:57'), (38, '2020-06-22#0', 0.00, 0.00, 4, '2020-06-28', 1, '2020-07-13 06:25:57'), (39, '2020-06-22#0', 100.00, 1.00, 1, '2020-06-29', 1, '2020-07-13 06:25:57'), (40, '2020-06-22#0', 100.00, 1.00, 1, '2020-06-30', 1, '2020-07-13 06:25:57'), (41, '2020-06-22#0', 100.00, 1.00, 1, '2020-07-01', 1, '2020-07-13 06:25:57'), (42, '2020-06-22#0', 100.00, 1.00, 1, '2020-07-02', 1, '2020-07-13 06:25:57'), (43, '2020-06-22#0', 100.00, 1.00, 1, '2020-07-03', 1, '2020-07-13 06:25:57'), (44, '2020-06-22#0', 100.00, 1.00, 1, '2020-07-04', 1, '2020-07-13 06:25:57'), (45, '2020-06-22#0', 100.00, 1.00, 1, '2020-07-05', 1, '2020-07-13 06:25:57'), (46, '2020-06-22#0', 100.00, 1.00, 1, '2020-07-06', 1, '2020-07-13 06:25:57'), (47, '2020-06-22#0', 100.00, 1.00, 1, '2020-07-08', 1, '2020-07-13 06:25:57'), (48, '2020-06-22#0', 100.00, 1.00, 1, '2020-07-09', 1, '2020-07-13 06:25:57'), (49, '2020-06-22#0', 100.00, 1.00, 1, '2020-07-07', 1, '2020-07-13 06:25:57'), (50, '2020-06-22#0', 100.00, 1.00, 1, '2020-07-10', 1, '2020-07-13 06:25:57'), (51, '2020-06-22#0', 100.00, 1.00, 1, '2020-07-11', 1, '2020-07-13 06:25:57'), (52, '2020-06-22#0', 100.00, 1.00, 1, '2020-07-12', 1, '2020-07-13 06:25:57'), (53, '2020-06-22#0', 100.00, 1.00, 1, '2020-07-13', 1, '2020-07-13 06:25:57');
COMMIT;

-- ----------------------------
-- Table structure for actividad_economica
-- ----------------------------
DROP TABLE IF EXISTS `actividad_economica`;
CREATE TABLE `actividad_economica`  (
  `id_actividad_economica` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_actividad_economica`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of actividad_economica
-- ----------------------------
BEGIN;
INSERT INTO `actividad_economica` VALUES (1, 'Taqueria'), (2, 'Carniceria'), (3, 'Reparación de Celulares'), (4, 'Pollos aliñados'), (5, 'Estética'), (6, 'Pochi'), (7, 'Taxista'), (8, 'Antojitos'), (9, 'Comerciante'), (10, 'Tienda de Electrónica');
COMMIT;

-- ----------------------------
-- Table structure for aval
-- ----------------------------
DROP TABLE IF EXISTS `aval`;
CREATE TABLE `aval`  (
  `id_aval` int(11) NOT NULL AUTO_INCREMENT,
  `ine` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido_paterno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apellido_materno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `direccion` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telefono` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentesco` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_aval`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of aval
-- ----------------------------
BEGIN;
INSERT INTO `aval` VALUES (9, '0247040029410', 'FERNANDO ', 'JIMENEZ ', 'OLIVA', NULL, '9331566400', 'AMIGO GALLINA'), (16, '1029071683966', 'FRANCISCO CAYETANO', 'DAGDUG', 'CORDOVA', NULL, '9331700406', 'AMIGO'), (17, '0574100264368', 'JULIO CESAR', 'FUENTES', 'ALEMAN', NULL, '9341156699', 'COMPAÑERO'), (18, '052105054618541', '', '', '', NULL, '', '');
COMMIT;

-- ----------------------------
-- Table structure for calle
-- ----------------------------
DROP TABLE IF EXISTS `calle`;
CREATE TABLE `calle`  (
  `id_calle` int(11) NOT NULL AUTO_INCREMENT,
  `id_colonia` int(11) NULL DEFAULT NULL,
  `nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_calle`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of calle
-- ----------------------------
BEGIN;
INSERT INTO `calle` VALUES (1, 1, 'Sin Definir');
COMMIT;

-- ----------------------------
-- Table structure for capital
-- ----------------------------
DROP TABLE IF EXISTS `capital`;
CREATE TABLE `capital`  (
  `id_capital` int(11) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `id_usuario` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_tipo_capital` int(11) NOT NULL COMMENT '- Ingreso\n- Egreso',
  `id_tipo_concepto` int(11) NOT NULL COMMENT 'Tipo de consecto de ingreso o egreso:\n- Ingreso\n--- Remanente de entrega\n--- Recuperación de deuda\n--- General\n\n- Egreso\n--- Gasto oficina\n--- Mantenimiento Vehiculos\n--- General\n',
  `emisor` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `concepto` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `empresa` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `monto` decimal(10, 2) NULL DEFAULT NULL,
  `hora` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `folio_ticket` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comprobante` longblob NULL,
  `fecha` date NULL DEFAULT NULL COMMENT 'Fecha del Ingreso/Egreso',
  `id_estado` int(11) NOT NULL,
  `fecha_reg` datetime(0) NULL DEFAULT NULL COMMENT 'Fecha en que se registro',
  PRIMARY KEY (`id_capital`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of capital
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ciudad
-- ----------------------------
DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE `ciudad`  (
  `id_ciudad` int(11) NOT NULL AUTO_INCREMENT,
  `id_provinvia` int(11) NULL DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_ciudad`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of ciudad
-- ----------------------------
BEGIN;
INSERT INTO `ciudad` VALUES (1, 1, 'Comalcalco'), (2, 1, 'Paraiso'), (3, 1, 'Cunduacan');
COMMIT;

-- ----------------------------
-- Table structure for cobro_dia
-- ----------------------------
DROP TABLE IF EXISTS `cobro_dia`;
CREATE TABLE `cobro_dia`  (
  `folio_credito` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ine` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_ruta` int(11) NULL DEFAULT NULL,
  `id_usuario` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`folio_credito`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of cobro_dia
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for colonia
-- ----------------------------
DROP TABLE IF EXISTS `colonia`;
CREATE TABLE `colonia`  (
  `id_colonia` int(11) NOT NULL AUTO_INCREMENT,
  `id_ciudad` int(11) NULL DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_colonia`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of colonia
-- ----------------------------
BEGIN;
INSERT INTO `colonia` VALUES (1, 1, 'Centro');
COMMIT;

-- ----------------------------
-- Table structure for configuracion
-- ----------------------------
DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE `configuracion`  (
  `id_configuracion` int(11) NOT NULL AUTO_INCREMENT,
  `no_cobradores` int(11) NULL DEFAULT NULL,
  `licencia_inicio` date NULL DEFAULT NULL,
  `licencia_fin` date NULL DEFAULT NULL,
  `id_moneda` int(11) NULL DEFAULT NULL,
  `id_zona_horaria` int(11) NULL DEFAULT NULL,
  `id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_configuracion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of configuracion
-- ----------------------------
BEGIN;
INSERT INTO `configuracion` VALUES (1, 10, '2020-03-01', '2030-03-01', 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for credito
-- ----------------------------
DROP TABLE IF EXISTS `credito`;
CREATE TABLE `credito`  (
  `folio_credito` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Barcode or QR code',
  `descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_usuario` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Usuario quien registra el credito',
  `id_usuario_establecimiento` int(11) NOT NULL COMMENT 'Usuario a quien se le otorga el credito',
  `id_periodo` int(11) NULL DEFAULT NULL,
  `id_tipo_cobro` int(11) NOT NULL,
  `monto_credito` decimal(10, 2) NOT NULL COMMENT 'Monto del prestamo',
  `monto_pago` decimal(10, 2) NOT NULL COMMENT 'Monto Pago Diario',
  `monto_total` decimal(10, 2) NOT NULL COMMENT 'Monto Total a Pagar con intereses',
  `fecha_entrega` date NOT NULL,
  `fecha_inicio_cobro` date NOT NULL,
  `fecha_siguiente_pago` date NULL DEFAULT NULL,
  `pagos_total` int(11) NULL DEFAULT NULL COMMENT 'Numero de pagos total a realizar',
  `id_estado_credito` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `id_tipo_credito` int(11) NOT NULL COMMENT 'Tipo de operqación:\n1- Nuevo cliente\n2- Renovación credito\n3- Nuevo credito a cliente Con credito activo\n4- Moroso',
  `fecha_reg` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`folio_credito`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of credito
-- ----------------------------
BEGIN;
INSERT INTO `credito` VALUES ('2020-06-22#0', '', 'oficina2', 7, 6, 1, 2000.00, 100.00, 2400.00, '2020-06-22', '2020-06-23', '2020-06-23', 25, 1, 1, 1, '2020-07-13 06:25:58');
COMMIT;

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa`  (
  `id_empresa` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `razon_social` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `direccion` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_ciudad` int(11) NULL DEFAULT NULL,
  `cp` int(11) NULL DEFAULT NULL,
  `telefono` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_configuracion` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_empresa`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of empresa
-- ----------------------------
BEGIN;
INSERT INTO `empresa` VALUES ('RFC45GENERICO', 'CDJ COP Asociados', 'Colonia Centro', 1, 86300, '9331452145', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for estadistica_cliente
-- ----------------------------
DROP TABLE IF EXISTS `estadistica_cliente`;
CREATE TABLE `estadistica_cliente`  (
  `folio_credito` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ine` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `monto_credito` decimal(10, 2) NULL DEFAULT NULL,
  `fecha_entrega` datetime(0) NULL DEFAULT NULL,
  `pagos_total` int(11) NULL DEFAULT NULL,
  `no_pagos` decimal(10, 2) NULL DEFAULT NULL,
  `no_abonos` int(11) NULL DEFAULT NULL,
  `no_adelantos` decimal(10, 2) NULL DEFAULT NULL,
  `no_atrasos` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`folio_credito`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of estadistica_cliente
-- ----------------------------
BEGIN;
INSERT INTO `estadistica_cliente` VALUES ('2020-06-22#0', '0535127612623', 2000.00, '2020-06-22 00:00:00', 25, 19.00, 0, 0.00, 1);
COMMIT;

-- ----------------------------
-- Table structure for estado
-- ----------------------------
DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado`  (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT COMMENT '1 - Activo\n2 - Inactivo\n3 - Suspendido \n4 - Eliminado\n5 - Verificar',
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of estado
-- ----------------------------
BEGIN;
INSERT INTO `estado` VALUES (1, 'Activo'), (2, 'Inactivo'), (3, 'Suspendido'), (4, 'Eliminado'), (5, 'Verificar');
COMMIT;

-- ----------------------------
-- Table structure for estado_credito
-- ----------------------------
DROP TABLE IF EXISTS `estado_credito`;
CREATE TABLE `estado_credito`  (
  `id_estado_credito` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado_credito`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of estado_credito
-- ----------------------------
BEGIN;
INSERT INTO `estado_credito` VALUES (1, 'Activo'), (2, 'Inactivo'), (3, 'Congelado'), (4, 'Condonado'), (5, 'Terminado'), (6, 'Renovado');
COMMIT;

-- ----------------------------
-- Table structure for estado_solicitud
-- ----------------------------
DROP TABLE IF EXISTS `estado_solicitud`;
CREATE TABLE `estado_solicitud`  (
  `id_estado_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado_solicitud`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of estado_solicitud
-- ----------------------------
BEGIN;
INSERT INTO `estado_solicitud` VALUES (1, 'Aprobado'), (2, 'En espera'), (3, 'Rechazado');
COMMIT;

-- ----------------------------
-- Table structure for moneda
-- ----------------------------
DROP TABLE IF EXISTS `moneda`;
CREATE TABLE `moneda`  (
  `id_moneda` int(11) NOT NULL AUTO_INCREMENT,
  `abreviatura` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_moneda`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of moneda
-- ----------------------------
BEGIN;
INSERT INTO `moneda` VALUES (1, 'MXN', 'Pesos Mexicanos'), (2, 'USD', 'Dolar Estadonidense');
COMMIT;

-- ----------------------------
-- Table structure for pais
-- ----------------------------
DROP TABLE IF EXISTS `pais`;
CREATE TABLE `pais`  (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_pais`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of pais
-- ----------------------------
BEGIN;
INSERT INTO `pais` VALUES (1, 'México');
COMMIT;

-- ----------------------------
-- Table structure for periodo
-- ----------------------------
DROP TABLE IF EXISTS `periodo`;
CREATE TABLE `periodo`  (
  `id_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `capital_inicio` decimal(10, 2) NULL DEFAULT NULL,
  `capital_fin` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_periodo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of periodo
-- ----------------------------
BEGIN;
INSERT INTO `periodo` VALUES (1, 1, 2020, 1, 0.00, 0.00), (2, 1, 2020, 2, 0.00, 0.00), (3, 1, 2020, 3, 0.00, 0.00), (4, 1, 2020, 4, 0.00, 0.00), (5, 1, 2020, 5, 0.00, 0.00), (6, 1, 2020, 6, 0.00, 0.00), (7, 1, 2020, 7, 0.00, 0.00), (8, 1, 2020, 8, 0.00, 0.00), (9, 1, 2020, 9, 0.00, 0.00), (10, 1, 2020, 10, 0.00, 0.00), (11, 1, 2020, 11, 0.00, 0.00), (12, 1, 2020, 12, 0.00, 0.00), (13, 1, 2021, 1, 0.00, 0.00), (14, 1, 2021, 2, 0.00, 0.00), (15, 1, 2021, 3, 0.00, 0.00), (16, 1, 2021, 4, 0.00, 0.00), (17, 1, 2021, 5, 0.00, 0.00), (18, 1, 2021, 6, 0.00, 0.00), (19, 1, 2021, 7, 0.00, 0.00), (20, 1, 2021, 8, 0.00, 0.00);
COMMIT;

-- ----------------------------
-- Table structure for permiso
-- ----------------------------
DROP TABLE IF EXISTS `permiso`;
CREATE TABLE `permiso`  (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_permiso`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of permiso
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for persona
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona`  (
  `ine` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ine_ref` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'INE de usuario que está refiriendo',
  `alias` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido_paterno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido_materno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_calle` int(11) NULL DEFAULT NULL,
  `direccion` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_casa` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `referencias` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `foto_casa` longblob NULL,
  `telefono` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `foto` longblob NULL,
  `ine_img` longblob NULL,
  `id_tipo_inmueble` int(11) NULL DEFAULT NULL,
  `id_estado` int(11) NOT NULL,
  `fecha_reg` datetime(0) NOT NULL COMMENT 'Fecha de Registro de Persona',
  PRIMARY KEY (`ine`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of persona
-- ----------------------------
BEGIN;
INSERT INTO `persona` VALUES ('0247040029410', NULL, 'TAXI 01 PLUS', 'ESMIDER', 'PEREZ ', 'ESCALANTE', 1, 'CALLE CRUZ GUERRERO COL. JOSE MARIA PINO SUAREZ 86029', '138', 'CENTRO, TABASCO', NULL, '9331206016', '', NULL, NULL, 1, 5, '2020-07-13 06:52:48'), ('0515132616390', NULL, 'Alfonso Rodriguez', 'Alfonso', 'Rodriguez', 'Hernandez', 1, 'calle reforma norte', '519', 'Frente al kinder federico froebel', NULL, '', '', NULL, NULL, 1, 5, '2020-07-13 06:29:12'), ('052105054618541', NULL, '', 'Armando', 'Rabanales', 'perez', 1, 'Calle reforma', '112', 'a dos casas de casa Mazatlan', NULL, '9331562633', '', NULL, NULL, 1, 5, '2020-07-13 08:07:09'), ('0535127612623', NULL, 'TAXI 102', 'FELIPE', 'RICARDEZ', 'FLORES', 1, 'ORIENTE 1RA SECCION ', 'S/N', 'COMALCALCO, TABASCO', NULL, '9333271776', '', NULL, NULL, 1, 5, '2020-07-13 06:05:35'), ('0555009813409', NULL, 'POCHI ZAPOTAL', 'ANDRES', 'MARQUEZ', 'MENDEZ', 1, 'CARRETERA A ZAPOTAL R/A GREGORIO MENDEZ 3RA SECCION C.P 86650', 'S/N', 'COMALCALCO, TABASCO', NULL, '9331054681', '', NULL, NULL, 1, 5, '2020-07-13 07:32:32'), ('0555054980528', NULL, 'POCHI TOMAS GARRIDO', 'ALFREDO', 'BRAVO', 'DOMINGUEZ', 1, 'CALLE TULIPANES COL. TOMAS GARRIDO CANABAL C.P 86640', 'S/N', 'COMALCALCO, TABASCO', NULL, '9331299019', '', NULL, NULL, 1, 5, '2020-07-13 07:21:54'), ('0555126868277', NULL, 'POCHI TOMAS GARRIDO ', 'AGUSTIN', 'JIMENEZ', 'DIAZ', 1, 'CALLE TIGRE COL. TOMAS GARRIDO', 'S/N', 'COMALCALCO, TABASCO', NULL, '9335939640', '', NULL, NULL, 1, 5, '2020-07-13 07:07:03'), ('0559103499618', NULL, 'POCHI ZAPOTAL', 'ALEX ', 'DE LA CRUZ', 'MARQUEZ', 1, '', '', '', NULL, '', '', NULL, NULL, 1, 5, '2020-07-13 07:16:47'), ('0573031755131', NULL, 'TAXI #115', 'ANGEL ', 'ALCUDIA ', 'ULIN', 1, 'CALLE NIÑOS HEROES , VILLA CHICHICAPA C.P 86670', 'S/N', 'COMALCALCO, TABASCO', NULL, '9331566665', '', NULL, NULL, 1, 5, '2020-07-13 07:44:43'), ('0574100264368', NULL, 'POCHI CHICHICAPA', 'RAMON', 'LOPEZ', 'ROMERO', 1, 'CALLE ANDRES SANCHEZ MAGALLANES. VILLA CHICHICAPA C.P 86670', 'S/N', 'COMALCALCO, TABASCO', NULL, '9331217605', '', NULL, NULL, 1, 5, '2020-07-13 07:52:12'), ('1029071683966', NULL, 'TALLER TORREZ', 'ISIDRO', 'CHABLE', 'CHABLE', 1, 'ENTRADA AL CHIVERO R/A LIBERTAD 1RA. SECC C.P 86611', 'S/N', 'COMALCALCO, TABASCO', NULL, '9331071850', '', NULL, NULL, 1, 5, '2020-07-13 07:48:12'), ('1033002128296', NULL, 'TAXI # 51', 'ANDY', 'VALENZUELA', 'HERNANDEZ', 1, 'CARRETERA A CHILTEPEC POB. NICOLAS BRAVO 1RA SECC C.P 86611', 'S/N', 'PARAISO, TABASCO', NULL, '9331517148', '', NULL, NULL, 1, 5, '2020-07-13 07:37:41'), ('INE_ADMIN', NULL, 'Ingeniero', 'Daniel', 'Pérez', 'Cortéz', 1, 'Jalpa de Méndez', '10', 'Centro', NULL, '9141198098', 'pcd510@hotmail.com', NULL, NULL, 1, 1, '2020-03-01 00:00:00'), ('INE_DAVID', NULL, 'Chaparro', 'David', 'Gonzalez', 'Ovando', 1, 'Comalcalco', '85', 'Centro', NULL, '9332514561', 'ejemplo@hotmail.com', NULL, NULL, 1, 1, '2020-03-01 00:00:00'), ('INE_JC', NULL, 'JC', 'Angel', 'Castillo', 'López', 1, 'Comalcalco', '65', 'Centro', NULL, '9331036538', 'ejemplo@hotmail.com', NULL, NULL, 1, 1, '2020-03-01 00:00:00'), ('INE_OFICINA', NULL, 'Oficina', 'Oficina', 'Oficina', 'Oficina', 1, 'Comalcalco', '2', 'Centro', NULL, '9331036538', 'ejemplo@hotmail.com', NULL, NULL, 2, 1, '2020-03-01 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for provincia
-- ----------------------------
DROP TABLE IF EXISTS `provincia`;
CREATE TABLE `provincia`  (
  `id_provincia` int(11) NOT NULL AUTO_INCREMENT,
  `id_pais` int(11) NULL DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_provincia`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of provincia
-- ----------------------------
BEGIN;
INSERT INTO `provincia` VALUES (1, 1, 'Tabasco');
COMMIT;

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol`  (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_rol`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of rol
-- ----------------------------
BEGIN;
INSERT INTO `rol` VALUES (1, 'Administrador', 1), (2, 'Cobrador', 1), (3, 'Cliente', 1), (4, 'Master', 1);
COMMIT;

-- ----------------------------
-- Table structure for rol_permiso
-- ----------------------------
DROP TABLE IF EXISTS `rol_permiso`;
CREATE TABLE `rol_permiso`  (
  `id_rol_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NULL DEFAULT NULL,
  `id_permiso` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_rol_permiso`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of rol_permiso
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ruta
-- ----------------------------
DROP TABLE IF EXISTS `ruta`;
CREATE TABLE `ruta`  (
  `id_ruta` int(11) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) NOT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_ruta`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of ruta
-- ----------------------------
BEGIN;
INSERT INTO `ruta` VALUES (0, 1, 'Seleccionar', 1), (1, 1, 'R2-Motorizada', 1), (2, 1, 'Mercado', 1), (3, 1, 'Oficina', 1);
COMMIT;

-- ----------------------------
-- Table structure for sesion
-- ----------------------------
DROP TABLE IF EXISTS `sesion`;
CREATE TABLE `sesion`  (
  `id_sesion` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_usuario` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inicio_sesion` datetime(0) NOT NULL,
  `ultima_conexion` datetime(0) NULL DEFAULT NULL,
  `fin_sesion` datetime(0) NULL DEFAULT NULL,
  `id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_sesion`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of sesion
-- ----------------------------
BEGIN;
INSERT INTO `sesion` VALUES ('%2F0NBLvX%2FTPI4ZSJKs9v96gvY%2BBUybM6pYyByshbTo9g%3D', 'admin', '2020-07-11 09:43:47', '2020-07-11 09:54:24', '2020-07-11 10:28:41', 2), ('%2F0NBLvX%2FTPI4ZSJKs9v96utMaT%2Bh3xQ5%2FvbshesO3T4%3D', 'admin', '2020-07-11 09:43:01', '2020-07-11 09:43:01', '2020-07-11 09:43:47', 2), ('1bV3VnxHqBZP6LWFtTLqQpE5zegfGKlRyDAHxhrYofs%3D', 'admin', '2020-07-13 06:19:38', '2020-07-13 07:20:37', NULL, 1), ('790Bm9Fp96p9PzwElOUxdoon%2F%2FmjM2U74l7kiwQ4pYw%3D', 'jc', '2020-07-11 04:48:54', '2020-07-11 04:48:54', '2020-07-11 04:49:07', 2), ('AeBJgGAJ9%2F%2FdsUhLVmuLcVD5BsH%2FepD03By7%2FH7hGpU%3D', 'admin', '2020-07-13 05:42:34', '2020-07-13 05:42:34', '2020-07-13 06:19:38', 2), ('AsuA7rMNDh6fWtce9MQoVY2RIebBO%2FHdRdJ8ys2rYbo%3D', 'jc', '2020-07-11 04:50:01', '2020-07-11 04:50:01', '2020-07-11 07:32:42', 2), ('BEiIC1T1mkbwXld8dg4Wk%2FS6%2FKfqVVhMcMUVj39e7XU%3D', 'jc', '2020-07-11 04:49:07', '2020-07-11 04:49:18', '2020-07-11 04:50:01', 2), ('Bs%2FL8h0oPXs4JYPpyG1CfvK3PPoFhS2OpgIKczqDHJQ%3D', 'admin', '2020-07-11 10:58:33', '2020-07-11 11:00:40', '2020-07-11 11:14:05', 2), ('CKzk%2BlcT5EG990%2FU%2FU6xZrRrHQfLDOuuBVfcIxlo%2F98%3D', 'admin', '2020-07-11 04:02:57', '2020-07-11 04:03:41', '2020-07-11 04:07:22', 2), ('CYffMtOGgFpQ53s09Q1a2HuMkHGQbaATJis421yg%2BPc%3D', 'oficina2', '2020-07-13 05:44:15', '2020-07-13 07:52:11', NULL, 1), ('CYffMtOGgFpQ53s09Q1a2Hy55PaVYTGGXrJqfDsC48w%3D', 'OFICINA1', '2020-07-13 05:44:14', '2020-07-13 08:07:09', NULL, 1), ('DtY%2FcrSlgwIfnlkyHKq57%2BrfjNfBG1TEhMRvBwoqrUo%3D', 'admin', '2020-07-11 11:14:05', '2020-07-12 12:05:30', '2020-07-12 12:11:03', 2), ('DYc7RP7ecl%2FkfrHpylvfKc9eEu%2FPmZoBs2R06JRB5ec%3D', 'admin', '2020-07-11 07:51:01', '2020-07-11 09:40:52', '2020-07-11 09:43:01', 2), ('IL%2Bzz8OzDdI79g2kwiHitDvIbidzZVQd35sBsU86iPo%3D', 'jc', '2020-07-11 10:30:57', '2020-07-11 10:31:08', '2020-07-11 10:34:32', 2), ('M2VYR%2Fb8Cauvc1EjxzqKkH5XCLKpzM1N0a3Xsl9FgrA%3D', 'oficina2', '2020-07-12 12:21:47', '2020-07-12 12:21:47', '2020-07-12 12:23:48', 2), ('M2VYR%2Fb8Cauvc1EjxzqKkJotMPbBcFw3lj5E%2Bz%2FA1VA%3D', 'OFICINA1', '2020-07-12 12:21:16', '2020-07-12 12:21:16', '2020-07-13 05:44:14', 2), ('nlxkTxHlMsxstWFOhrZLPT0pAebpnBDU%2Bz6wItvR4so%3D', 'jc', '2020-07-11 09:53:20', '2020-07-11 09:53:51', '2020-07-11 10:30:57', 2), ('oneOTTXJXhceIpy4mDzKRbjqsoDIwd2EMuNW2AE3DXo%3D', 'jc', '2020-07-11 07:32:42', '2020-07-11 07:33:27', '2020-07-11 09:53:20', 2), ('QNDQWNJHzO3foyY1crxB7hI9XwnfI9oxTw78Odu40U0%3D', 'admin', '2020-07-12 12:11:03', '2020-07-12 12:11:03', '2020-07-12 03:23:22', 2), ('reR%2FKZJE7awG65fW%2BMzixReOrqrBEeZux9%2F5AssaPEM%3D', 'admin', '2020-07-11 04:07:22', '2020-07-11 04:07:22', '2020-07-11 04:07:42', 2), ('reR%2FKZJE7awG65fW%2BMzixSm7CYJK3lwBh6OA9DHZEPQ%3D', 'admin', '2020-07-11 04:07:42', '2020-07-11 04:07:42', '2020-07-11 04:17:52', 2), ('sVr4Wee3vijR16FsWSbq2E3PxMKHqtg4fA7qeSR8YnE%3D', 'oficina', '2020-07-11 10:32:14', '2020-07-12 12:00:55', NULL, 1), ('sVr4Wee3vijR16FsWSbq2M%2BGro8G70zSGyQQpslSKeI%3D', 'admin', '2020-07-11 10:32:52', '2020-07-11 10:32:52', '2020-07-11 10:35:46', 2), ('t87%2FYPl9%2FvV4blrzHyMSE%2BR4cK%2F8wpATN4F3klUUdNw%3D', 'jc', '2020-07-12 12:09:07', '2020-07-12 12:10:51', NULL, 1), ('tRobBJkRT3Utjtoxf2i0ffIx8TalSM5d9UFNyTkIACM%3D', 'admin', '2020-07-11 04:45:39', '2020-07-11 04:45:39', '2020-07-11 07:34:20', 2), ('tzOO2krGG3%2B23iiCymGQW%2BqGN8MZoFMqC0u4TJe9Wnw%3D', 'admin', '2020-07-11 03:49:05', '2020-07-11 03:49:42', '2020-07-11 04:02:57', 2), ('uf4H40XmZREh8eo4N%2F5u9mQP7JNHzix89C9%2FPPb5YDM%3D', 'jc', '2020-07-11 10:34:56', '2020-07-11 10:34:56', '2020-07-12 12:09:07', 2), ('uf4H40XmZREh8eo4N%2F5u9s7S5KLui6p9r6QwCVcb%2FrI%3D', 'jc', '2020-07-11 10:34:32', '2020-07-11 10:34:32', '2020-07-11 10:34:56', 2), ('vHjHonASfBQr8E4bva3ZCS15cfuH6i%2BR2j65v7pBx88%3D', 'admin', '2020-07-11 10:28:41', '2020-07-11 10:30:29', '2020-07-11 10:32:52', 2), ('vjwtYuIE8yiS2Mwm9TSWVjMqeAjfCmUPQ%2Bcafsgr8eI%3D', 'admin', '2020-07-11 04:17:52', '2020-07-11 04:18:08', '2020-07-11 04:45:39', 2), ('VsE%2BEWY7OGso94Aq4ScI8I7%2F43elf6kG8PXh0C6nqbM%3D', 'admin', '2020-07-11 10:35:46', '2020-07-11 10:35:46', '2020-07-11 10:58:33', 2), ('VSjw7TtpIHBCuIkaj%2FXULBgkSjMIFw1OnaI6ccjkoIM%3D', 'admin', '2020-07-12 03:23:22', '2020-07-12 03:23:58', '2020-07-13 05:42:34', 2), ('vtDlYsu3%2FzSzEL1XRZ4kLI306e9dBuNZD47iTLr1L6o%3D', 'admin', '2020-07-11 07:34:20', '2020-07-11 07:49:16', '2020-07-11 07:51:01', 2), ('ZC7kfbCCp88bNWlab1BuAUgr74sjmp40Pl1fiK%2BGg6Y%3D', 'oficina2', '2020-07-12 12:23:48', '2020-07-12 12:23:48', '2020-07-13 05:44:15', 2);
COMMIT;

-- ----------------------------
-- Table structure for solicitud
-- ----------------------------
DROP TABLE IF EXISTS `solicitud`;
CREATE TABLE `solicitud`  (
  `id_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) NOT NULL,
  `id_usuario` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ine` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `monto` decimal(10, 0) NOT NULL,
  `pagos` int(11) NULL DEFAULT NULL COMMENT 'Número de pagos',
  `id_tipo_cobro` int(11) NULL DEFAULT NULL COMMENT 'Tipo / perioricidad de pagos',
  `fecha_requerida` date NOT NULL COMMENT 'Fecha en que se requiere el prestamo.',
  `id_estado_solicitud` int(11) NULL DEFAULT NULL,
  `id_estado` int(11) NOT NULL,
  `fecha_reg` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id_solicitud`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of solicitud
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sucursal
-- ----------------------------
DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE `sucursal`  (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `direccion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_ciudad` int(11) NULL DEFAULT NULL,
  `cp` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telefono` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_sucursal`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of sucursal
-- ----------------------------
BEGIN;
INSERT INTO `sucursal` VALUES (1, 'RFC45GENERICO', 'Comalcalco', 'Calle Reforma', 1, '86300', '9331490521', 1);
COMMIT;

-- ----------------------------
-- Table structure for tipo_capital
-- ----------------------------
DROP TABLE IF EXISTS `tipo_capital`;
CREATE TABLE `tipo_capital`  (
  `id_tipo_capital` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_tipo_capital`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of tipo_capital
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tipo_cobro
-- ----------------------------
DROP TABLE IF EXISTS `tipo_cobro`;
CREATE TABLE `tipo_cobro`  (
  `id_tipo_cobro` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Al cambiar los valores de la pestaña Insert debe actualizarce el código de la función CAL_FECHA_PAGO que esta ligada\na dicha información de esta tabla.',
  `perioricidad_dias` int(11) NOT NULL COMMENT 'Periodo de cobro en dias. Cada cuantos dias se cobrará.\n\nAl cambiar los valores de la pestaña Insert debe actualizarce el código de la función CAL_FECHA_PAGO que esta ligada\na dicha información de esta tabla.',
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Al cambiar los valores de la pestaña Insert debe actualizarce el código de la función CAL_FECHA_PAGO que esta ligada\na dicha información de esta tabla.',
  PRIMARY KEY (`id_tipo_cobro`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of tipo_cobro
-- ----------------------------
BEGIN;
INSERT INTO `tipo_cobro` VALUES (1, 1, 'Diario'), (2, 7, 'Semanal'), (3, 14, 'Catorcenal'), (4, 15, 'Quincenal'), (5, 30, 'Mensual');
COMMIT;

-- ----------------------------
-- Table structure for tipo_concepto
-- ----------------------------
DROP TABLE IF EXISTS `tipo_concepto`;
CREATE TABLE `tipo_concepto`  (
  `id_tipo_concepto` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_capital` int(11) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_concepto`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of tipo_concepto
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tipo_credito
-- ----------------------------
DROP TABLE IF EXISTS `tipo_credito`;
CREATE TABLE `tipo_credito`  (
  `id_tipo_credito` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipo de operqación:\n1- Nuevo cliente\n2- Renovación credito\n3- Nuevo credito a cliente Con credito activo\n4- Moroso',
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_credito`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of tipo_credito
-- ----------------------------
BEGIN;
INSERT INTO `tipo_credito` VALUES (1, 'Renovación'), (2, 'Nuevo credito'), (3, 'Nuevo Cliente'), (4, 'Recuperación');
COMMIT;

-- ----------------------------
-- Table structure for tipo_inmueble
-- ----------------------------
DROP TABLE IF EXISTS `tipo_inmueble`;
CREATE TABLE `tipo_inmueble`  (
  `id_tipo_inmueble` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_inmueble`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of tipo_inmueble
-- ----------------------------
BEGIN;
INSERT INTO `tipo_inmueble` VALUES (1, 'Propio'), (2, 'Renta');
COMMIT;

-- ----------------------------
-- Table structure for tipo_local
-- ----------------------------
DROP TABLE IF EXISTS `tipo_local`;
CREATE TABLE `tipo_local`  (
  `id_tipo_local` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_local`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of tipo_local
-- ----------------------------
BEGIN;
INSERT INTO `tipo_local` VALUES (1, 'Fijo'), (2, 'Ambulante'), (3, 'Empleado');
COMMIT;

-- ----------------------------
-- Table structure for tipo_pago
-- ----------------------------
DROP TABLE IF EXISTS `tipo_pago`;
CREATE TABLE `tipo_pago`  (
  `id_tipo_pago` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tipo de pago:\n1- Pago normal completo\n2- Pago parcial\n3- Extra\n4- No pago\n5- Sin visitar',
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_pago`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of tipo_pago
-- ----------------------------
BEGIN;
INSERT INTO `tipo_pago` VALUES (1, 'Pago normal'), (2, 'Abono parcial'), (3, 'Extra'), (4, 'No pagó'), (5, 'Sin visitar'), (6, 'Fin de credito'), (7, 'Renovación');
COMMIT;

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `id_usuario` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_sucursal` int(11) NOT NULL DEFAULT 0,
  `ine` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_rol` int(11) NOT NULL,
  `usuario_padre` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of usuario
-- ----------------------------
BEGIN;
INSERT INTO `usuario` VALUES ('0247040029410', 0, '0247040029410', '12345', 3, 'oficina2', 5), ('0515132616390', 1, '0515132616390', '12345', 3, 'OFICINA1', 5), ('052105054618541', 1, '052105054618541', '12345', 3, 'OFICINA1', 5), ('0535127612623', 0, '0535127612623', '12345', 3, 'oficina2', 5), ('0555009813409', 0, '0555009813409', '12345', 3, 'oficina2', 5), ('0555054980528', 0, '0555054980528', '12345', 3, 'oficina2', 5), ('0555126868277', 0, '0555126868277', '12345', 3, 'oficina2', 5), ('0559103499618', 0, '0559103499618', '12345', 3, 'oficina2', 5), ('0573031755131', 0, '0573031755131', '12345', 3, 'oficina2', 5), ('0574100264368', 0, '0574100264368', '12345', 3, 'oficina2', 5), ('1029071683966', 0, '1029071683966', '12345', 3, 'oficina2', 5), ('1033002128296', 0, '1033002128296', '12345', 3, 'oficina2', 5), ('admin', 1, 'INE_ADMIN', '@a82497EEW', 1, NULL, 1), ('chaparro', 1, 'INE_DAVID', '12345', 2, 'admin', 1), ('jc', 1, 'INE_JC', '12345', 2, 'admin', 1), ('oficina', 0, 'OFICINA', '12345', 2, 'admin', 1), ('oficina1', 1, 'OFI1', '12345', 1, 'admin', 1), ('oficina2', 0, 'OFI2', '12345', 1, 'admin', 1);
COMMIT;

-- ----------------------------
-- Table structure for usuario_establecimiento
-- ----------------------------
DROP TABLE IF EXISTS `usuario_establecimiento`;
CREATE TABLE `usuario_establecimiento`  (
  `id_usuario_establecimiento` int(11) NOT NULL AUTO_INCREMENT,
  `ine` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_calle` int(11) NULL DEFAULT NULL,
  `numero_ext` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `referencias` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_actividad_economica` int(11) NULL DEFAULT NULL,
  `id_tipo_inmueble` int(11) NULL DEFAULT NULL,
  `id_tipo_local` int(11) NULL DEFAULT NULL COMMENT 'Fijo\nAmbulante\nEmpleado',
  `documento_adicional` longblob NULL,
  `disponibilidad_hr_inicio` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Hora de paertura de local | Hora de inicio de disponibilidad',
  `disponibilidad_hr_fin` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Hora de cierre de local | Hora de fin de disponibilidad',
  `coordenadas` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `foto` longblob NULL,
  `id_ruta` int(11) NULL DEFAULT NULL,
  `id_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario_establecimiento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of usuario_establecimiento
-- ----------------------------
BEGIN;
INSERT INTO `usuario_establecimiento` VALUES (1, 'INE_1', 'Taco loco', NULL, NULL, 'Banco Santander', NULL, 1, 1, NULL, '09:00', '16:00', '', NULL, 3, 5), (2, 'INE_2', 'Antojitos Nelli', NULL, NULL, 'Banco Santander', NULL, 1, 1, NULL, '09:00', '16:00', '', NULL, 3, 5), (3, 'INE_3', 'Cocos', NULL, NULL, 'Banco Santander', NULL, 1, 1, NULL, '09:00', '16:00', '', NULL, 2, 5), (4, 'INE_4', 'Pollos', NULL, NULL, 'Banco Santander', NULL, 1, 1, NULL, '09:00', '16:00', '', NULL, 2, 5), (5, 'INE_5', 'La Gotita', NULL, NULL, 'Banco Santander', NULL, 1, 1, NULL, '09:00', '16:00', '', NULL, 1, 5), (6, 'INE_6', '', NULL, NULL, '', NULL, 1, 1, NULL, '', '', '', NULL, 1, 5), (7, '0535127612623', '', NULL, NULL, '', NULL, 1, 1, NULL, '', '', '', NULL, 3, 5), (8, '0515132616390', '', NULL, NULL, 'Tienda de abarrotes', NULL, 1, 1, NULL, '', '', '', NULL, 1, 5), (9, '0247040029410', '', NULL, NULL, '', NULL, 1, 1, NULL, '', '', '', NULL, 3, 5), (10, '0555126868277', '', NULL, NULL, '', NULL, 1, 1, NULL, '', '', '', NULL, 3, 5), (11, '0559103499618', '', NULL, NULL, '', NULL, 1, 1, NULL, '', '', '', NULL, 3, 5), (12, '0555054980528', '', NULL, NULL, '', NULL, 1, 1, NULL, '', '', '', NULL, 3, 5), (13, '0555009813409', '', NULL, NULL, '', NULL, 1, 1, NULL, '', '', '', NULL, 3, 5), (14, '1033002128296', '', NULL, NULL, '', NULL, 1, 1, NULL, '', '', '', NULL, 3, 5), (15, '0573031755131', '', NULL, NULL, '', NULL, 1, 1, NULL, '', '', '', NULL, 3, 5), (16, '1029071683966', '', NULL, NULL, '', NULL, 1, 1, NULL, '', '', '', NULL, 3, 5), (17, '0574100264368', '', NULL, NULL, '', NULL, 1, 1, NULL, '', '', '', NULL, 3, 5), (18, '052105054618541', 'Taco Loco', NULL, NULL, 'Cerca de Casa Mazatlan', NULL, 2, 1, NULL, '03:00', '10:00', '', NULL, 1, 5);
COMMIT;

-- ----------------------------
-- Table structure for usuario_permiso
-- ----------------------------
DROP TABLE IF EXISTS `usuario_permiso`;
CREATE TABLE `usuario_permiso`  (
  `id_usuario_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `id_permiso` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario_permiso`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of usuario_permiso
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for usuario_ruta
-- ----------------------------
DROP TABLE IF EXISTS `usuario_ruta`;
CREATE TABLE `usuario_ruta`  (
  `id_usuario_ruta` int(11) NOT NULL AUTO_INCREMENT,
  `id_ruta` int(11) NOT NULL,
  `id_usuario` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_usuario_ruta`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of usuario_ruta
-- ----------------------------
BEGIN;
INSERT INTO `usuario_ruta` VALUES (1, 1, 'jc'), (2, 2, 'chaparro'), (3, 3, 'oficina');
COMMIT;

-- ----------------------------
-- Table structure for zona_horaria
-- ----------------------------
DROP TABLE IF EXISTS `zona_horaria`;
CREATE TABLE `zona_horaria`  (
  `id_zona_horaria` int(11) NOT NULL AUTO_INCREMENT,
  `utc` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zona` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_zona_horaria`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of zona_horaria
-- ----------------------------
BEGIN;
INSERT INTO `zona_horaria` VALUES (1, 'UTC-6', 'America/Mexico_City', 'México'), (2, 'UTC-7', 'America/Phoenix', 'United States');
COMMIT;

-- ----------------------------
-- Procedure structure for CARTERA_CLIENTES
-- ----------------------------
DROP PROCEDURE IF EXISTS `CARTERA_CLIENTES`;
delimiter ;;
CREATE PROCEDURE `CARTERA_CLIENTES`(IN usuario VARCHAR ( 30 ))
BEGIN-- a Persona
-- b Credito
-- c Abono
-- d Usuario_establecimiento
-- e Usuario_ruta
-- f Usuario
-- g Ruta
	IF
		usuario = "0" THEN
		SELECT
			f.id_usuario,
			g.id_ruta,
			a.alias,
			CONCAT_WS( ' ', a.nombre, a.apellido_paterno, a.apellido_materno ) AS "nombre",
			IF((b.pagos_total * monto_pago ) - SUM( c.monto ) IS NULL, b.monto_total, (b.pagos_total * monto_pago ) - SUM( c.monto ) ) AS "restante" 
		FROM
			credito b
			INNER JOIN usuario_establecimiento AS d ON d.id_usuario_establecimiento = b.id_usuario_establecimiento
			INNER JOIN persona AS a ON a.ine = d.ine
			INNER JOIN usuario_ruta AS e ON e.id_ruta = d.id_ruta
			INNER JOIN usuario AS f ON f.id_usuario = e.id_usuario
			INNER JOIN ruta AS g ON g.id_ruta = e.id_ruta
			LEFT JOIN abono AS c ON c.folio_credito = b.folio_credito 
		WHERE
			b.id_estado_credito = 1 
		GROUP BY
			b.folio_credito;
		ELSE 
		
		SELECT
			f.id_usuario,
			g.id_ruta,
			a.alias,
			CONCAT_WS( ' ', a.nombre, a.apellido_paterno, a.apellido_materno ) AS "nombre",
			IF((b.pagos_total * monto_pago ) - SUM( c.monto ) IS NULL, b.monto_total, (b.pagos_total * monto_pago ) - SUM( c.monto ) ) AS "restante" 
		FROM
			credito b
			INNER JOIN usuario_establecimiento AS d ON d.id_usuario_establecimiento = b.id_usuario_establecimiento
			INNER JOIN persona AS a ON a.ine = d.ine
			INNER JOIN usuario_ruta AS e ON e.id_ruta = d.id_ruta
			INNER JOIN usuario AS f ON f.id_usuario = e.id_usuario
			INNER JOIN ruta AS g ON g.id_ruta = e.id_ruta
			LEFT JOIN abono AS c ON c.folio_credito = b.folio_credito 
		WHERE
			f.id_usuario = usuario 
			AND b.id_estado_credito = 1 
		GROUP BY
			b.folio_credito;
		
	END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for COBRO_DIA
-- ----------------------------
DROP PROCEDURE IF EXISTS `COBRO_DIA`;
delimiter ;;
CREATE PROCEDURE `COBRO_DIA`(IN var_usuario VARCHAR(100))
BEGIN

		-- DECLARACION DE VARIABLES ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	DECLARE done 								INT DEFAULT FALSE;
	
	DECLARE var_folio_credito		VARCHAR(50) DEFAULT "";
	DECLARE var_id_ruta 				INT DEFAULT 0;
	DECLARE var_ine 						VARCHAR(100) DEFAULT "";
	DECLARE var_nombre 					VARCHAR(100) DEFAULT "";
	DECLARE var_alias 					VARCHAR(60) DEFAULT "";
	DECLARE var_telefono 				VARCHAR(12) DEFAULT "";
	DECLARE var_monto_credito 	DECIMAL(10,2) DEFAULT 0;
	DECLARE var_pagos_total 		INT DEFAULT 0;
	DECLARE var_monto_total 		DECIMAL(10,2) DEFAULT 0;
	DECLARE var_monto_pago 			DECIMAL(10,2) DEFAULT 0;
	DECLARE var_fecha_entrega 	DATE DEFAULT "";
	DECLARE var_pagado 					DECIMAL(10,2) DEFAULT 0;
	DECLARE var_atrasos_no 			DECIMAL(10,2) DEFAULT 0;
	DECLARE var_atrasos_monto 	DECIMAL(10,2) DEFAULT 0;
	DECLARE var_extras_no 				DECIMAL(10,2) DEFAULT 0;
	DECLARE var_extras_monto 		DECIMAL(10,2) DEFAULT 0;
	
	DECLARE var_restante_no 		INT DEFAULT 0;
	DECLARE var_restante_monto 	DECIMAL(10,2) DEFAULT 0;
	DECLARE var_restante_total 	DECIMAL(10,2) DEFAULT 0;
	DECLARE var_abono_hoy 			DECIMAL(10,2) DEFAULT 0;
	DECLARE var_id_tipo_pago 		INT DEFAULT 0;
	DECLARE var_descripcion 		VARCHAR(50) DEFAULT "";
	
	DECLARE var_abonos_no 			INT DEFAULT 0;
	DECLARE var_id_tipo_pago_aux INT DEFAULT 0;

	
	-- DECLARACION DEL CURSOR ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		
		-- a Persona
		-- b Credito
		-- c Abono
		-- d Cobro_dia
		-- e Tipo_pago

	DEClARE curLista 
		CURSOR FOR 
				SELECT 
					d.folio_credito,
					d.id_ruta,
					a.ine, 
					CONCAT_WS(' ', a.nombre, a.apellido_paterno, a.apellido_materno) AS "nombre", 
					a.alias, 
					a.telefono, 
					b.monto_credito, 
					b.pagos_total, 
					(b.monto_pago * b.pagos_total) AS "monto_total", 
					b.monto_pago, 
					b.fecha_entrega, 
					COUNT(IF(c.id_tipo_pago = 4,c.id_tipo_pago,NULL)) AS "atrasos_no", 
					SUM(IF(c.id_tipo_pago = 4, b.monto_pago,IF(c.id_tipo_pago = 2, b.monto_pago - c.monto, 0))) AS "atrasos_monto",
					COUNT(IF(c.id_tipo_pago = 3,c.id_tipo_pago,NULL)) AS "extras_no", 
					SUM(IF(c.id_tipo_pago = 3, c.monto - b.monto_pago, 0)) AS "extras_monto" 
				FROM credito b
				INNER JOIN cobro_dia AS d ON d.folio_credito = b.folio_credito 
				INNER JOIN persona AS a ON a.ine = d.ine 
				LEFT JOIN abono AS c ON c.folio_credito = d.folio_credito 
				
				WHERE b.id_estado_credito = 1 AND (d.id_usuario = var_usuario OR var_usuario = "0")
				GROUP BY b.folio_credito ORDER BY a.alias;
		-- FIN CURSOR -----------------------------------------------------------------------------------------------------------------------
		

	-- DECLARACION DE ERROR PARA FOR(CURSOR) ----------------------------------------------------------------------------------------------
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;


		-- TABLA TEMPORAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	CREATE TEMPORARY TABLE IF NOT EXISTS ttcobrodia1 ( 
		folio_credito 		VARCHAR(50) PRIMARY KEY,
		id_ruta						INT,
		ine								VARCHAR(100) NULL,
		nombre 						VARCHAR(100) NULL,
		alias 						VARCHAR(60) NULL,
		telefono 					VARCHAR(12) NULL,
		monto_credito 		DECIMAL(10,2) NULL,
		pagos_total 			INT(11) NULL,
		monto_total 			DECIMAL(10,2) NULL,
		monto_pago 				DECIMAL(10,2) NULL,
		fecha_entrega 		DATE NOT NULL,
		pagado 						DECIMAL(10,2) NULL,
		atrasos_no 				DECIMAL(10,2) NULL,
		atrasos_monto 		DECIMAL(10,2) NULL,
		extras_no 					DECIMAL(10,2) NULL,
		extras_monto 			DECIMAL(10,2) NULL,
		restante_no 			DECIMAL(10,2) NULL,
		restante_monto 		DECIMAL(10,2) NULL,
		restante_total 		DECIMAL(10,2) NULL,
		abono_hoy 				DECIMAL(10,2) NULL,
		id_tipo_pago 			INT(11) NULL,
		descripcion 			VARCHAR(50) NULL
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
		INSERT INTO ttcobrodia1 VALUES(
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
	
	SELECT * FROM ttcobrodia1;
	DROP TABLE ttcobrodia1;

END
;;
delimiter ;

-- ----------------------------
-- Function structure for COBRO_DIA_CAL_FECHA_PAGO
-- ----------------------------
DROP FUNCTION IF EXISTS `COBRO_DIA_CAL_FECHA_PAGO`;
delimiter ;;
CREATE FUNCTION `COBRO_DIA_CAL_FECHA_PAGO`(fecha_pago DATE, tipo_cobro INT)
 RETURNS varchar(20) CHARSET utf8
BEGIN 
	DECLARE fecha DATE;

	CASE tipo_cobro
		WHEN 1 THEN # AGREGAR UN DIA A LA FECHA
			SET fecha = NOW();
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
		RETURN '2020-01-01';

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for COBRO_DIA_CONSULTA
-- ----------------------------
DROP PROCEDURE IF EXISTS `COBRO_DIA_CONSULTA`;
delimiter ;;
CREATE PROCEDURE `COBRO_DIA_CONSULTA`(IN _credito VARCHAR(50))
BEGIN 

		-- DECLARACION DE VARIABLES ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	DECLARE done 								INT DEFAULT FALSE;
	
	DECLARE var_folio_credito		VARCHAR(50) DEFAULT "";
	DECLARE var_id_ruta 				INT DEFAULT 0;
	DECLARE var_ine 						VARCHAR(100) DEFAULT "";
	DECLARE var_nombre 					VARCHAR(100) DEFAULT "";
	DECLARE var_alias 					VARCHAR(60) DEFAULT "";
	DECLARE var_telefono 				VARCHAR(12) DEFAULT "";
	DECLARE var_monto_credito 	DECIMAL(10,2) DEFAULT 0;
	DECLARE var_pagos_total 		INT DEFAULT 0;
	DECLARE var_monto_total 		DECIMAL(10,2) DEFAULT 0;
	DECLARE var_monto_pago 			DECIMAL(10,2) DEFAULT 0;
	DECLARE var_fecha_entrega 	DATE DEFAULT "";
	DECLARE var_pagado 					DECIMAL(10,2) DEFAULT 0;
	DECLARE var_atrasos_no 			DECIMAL(10,2) DEFAULT 0;
	DECLARE var_atrasos_monto 	DECIMAL(10,2) DEFAULT 0;
	DECLARE var_extras_no 				DECIMAL(10,2) DEFAULT 0;
	DECLARE var_extras_monto 		DECIMAL(10,2) DEFAULT 0;
	
	DECLARE var_restante_no 		INT DEFAULT 0;
	DECLARE var_restante_monto 	DECIMAL(10,2) DEFAULT 0;
	DECLARE var_restante_total 	DECIMAL(10,2) DEFAULT 0;
	DECLARE var_abono_hoy 			DECIMAL(10,2) DEFAULT 0;
	DECLARE var_id_tipo_pago 		INT DEFAULT 0;
	DECLARE var_descripcion 		VARCHAR(50) DEFAULT "";
	
	DECLARE var_abonos_no 			INT DEFAULT 0;
	DECLARE var_id_tipo_pago_aux INT DEFAULT 0;

	
	-- DECLARACION DEL CURSOR ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		
		-- a Persona
		-- b Credito
		-- c Abono
		-- d Cobro_dia
		-- e Tipo_pago

	DEClARE curLista 
		CURSOR FOR 
			SELECT 
					b.folio_credito,
					d.id_ruta,
					a.ine, 
					CONCAT_WS(' ', a.nombre, a.apellido_paterno, a.apellido_materno) AS "nombre", 
					a.alias, 
					a.telefono, 
					b.monto_credito, 
					b.pagos_total, 
					(b.monto_pago * b.pagos_total) AS "monto_total", 
					b.monto_pago, 
					b.fecha_entrega, 
					COUNT(IF(c.id_tipo_pago = 4,c.id_tipo_pago,NULL)) AS "atrasos_no", 
					SUM(IF(c.id_tipo_pago = 4, b.monto_pago,IF(c.id_tipo_pago = 2, b.monto_pago - c.monto, 0))) AS "atrasos_monto",
					COUNT(IF(c.id_tipo_pago = 3,c.id_tipo_pago,NULL)) AS "extras_no", 
					SUM(IF(c.id_tipo_pago = 3, c.monto - b.monto_pago, 0)) AS "extras_monto" 
				FROM credito b
				INNER JOIN usuario_establecimiento AS d ON d.id_usuario_establecimiento = b.id_usuario_establecimiento 
				INNER JOIN persona AS a ON a.ine = d.ine 
				LEFT JOIN abono AS c ON c.folio_credito = b.folio_credito 
				
		WHERE b.id_estado_credito = 1 AND b.folio_credito = _credito 
		GROUP BY b.folio_credito ORDER BY a.alias;
		-- FIN CURSOR -----------------------------------------------------------------------------------------------------------------------
		

	-- DECLARACION DE ERROR PARA FOR(CURSOR) ----------------------------------------------------------------------------------------------
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;


		-- TABLA TEMPORAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	CREATE TEMPORARY TABLE IF NOT EXISTS ttcobrodia2 ( 
		folio_credito 		VARCHAR(50) PRIMARY KEY,
		id_ruta						INT,
		ine								VARCHAR(100) NULL,
		nombre 						VARCHAR(100) NULL,
		alias 						VARCHAR(60) NULL,
		telefono 					VARCHAR(12) NULL,
		monto_credito 		DECIMAL(10,2) NULL,
		pagos_total 			INT(11) NULL,
		monto_total 			DECIMAL(10,2) NULL,
		monto_pago 				DECIMAL(10,2) NULL,
		fecha_entrega 		DATE NOT NULL,
		pagado 						DECIMAL(10,2) NULL,
		atrasos_no 				DECIMAL(10,2) NULL,
		atrasos_monto 		DECIMAL(10,2) NULL,
		extras_no 					DECIMAL(10,2) NULL,
		extras_monto 			DECIMAL(10,2) NULL,
		restante_no 			DECIMAL(10,2) NULL,
		restante_monto 		DECIMAL(10,2) NULL,
		restante_total 		DECIMAL(10,2) NULL,
		abono_hoy 				DECIMAL(10,2) NULL,
		id_tipo_pago 			INT(11) NULL,
		descripcion 			VARCHAR(50) NULL
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
		INSERT INTO ttcobrodia2 VALUES(
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
	
	SELECT * FROM ttcobrodia2;
	DROP TABLE ttcobrodia2;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for COBRO_DIA_CORTE
-- ----------------------------
DROP PROCEDURE IF EXISTS `COBRO_DIA_CORTE`;
delimiter ;;
CREATE PROCEDURE `COBRO_DIA_CORTE`()
BEGIN
/*
	Añadir registro tipo_pago: 7 - Renovacion
*/
		SELECT 
					b.id_ruta,
					b.descripcion AS "ruta_descripcion",
					a.id_usuario,
					SUM(c.monto) AS "total_recolectado",
					SUM(d.monto_pago) AS "total_deberia_recolectar_dia",
					SUM(IF(c.id_tipo_pago != 3, c.monto, d.monto_pago)) AS "total_recolectado_sin_extras",
					SUM(IF(c.id_tipo_pago = 2, c.monto,0)) AS "monto_abonos",
					SUM(IF(c.id_tipo_pago = 3, c.monto - d.monto_pago, 0)) AS "monto_extras",
					SUM(IF(c.id_tipo_pago = 1, c.monto, 0)) AS "monto_normal",
					SUM(IF(c.id_tipo_pago = 4, d.monto_pago, 0)) AS "monto_no_pagos",
					SUM(IF(c.id_tipo_pago = 2, d.monto_pago - c.monto, 0)) AS "monto_defici_abonos",
					SUM(IF(c.id_tipo_pago = 4, c.monto, IF(c.id_tipo_pago = 2, d.monto_pago - c.monto,0))) AS "monto_defici_total",
					SUM(IF(c.id_tipo_pago = 7,IF(c.monto >= d.monto_pago, c.monto - d.monto_pago,c.monto),0)) AS "monto_remanente",

					COUNT(a.folio_credito) AS "total_cli_visitar",
					COUNT(c.id_abono) AS "total_cli_visitados",
					SUM(IF(c.id_tipo_pago = 4, 1, null)) AS "total_cli_no_pago",
					SUM(IF(c.id_tipo_pago = 1, 1, null)) AS "total_cli_pago",
					SUM(IF(c.id_tipo_pago = 2, 1, null)) AS "total_cli_abonaron",
					SUM(IF(c.id_tipo_pago = 3, 1, null)) AS "total_cli_extra",
					(COUNT(a.id_ruta) - COUNT(c.id_abono)) AS "total_cli_no_vicitaron"

					FROM ruta b
					INNER JOIN cobro_dia AS a ON a.id_ruta = b.id_ruta
					INNER JOIN credito AS d ON d.folio_credito = a.folio_credito
					LEFT JOIN abono AS c ON c.folio_credito = a.folio_credito
					GROUP BY a.id_ruta;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for COBRO_DIA_PROC_CALCULAR
-- ----------------------------
DROP PROCEDURE IF EXISTS `COBRO_DIA_PROC_CALCULAR`;
delimiter ;;
CREATE PROCEDURE `COBRO_DIA_PROC_CALCULAR`()
BEGIN

	-- DECLARACION DE VARIABLES ---------------------------------------------------------------------------------------
	DECLARE done INT DEFAULT FALSE;								-- Control de error de FOR(CURSOR)
	DECLARE var_folio VARCHAR(50) DEFAULT "";			-- Folio del credito
	DECLARE var_id_tipo INT DEFAULT 0;						-- Tipo de cobro del credito
	DECLARE var_fecha DATE;												-- Fecha del siguiente pago
	DECLARE var_ruta INT DEFAULT 0;								-- Ruta
	DECLARE var_usuario VARCHAR(30) DEFAULT ""; 	-- Usuario (cobrador)
	DECLARE var_ine VARCHAR(100);

	-- DECLARACION DEL CURSOR -----------------------------------------------------------------------------------------
	DEClARE curLista 
		CURSOR FOR 
			SELECT a.folio_credito, a.id_tipo_cobro, a.fecha_siguiente_pago, b.id_ruta, c.id_usuario, b.ine FROM credito a
				INNER JOIN usuario_establecimiento AS b ON b.id_usuario_establecimiento = a.id_usuario_establecimiento
				INNER JOIN usuario_ruta AS c ON c.id_ruta = b.id_ruta
				WHERE a.fecha_siguiente_pago <= CURDATE() AND a.id_estado_credito = 1 ORDER BY a.folio_credito ASC;

	-- DECLARACION DE ERROR PARA FOR(CURSOR) --------------------------------------------------------------------------
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

 -- Se procesan los clientes que no se les especifico tipo de pago.
	CALL COBRO_DIA_PROC_NO_PAGO();

	-- Se inicializa el cursor
	OPEN curLista;

	-- Se inicia ciclo repetitivo -------------------------------------------------------------------------------------
	ciclo: LOOP
		FETCH curLista INTO var_folio, var_id_tipo, var_fecha, var_ruta, var_usuario, var_ine;
		
		IF done THEN 
			LEAVE ciclo;
		END IF;
		
		IF var_fecha < CURDATE() THEN
			SET var_fecha = COBRO_DIA_CAL_FECHA_PAGO(var_fecha, var_id_tipo);
			UPDATE credito SET fecha_siguiente_pago = var_fecha WHERE folio_credito = var_folio;
		END IF;
		
		IF var_fecha = CURDATE() THEN
			INSERT INTO cobro_dia VALUES(var_folio, var_ine, var_ruta, var_usuario);
		END IF;
		
	END LOOP ciclo;
	CLOSE curLista;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for COBRO_DIA_PROC_NO_PAGO
-- ----------------------------
DROP PROCEDURE IF EXISTS `COBRO_DIA_PROC_NO_PAGO`;
delimiter ;;
CREATE PROCEDURE `COBRO_DIA_PROC_NO_PAGO`()
BEGIN

	-- DECLARACION DE VARIABLES ---------------------------------------------------------------------------------------
	DECLARE done INT DEFAULT FALSE;								-- Control de error de FOR(CURSOR)
	DECLARE var_folio_credito VARCHAR(50) DEFAULT "";			-- Folio del credito
	DECLARE var_ine VARCHAR(100) DEFAULT "";
	DECLARE var_monto_credito DECIMAL(10,2) DEFAULT 0;
	DECLARE var_fecha_entrega DATE DEFAULT "";
	DECLARE var_pagos_total INT DEFAULT 0;
	DECLARE var_fecha_abono DATE DEFAULT "";
	DECLARE var_estadistica_existe INT DEFAULT 0;
 
	-- DECLARACION DEL CURSOR -----------------------------------------------------------------------------------------
	DEClARE curLista 
			CURSOR FOR 
				SELECT a.folio_credito, d.ine, c.monto_credito, c.fecha_entrega, c.pagos_total
				FROM cobro_dia a
				INNER JOIN credito AS c ON a.folio_credito = c.folio_credito
				INNER JOIN usuario_establecimiento AS d ON c.id_usuario_establecimiento = d.id_usuario_establecimiento
				LEFT JOIN abono AS b ON a.folio_credito = b.folio_credito and b.fecha_abono = DATE(DATE_SUB( NOW(), INTERVAL 1 DAY))
				WHERE b.fecha_abono IS NULL;

	-- DECLARACION DE ERROR PARA FOR(CURSOR) --------------------------------------------------------------------------
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	SET var_fecha_abono = (DATE_SUB( NOW(), INTERVAL 1 DAY));
	OPEN curLista;
	
	ciclo: LOOP
			FETCH curLista INTO var_folio_credito, var_ine, var_monto_credito, var_fecha_entrega, var_pagos_total;
			
			IF done THEN 
				LEAVE ciclo;
			END IF;
			
				INSERT INTO abono VALUES(NULL, var_folio_credito, 0, 0, 4, var_fecha_abono, 1, NOW());
				
				SET var_estadistica_existe = (SELECT COUNT(ine) FROM estadistica_cliente WHERE folio_credito = var_folio_credito);
				IF var_estadistica_existe > 0 THEN
					UPDATE estadistica_cliente SET no_atrasos = (no_atrasos + 1) WHERE folio_credito = var_folio_credito;
				ELSE
					INSERT INTO estadistica_cliente VALUES(var_folio_credito, var_ine, var_monto_credito, var_fecha_entrega, var_pagos_total, 0, 0, 0, 1);
				END IF;
			
		
	END LOOP ciclo;
	CLOSE curLista;
	
	TRUNCATE TABLE cobro_dia;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for FILTRAR_CLIENTES
-- ----------------------------
DROP PROCEDURE IF EXISTS `FILTRAR_CLIENTES`;
delimiter ;;
CREATE PROCEDURE `FILTRAR_CLIENTES`(IN filtro VARCHAR(100))
BEGIN
	
	
	
		-- DECLARACION DE VARIABLES ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	DECLARE done 								INT DEFAULT FALSE;
	
	DECLARE var_ine						VARCHAR(100) DEFAULT "";
	DECLARE var_nombre 				VARCHAR(100) DEFAULT "";
	DECLARE var_no_creditos   INT DEFAULT 0;
	DECLARE var_pagos_total 	INT DEFAULT 0;
	DECLARE var_no_pagos			DECIMAL(10,2) DEFAULT 0;
	DECLARE var_no_abonos			INT DEFAULT 0;
	DECLARE var_no_atrasos		DECIMAL(10,2) DEFAULT 0; 
	DECLARE var_no_adelantos 	DECIMAL(10,2) DEFAULT 0;
	DECLARE var_calificacion  DECIMAL(10,2) DEFAULT 0;
	DECLARE var_extras 				DECIMAL(10,2) DEFAULT 0;
	DECLARE var_telefono 			VARCHAR(15) DEFAULT "";
	DECLARE var_id_usuario_establecimiento INT DEFAULT 0;
	


	
	-- DECLARACION DEL CURSOR ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		

	DEClARE curLista 
		CURSOR FOR 
						SELECT 
							a.ine, 
							concat_ws(' ',a.alias, " - ", a.nombre, a.apellido_paterno, a.apellido_materno) AS "nombre",
							COUNT(c.ine) AS "no_creditos",
							SUM(c.pagos_total) AS "pagos_total",
							SUM(c.no_pagos) AS "no_pagos",
							SUM(c.no_abonos) AS "no_abonos",
							SUM(c.no_atrasos) AS "no_atrasos",
							SUM(c.no_adelantos) AS "no_adelantos",
							a.telefono,
							d.id_usuario_establecimiento
						FROM persona a
						INNER JOIN usuario AS b ON b.ine = a.ine
						INNER JOIN usuario_establecimiento AS d ON d.ine = a.ine
						LEFT JOIN estadistica_cliente AS c ON c.ine = a.ine
						
						WHERE b.id_rol = 3 AND concat_ws(' ', a.ine, a.alias, a.nombre, a.apellido_paterno, a.apellido_materno) 
						LIKE CONCAT('%',filtro,'%') GROUP BY b.ine ORDER BY a.nombre ASC LIMIT 20;
		-- FIN CURSOR -----------------------------------------------------------------------------------------------------------------------
		

	-- DECLARACION DE ERROR PARA FOR(CURSOR) ----------------------------------------------------------------------------------------------
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;


		-- TABLA TEMPORAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	CREATE TEMPORARY TABLE IF NOT EXISTS tmpClientes ( 
		ine								VARCHAR(100) NOT NULL PRIMARY KEY,
		nombre 						VARCHAR(100) NOT NULL,
		telefono 					VARCHAR(15),
		no_creditos 			INT,
		calificacion 			DECIMAL(10,2),
		id_usuario_establecimiento INT
	); 
		-- FIN TABLA TEMPORAL ----------------------------------------------------------------------------------------------------------------
		
	


	-- Se inicializa el cursor
	OPEN curLista;

	-- INICIO DE CICLO +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	ciclo: LOOP
		FETCH curLista INTO 
												var_ine,
												var_nombre,
												var_no_creditos,
												var_pagos_total,
												var_no_pagos,
												var_no_abonos,
												var_no_atrasos,
												var_no_adelantos,
												var_telefono,
												var_id_usuario_establecimiento;
		
		IF done THEN 
			LEAVE ciclo;
		END IF;
		
		#  CALCULOS DE CALIFICACION *************************************************************************************************************
		
		SET var_calificacion = ((100 / var_pagos_total) * (var_no_pagos + var_no_abonos * 0.5) * (80/100));
		
		IF (var_pagos_total * 0.25) <= var_no_adelantos THEN
			SET var_extras = 20;
		ELSE
			SET var_extras = (20 / (var_pagos_total * 0.25) * var_no_adelantos);
		END IF;
		
		SET var_calificacion = var_calificacion + var_extras;
		
		IF var_calificacion IS NULL THEN
			SET var_calificacion = 0;
		ELSEIF var_calificacion > 100 THEN
			SET var_calificacion = 100;
		ELSEIF var_calificacion < 0 THEN
			SET var_calificacion = 0;
		END IF;
		
		-- SE INSERTAN LOS DATOS EN LA TABLA TEMPORAL
		INSERT INTO tmpClientes VALUES(var_ine, var_nombre, var_telefono, var_no_creditos, var_calificacion, var_id_usuario_establecimiento);
		
		# *************************************************************************************************************************************************************************
		
	END LOOP ciclo;
	-- FIN DE CICLO ---------------------------------------------------------------------------------------------------------------------
	CLOSE curLista;
	
	SELECT * FROM tmpClientes;
	DROP TABLE tmpClientes;

	END
;;
delimiter ;

-- ----------------------------
-- Function structure for GET_PERIODO
-- ----------------------------
DROP FUNCTION IF EXISTS `GET_PERIODO`;
delimiter ;;
CREATE FUNCTION `GET_PERIODO`(fecha DATE)
 RETURNS varchar(20) CHARSET utf8
BEGIN 
	DECLARE periodo INT DEFAULT 0;
		RETURN (SELECT id_periodo FROM periodo WHERE anio= YEAR(fecha) AND mes = MONTH(fecha));

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for LISTA_SOLICITUDES
-- ----------------------------
DROP PROCEDURE IF EXISTS `LISTA_SOLICITUDES`;
delimiter ;;
CREATE PROCEDURE `LISTA_SOLICITUDES`(IN usuario VARCHAR(100))
BEGIN
		SELECT a.ine, a.alias, CONCAT_WS(' ', a.nombre, a.apellido_paterno, a.apellido_materno) AS "nombre", b.monto, b.pagos, b.id_estado_solicitud 
		FROM persona a INNER JOIN solicitud AS b ON b.ine = a.ine
		WHERE b.id_usuario = usuario;
	END
;;
delimiter ;

-- ----------------------------
-- Event structure for TAREA_GENERAR_CARTERA_COBRO
-- ----------------------------
DROP EVENT IF EXISTS `TAREA_GENERAR_CARTERA_COBRO`;
delimiter ;;
CREATE EVENT `TAREA_GENERAR_CARTERA_COBRO`
ON SCHEDULE
EVERY '1' DAY STARTS '2020-07-13 05:00:00'
DO CALL COBRO_DIA_PROC_CALCULAR()
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
