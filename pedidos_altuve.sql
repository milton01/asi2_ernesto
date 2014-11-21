/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : altuve

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2014-11-09 06:30:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `almacen`
-- ----------------------------
DROP TABLE IF EXISTS `almacen`;
CREATE TABLE `almacen` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of almacen
-- ----------------------------
INSERT INTO `almacen` VALUES ('1', 'Listo para la venta');
INSERT INTO `almacen` VALUES ('2', 'En ruta');
INSERT INTO `almacen` VALUES ('3', 'No Disponible para venta');

-- ----------------------------
-- Table structure for `carga`
-- ----------------------------
DROP TABLE IF EXISTS `carga`;
CREATE TABLE `carga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `transporte_placa` varchar(10) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `ruta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_carga_transporte1_idx` (`transporte_placa`),
  KEY `fk_carga_empleado1_idx` (`empleado_id`),
  KEY `fk_carga_ruta1_idx` (`ruta_id`),
  CONSTRAINT `fk_carga_transporte1` FOREIGN KEY (`transporte_placa`) REFERENCES `transporte` (`placa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carga
-- ----------------------------
INSERT INTO `carga` VALUES ('1', '2014-01-01', '00:00:12', 'abc', '1', '1', '1');
INSERT INTO `carga` VALUES ('2', '2014-01-01', '00:00:12', 'abc', '2', '2', '2');

-- ----------------------------
-- Table structure for `categoriap`
-- ----------------------------
DROP TABLE IF EXISTS `categoriap`;
CREATE TABLE `categoriap` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categoriap
-- ----------------------------
INSERT INTO `categoriap` VALUES ('1', 'abc');
INSERT INTO `categoriap` VALUES ('2', 'abc');

