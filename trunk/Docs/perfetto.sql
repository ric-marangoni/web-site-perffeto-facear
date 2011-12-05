CREATE DATABASE IF NOT EXISTS `perfetto` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
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
CREATE  TABLE IF NOT EXISTS `perfetto`.`admin` (
  `id_admin` INT NOT NULL AUTO_INCREMENT ,
  `login` VARCHAR(45) NOT NULL ,
  `senha` VARCHAR(45) NOT NULL ,
  `nome` VARCHAR(100) NOT NULL ,
  `sobrenome` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id_admin`) ,
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
-- Table `perfetto`.`periodo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`periodo` (
  `id_periodo` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_periodo`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `perfetto`.`horario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfetto`.`horarios` (
  `id_horario` INT NOT NULL AUTO_INCREMENT ,
  `id_periodo` int NOT NULL ,
  `horario` VARCHAR(45) NOT NULL ,
  `segunda` VARCHAR(45) ,
  `terca` VARCHAR(45) ,
  `quarta` VARCHAR(45) ,
  `quinta` VARCHAR(45) ,
  `sexta` VARCHAR(45) ,
  `sabado` VARCHAR(45) ,
  PRIMARY KEY (`id_horario`),
  FOREIGN KEY (`id_periodo`) REFERENCES `periodo`(`id_periodo`)
)
ENGINE = InnoDB;

INSERT INTO periodo SET descricao = "manha";
INSERT INTO periodo SET descricao = "tarde";
INSERT INTO periodo SET descricao = "noite";

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