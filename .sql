-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LojadeTortas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LojadeTortas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LojadeTortas` DEFAULT CHARACTER SET utf8 ;
USE `LojadeTortas` ;

-- -----------------------------------------------------
-- Table `LojadeTortas`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojadeTortas`.`Clientes` (
  `IDCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Sobrenome` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojadeTortas`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojadeTortas`.`Login` (
  `IDCliente` INT NOT NULL,
  `UltimoAcesso` VARCHAR(45) NULL,
  `StatusLogin` TINYINT NULL,
  PRIMARY KEY (`IDCliente`),
  CONSTRAINT `FK_Login_Cliente`
    FOREIGN KEY (`IDCliente`)
    REFERENCES `LojadeTortas`.`Clientes` (`IDCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojadeTortas`.`Bebidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojadeTortas`.`Bebidas` (
  `IDBebidas` INT NOT NULL AUTO_INCREMENT,
  `NomeBebida` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(45) NULL,
  `Preco` VARCHAR(45) NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `UrlBebida` VARCHAR(45) NOT NULL,
  `Disponibilidade` TINYINT NOT NULL,
  PRIMARY KEY (`IDBebidas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojadeTortas`.`Tortas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojadeTortas`.`Tortas` (
  `IDTortas` INT NOT NULL AUTO_INCREMENT,
  `NomeTorta` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(45) NULL,
  `Preco` VARCHAR(45) NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `UrlTorta` VARCHAR(45) NOT NULL,
  `Disponibilidade` TINYINT NOT NULL,
  PRIMARY KEY (`IDTortas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojadeTortas`.`Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojadeTortas`.`Pedidos` (
  `IDPedido` INT NOT NULL AUTO_INCREMENT,
  `IDCliente` INT NOT NULL,
  `DateHora` DATE NULL,
  `StatusPedido` VARCHAR(45) NULL,
  `TotalPedido` VARCHAR(45) NULL,
  PRIMARY KEY (`IDPedido`),
  INDEX `IDCliente_idx` (`IDCliente` ASC) VISIBLE,
  CONSTRAINT `FK_Pedidos_Cliente`
    FOREIGN KEY (`IDCliente`)
    REFERENCES `LojadeTortas`.`Clientes` (`IDCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojadeTortas`.`ItensDoPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojadeTortas`.`ItensDoPedido` (
  `IDItensDoPedido` INT NOT NULL AUTO_INCREMENT,
  `IDPedido` INT NOT NULL,
  `IDTorta` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  `PrecoUnitario` VARCHAR(45) NOT NULL,
  `Subtotal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDItensDoPedido`),
  INDEX `IDPedido_idx` (`IDPedido` ASC) VISIBLE,
  INDEX `IDTorta_idx` (`IDTorta` ASC) VISIBLE,
  CONSTRAINT `FK_ItensDoPedido_Pedidos`
    FOREIGN KEY (`IDPedido`)
    REFERENCES `LojadeTortas`.`Pedidos` (`IDPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ItensDoPedido_Tortas`
    FOREIGN KEY (`IDTorta`)
    REFERENCES `LojadeTortas`.`Tortas` (`IDTortas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LojadeTortas`.`BebidasDoPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LojadeTortas`.`BebidasDoPedido` (
  `IDBebidasDoPedido` INT NOT NULL AUTO_INCREMENT,
  `IDPedido` INT NOT NULL,
  `IDBebida` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  `Preco` VARCHAR(45) NOT NULL,
  `Subtotal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDBebidasDoPedido`),
  INDEX `IDPedido_idx` (`IDPedido` ASC) VISIBLE,
  INDEX `IDBebida_idx` (`IDBebida` ASC) VISIBLE,
  CONSTRAINT `FK_BebidasDoPedido_Pedidos`
    FOREIGN KEY (`IDPedido`)
    REFERENCES `LojadeTortas`.`Pedidos` (`IDPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_BebidasDoPedido_Bebidas`
    FOREIGN KEY (`IDBebida`)
    REFERENCES `LojadeTortas`.`Bebidas` (`IDBebidas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
