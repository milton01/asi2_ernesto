CREATE DATABASE  IF NOT EXISTS `altuve` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `altuve`;
-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: altuve
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigoprod` int(11) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `fecha_mov` varchar(45) NOT NULL,
  `tipo_mov` varchar(50) NOT NULL,
  `movimientoid` int(11) NOT NULL,
  `almacenid` int(11) NOT NULL,
  `no_transaccion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_almacen_idx` (`almacenid`),
  KEY `prod_cod_idx` (`codigoprod`),
  KEY `tipo_mov_idx` (`movimientoid`),
  CONSTRAINT `fk_almacen_id` FOREIGN KEY (`almacenid`) REFERENCES `almacen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_codigo_pro` FOREIGN KEY (`codigoprod`) REFERENCES `producto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mov_id` FOREIGN KEY (`movimientoid`) REFERENCES `tipo_movimiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,2020,'300','2014-11-21','II',1,1,1),(2,2020,'10','2014-11-24','2',2,1,1),(3,2020,'-10','2014-11-24','6',6,2,1),(4,2020,'10','2014-11-24','2',2,1,1),(5,2020,'-10','2014-11-24','6',6,2,1);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatus`
--

DROP TABLE IF EXISTS `estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatus`
--

LOCK TABLES `estatus` WRITE;
/*!40000 ALTER TABLE `estatus` DISABLE KEYS */;
INSERT INTO `estatus` VALUES (1,'0','0'),(2,'P','Pendiente');
/*!40000 ALTER TABLE `estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almacen` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,'listo para la venta'),(2,'En ruta'),(3,'avería y vencidos');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos_ruta`
--

DROP TABLE IF EXISTS `gastos_ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gastos_ruta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos_ruta`
--