-- ----------------------------
-- Table structure for `cliente`
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `nit` int(14) NOT NULL,
  `dui` int(9) DEFAULT NULL,
  `registro` int(10) DEFAULT NULL,
  `giro` varchar(200) DEFAULT NULL,
  `nombre_j` varchar(250) NOT NULL,
  `nombre_c` varchar(250) NOT NULL,
  `contacto` varchar(200) NOT NULL,
  `telefono_1` int(8) NOT NULL,
  `telefono_2` int(8) DEFAULT NULL,
  `celular` int(8) DEFAULT NULL,
  `fax` int(8) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `tipo` char(2) NOT NULL,
  `categoria` char(2) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `municipio` varchar(20) NOT NULL,
  `departamento` varchar(20) NOT NULL,
  `statu_cred` tinyint(1) NOT NULL,
  `ruta_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`cliente_id`),
  KEY `fk_cliente_ruta1_idx` (`ruta_id`),
  KEY `fk_cliente_status1_idx` (`status_id`),
  CONSTRAINT `fk_cliente_ruta1` FOREIGN KEY (`ruta_id`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cliente
-- ----------------------------
INSERT INTO `cliente` VALUES ('1', '123', '123', '1', 'abc', 'abc', 'abc', 'abc', '123', '123', '12312', '123', 'm@gmail.com', '1', '1', 'abc', 'abc', 'abc', '1', '1', '1');
INSERT INTO `cliente` VALUES ('2', '123', '123', '2', 'abc', 'abc', 'abc', 'abc', '1213', '123', '123', '123', 'm@gmail.com', '2', '2', 'abc', 'abc', 'abc', '2', '2', '2');

-- ----------------------------
-- Table structure for `compra`
-- ----------------------------
DROP TABLE IF EXISTS `compra`;
CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `compra_fecha` date NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_compra_proveedor1_idx` (`proveedor_id`),
  CONSTRAINT `fk_compra_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of compra
-- ----------------------------
INSERT INTO `compra` VALUES ('1', '2014-01-01', '1');
INSERT INTO `compra` VALUES ('2', '2014-01-01', '2');

-- ----------------------------
-- Table structure for `credito`
-- ----------------------------
DROP TABLE IF EXISTS `credito`;
CREATE TABLE `credito` (
  `docto` int(11) NOT NULL,
  `monto` double NOT NULL,
  `fecha` date NOT NULL,
  `fechavence` date NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `docto_id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`docto`),
  KEY `fk_credito_documento1_idx` (`docto_id`),
  KEY `fk_credito_cliente1_idx` (`cliente_id`),
  KEY `fk_credito_pedido1_idx` (`pedido_id`),
  KEY `fk_credito_status1_idx` (`status_id`),
  CONSTRAINT `fk_credito_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_credito_documento1` FOREIGN KEY (`docto_id`) REFERENCES `documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_credito_pedido1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_credito_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of credito
-- ----------------------------
INSERT INTO `credito` VALUES ('1', '12', '2014-01-01', '2014-01-01', '1', '1', '1', '1');
INSERT INTO `credito` VALUES ('2', '12', '2014-01-01', '2014-01-01', '2', '2', '2', '2');

-- ----------------------------
-- Table structure for `detalle_carga_producto`
-- ----------------------------
DROP TABLE IF EXISTS `detalle_carga_producto`;
CREATE TABLE `detalle_carga_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL,
  `codigoprod` int(11) NOT NULL,
  `carga_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_carga_producto_producto1_idx` (`codigoprod`),
  KEY `fk_detalle_carga_producto_carga1_idx` (`carga_id`),
  CONSTRAINT `fk_detalle_carga_producto_producto1` FOREIGN KEY (`codigoprod`) REFERENCES `producto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detalle_carga_producto
-- ----------------------------
INSERT INTO `detalle_carga_producto` VALUES ('1', '12', '1', '1');
INSERT INTO `detalle_carga_producto` VALUES ('2', '12', '2', '2');

-- ----------------------------
-- Table structure for `detalle_compra`
-- ----------------------------
DROP TABLE IF EXISTS `detalle_compra`;
CREATE TABLE `detalle_compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `compra_id` int(11) NOT NULL,
  `codigoprod` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_compra_compra1_idx` (`compra_id`),
  KEY `fk_detalle_compra_producto1_idx` (`codigoprod`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detalle_compra
-- ----------------------------
INSERT INTO `detalle_compra` VALUES ('1', '12', '2014-10-23 23:51:27', '1', '1');
INSERT INTO `detalle_compra` VALUES ('2', '12', '2014-10-23 23:51:27', '2', '2');

-- ----------------------------
-- Table structure for `detalle_pedido`
-- ----------------------------
DROP TABLE IF EXISTS `detalle_pedido`;
CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `codigoprod` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_producto_producto1_idx` (`codigoprod`),
  KEY `fk_pedido_producto_pedido1_idx` (`pedido_id`),
  CONSTRAINT `fk_pedido_producto_pedido1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_producto_producto1` FOREIGN KEY (`codigoprod`) REFERENCES `producto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of detalle_pedido
-- ----------------------------
INSERT INTO `detalle_pedido` VALUES ('1', '12', '1', '1');
INSERT INTO `detalle_pedido` VALUES ('2', '12', '2', '2');
INSERT INTO `detalle_pedido` VALUES ('3', '50', '6060', '3');

-- ----------------------------
-- Table structure for `documento`
-- ----------------------------
DROP TABLE IF EXISTS `documento`;
CREATE TABLE `documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of documento
-- ----------------------------
INSERT INTO `documento` VALUES ('1', 'abc');
INSERT INTO `documento` VALUES ('2', 'abc');

