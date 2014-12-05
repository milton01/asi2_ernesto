-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 05-12-2014 a las 00:10:12
-- Versión del servidor: 5.6.20-log
-- Versión de PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `altuve`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE IF NOT EXISTS `almacen` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `almacen`
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
`id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `transporte_placa` varchar(10) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `ruta_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `carga`
--

INSERT INTO `carga` (`id`, `fecha`, `hora`, `descripcion`, `transporte_placa`, `empleado_id`, `ruta_id`) VALUES
(1, '2014-06-08', '08:55:00', 'Carga va hacia Deposito', 'C-4568', 1, 9011);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriap`
--

CREATE TABLE IF NOT EXISTS `categoriap` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoriap`
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
`cliente_id` int(11) NOT NULL,
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
  `usuario_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `nit`, `dui`, `registro`, `giro`, `nombre_j`, `nombre_c`, `contacto`, `telefono_1`, `telefono_2`, `celular`, `fax`, `correo`, `tipo`, `categoria`, `direccion`, `municipio`, `departamento`, `statu_cred`, `ruta_id`, `status_id`, `usuario_id`) VALUES
(1, '01010509921014', '046897914', 1035, 'Venta de bebidas', 'Ventas libres S.A de C.V.', 'Venta de bebidas la colmena', 'Julieta Moffan', 75526542, NULL, NULL, NULL, 'ventas@gmail.com', 'JU', 'C', 'Cantón el Progreso, Lote #23 Frente a escuela ', 'Mizata', 'La Libertad', 0, 9011, 1, 2),
(2, '01010509921015', '046897958', 105, 'Venta de carnes y embutidos', 'Pablo Hernandez', 'Don Pablo', 'Pablo Hernandez', 73871107, 0, 0, 0, 'pablito@gmail.com', 'na', 'c', 'Av. A Urbanización Plaza las Colinas.', 'Ciudad Arce', 'La Libertad', 0, 9011, 1, 1),
(10, '05112609831023', '018576952', 5478, 'Distribucion de Bebidas', 'Motursa S.A.', 'Motursa S.A.', 'Miguel Umaña', 22759044, 30687512, 99785562, 12345678, 'revision@gmail.com', '', '', 'urbanizacion brisas de tuscania', 'Zaragoza', 'La Libertad', 0, 9012, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
`id` int(11) NOT NULL,
  `compra_fecha` date NOT NULL,
  `proveedor_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `compra`
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
  `estado_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_carga_producto`
--

CREATE TABLE IF NOT EXISTS `detalle_carga_producto` (
`id` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `codigoprod` int(11) NOT NULL,
  `carga_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `detalle_carga_producto`
--

INSERT INTO `detalle_carga_producto` (`id`, `cantidad`, `codigoprod`, `carga_id`) VALUES
(1, 50, 2020, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE IF NOT EXISTS `detalle_compra` (
`id` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `compra_id` int(11) NOT NULL,
  `producto_codigo` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id`, `cantidad`, `fecha`, `compra_id`, `producto_codigo`) VALUES