LOCK TABLES `gastos_ruta` WRITE;
/*!40000 ALTER TABLE `gastos_ruta` DISABLE KEYS */;
INSERT INTO `gastos_ruta` VALUES (1,38.25,'Combustible'),(2,20.3,'Cambio de llantas'),(3,87.65,'Cambio de aceite motor');
/*!40000 ALTER TABLE `gastos_ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credito`
--

DROP TABLE IF EXISTS `credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credito` (
  `docto` int(11) NOT NULL,
  `monto` double NOT NULL,
  `fecha` date NOT NULL,
  `fechavence` date NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `docto_id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  PRIMARY KEY (`docto`),
  KEY `clienteid_idx` (`cliente_id`),
  KEY `documento_idx` (`docto_id`),
  KEY `pedidoid_idx` (`pedido_id`),
  KEY `fk_statusid_idx` (`estado_id`),
  CONSTRAINT `fk_cliente_4` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_docto_id` FOREIGN KEY (`docto_id`) REFERENCES `documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credito`
--

LOCK TABLES `credito` WRITE;
/*!40000 ALTER TABLE `credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Coca Cola'),(2,'Fanta'),(3,'Uva'),(4,'Fresa'),(5,'Sprite'),(6,'Crema Soda'),(7,'Pilsener'),(8,'Golden'),(9,'Regia'),(10,'Mandarina'),(11,'Naranja'),(12,'Oasis');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nit` varchar(14) NOT NULL,
  `giro` varchar(200) NOT NULL,
  `registro` varchar(10) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `contacto` varchar(200) NOT NULL,
  `telefono` int(8) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'01010509921018','Venta de bebidas','10325','Industrias La Constancia','Juan Jose Hoffman',78956412,'jofman@hotmail.com','Residenciar Altos de Santa Teresa, calle el pedregal, bloc 9 #23');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compra_fecha` date NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedorfk_idx` (`proveedor_id`),
  CONSTRAINT `fk_prov_id_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,'2014-06-05',1);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `pedido_realizado`
--

DROP TABLE IF EXISTS `pedido_realizado`;
/*!50001 DROP VIEW IF EXISTS `pedido_realizado`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `pedido_realizado` (
  `id_venta` tinyint NOT NULL,
  `fecha_venta` tinyint NOT NULL,
  `fecha_pedido` tinyint NOT NULL,
  `forma_pago` tinyint NOT NULL,
  `documento` tinyint NOT NULL,
  `giro` tinyint NOT NULL,
  `razon_social` tinyint NOT NULL,
  `nombre_comun` tinyint NOT NULL,
  `representante_empresa` tinyint NOT NULL,
  `nrc` tinyint NOT NULL,
  `nit` tinyint NOT NULL,
  `dui` tinyint NOT NULL,
  `correo` tinyint NOT NULL,
  `tipo` tinyint NOT NULL,
  `categoria` tinyint NOT NULL,
  `municipio` tinyint NOT NULL,
  `departamento` tinyint NOT NULL,
  `ruta_venta` tinyint NOT NULL,
  `codigo_estado_venta` tinyint NOT NULL,
  `estado_venta` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `categoriap`
--

DROP TABLE IF EXISTS `categoriap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoriap` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriap`
--

LOCK TABLES `categoriap` WRITE;
/*!40000 ALTER TABLE `categoriap` DISABLE KEYS */;
INSERT INTO `categoriap` VALUES (1,'Gaseosa'),(2,'Cerveza'),(3,'Agua'),(4,'Jugos');
/*!40000 ALTER TABLE `categoriap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'miguel','123','vendedor'),(2,'flor','123','cliente');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `fk_marca_idx` (`marcaid`),
  KEY `fk_categoria_idx` (`categoriaid`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`categoriaid`) REFERENCES `categoriap` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_marca` FOREIGN KEY (`marcaid`) REFERENCES `marca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (2020,5.7,5,1,1,'2015-01-01 06:00:00','6.5 oz VR 24 U');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporte`
--

DROP TABLE IF EXISTS `transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transporte` (
  `placa` varchar(10) NOT NULL,
  `clase` varchar(60) NOT NULL,
  `color` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `capacidad_carga` double NOT NULL,
  `capacidad_volumen` varchar(45) DEFAULT NULL,
  `anio` date NOT NULL,
  `propietario` varchar(200) NOT NULL,
  `direccionpropietario` varchar(200) NOT NULL,
  `fechatarjeta` date NOT NULL,
  `ruta_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`placa`),
  UNIQUE KEY `transp_id_UNIQUE` (`placa`),
  KEY `fk_ruta_id_idx` (`ruta_id`),
  KEY `fk_estatus_id_idx` (`status_id`),
  CONSTRAINT `fk_estatus_id_2` FOREIGN KEY (`status_id`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rutas_id_1` FOREIGN KEY (`ruta_id`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporte`
--

LOCK TABLES `transporte` WRITE;
/*!40000 ALTER TABLE `transporte` DISABLE KEYS */;
INSERT INTO `transporte` VALUES ('C-4568','Paletizado','Blanco','Mercedes Benz','1117',8,'20','2000-01-01','Jorge Altuve','Residencial Altos de Santa Eugenia, Block 14 # 54','2014-10-01',9011,1),('C-8532','Paletizado','Rojo','Mercedes Benz','1116',8,'20','2002-01-01','Jorge Altuve','Residencial Altos de Santa Eugenia, Block 14 # 54','2014-10-01',9012,1);
/*!40000 ALTER TABLE `transporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `no_doc` varchar(45) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `ruta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_empleado1_idx` (`empleado_id`),
  KEY `fk_venta_ruta1_idx` (`ruta_id`),
  CONSTRAINT `fk_empleado_id_3` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ruta_4` FOREIGN KEY (`ruta_id`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2014-05-08','901232',1,9011);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_v` timestamp NULL DEFAULT NULL,
  `fecha_p` timestamp NULL DEFAULT NULL,
  `forma_pago` varchar(45) NOT NULL,
  `docto` int(11) NOT NULL,
  `motivo_r` varchar(10) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `docto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clienteid_idx` (`cliente_id`),
  KEY `fk_doctoid_idx` (`docto_id`),
  KEY `fk_estados_id_idx` (`status_id`),
  CONSTRAINT `fk_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_documento_id` FOREIGN KEY (`docto_id`) REFERENCES `documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estados_id` FOREIGN KEY (`status_id`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,NULL,NULL,'Contado',901232,NULL,2,1,1),(2,'2014-11-29 06:00:00','2014-11-29 06:00:00','CONTADO',12345,NULL,2,1,1);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carga`
--

DROP TABLE IF EXISTS `carga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `transporte_placa` varchar(10) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `ruta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_carga_empleado1_idx` (`empleado_id`),
  KEY `fk_carga_ruta1_idx` (`ruta_id`),
  KEY `fk_carga_transporte1_idx` (`transporte_placa`),
  CONSTRAINT `fk_carga_transporte1` FOREIGN KEY (`transporte_placa`) REFERENCES `transporte` (`placa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado_id` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ruta_id` FOREIGN KEY (`ruta_id`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carga`
--

LOCK TABLES `carga` WRITE;
/*!40000 ALTER TABLE `carga` DISABLE KEYS */;
INSERT INTO `carga` VALUES (1,'2014-06-08','08:55:00','Carga va hacia Deposito','C-4568',1,9011);
/*!40000 ALTER TABLE `carga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `codigoprod` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigoproducto_idx` (`codigoprod`),
  KEY `id_pedido_idx` (`pedido_id`),
  CONSTRAINT `fk_codprod_1` FOREIGN KEY (`codigoprod`) REFERENCES `producto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (0,10,2020,1);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruta`
--

DROP TABLE IF EXISTS `ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_ruta_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta`
--

LOCK TABLES `ruta` WRITE;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` VALUES (9011,'Mizata'),(9012,'Terminal'),(9013,'Moto');
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_movimiento`
--

DROP TABLE IF EXISTS `tipo_movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_movimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` char(1) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_movimiento`
--

LOCK TABLES `tipo_movimiento` WRITE;
/*!40000 ALTER TABLE `tipo_movimiento` DISABLE KEYS */;
INSERT INTO `tipo_movimiento` VALUES (1,'I','Inventario Inicial'),(2,'V','Venta'),(3,'C','Compra'),(4,'A','Ajuste'),(5,'D','Devolucion'),(6,'R','Ruta');
/*!40000 ALTER TABLE `tipo_movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_carga_producto`
--

DROP TABLE IF EXISTS `detalle_carga_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_carga_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL,
  `codigoprod` int(11) NOT NULL,
  `carga_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_carga_producto_carga1_idx` (`carga_id`),
  KEY `producto_cod_idx` (`codigoprod`),
  CONSTRAINT `fk_carga_id` FOREIGN KEY (`carga_id`) REFERENCES `carga` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_codprod` FOREIGN KEY (`codigoprod`) REFERENCES `producto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_carga_producto`
--

LOCK TABLES `detalle_carga_producto` WRITE;
/*!40000 ALTER TABLE `detalle_carga_producto` DISABLE KEYS */;
INSERT INTO `detalle_carga_producto` VALUES (1,50,2020,1);
/*!40000 ALTER TABLE `detalle_carga_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquidacion_ruta`
--

DROP TABLE IF EXISTS `liquidacion_ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquidacion_ruta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credito_id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `gastos_ruta_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_liquidacion_ruta_gastos_ruta1_idx` (`gastos_ruta_id`),
  KEY `fk_creditos_5_idx` (`credito_id`),
  KEY `fk_ventas_id_idx` (`venta_id`),
  CONSTRAINT `fk_creditos_5` FOREIGN KEY (`credito_id`) REFERENCES `credito` (`docto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gasto_ruta_id` FOREIGN KEY (`gastos_ruta_id`) REFERENCES `gastos_ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_id` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquidacion_ruta`
--

LOCK TABLES `liquidacion_ruta` WRITE;
/*!40000 ALTER TABLE `liquidacion_ruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `liquidacion_ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `compra_id` int(11) NOT NULL,
  `producto_codigo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compraid_idx` (`compra_id`),
  KEY `codprod_idx` (`producto_codigo`),
  CONSTRAINT `fk_codpro` FOREIGN KEY (`producto_codigo`) REFERENCES `producto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_id` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (1,100,'2014-05-06 06:00:00',1,2020);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `nit` varchar(14) NOT NULL,
  `dui` varchar(9) NOT NULL,
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
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`cliente_id`),
  KEY `rutaid_idx` (`ruta_id`),
  KEY `usuarioid_idx` (`usuario_id`),
  KEY `fk_status_id` (`status_id`),
  CONSTRAINT `fk_rutas_5` FOREIGN KEY (`ruta_id`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_id` FOREIGN KEY (`status_id`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'01010509921014','046897914',1035,'Venta de bebidas','Ventas libres S.A de C.V.','Venta de bebidas','Julieta Moffan',75526542,NULL,NULL,NULL,'ventas@gmail.com','JU','C','Cantón el Progreso, Lote #23 Frente a escuela ','Mizata','La Libertad',0,9011,2,2),(2,'01010509921015','046897958',105,'Venta de carnes y embutidos','Pablo Hernandez','Don Pablo','Pablo Hernandez',73871107,0,0,0,'pablito@gmail.com','na','c','Av. A Urbanización Plaza las Colinas.','Ciudad Arce','La Libertad',0,9011,1,1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idruta_idx` (`rutaid`),
  KEY `idusuario_idx` (`usuario_id`),
  KEY `fk_estatus_id_idx` (`status_id`),
  CONSTRAINT `fk_estatus_id` FOREIGN KEY (`status_id`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rutas_id` FOREIGN KEY (`rutaid`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,4689795,'Miguel Angel','Flores Perez','vendedor','2009-01-01',78985245,'Urbanizacion Las Flores, Sonsonate.',9011,1,1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (1,'Factura'),(2,'Comprobante de crédito fiscal'),(3,'Quedan');
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `pedido_realizado`
--
-- LLENADO DE TABLAS, >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
--
use almacen
INSERT INTO `almacen` (`id`, `descripcion`) VALUES
(1, 'listo para la venta'),
(2, 'En ruta'),
(3, 'avería y vencidos');


use carga
INSERT INTO `carga` (`id`, `fecha`, `hora`, `descripcion`, `transporte_placa`, `empleado_id`, `ruta_id`) VALUES
(1, '2014-06-08', '08:55:00', 'Carga va hacia Deposito', 'C-4568', 1, 9011);


use categoriap
INSERT INTO `categoriap` (`id`, `descripcion`) VALUES
(1, 'Gaseosa'),
(2, 'Cerveza'),
(3, 'Agua'),
(4, 'Jugos');


use cliente
INSERT INTO `cliente` (`nit`, `dui`, `registro`, `giro`, `nombre_j`, `nombre_c`, `contacto`, `telefono_1`, `telefono_2`, `celular`, `fax`, `correo`, `tipo`, `categoria`, `direccion`, `municipio`, `departamento`, `statu_cred`, `ruta_id`, `status_id`, `usuario_id`) VALUES
('01010509921014', '046897914', 1035, 'Venta de bebidas', 'Ventas libres S.A de C.V.', 'Venta de bebidas la colmena', 'Julieta Moffan', 75526542, NULL, NULL, NULL, 'ventas@gmail.com', 'JU', 'C', 'Cantón el Progreso, Lote #23 Frente a escuela ', 'Mizata', 'La Libertad', 0, 9011, 1, 2),
('01010509921015', '046897958', 105, 'Venta de carnes y embutidos', 'Pablo Hernandez', 'Don Pablo', 'Pablo Hernandez', 73871107, 0, 0, 0, 'pablito@gmail.com', 'na', 'c', 'Av. A Urbanización Plaza las Colinas.', 'Ciudad Arce', 'La Libertad', 0, 9011, 1, 1),
('05112609831023', '018576952', 5478, 'Distribucion de Bebidas', 'Motursa S.A.', 'Motursa S.A.', 'Miguel Umaña', 22759044, 30687512, 99785562, 12345678, 'revision@gmail.com', '', '', 'urbanizacion brisas de tuscania', 'Zaragoza', 'La Libertad', 0, 9012, 1, 0);

use compra
INSERT INTO `compra` (`compra_fecha`, `proveedor_id`) VALUES
('2014-06-05', 1),
('2014-07-05', 2),
('2014-07-05', 3),
('2014-08-05', 1);

use detalle_carga_producto
INSERT INTO `detalle_carga_producto` (`cantidad`, `codigoprod`, `carga_id`) VALUES
(50, 2020, 1),
(50, 2020, 1),
(50, 2020, 1);


use detalle_compra
INSERT INTO `detalle_compra` (`cantidad`, `fecha`, `compra_id`, `producto_codigo`) VALUES
(100, '2014-05-06 06:00:00', 1, 2020),
(80, '2014-05-07 06:00:00', 1, 2021),
(90, '2014-05-08 06:00:00', 1, 2025);


use detalle_pedido
INSERT INTO `detalle_pedido` (`cantidad`, `codigoprod`, `pedido_id`) VALUES
(10, 2020, 1),
(2, 2020, 3),
(3, 2025, 3),
(14, 2025, 4),
(3, 2025, 5),
(7, 2025, 6),
(12, 2025, 7),
(12, 2025, 8),
(8, 2020, 8),
(17, 2020, 2),
(12, 2020, 2),
(1, 2021, 2);


use documento
INSERT INTO `documento` (`nombre`) VALUES
('Factura'),
('Comprobante de crédito fiscal'),
('Quedan');

user empleado
INSERT INTO `empleado` (`dui`, `nombres`, `apellidos`, `cargo`, `fecha_ingreso`, `telefono`, `direccion`, `rutaid`, `status_id`, `usuario_id`) VALUES
(4689795, 'Miguel Angel', 'Flores Perez', 'vendedor', '2009-01-01', 78985245, 'Urbanizacion Las Flores, Sonsonate.', 9011, 1, 1);
(4689795, 'Carlos Angel', 'Sanchez Perez', 'vendedor', '2009-01-01', 78985245, 'Urbanizacion Las Flores, Sonsonate.', 9011, 1, 2);
(4689795, 'JUlio Angel', 'Juarez Perez', 'vendedor', '2009-01-01', 78985245, 'Urbanizacion Las Flores, Sonsonate.', 9011, 1, 3);


use estatus
INSERT INTO `estatus` (`nombre`, `descripcion`) VALUES
('P', 'Pendiente'),
('ND', 'No Despachado'),
('D', 'Despachado'),
('R', 'Rechazado'),
('V', 'Vendido'),
('DV', 'Devolucion');


use gastos_ruta
INSERT INTO `gastos_ruta` (`id`, `valor`, `descripcion`) VALUES
(1, 38.25, 'Combustible'),
(2, 20.3, 'Cambio de llantas'),
(3, 87.65, 'Cambio de aceite motor');

use inventario
INSERT INTO `inventario` (`codigoprod`, `cantidad`, `fecha_mov`, `tipo_mov`, `movimientoid`, `almacenid`, `no_transaccion`) VALUES
(2020, '300', '2014-11-21', 'II', 1, 1, 1),
(2020, '10', '2014-11-24', '2', 2, 1, 1),
(2020, '-10', '2014-11-24', '6', 6, 2, 1),
(2020, '10', '2014-11-24', '2', 2, 1, 1),
(2020, '-10', '2014-11-24', '6', 6, 2, 1),
(2022, '300', '2014-11-29', 'II', 1, 1, 1),
(2025, '400', '2014-11-29', 'II', 1, 1, 1),
(1010, '500', '2014-11-29', 'II', 1, 1, 1),
(2020, '10', '2014-12-01', '2', 2, 1, 1),
(2020, '-10', '2014-12-01', '6', 6, 2, 1);

use marca
INSERT INTO `marca` (`nombre`) VALUES
('Coca Cola'),
('Fanta'),
('Uva'),
('Fresa'),
('Sprite'),
('Crema Soda'),
('Pilsener'),
('Golden'),
('Regia'),
('Mandarina'),
('Naranja'),
('Oasis');

use pedido
INSERT INTO `pedido` (`fecha_v`, `fecha_p`, `forma_pago`, `docto`, `motivo_r`, `status_id`, `cliente_id`, `docto_id`) VALUES
('2014-11-11 00:00:00', '2014-11-04 00:00:00', 'Contado', 901232, NULL, 4, 1, 1),
('2014-11-29 06:00:00', '2014-11-29 06:00:00', 'contado', 12345, NULL, 1, 1, 1),
('2014-11-04 00:00:00', '2014-11-05 00:00:00', 'contado', 12, '', 3, 2, 2),
('2014-11-10 00:00:00', '2014-11-11 00:00:00', 'contado', 13, '', 1, 2, 2),
('2014-11-10 00:00:00', '2014-11-11 00:00:00', 'contado', 13, NULL, 1, 10, 3),
('2014-11-11 00:00:00', '2014-11-11 00:00:00', 'contado', 14, NULL, 3, 10, 2),
('2014-11-17 00:00:00', '2014-11-18 00:00:00', 'contado', 14, NULL, 1, 2, 3),
('2014-11-17 00:00:00', '2014-11-18 00:00:00', 'contado', 14, NULL, 2, 2, 3);


use producto
INSERT INTO `producto` (`codigo`, `preciov`, `precioc`, `marcaid`, `categoriaid`, `fecha`, `descripcion`, `capacidad`) VALUES
(2020, 5.7, 5, 1, 1, '2014-12-01 05:32:35', '6.5 oz VR 24 U', 0.15),
(2022, 6.5, 5, 1, 1, '2014-12-01 05:02:47', '16OnzVR', 0.25),
(2025, 7.5, 6, 7, 2, '2014-12-01 05:02:47', 'Lite VR12Oz', 0.3),
(1010, 4, 2.5, 12, 3, '2014-12-01 05:04:22', '24unidades', 0.45);


use proveedor
INSERT INTO `proveedor` (`nit`, `giro`, `registro`, `nombre`, `contacto`, `telefono`, `correo`, `direccion`) VALUES
('01010509921018', 'Venta de bebidas', '10325', 'Industrias La Constancia', 'Sandra Carla Gutierrez', 78956413, 'sandra@hotmail.com', 'Residenciar Bajos de Santa Teresa, calle el pedregal, bloc 9 #23'),
('01010509921018', 'Venta de bebidas', '10325', 'Industrias La Constancia', 'Juan Jose Hoffman', 78956412, 'jofman@hotmail.com', 'Residenciar Altos de Santa Teresa, calle el pedregal, bloc 9 #23');


use ruta
INSERT INTO `ruta` (`nombre`) VALUES
(9011, 'Mizata'),
(9012, 'Terminal'),
(9013, 'Moto');


use tipo_movimiento
INSERT INTO `tipo_movimiento` (`codigo`, `descripcion`) VALUES
('I', 'Inventario Inicial'),
('V', 'Venta'),
('C', 'Compra'),
('A', 'Ajuste'),
('D', 'Devolucion'),
('R', 'Ruta');

user transporte
INSERT INTO `transporte` (`placa`, `clase`, `color`, `marca`, `modelo`, `capacidad_carga`, `capacidad_volumen`, `anio`, `propietario`, `direccionpropietario`, `fechatarjeta`, `ruta_id`, `status_id`) VALUES
('C-4568', 'Paletizado', 'Blanco', 'Mercedes Benz', '1117', 8, '50', '2000-01-01', 'Jorge Altuve', 'Residencial Altos de Santa Eugenia, Block 14 # 54', '2014-10-01', 9011, 1),
('C-8532', 'Paletizado', 'Rojo', 'Mercedes Benz', '1116', 8, '45', '2002-01-01', 'Jorge Altuve', 'Residencial Altos de Santa Eugenia, Block 14 # 54', '2014-10-01', 9012, 1);


use usuario
INSERT INTO `usuario` (`id`, `nombre`, `password`, `tipo`) VALUES
(1, 'miguel', '123', 'vendedor'),
(2, 'flor', '123', 'cliente'),
(3, 'admin', '25d55ad283aa400af464c76d713c07ad', 'administrador');


use ventas
INSERT INTO `venta` (`fecha`, `no_doc`, `empleado_id`, `ruta_id`) VALUES
('2014-05-08', '901232', 1, 9011),
('2014-05-08', '901232', 2, 9012);

