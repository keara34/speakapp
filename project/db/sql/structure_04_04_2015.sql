-- MySQL Script generated by MySQL Workbench
-- 04/04/15 18:15:21
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema speakapp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `speakapp` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `speakapp` ;

-- -----------------------------------------------------
-- Table `speakapp`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `speakapp`.`location` ;

CREATE TABLE IF NOT EXISTS `speakapp`.`location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `zipcode` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `speakapp`.`gender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `speakapp`.`gender` ;

CREATE TABLE IF NOT EXISTS `speakapp`.`gender` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `speakapp`.`profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `speakapp`.`profile` ;

CREATE TABLE IF NOT EXISTS `speakapp`.`profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `birthday` DATETIME NULL,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `interests` TEXT NULL,
  `description` LONGTEXT NULL,
  `hometownLocation` INT NULL,
  `currentLocation` INT NULL,
  `pictureURL` VARCHAR(255) NULL,
  `pictureSmallURL` VARCHAR(255) NULL,
  `pictureBigURL` VARCHAR(255) NULL,
  `profileGender` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `hometownLocation_idx` (`hometownLocation` ASC),
  INDEX `currentLocation_idx` (`currentLocation` ASC),
  INDEX `profile_gender_fk_idx` (`profileGender` ASC),
  CONSTRAINT `hometownLocation_fk`
    FOREIGN KEY (`hometownLocation`)
    REFERENCES `speakapp`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `currentLocation_fk`
    FOREIGN KEY (`currentLocation`)
    REFERENCES `speakapp`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `profile_gender_fk`
    FOREIGN KEY (`profileGender`)
    REFERENCES `speakapp`.`gender` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `speakapp`.`language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `speakapp`.`language` ;

CREATE TABLE IF NOT EXISTS `speakapp`.`language` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `code` VARCHAR(5) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `speakapp`.`profile_language_spoken`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `speakapp`.`profile_language_spoken` ;

CREATE TABLE IF NOT EXISTS `speakapp`.`profile_language_spoken` (
  `profile_id` INT NOT NULL,
  `language_id` INT NOT NULL,
  INDEX `id_language_fk_idx` (`language_id` ASC),
  CONSTRAINT `id_profile_language_spoken_fk`
    FOREIGN KEY (`profile_id`)
    REFERENCES `speakapp`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_language_language_spoken_fk`
    FOREIGN KEY (`language_id`)
    REFERENCES `speakapp`.`language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `speakapp`.`discussion_method`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `speakapp`.`discussion_method` ;

CREATE TABLE IF NOT EXISTS `speakapp`.`discussion_method` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `methodName` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `speakapp`.`discussion_method_profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `speakapp`.`discussion_method_profile` ;

CREATE TABLE IF NOT EXISTS `speakapp`.`discussion_method_profile` (
  `id` INT NOT NULL,
  `profileId` INT NOT NULL,
  PRIMARY KEY (`id`, `profileId`),
  INDEX `id_profile_fk_idx` (`profileId` ASC),
  CONSTRAINT `id_profile_discussion_method_fk`
    FOREIGN KEY (`profileId`)
    REFERENCES `speakapp`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_discussion_method_fk`
    FOREIGN KEY (`id`)
    REFERENCES `speakapp`.`discussion_method` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `speakapp`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `speakapp`.`status` ;

CREATE TABLE IF NOT EXISTS `speakapp`.`status` (
  `code` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `speakapp`.`relationship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `speakapp`.`relationship` ;

CREATE TABLE IF NOT EXISTS `speakapp`.`relationship` (
  `profile_one_id` INT NOT NULL,
  `profile_two_id` INT NOT NULL,
  `status` INT NOT NULL,
  `action_user_id` INT NOT NULL,
  PRIMARY KEY (`profile_one_id`, `profile_two_id`),
  INDEX `profile_two_id_fk_idx` (`profile_two_id` ASC),
  INDEX `action_user_id_fk_idx` (`action_user_id` ASC),
  INDEX `status_id_fk_idx` (`status` ASC),
  CONSTRAINT `profile_one_id_fk`
    FOREIGN KEY (`profile_one_id`)
    REFERENCES `speakapp`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `profile_two_id_fk`
    FOREIGN KEY (`profile_two_id`)
    REFERENCES `speakapp`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `action_user_id_fk`
    FOREIGN KEY (`action_user_id`)
    REFERENCES `speakapp`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `status_id_fk`
    FOREIGN KEY (`status`)
    REFERENCES `speakapp`.`status` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `speakapp`.`profile_language_to_learn`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `speakapp`.`profile_language_to_learn` ;

CREATE TABLE IF NOT EXISTS `speakapp`.`profile_language_to_learn` (
  `profile_id` INT NOT NULL,
  `language_id` INT NOT NULL,
  INDEX `id_language_fk_idx` (`language_id` ASC),
  CONSTRAINT `id_profile_language_to_learn_fk`
    FOREIGN KEY (`profile_id`)
    REFERENCES `speakapp`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_language_language_to_learn_fk`
    FOREIGN KEY (`language_id`)
    REFERENCES `speakapp`.`language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `speakapp`.`chat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `speakapp`.`chat` ;

CREATE TABLE IF NOT EXISTS `speakapp`.`chat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `profile_id` INT NOT NULL,
  `message` TEXT NOT NULL,
  `sent_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `id_profile_fk_idx` (`profile_id` ASC),
  CONSTRAINT `id_profile_chat_fk`
    FOREIGN KEY (`profile_id`)
    REFERENCES `speakapp`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;