-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 22-11-2014 a las 23:26:26
-- Versión del servidor: 5.1.37
-- Versión de PHP: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de datos: `altuve`
--
CREATE DATABASE `altuve` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `altuve`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE IF NOT EXISTS `almacen` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`id`, `descripcion`) VALUES
(1, 'listo para la venta'),
(2, 'En ruta'),
(3, 'avería y vencidos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carga`
--

CREATE TABLE IF NOT EXISTS `carga` (
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
  KEY `fk_carga_transporte1_idx` (`transporte_placa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `carga`
--

INSERT INTO `carga` (`id`, `fecha`, `hora`, `descripcion`, `transporte_placa`, `empleado_id`, `ruta_id`) VALUES
(1, '2014-06-08', '08:55:00', 'Carga va hacia Deposito', 'C-4568', 1, 9011);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriap`
--

CREATE TABLE IF NOT EXISTS `categoriap` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `categoriap`
--

INSERT INTO `categoriap` (`id`, `descripcion`) VALUES
(1, 'Gaseosa'),
(2, 'Cerveza'),
(3, 'Agua'),
(4, 'Jugos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
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
  KEY `fk_status_id` (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `nit`, `dui`, `registro`, `giro`, `nombre_j`, `nombre_c`, `contacto`, `telefono_1`, `telefono_2`, `celular`, `fax`, `correo`, `tipo`, `categoria`, `direccion`, `municipio`, `departamento`, `statu_cred`, `ruta_id`, `status_id`, `usuario_id`) VALUES
(1, '01010509921014', '046897914', 1035, 'Venta de bebidas', 'Ventas libres S.A de C.V.', 'Venta de bebidas', 'Julieta Moffan', 75526542, NULL, NULL, NULL, 'ventas@gmail.com', 'JU', 'C', 'Cantón el Progreso, Lote #23 Frente a escuela ', 'Mizata', 'La Libertad', 0, 9011, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compra_fecha` date NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedorfk_idx` (`proveedor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `compra_fecha`, `proveedor_id`) VALUES
(1, '2014-06-05', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credito`
--

CREATE TABLE IF NOT EXISTS `credito` (
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
  KEY `fk_statusid_idx` (`estado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `credito`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_carga_producto`
--

CREATE TABLE IF NOT EXISTS `detalle_carga_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL,
  `codigoprod` int(11) NOT NULL,
  `carga_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_carga_producto_carga1_idx` (`carga_id`),
  KEY `producto_cod_idx` (`codigoprod`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `detalle_carga_producto`
--

INSERT INTO `detalle_carga_producto` (`id`, `cantidad`, `codigoprod`, `carga_id`) VALUES
(1, 50, 2020, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE IF NOT EXISTS `detalle_compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `compra_id` int(11) NOT NULL,
  `producto_codigo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compraid_idx` (`compra_id`),
  KEY `codprod_idx` (`producto_codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id`, `cantidad`, `fecha`, `compra_id`, `producto_codigo`) VALUES
(1, 100, '2014-05-06 00:00:00', 1, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `codigoprod` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigoproducto_idx` (`codigoprod`),
  KEY `id_pedido_idx` (`pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `cantidad`, `codigoprod`, `pedido_id`) VALUES
(0, 10, 2020, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE IF NOT EXISTS `documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `documento`
--

INSERT INTO `documento` (`id`, `nombre`) VALUES
(1, 'Factura'),
(2, 'Comprobante de crédito fiscal'),
(3, 'Quedan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
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
  KEY `fk_estatus_id_idx` (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `dui`, `nombres`, `apellidos`, `cargo`, `fecha_ingreso`, `telefono`, `direccion`, `rutaid`, `status_id`, `usuario_id`) VALUES
(1, 4689795, 'Miguel Angel', 'Flores Perez', 'vendedor', '2009-01-01', 78985245, 'Urbanizacion Las Flores, Sonsonate.', 9011, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

CREATE TABLE IF NOT EXISTS `estatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `estatus`
--

INSERT INTO `estatus` (`id`, `nombre`, `descripcion`) VALUES
(1, '0', '0'),
(2, 'P', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos_ruta`
--

CREATE TABLE IF NOT EXISTS `gastos_ruta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `gastos_ruta`
--

INSERT INTO `gastos_ruta` (`id`, `valor`, `descripcion`) VALUES
(1, 38.25, 'Combustible'),
(2, 20.3, 'Cambio de llantas'),
(3, 87.65, 'Cambio de aceite motor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE IF NOT EXISTS `inventario` (
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
  KEY `tipo_mov_idx` (`movimientoid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `codigoprod`, `cantidad`, `fecha_mov`, `tipo_mov`, `movimientoid`, `almacenid`, `no_transaccion`) VALUES
(1, 2020, '300', '2014-11-21', 'II', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidacion_ruta`
--

CREATE TABLE IF NOT EXISTS `liquidacion_ruta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credito_id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `gastos_ruta_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_liquidacion_ruta_gastos_ruta1_idx` (`gastos_ruta_id`),
  KEY `fk_creditos_5_idx` (`credito_id`),
  KEY `fk_ventas_id_idx` (`venta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `liquidacion_ruta`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE IF NOT EXISTS `marca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcar la base de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre`) VALUES
(1, 'Coca Cola'),
(2, 'Fanta'),
(3, 'Uva'),
(4, 'Fresa'),
(5, 'Sprite'),
(6, 'Crema Soda'),
(7, 'Pilsener'),
(8, 'Golden'),
(9, 'Regia'),
(10, 'Mandarina'),
(11, 'Naranja'),
(12, 'Oasis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
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
  KEY `fk_estados_id_idx` (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `fecha_v`, `fecha_p`, `forma_pago`, `docto`, `motivo_r`, `status_id`, `cliente_id`, `docto_id`) VALUES
(1, NULL, NULL, 'Contado', 901232, NULL, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
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
  KEY `fk_categoria_idx` (`categoriaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `preciov`, `precioc`, `marcaid`, `categoriaid`, `fecha`, `descripcion`) VALUES
(2020, 5.7, 5, 1, 1, '2015-01-01 00:00:00', '6.5 oz VR 24 U');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `nit`, `giro`, `registro`, `nombre`, `contacto`, `telefono`, `correo`, `direccion`) VALUES
(1, '01010509921018', 'Venta de bebidas', '10325', 'Industrias La Constancia', 'Juan Jose Hoffman', 78956412, 'jofman@hotmail.com', 'Residenciar Altos de Santa Teresa, calle el pedregal, bloc 9 #23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE IF NOT EXISTS `ruta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_ruta_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';

--
-- Volcar la base de datos para la tabla `ruta`
--

INSERT INTO `ruta` (`id`, `nombre`) VALUES
(9011, 'Mizata'),
(9012, 'Terminal'),
(9013, 'Moto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_movimiento`
--

CREATE TABLE IF NOT EXISTS `tipo_movimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` char(1) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcar la base de datos para la tabla `tipo_movimiento`
--

INSERT INTO `tipo_movimiento` (`id`, `codigo`, `descripcion`) VALUES
(1, 'I', 'Inventario Inicial'),
(2, 'V', 'Venta'),
(3, 'C', 'Compra'),
(4, 'A', 'Ajuste'),
(5, 'D', 'Devolucion'),
(6, 'R', 'Ruta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte`
--

CREATE TABLE IF NOT EXISTS `transporte` (
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
  KEY `fk_estatus_id_idx` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `transporte`
--

INSERT INTO `transporte` (`placa`, `clase`, `color`, `marca`, `modelo`, `capacidad_carga`, `capacidad_volumen`, `anio`, `propietario`, `direccionpropietario`, `fechatarjeta`, `ruta_id`, `status_id`) VALUES
('C-4568', 'Paletizado', 'Blanco', 'Mercedes Benz', '1117', 8, '20', '2000-01-01', 'Jorge Altuve', 'Residencial Altos de Santa Eugenia, Block 14 # 54', '2014-10-01', 9011, 1),
('C-8532', 'Paletizado', 'Rojo', 'Mercedes Benz', '1116', 8, '20', '2002-01-01', 'Jorge Altuve', 'Residencial Altos de Santa Eugenia, Block 14 # 54', '2014-10-01', 9012, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `password`, `tipo`) VALUES
(1, 'miguel', '123', 'vendedor'),
(2, 'flor', '123', 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `no_doc` varchar(45) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `ruta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_empleado1_idx` (`empleado_id`),
  KEY `fk_venta_ruta1_idx` (`ruta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `fecha`, `no_doc`, `empleado_id`, `ruta_id`) VALUES
(1, '2014-05-08', '901232', 1, 9011);

--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `carga`
--
ALTER TABLE `carga`
  ADD CONSTRAINT `fk_carga_transporte1` FOREIGN KEY (`transporte_placa`) REFERENCES `transporte` (`placa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_id` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ruta_id` FOREIGN KEY (`ruta_id`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_rutas_5` FOREIGN KEY (`ruta_id`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_status_id` FOREIGN KEY (`status_id`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_prov_id_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `credito`
--
ALTER TABLE `credito`
  ADD CONSTRAINT `fk_cliente_4` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_docto_id` FOREIGN KEY (`docto_id`) REFERENCES `documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_carga_producto`
--
ALTER TABLE `detalle_carga_producto`
  ADD CONSTRAINT `fk_carga_id` FOREIGN KEY (`carga_id`) REFERENCES `carga` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_codprod` FOREIGN KEY (`codigoprod`) REFERENCES `producto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `fk_codpro` FOREIGN KEY (`producto_codigo`) REFERENCES `producto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compra_id` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fk_codprod_1` FOREIGN KEY (`codigoprod`) REFERENCES `producto` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_estatus_id` FOREIGN KEY (`status_id`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rutas_id` FOREIGN KEY (`rutaid`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_almacen_id` FOREIGN KEY (`almacenid`) REFERENCES `almacen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mov_id` FOREIGN KEY (`movimientoid`) REFERENCES `tipo_movimiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `liquidacion_ruta`
--
ALTER TABLE `liquidacion_ruta`
  ADD CONSTRAINT `fk_creditos_5` FOREIGN KEY (`credito_id`) REFERENCES `credito` (`docto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gasto_ruta_id` FOREIGN KEY (`gastos_ruta_id`) REFERENCES `gastos_ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ventas_id` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_documento_id` FOREIGN KEY (`docto_id`) REFERENCES `documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estados_id` FOREIGN KEY (`status_id`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`categoriaid`) REFERENCES `categoriap` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_marca` FOREIGN KEY (`marcaid`) REFERENCES `marca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `transporte`
--
ALTER TABLE `transporte`
  ADD CONSTRAINT `fk_estatus_id_2` FOREIGN KEY (`status_id`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rutas_id_1` FOREIGN KEY (`ruta_id`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_empleado_id_3` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ruta_4` FOREIGN KEY (`ruta_id`) REFERENCES `ruta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
