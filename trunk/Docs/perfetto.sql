SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `perfetto` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `perfetto` ;

-- -----------------------------------------------------
-- Table `perfetto`.`banner`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`banner` (
  `id_banner` INT NOT NULL AUTO_INCREMENT ,
  `image_path` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id_banner`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfetto`.`personal_trainers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`personal_trainers` (
  `id_personal_trainers` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  `area` VARCHAR(45) NOT NULL ,
  `image_path` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id_personal_trainers`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfetto`.`alunos_destaque`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`alunos_destaque` (
  `id_alunos_destaque` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  `image_path` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id_alunos_destaque`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfetto`.`adimin`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`adimin` (
  `id_adimin` INT NOT NULL AUTO_INCREMENT ,
  `login` VARCHAR(45) NOT NULL ,
  `senha` VARCHAR(45) NOT NULL ,
  `nome` VARCHAR(100) NOT NULL ,
  `sobrenome` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id_adimin`) ,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfetto`.`home_modalidades`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`home_modalidades` (
  `id_home_modalidade` INT NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(45) NOT NULL ,
  `link` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_home_modalidade`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfetto`.`home_videos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`home_videos` (
  `id_home_video` INT NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(45) NOT NULL ,
  `descricao` VARCHAR(45) NOT NULL ,
  `url_video` VARCHAR(255) NOT NULL ,
  `url_thumb_image` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id_home_video`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfetto`.`modalidade`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`modalidade` (
  `id_modalidade` INT NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(45) NOT NULL ,
  `descricao` VARCHAR(255) NOT NULL ,
  `path_image` VARCHAR(255) NOT NULL ,
  `ordem` INT NOT NULL ,
  PRIMARY KEY (`id_modalidade`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfetto`.`horario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`horario` (
  `id_horario` INT NOT NULL AUTO_INCREMENT ,
  `hora` VARCHAR(45) NOT NULL ,
  `periodo` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_horario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfetto`.`dia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`dia` (
  `id_dia` INT NOT NULL AUTO_INCREMENT ,
  `descricao` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_dia`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfetto`.`horario_dia_semana`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`horario_dia_semana` (
  `id_horario_dia_semana` INT NOT NULL AUTO_INCREMENT ,
  `id_dia` INT NOT NULL ,
  `id_horario` INT NOT NULL ,
  `id_modalidade` INT NOT NULL ,
  `ordem` INT NOT NULL ,
  PRIMARY KEY (`id_horario_dia_semana`) ,
  INDEX `id_dia` (`id_dia` ASC) ,
  INDEX `id_horario` (`id_horario` ASC) ,
  INDEX `id_modalidade` (`id_modalidade` ASC) ,
  CONSTRAINT `id_dia`
    FOREIGN KEY (`id_dia` )
    REFERENCES `perfetto`.`dia` (`id_dia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_horario`
    FOREIGN KEY (`id_horario` )
    REFERENCES `perfetto`.`horario` (`id_horario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_modalidade`
    FOREIGN KEY (`id_modalidade` )
    REFERENCES `perfetto`.`modalidade` (`id_modalidade` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfetto`.`categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT ,
  `descricao` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_categoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfetto`.`video`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`video` (
  `id_video` INT NOT NULL AUTO_INCREMENT ,
  `id_categoria` INT NOT NULL ,
  `titulo` VARCHAR(45) NOT NULL ,
  `descricao` VARCHAR(45) NOT NULL ,
  `url_video` VARCHAR(255) NOT NULL ,
  `url_thumb_image` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id_video`) ,
  INDEX `id_categoria` (`id_categoria` ASC) ,
  CONSTRAINT `id_categoria`
    FOREIGN KEY (`id_categoria` )
    REFERENCES `perfetto`.`categoria` (`id_categoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfetto`.`album`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`album` (
  `id_album` INT NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(45) NOT NULL ,
  `descricao` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id_album`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfetto`.`foto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`foto` (
  `id_foto` INT NOT NULL AUTO_INCREMENT ,
  `id_album` INT NOT NULL ,
  `descricao` VARCHAR(255) NOT NULL ,
  `path_image` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id_foto`) ,
  INDEX `id_album` (`id_album` ASC) ,
  CONSTRAINT `id_album`
    FOREIGN KEY (`id_album` )
    REFERENCES `perfetto`.`album` (`id_album` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
