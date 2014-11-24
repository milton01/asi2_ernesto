SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

SHOW WARNINGS;
DROP SCHEMA IF EXISTS `altuve` ;
CREATE SCHEMA IF NOT EXISTS `altuve` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
SHOW WARNINGS;
USE `altuve` ;

-- -----------------------------------------------------
-- Table `almacen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `almacen` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `almacen` (
  `id` INT(11) NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ruta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ruta` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `ruta` (
  `id` INT(11) NOT NULL ,
  `nombre` VARCHAR(60) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '	';

SHOW WARNINGS;
CREATE UNIQUE INDEX `id_ruta_UNIQUE` ON `ruta` (`id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `status` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `status` (
  `id` INT(11) NOT NULL ,
  `nombre` CHAR(2) NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `transporte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `transporte` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `transporte` (
  `placa` VARCHAR(10) NOT NULL ,
  `clase` VARCHAR(60) NOT NULL ,
  `color` VARCHAR(45) NOT NULL ,
  `marca` VARCHAR(45) NOT NULL ,
  `modelo` VARCHAR(45) NOT NULL ,
  `capacidad_carga` DOUBLE NOT NULL ,
  `anio` DATE NOT NULL ,
  `propietario` VARCHAR(200) NOT NULL ,
  `direccionpropietario` VARCHAR(200) NOT NULL ,
  `fechatarjeta` DATE NOT NULL ,
  `ruta_id` INT(11) NOT NULL ,
  `status_id` INT(11) NOT NULL ,
  PRIMARY KEY (`placa`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;
CREATE UNIQUE INDEX `transp_id_UNIQUE` ON `transporte` (`placa` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `carga`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carga` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `carga` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `fecha` DATE NOT NULL ,
  `hora` TIME NOT NULL ,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL ,
  `transporte_placa` VARCHAR(10) NOT NULL ,
  `empleado_id` INT(11) NOT NULL ,
  `ruta_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;
CREATE INDEX `fk_carga_empleado1_idx` ON `carga` (`empleado_id` ASC) ;

SHOW WARNINGS;
CREATE INDEX `fk_carga_ruta1_idx` ON `carga` (`ruta_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `categoriap`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `categoriap` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `categoriap` (
  `id` INT(11) NOT NULL ,
  `descripcion` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuario` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `usuario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `tipo` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;
CREATE UNIQUE INDEX `usuario_nombre_UNIQUE` ON `usuario` (`nombre` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cliente` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `cliente` (
  `cliente_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nit` INT(14) NOT NULL ,
  `dui` INT(9) NULL DEFAULT NULL ,
  `registro` INT(10) NULL DEFAULT NULL ,
  `giro` VARCHAR(200) NULL DEFAULT NULL ,
  `nombre_j` VARCHAR(250) NOT NULL ,
  `nombre_c` VARCHAR(250) NOT NULL ,
  `contacto` VARCHAR(200) NOT NULL ,
  `telefono_1` INT(8) NOT NULL ,
  `telefono_2` INT(8) NULL DEFAULT NULL ,
  `celular` INT(8) NULL DEFAULT NULL ,
  `fax` INT(8) NULL DEFAULT NULL ,
  `correo` VARCHAR(200) NULL DEFAULT NULL ,
  `tipo` CHAR(2) NOT NULL ,
  `categoria` CHAR(2) NOT NULL ,
  `direccion` VARCHAR(250) NOT NULL ,
  `municipio` VARCHAR(20) NOT NULL ,
  `departamento` VARCHAR(20) NOT NULL ,
  `statu_cred` TINYINT(1) NOT NULL ,
  `ruta_id` INT(11) NOT NULL ,
  `status_id` INT(11) NOT NULL ,
  `usuario_id` INT(11) NOT NULL ,
  PRIMARY KEY (`cliente_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `proveedor` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `proveedor` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nit` INT(14) NOT NULL ,
  `giro` VARCHAR(200) NOT NULL ,
  `registro` INT(10) NOT NULL ,
  `nombre` VARCHAR(250) NOT NULL ,
  `contacto` VARCHAR(200) NOT NULL ,
  `telefono` INT(8) NOT NULL ,
  `correo` VARCHAR(100) NULL DEFAULT NULL ,
  `direccion` VARCHAR(250) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `compra` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `compra` (
  `id` INT(11) NOT NULL ,
  `compra_fecha` DATE NOT NULL ,
  `proveedor_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `documento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `documento` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `documento` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pedido` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `pedido` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `fecha_v` TIMESTAMP NULL DEFAULT NULL,
  `fecha_p` TIMESTAMP NUll DEFAULT NULL,
  `forma_pago` VARCHAR(45) NOT NULL ,
  `docto` INT(11) NOT NULL ,
  `motivo_r` VARCHAR(10) NULL DEFAULT NULL ,
  `status_id` INT(11) NOT NULL ,
  `cliente_id` INT(11) NOT NULL ,
  `docto_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `credito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `credito` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `credito` (
  `docto` INT(11) NOT NULL ,
  `monto` DOUBLE NOT NULL ,
  `fecha` DATE NOT NULL ,
  `fechavence` DATE NOT NULL ,
  `cliente_id` INT(11) NOT NULL ,
  `docto_id` INT(11) NOT NULL ,
  `pedido_id` INT(11) NOT NULL ,
  `status_id` INT(11) NOT NULL ,
  PRIMARY KEY (`docto`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marca` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `marca` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `producto` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `producto` (
  `codigo` INT(11) NOT NULL ,
  `preciov` DOUBLE NOT NULL ,
  `precioc` DOUBLE NOT NULL ,
  `marcaid` INT(11) NOT NULL ,
  `categoriaid` INT(11) NOT NULL ,
  `fecha` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `descripcion` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`codigo`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;
CREATE UNIQUE INDEX `producto_codigo_UNIQUE` ON `producto` (`codigo` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `detalle_carga_producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detalle_carga_producto` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `detalle_carga_producto` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `cantidad` DOUBLE NOT NULL ,
  `codigoprod` INT(11) NOT NULL ,
  `carga_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;
CREATE INDEX `fk_detalle_carga_producto_carga1_idx` ON `detalle_carga_producto` (`carga_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `detalle_compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detalle_compra` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `detalle_compra` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `cantidad` DOUBLE NOT NULL ,
  `fecha` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `compra_id1` INT(11) NOT NULL ,
  `producto_codigo` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `detalle_pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detalle_pedido` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `detalle_pedido` (
  `id` INT(11) NOT NULL ,
  `cantidad` INT(11) NOT NULL ,
  `codigoprod` INT(11) NOT NULL ,
  `pedido_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `empleado` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `empleado` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `dui` INT(9) NOT NULL ,
  `nombres` VARCHAR(200) NOT NULL ,
  `apellidos` VARCHAR(200) NOT NULL ,
  `cargo` VARCHAR(100) NOT NULL ,
  `fecha_ingreso` DATE NOT NULL ,
  `telefono` INT(8) NOT NULL ,
  `direccion` VARCHAR(250) NOT NULL ,
  `rutaid` INT(11) NOT NULL ,
  `status_id` INT(11) NOT NULL ,
  `usuario_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `gastos_ruta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gastos_ruta` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `gastos_ruta` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `valor` DOUBLE NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tipo_movimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipo_movimiento` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `tipo_movimiento` (
  `id` INT(11) NOT NULL ,
  `codigo` CHAR(1) NOT NULL ,
  `descripcion` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `inventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventario` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `inventario` (
  `id` INT(11) NOT NULL ,
  `codigoprod` INT(11) NOT NULL ,
  `cantidad` VARCHAR(45) NOT NULL ,
  `fecha_mov` VARCHAR(45) NOT NULL ,
  `tipo_mov` VARCHAR(50) NOT NULL ,
  `movimientoid` INT(11) NOT NULL ,
  `almacenid` INT(11) NOT NULL ,
  `no_transaccion` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `venta` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `venta` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `fecha` DATE NOT NULL ,
  `no_doc` VARCHAR(45) NOT NULL ,
  `empleado_id` INT(11) NOT NULL ,
  `ruta_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;
CREATE INDEX `fk_venta_empleado1_idx` ON `venta` (`empleado_id` ASC) ;

SHOW WARNINGS;
CREATE INDEX `fk_venta_ruta1_idx` ON `venta` (`ruta_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `liquidacion_ruta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `liquidacion_ruta` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `liquidacion_ruta` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `credito_id` INT(11) NOT NULL ,
  `venta_id` INT(11) NOT NULL ,
  `gastos_ruta_id` INT(11) NOT NULL ,
  `fecha` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;
CREATE INDEX `fk_liquidacion_ruta_gastos_ruta1_idx` ON `liquidacion_ruta` (`gastos_ruta_id` ASC) ;

SHOW WARNINGS;
USE `altuve` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