(1, 100, '2014-05-06 06:00:00', 1, 2020);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE IF NOT EXISTS `detalle_pedido` (
`id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `codigoprod` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `cantidad`, `codigoprod`, `pedido_id`) VALUES
(1, 10, 2020, 1),
(2, 2, 2020, 3),
(3, 3, 2025, 3),
(4, 14, 2025, 4),
(5, 3, 2025, 5),
(6, 7, 2025, 6),
(7, 12, 2025, 7),
(8, 12, 2025, 8),
(9, 8, 2020, 8),
(10, 17, 2020, 2),
(11, 12, 2020, 2),
(12, 1, 2021, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE IF NOT EXISTS `documento` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `documento`
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
`id` int(11) NOT NULL,
  `dui` int(9) NOT NULL,
  `nombres` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `telefono` int(8) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `rutaid` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `dui`, `nombres`, `apellidos`, `cargo`, `fecha_ingreso`, `telefono`, `direccion`, `rutaid`, `status_id`, `usuario_id`) VALUES
(1, 4689795, 'Miguel Angel', 'Flores Perez', 'vendedor', '2009-01-01', 78985245, 'Urbanizacion Las Flores, Sonsonate.', 9011, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

CREATE TABLE IF NOT EXISTS `estatus` (
`id` int(11) NOT NULL,
  `nombre` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `estatus`
--

INSERT INTO `estatus` (`id`, `nombre`, `descripcion`) VALUES
(1, 'P', 'Pendiente'),
(2, 'ND', 'No Despachado'),
(3, 'D', 'Despachado'),
(4, 'R', 'Rechazado'),
(5, 'V', 'Vendido'),
(6, 'DV', 'Devolucion'),
(7, 'C', 'Confirmado'),
(8, 'TD', 'Transporte Disponible'),
(9, 'TR', 'Transporte en Ruta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos_ruta`
--

CREATE TABLE IF NOT EXISTS `gastos_ruta` (
`id` int(11) NOT NULL,
  `valor` double NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `gastos_ruta`
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
`id` int(11) NOT NULL,
  `codigoprod` int(11) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `fecha_mov` varchar(45) NOT NULL,
  `tipo_mov` varchar(50) NOT NULL,
  `movimientoid` int(11) NOT NULL,
  `almacenid` int(11) NOT NULL,
  `no_transaccion` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `codigoprod`, `cantidad`, `fecha_mov`, `tipo_mov`, `movimientoid`, `almacenid`, `no_transaccion`) VALUES
(1, 2020, '300', '2014-11-21', 'II', 1, 1, 1),
(2, 2020, '10', '2014-11-24', '2', 2, 1, 1),
(3, 2020, '-10', '2014-11-24', '6', 6, 2, 1),
(4, 2020, '10', '2014-11-24', '2', 2, 1, 1),
(5, 2020, '-10', '2014-11-24', '6', 6, 2, 1),
(6, 2022, '300', '2014-11-29', 'II', 1, 1, 1),
(7, 2025, '400', '2014-11-29', 'II', 1, 1, 1),
(8, 1010, '500', '2014-11-29', 'II', 1, 1, 1),
(9, 2020, '10', '2014-12-01', '2', 2, 1, 1),
(10, 2020, '-10', '2014-12-01', '6', 6, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidacion_ruta`
--

CREATE TABLE IF NOT EXISTS `liquidacion_ruta` (
`id` int(11) NOT NULL,
  `credito_id` int(11) NOT NULL,
  `venta_id` int(11) NOT NULL,
  `gastos_ruta_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE IF NOT EXISTS `marca` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `marca`
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
`id` int(11) NOT NULL,
  `fecha_v` timestamp NULL DEFAULT NULL,
  `fecha_p` timestamp NULL DEFAULT NULL,
  `forma_pago` varchar(45) NOT NULL,
  `docto` int(11) NOT NULL,
  `motivo_r` varchar(10) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `docto_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `fecha_v`, `fecha_p`, `forma_pago`, `docto`, `motivo_r`, `status_id`, `cliente_id`, `docto_id`) VALUES
(1, '2014-11-11 00:00:00', '2014-11-04 00:00:00', 'Contado', 901232, NULL, 4, 1, 1),
(2, '2014-11-29 06:00:00', '2014-11-29 06:00:00', 'CONTADO', 12345, NULL, 1, 1, 1),
(3, '2014-11-04 00:00:00', '2014-11-05 00:00:00', 'contado', 12, '', 3, 2, 2),
(4, '2014-11-10 00:00:00', '2014-11-11 00:00:00', 'contado', 13, '', 1, 2, 2),
(5, '2014-11-10 00:00:00', '2014-11-11 00:00:00', 'contado', 13, NULL, 1, 10, 3),
(6, '2014-11-11 00:00:00', '2014-11-11 00:00:00', 'contado', 14, NULL, 3, 10, 2),
(7, '2014-11-17 00:00:00', '2014-11-18 00:00:00', 'contado', 14, NULL, 1, 2, 3),
(8, '2014-11-17 00:00:00', '2014-11-18 00:00:00', 'contado', 14, NULL, 7, 2, 3);

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
  `capacidad` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `preciov`, `precioc`, `marcaid`, `categoriaid`, `fecha`, `descripcion`, `capacidad`) VALUES
(2020, 5.7, 5, 1, 1, '2014-12-01 05:32:35', '6.5 oz VR 24 U', 0.15),
(2022, 6.5, 5, 1, 1, '2014-12-01 05:02:47', '16OnzVR', 0.25),
(2025, 7.5, 6, 7, 2, '2014-12-01 05:02:47', 'Lite VR12Oz', 0.3),
(1010, 4, 2.5, 12, 3, '2014-12-01 05:04:22', '24unidades', 0.45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
`id` int(11) NOT NULL,
  `nit` varchar(14) NOT NULL,
  `giro` varchar(200) NOT NULL,
  `registro` varchar(10) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `contacto` varchar(200) NOT NULL,
  `telefono` int(8) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(250) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `nit`, `giro`, `registro`, `nombre`, `contacto`, `telefono`, `correo`, `direccion`) VALUES
(1, '01010509921018', 'Venta de bebidas', '10325', 'Industrias La Constancia', 'Juan Jose Hoffman', 78956412, 'jofman@hotmail.com', 'Residenciar Altos de Santa Teresa, calle el pedregal, bloc 9 #23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE IF NOT EXISTS `ruta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='	';

--
-- Volcado de datos para la tabla `ruta`
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
`id` int(11) NOT NULL,
  `codigo` char(1) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tipo_movimiento`
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
  `status_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `transporte`
--

INSERT INTO `transporte` (`placa`, `clase`, `color`, `marca`, `modelo`, `capacidad_carga`, `capacidad_volumen`, `anio`, `propietario`, `direccionpropietario`, `fechatarjeta`, `ruta_id`, `status_id`) VALUES
('C-4568', 'Paletizado', 'Blanco', 'Mercedes Benz', '1117', 8, '50', '2000-01-01', 'Jorge Altuve', 'Residencial Altos de Santa Eugenia, Block 14 # 54', '2014-10-01', 9011, 8),
('C-8532', 'Paletizado', 'Rojo', 'Mercedes Benz', '1116', 8, '45', '2002-01-01', 'Jorge Altuve', 'Residencial Altos de Santa Eugenia, Block 14 # 54', '2014-10-01', 9012, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
`id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `password`, `tipo`) VALUES
(1, 'miguel', '123', 'vendedor'),
(2, 'flor', '123', 'cliente'),
(3, 'admin', '25d55ad283aa400af464c76d713c07ad', 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
`id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `no_doc` varchar(45) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `ruta_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `fecha`, `no_doc`, `empleado_id`, `ruta_id`) VALUES
(1, '2014-05-08', '901232', 1, 9011);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carga`
--
ALTER TABLE `carga`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_carga_empleado1_idx` (`empleado_id`), ADD KEY `fk_carga_ruta1_idx` (`ruta_id`), ADD KEY `fk_carga_transporte1_idx` (`transporte_placa`);

--
-- Indices de la tabla `categoriap`
--
ALTER TABLE `categoriap`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`cliente_id`), ADD KEY `rutaid_idx` (`ruta_id`), ADD KEY `usuarioid_idx` (`usuario_id`), ADD KEY `fk_status_id` (`status_id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
 ADD PRIMARY KEY (`id`), ADD KEY `proveedorfk_idx` (`proveedor_id`);

--
-- Indices de la tabla `credito`
--
ALTER TABLE `credito`
 ADD PRIMARY KEY (`docto`), ADD KEY `clienteid_idx` (`cliente_id`), ADD KEY `documento_idx` (`docto_id`), ADD KEY `pedidoid_idx` (`pedido_id`), ADD KEY `fk_statusid_idx` (`estado_id`);

--
-- Indices de la tabla `detalle_carga_producto`
--
ALTER TABLE `detalle_carga_producto`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_detalle_carga_producto_carga1_idx` (`carga_id`), ADD KEY `producto_cod_idx` (`codigoprod`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
 ADD PRIMARY KEY (`id`), ADD KEY `compraid_idx` (`compra_id`), ADD KEY `codprod_idx` (`producto_codigo`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
 ADD PRIMARY KEY (`id`), ADD KEY `codigoproducto_idx` (`codigoprod`), ADD KEY `id_pedido_idx` (`pedido_id`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
 ADD PRIMARY KEY (`id`), ADD KEY `idruta_idx` (`rutaid`), ADD KEY `idusuario_idx` (`usuario_id`), ADD KEY `fk_estatus_id_idx` (`status_id`);

--
-- Indices de la tabla `estatus`
--
ALTER TABLE `estatus`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gastos_ruta`
--
ALTER TABLE `gastos_ruta`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
 ADD PRIMARY KEY (`id`), ADD KEY `id_almacen_idx` (`almacenid`), ADD KEY `prod_cod_idx` (`codigoprod`), ADD KEY `tipo_mov_idx` (`movimientoid`);

--
-- Indices de la tabla `liquidacion_ruta`
--
ALTER TABLE `liquidacion_ruta`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_liquidacion_ruta_gastos_ruta1_idx` (`gastos_ruta_id`), ADD KEY `fk_creditos_5_idx` (`credito_id`), ADD KEY `fk_ventas_id_idx` (`venta_id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_clienteid_idx` (`cliente_id`), ADD KEY `fk_doctoid_idx` (`docto_id`), ADD KEY `fk_estados_id_idx` (`status_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
 ADD PRIMARY KEY (`codigo`), ADD UNIQUE KEY `producto_codigo_UNIQUE` (`codigo`), ADD KEY `fk_marca_idx` (`marcaid`), ADD KEY `fk_categoria_idx` (`categoriaid`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_ruta_UNIQUE` (`id`);

--
-- Indices de la tabla `tipo_movimiento`
--
ALTER TABLE `tipo_movimiento`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transporte`
--
ALTER TABLE `transporte`
 ADD PRIMARY KEY (`placa`), ADD UNIQUE KEY `transp_id_UNIQUE` (`placa`), ADD KEY `fk_ruta_id_idx` (`ruta_id`), ADD KEY `fk_estatus_id_idx` (`status_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `usuario_nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_venta_empleado1_idx` (`empleado_id`), ADD KEY `fk_venta_ruta1_idx` (`ruta_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carga`
--
ALTER TABLE `carga`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `detalle_carga_producto`
--
ALTER TABLE `detalle_carga_producto`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `estatus`
--
ALTER TABLE `estatus`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `gastos_ruta`
--
ALTER TABLE `gastos_ruta`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `liquidacion_ruta`
--
ALTER TABLE `liquidacion_ruta`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipo_movimiento`
--
ALTER TABLE `tipo_movimiento`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