-- ----------------------------
-- Table structure for `empleado`
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dui` int(9) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `telefono` int(8) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `rutaid` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empleado_ruta1_idx` (`rutaid`),
  KEY `fk_empleado_status1_idx` (`status_id`),
  CONSTRAINT `fk_empleado_ruta1` FOREIGN KEY (`rutaid`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES ('1', '123', 'abc', 'abc', 'abc', '2014-01-01', '123', 'abc', '1', '1');
INSERT INTO `empleado` VALUES ('2', '123', 'abc', 'abc', 'abc', '2014-01-01', '123', 'abc', '2', '2');

-- ----------------------------
-- Table structure for `gastos_ruta`
-- ----------------------------
DROP TABLE IF EXISTS `gastos_ruta`;
CREATE TABLE `gastos_ruta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gastos_ruta
-- ----------------------------
INSERT INTO `gastos_ruta` VALUES ('1', '12', 'abc');
INSERT INTO `gastos_ruta` VALUES ('2', '12', 'abc');

-- ----------------------------
-- Table structure for `inventario`
-- ----------------------------
DROP TABLE IF EXISTS `inventario`;
CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `codigoprod` int(11) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `fecha_mov` varchar(45) NOT NULL,
  `tipo_mov` varchar(50) NOT NULL,
  `movimientoid` int(11) NOT NULL,
  `almacenid` int(11) NOT NULL,
  `no_transaccion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inventario_producto1_idx` (`codigoprod`),
  KEY `fk_inventario_Almacen1_idx` (`almacenid`),
  KEY `fk_inventario_tipo_movimiento1_idx` (`movimientoid`),
  CONSTRAINT `fk_inventario_Almacen1` FOREIGN KEY (`almacenid`) REFERENCES `almacen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventario_producto1` FOREIGN KEY (`codigoprod`) REFERENCES `producto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventario_tipo_movimiento1` FOREIGN KEY (`movimientoid`) REFERENCES `tipo_movimiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inventario
-- ----------------------------
INSERT INTO `inventario` VALUES ('1', '1', '100', '2014-1-1', '2', '1', '1', '12');
INSERT INTO `inventario` VALUES ('2', '1', '-25', '2014-1-1', '2', '2', '2', '12');
INSERT INTO `inventario` VALUES ('3', '6060', '200', '2014-11-9', '1', '3', '1', '3');
INSERT INTO `inventario` VALUES ('4', '6060', '-50', '2014-11-09', '2', '4', '1', '3');
INSERT INTO `inventario` VALUES ('5', '6060', '50', '2014-11-09', '6', '4', '2', '3');

-- ----------------------------
-- Table structure for `liquidacion_ruta`
-- ----------------------------
DROP TABLE IF EXISTS `liquidacion_ruta`;
CREATE TABLE `liquidacion_ruta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credito_id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `gastos_ruta_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_liquidacion_ruta_venta1_idx` (`venta_id`),
  KEY `fk_liquidacion_ruta_gastos_ruta1_idx` (`gastos_ruta_id`),
  CONSTRAINT `fk_liquidacion_ruta_venta1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of liquidacion_ruta
-- ----------------------------
INSERT INTO `liquidacion_ruta` VALUES ('1', '1', '1', '1', '2014-01-01 00:00:24');
INSERT INTO `liquidacion_ruta` VALUES ('2', '2', '2', '2', '2014-01-01 00:00:24');

-- ----------------------------
-- Table structure for `marca`
-- ----------------------------
DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of marca
-- ----------------------------
INSERT INTO `marca` VALUES ('1', 'abc');
INSERT INTO `marca` VALUES ('2', 'abc');

-- ----------------------------
-- Table structure for `pedido`
-- ----------------------------
DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_v` timestamp NULL DEFAULT NULL,
  `fecha_p` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `forma_pago` varchar(45) NOT NULL,
  `docto` int(11) NOT NULL,
  `motivo_r` varchar(10) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `docto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_cliente1_idx` (`cliente_id`),
  KEY `fk_pedido_status1_idx` (`status_id`),
  KEY `fk_pedido_documento_venta_compra1_idx` (`docto_id`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_documento_venta_compra1` FOREIGN KEY (`docto_id`) REFERENCES `documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pedido
-- ----------------------------
INSERT INTO `pedido` VALUES ('1', '2014-01-01 00:00:24', '2014-01-01 00:00:24', 'abcab', '1', 'abcab', '1', '1', '1');
INSERT INTO `pedido` VALUES ('2', '2014-01-01 00:00:24', '2014-01-01 00:00:24', 'abc', '2', 'abc', '2', '2', '2');
INSERT INTO `pedido` VALUES ('3', '2014-11-09 04:41:39', '2014-11-09 04:41:41', '1', '1', null, '1', '1', '1');

-- ----------------------------
-- Table structure for `producto`
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `codigo` int(11) NOT NULL,
  `preciov` double NOT NULL,
  `precioc` double NOT NULL,
  `marcaid` int(11) NOT NULL,
  `categoriaid` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `producto_codigo_UNIQUE` (`codigo`),
  KEY `fk_producto_marca_subcategoria1_idx` (`marcaid`),
  KEY `fk_producto_categoria_producto1_idx` (`categoriaid`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`categoriaid`) REFERENCES `categoriap` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_marca` FOREIGN KEY (`marcaid`) REFERENCES `marca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES ('1', '12', '12', '1', '1', '2014-01-01 00:00:24', '');
INSERT INTO `producto` VALUES ('2', '12', '12', '2', '2', '2014-01-01 00:00:24', '');
INSERT INTO `producto` VALUES ('6060', '10', '7', '1', '1', '2014-11-09 04:38:19', 'Descripcion');

-- ----------------------------
-- Table structure for `proveedor`
-- ----------------------------
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nit` int(14) NOT NULL,
  `giro` varchar(200) NOT NULL,
  `registro` int(10) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `contacto` varchar(200) NOT NULL,
  `telefono` int(8) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proveedor
-- ----------------------------
INSERT INTO `proveedor` VALUES ('1', '2323', 'abc', '1', 'abc', 'abc', '2323', 'm@gmail.com', 'abc');
INSERT INTO `proveedor` VALUES ('2', '2323', 'abc', '2', 'abc', 'abc', '3434', 'm@gmail.com', 'abc');

-- ----------------------------
-- Table structure for `ruta`
-- ----------------------------
DROP TABLE IF EXISTS `ruta`;
CREATE TABLE `ruta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_ruta_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';

-- ----------------------------
-- Records of ruta
-- ----------------------------
INSERT INTO `ruta` VALUES ('1', 'abc');
INSERT INTO `ruta` VALUES ('2', 'abc');
INSERT INTO `ruta` VALUES ('3', 'Lourdes');
INSERT INTO `ruta` VALUES ('4', 'San Salvador');

-- ----------------------------
-- Table structure for `status`
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `nombre` char(2) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', 'PE', 'Pendiente');
INSERT INTO `status` VALUES ('2', 'DE', 'Despachado');
INSERT INTO `status` VALUES ('3', 'RE', 'Rechazado');
INSERT INTO `status` VALUES ('4', 'CO', 'Confirmado');

-- ----------------------------
-- Table structure for `tipo_movimiento`
-- ----------------------------
DROP TABLE IF EXISTS `tipo_movimiento`;
CREATE TABLE `tipo_movimiento` (
  `id` int(11) NOT NULL,
  `codigo` char(1) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo_movimiento
-- ----------------------------
INSERT INTO `tipo_movimiento` VALUES ('1', 'I', 'Inventario Inicial');
INSERT INTO `tipo_movimiento` VALUES ('2', 'V', 'Venta');
INSERT INTO `tipo_movimiento` VALUES ('3', 'C', 'Compra');
INSERT INTO `tipo_movimiento` VALUES ('4', 'A', 'Ajuste');
INSERT INTO `tipo_movimiento` VALUES ('5', 'D', 'Devolución');
INSERT INTO `tipo_movimiento` VALUES ('6', 'R', 'Ruta');

-- ----------------------------
-- Table structure for `transporte`
-- ----------------------------
DROP TABLE IF EXISTS `transporte`;
CREATE TABLE `transporte` (
  `placa` varchar(10) NOT NULL,
  `clase` varchar(60) NOT NULL,
  `color` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `capacidad_carga` double NOT NULL,
  `anio` date NOT NULL,
  `propietario` varchar(200) NOT NULL,
  `direccionpropietario` varchar(200) NOT NULL,
  `fechatarjeta` date NOT NULL,
  `ruta_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`placa`),
  UNIQUE KEY `transp_id_UNIQUE` (`placa`),
  KEY `fk_transporte_ruta1_idx` (`ruta_id`),
  KEY `fk_transporte_status1_idx` (`status_id`),
  CONSTRAINT `fk_transporte_ruta1` FOREIGN KEY (`ruta_id`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transporte_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transporte
-- ----------------------------
INSERT INTO `transporte` VALUES ('1', 'a', 'abc', 'abc', 'abc', '1', '2014-01-01', 'abc', 'abc', '2014-01-01', '1', '1');
INSERT INTO `transporte` VALUES ('2', 'b', 'abc', 'abc', 'abc', '2', '2014-01-01', 'abc', 'abcab', '2014-01-01', '2', '2');

-- ----------------------------
-- Table structure for `usuario`
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `tipo_usuario` char(10) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_nombre_UNIQUE` (`nombre`),
  KEY `fk_usuario_cliente1_idx` (`cliente_id`),
  KEY `fk_usuario_empleado1_idx` (`empleado_id`),
  CONSTRAINT `fk_usuario_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_empleado1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'abc', '123', '1', '1', '1');

-- ----------------------------
-- Table structure for `venta`
-- ----------------------------
DROP TABLE IF EXISTS `venta`;
CREATE TABLE `venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `no_doc` varchar(45) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `ruta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_empleado1_idx` (`empleado_id`),
  KEY `fk_venta_ruta1_idx` (`ruta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of venta
-- ----------------------------
INSERT INTO `venta` VALUES ('1', '2014-01-01', '12', '1', '1');
INSERT INTO `venta` VALUES ('2', '2014-01-01', '12', '2', '2');
