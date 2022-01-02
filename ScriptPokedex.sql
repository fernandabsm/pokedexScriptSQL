-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pokedexTest
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pokedexTestginasio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pokedexTest` DEFAULT CHARACTER SET utf8 ;

CREATE USER 'tpBD' IDENTIFIED BY '123';

GRANT ALL ON *.* TO 'tpBD' WITH GRANT OPTION;

USE `pokedexTest` ;

CREATE TABLE IF NOT EXISTS `pokedexTest`.`Treinador` (
  `cpf` VARCHAR(20) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(100) NOT NULL,
  `ranking` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokedexTest`.`Pokemon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokedexTest`.`Pokemon` (
  `idPokemon` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `pontos_combate` VARCHAR(45) NOT NULL,
  `local_captura` VARCHAR(50) NOT NULL,
  `data_captura` VARCHAR(10) NOT NULL,
  `evolucao` VARCHAR(45),
  `Treinador_cpf` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idPokemon`, `Treinador_cpf`),
  INDEX `fk_Pokemon_Treinador_idx` (`Treinador_cpf` ASC) VISIBLE,
  CONSTRAINT `captura`
    FOREIGN KEY (`Treinador_cpf`)
    REFERENCES `pokedexTest`.`Treinador` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokedexTest`.`Ginasio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokedexTest`.`Ginasio` (
  `endereco` VARCHAR(100) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`endereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokedexTest`.`Treinador_batalha_Ginasio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokedexTest`.`Treinador_batalha_Ginasio` (
  `Treinador_cpf` VARCHAR(20) NOT NULL,
  `Ginasio_endereco` VARCHAR(100) NOT NULL,
  `adversario` VARCHAR(50) NOT NULL,
  `status` VARCHAR(25),
  `vencedor` VARCHAR(50),
  PRIMARY KEY (`Treinador_cpf`, `Ginasio_endereco`),
  INDEX `fk_Treinador_has_Ginasio_Ginasio1_idx` (`Ginasio_endereco` ASC) VISIBLE,
  INDEX `fk_Treinador_has_Ginasio_Treinador1_idx` (`Treinador_cpf` ASC) VISIBLE,
  CONSTRAINT `batalha_em`
    FOREIGN KEY (`Treinador_cpf`)
    REFERENCES `pokedexTest`.`Treinador` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `contem_batalha`
    FOREIGN KEY (`Ginasio_endereco`)
    REFERENCES `pokedexTest`.`Ginasio` (`endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `pokedexTest`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokedexTest`.`Login` (
  `email` VARCHAR(40) NOT NULL,
  `senha` VARCHAR(15) NOT NULL,
  `Treinador_cpf` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Treinador_cpf`),
  CONSTRAINT `fk_Login_Treinador1`
    FOREIGN KEY (`Treinador_cpf`)
    REFERENCES `pokedexTest`.`Treinador` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
