-- MySQL Script generated by MySQL Workbench
-- Thu Oct 29 23:21:34 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_convivir
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db_convivir` ;

-- -----------------------------------------------------
-- Schema db_convivir
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_convivir` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `db_convivir` ;

-- -----------------------------------------------------
-- Table `db_convivir`.`abono`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_convivir`.`abono` ;

CREATE TABLE IF NOT EXISTS `db_convivir`.`abono` (
  `id_cuota` INT NOT NULL,
  `id_abono` INT NOT NULL,
  `fecha_abono` DATE NULL DEFAULT NULL,
  `monto_abono` FLOAT NULL DEFAULT NULL,
  `validado` INT NULL DEFAULT NULL,
  `tipo_abono` INT NULL DEFAULT NULL,
  `foto_comprobante` BLOB NULL DEFAULT NULL,
  PRIMARY KEY (`id_abono`),
  CONSTRAINT `abono_ibfk_1`
    FOREIGN KEY (`id_cuota`)
    REFERENCES `db_convivir`.`cuota` (`id_cuota`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `R_20` ON `db_convivir`.`abono` (`id_cuota` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `db_convivir`.`administrador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_convivir`.`administrador` ;

CREATE TABLE IF NOT EXISTS `db_convivir`.`administrador` (
  `id_usuario` INT NOT NULL,
  `id_uinmobiliaria` INT NOT NULL,
  `estado` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`, `id_uinmobiliaria`),
  CONSTRAINT `administrador_ibfk_1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `db_convivir`.`usuariosistema` (`id_usuario`),
  CONSTRAINT `administrador_ibfk_2`
    FOREIGN KEY (`id_uinmobiliaria`)
    REFERENCES `db_convivir`.`unidadinmobiliaria` (`id_uinmobiliaria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `R_17` ON `db_convivir`.`administrador` (`id_uinmobiliaria` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `db_convivir`.`concepto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_convivir`.`concepto` ;

CREATE TABLE IF NOT EXISTS `db_convivir`.`concepto` (
  `id_concepto` INT NOT NULL,
  `nombre_corto` VARCHAR(20) NULL DEFAULT NULL,
  `nombre_largo` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id_concepto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_convivir`.`cuota`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_convivir`.`cuota` ;

CREATE TABLE IF NOT EXISTS `db_convivir`.`cuota` (
  `id_cuota` INT NOT NULL,
  `titulo` VARCHAR(100) NULL DEFAULT NULL,
  `anio` INT NULL DEFAULT NULL,
  `mes` INT NULL DEFAULT NULL,
  `fecha_emision` DATE NULL DEFAULT NULL,
  `fecha_vencimiento` DATE NULL DEFAULT NULL,
  `id_uprivada` INT NOT NULL,
  `num_cuota` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_cuota`),
  CONSTRAINT `cuota_ibfk_1`
    FOREIGN KEY (`id_uprivada`)
    REFERENCES `db_convivir`.`unidadprivada` (`id_uprivada`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `R_14` ON `db_convivir`.`cuota` (`id_uprivada` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `db_convivir`.`detalle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_convivir`.`detalle` ;

CREATE TABLE IF NOT EXISTS `db_convivir`.`detalle` (
  `id_cuota` INT NOT NULL,
  `id_concepto` INT NOT NULL,
  `monto` FLOAT NULL DEFAULT NULL,
  CONSTRAINT `detalle_ibfk_1`
    FOREIGN KEY (`id_cuota`)
    REFERENCES `db_convivir`.`cuota` (`id_cuota`),
  CONSTRAINT `detalle_ibfk_2`
    FOREIGN KEY (`id_concepto`)
    REFERENCES `db_convivir`.`concepto` (`id_concepto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `R_13` ON `db_convivir`.`detalle` (`id_cuota` ASC) VISIBLE;

CREATE INDEX `R_15` ON `db_convivir`.`detalle` (`id_concepto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `db_convivir`.`persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_convivir`.`persona` ;

CREATE TABLE IF NOT EXISTS `db_convivir`.`persona` (
  `id_persona` INT NOT NULL,
  `tipo_documento` INT NULL DEFAULT NULL,
  `num_documento` VARCHAR(11) NULL DEFAULT NULL,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `primer_apellido` VARCHAR(100) NULL DEFAULT NULL,
  `segundo_apellido` VARCHAR(100) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_persona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_convivir`.`persona_up`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_convivir`.`persona_up` ;

CREATE TABLE IF NOT EXISTS `db_convivir`.`persona_up` (
  `id_uprivada` INT NOT NULL,
  `id_persona` INT NOT NULL,
  `id_tipo_relacion` INT NOT NULL,
  PRIMARY KEY (`id_uprivada`, `id_persona`, `id_tipo_relacion`),
  CONSTRAINT `persona_up_ibfk_1`
    FOREIGN KEY (`id_uprivada`)
    REFERENCES `db_convivir`.`unidadprivada` (`id_uprivada`),
  CONSTRAINT `persona_up_ibfk_2`
    FOREIGN KEY (`id_persona`)
    REFERENCES `db_convivir`.`persona` (`id_persona`),
  CONSTRAINT `persona_up_ibfk_3`
    FOREIGN KEY (`id_tipo_relacion`)
    REFERENCES `db_convivir`.`tiporelacion` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `R_18` ON `db_convivir`.`persona_up` (`id_persona` ASC) VISIBLE;

CREATE INDEX `R_23` ON `db_convivir`.`persona_up` (`id_tipo_relacion` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `db_convivir`.`tiporelacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_convivir`.`tiporelacion` ;

CREATE TABLE IF NOT EXISTS `db_convivir`.`tiporelacion` (
  `id` INT NOT NULL,
  `descripcion` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_convivir`.`unidadinmobiliaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_convivir`.`unidadinmobiliaria` ;

CREATE TABLE IF NOT EXISTS `db_convivir`.`unidadinmobiliaria` (
  `id_uinmobiliaria` INT NOT NULL,
  `nombre_corto` VARCHAR(50) NULL DEFAULT NULL,
  `nombre_largo` VARCHAR(200) NULL DEFAULT NULL,
  `des_direccion` VARCHAR(200) NULL DEFAULT NULL,
  `ubigeo` VARCHAR(20) NULL DEFAULT NULL,
  `latitud_map` VARCHAR(100) NULL DEFAULT NULL,
  `logitud_map` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_uinmobiliaria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_convivir`.`unidadprivada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_convivir`.`unidadprivada` ;

CREATE TABLE IF NOT EXISTS `db_convivir`.`unidadprivada` (
  `id_uprivada` INT NOT NULL,
  `tipo_unidad` INT NULL DEFAULT NULL,
  `numeracion` VARCHAR(20) NULL DEFAULT NULL,
  `zona` VARCHAR(20) NULL DEFAULT NULL,
  `id_uinmobiliaria` INT NOT NULL,
  PRIMARY KEY (`id_uprivada`),
  CONSTRAINT `unidadprivada_ibfk_1`
    FOREIGN KEY (`id_uinmobiliaria`)
    REFERENCES `db_convivir`.`unidadinmobiliaria` (`id_uinmobiliaria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `R_8` ON `db_convivir`.`unidadprivada` (`id_uinmobiliaria` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `db_convivir`.`usuariosistema`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_convivir`.`usuariosistema` ;

CREATE TABLE IF NOT EXISTS `db_convivir`.`usuariosistema` (
  `id_usuario` INT NOT NULL,
  `username` VARCHAR(20) NULL DEFAULT NULL,
  `password` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `id_persona` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `usuariosistema_ibfk_1`
    FOREIGN KEY (`id_persona`)
    REFERENCES `db_convivir`.`persona` (`id_persona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `R_7` ON `db_convivir`.`usuariosistema` (`id_persona` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
