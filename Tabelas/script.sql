-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Endereço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereço` (
  `idEndereço` INT NOT NULL AUTO_INCREMENT,
  `CEP` CHAR(9) NULL,
  `Cidade` VARCHAR(45) NULL,
  `Estado` VARCHAR(45) NULL,
  `numero` CHAR(5) NULL,
  PRIMARY KEY (`idEndereço`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empresa` (
  `idEmpresa` INT NOT NULL AUTO_INCREMENT,
  `razaoSocial` VARCHAR(45) NOT NULL,
  `nomeFantasia` VARCHAR(45) NULL,
  `representante` VARCHAR(45) NULL,
  `CNPJ` CHAR(18) NOT NULL,
  `email` VARCHAR(45) NULL,
  `TamanhoDataCenter` INT NOT NULL,
  `Usuario` CHAR(20) NOT NULL,
  `senha` CHAR(12) NULL,
  `fkEndereco` INT NOT NULL,
  PRIMARY KEY (`idEmpresa`),
  INDEX `fk_Empresa_Endereço1_idx` (`fkEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_Empresa_Endereço1`
    FOREIGN KEY (`fkEndereco`)
    REFERENCES `mydb`.`Endereço` (`idEndereço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`datacenter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`datacenter` (
  `idDatacenter` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `TamanhoDataCenter` INT NULL,
  `Endereço_idEndereço` INT NOT NULL,
  `Empresa_idEmpresa` INT NOT NULL,
  PRIMARY KEY (`idDatacenter`),
  INDEX `fk_datacenter_Endereço1_idx` (`Endereço_idEndereço` ASC) VISIBLE,
  INDEX `fk_datacenter_Empresa1_idx` (`Empresa_idEmpresa` ASC) VISIBLE,
  CONSTRAINT `fk_datacenter_Endereço1`
    FOREIGN KEY (`Endereço_idEndereço`)
    REFERENCES `mydb`.`Endereço` (`idEndereço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_datacenter_Empresa1`
    FOREIGN KEY (`Empresa_idEmpresa`)
    REFERENCES `mydb`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Parametros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Parametros` (
  `idParametros` INT NOT NULL,
  `tempMin` FLOAT NULL,
  `tempMax` FLOAT NULL,
  `umidMin` FLOAT NULL,
  `umidMax` FLOAT NULL,
  PRIMARY KEY (`idParametros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sensor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sensor` (
  `idSensor` INT NOT NULL,
  `fkParametros` INT NOT NULL,
  `LocInstal` VARCHAR(45) NOT NULL,
  `StatusSensor` VARCHAR(45) NOT NULL,
  `dtInstal` DATE NOT NULL,
  `dtUltManut` DATE NULL,
  `fkDC` INT NOT NULL,
  PRIMARY KEY (`idSensor`, `fkParametros`),
  INDEX `fk_Sensor_datacenter1_idx` (`fkDC` ASC) VISIBLE,
  INDEX `fk_Sensor_Parametros1_idx` (`fkParametros` ASC) VISIBLE,
  CONSTRAINT `fk_Sensor_datacenter1`
    FOREIGN KEY (`fkDC`)
    REFERENCES `mydb`.`datacenter` (`idDatacenter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sensor_Parametros1`
    FOREIGN KEY (`fkParametros`)
    REFERENCES `mydb`.`Parametros` (`idParametros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Leitura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Leitura` (
  `idLeitura` INT NOT NULL,
  `fkSensor` INT NOT NULL,
  `dataHora` DATETIME NULL,
  `leituraTemp` FLOAT NULL,
  `leituraUmid` FLOAT NULL,
  PRIMARY KEY (`idLeitura`, `fkSensor`),
  INDEX `fk_Leitura_Sensor1_idx` (`fkSensor` ASC) VISIBLE,
  CONSTRAINT `fk_Leitura_Sensor1`
    FOREIGN KEY (`fkSensor`)
    REFERENCES `mydb`.`Sensor` (`idSensor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
