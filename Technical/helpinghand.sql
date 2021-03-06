-- MySQL Script generated by MySQL Workbench
-- Fri Feb  9 13:20:44 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema helping_hand
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `helping_hand` ;

-- -----------------------------------------------------
-- Schema helping_hand
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `helping_hand` ;
USE `helping_hand` ;

-- -----------------------------------------------------
-- Table `helping_hand`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helping_hand`.`user` ;

CREATE TABLE IF NOT EXISTS `helping_hand`.`user` (
  `user_id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helping_hand`.`parent_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helping_hand`.`parent_account` ;

CREATE TABLE IF NOT EXISTS `helping_hand`.`parent_account` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `account_type` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `email_address` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_parent_account_user_idx` (`user_user_id` ASC),
  CONSTRAINT `fk_parent_account_user`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `helping_hand`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helping_hand`.`parent_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helping_hand`.`parent_address` ;

CREATE TABLE IF NOT EXISTS `helping_hand`.`parent_address` (
  `title` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `address_1` VARCHAR(45) NOT NULL,
  `address_2` VARCHAR(45) NULL,
  `town` VARCHAR(45) NOT NULL,
  `county` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `postcode` VARCHAR(45) NOT NULL,
  `phone` INT NOT NULL,
  `parent_account_user_id` INT NOT NULL,
  PRIMARY KEY (`parent_account_user_id`),
  CONSTRAINT `fk_parent_address_parent_account1`
    FOREIGN KEY (`parent_account_user_id`)
    REFERENCES `helping_hand`.`parent_account` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helping_hand`.`parent_pref`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helping_hand`.`parent_pref` ;

CREATE TABLE IF NOT EXISTS `helping_hand`.`parent_pref` (
  `pref_id` INT NOT NULL,
  `user_user_id` INT NOT NULL,
  `academic_subjects` VARCHAR(45) NOT NULL,
  `languages` VARCHAR(45) NOT NULL,
  `comp_subjects` VARCHAR(45) NOT NULL,
  `sup_subjects` VARCHAR(45) NOT NULL,
  `music_instru` TEXT(180) NOT NULL,
  `level_study` VARCHAR(45) NOT NULL,
  `mode_study` VARCHAR(45) NOT NULL,
  `child_name` TEXT(80) NOT NULL,
  PRIMARY KEY (`pref_id`),
  INDEX `fk_parent_pref_user1_idx` (`user_user_id` ASC),
  CONSTRAINT `fk_parent_pref_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `helping_hand`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helping_hand`.`child_pref`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helping_hand`.`child_pref` ;

CREATE TABLE IF NOT EXISTS `helping_hand`.`child_pref` (
  `child_name` TEXT(60) NOT NULL,
  `child_age` INT NOT NULL,
  `parent_pref_pref_id` INT NOT NULL,
  PRIMARY KEY (`child_name`, `parent_pref_pref_id`),
  INDEX `fk_child_pref_parent_pref1_idx` (`parent_pref_pref_id` ASC),
  CONSTRAINT `fk_child_pref_parent_pref1`
    FOREIGN KEY (`parent_pref_pref_id`)
    REFERENCES `helping_hand`.`parent_pref` (`pref_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
