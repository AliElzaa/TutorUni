-- MySQL Script generated by MySQL Workbench
-- Mon Feb 12 15:16:38 2018
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
  `academic_sub` VARCHAR(45) NOT NULL,
  `languages` VARCHAR(45) NOT NULL,
  `comp_sub` VARCHAR(45) NOT NULL,
  `support_sub` VARCHAR(45) NOT NULL,
  `musical_inst` TEXT(100) NOT NULL,
  `level_study` VARCHAR(45) NOT NULL,
  `mode_study` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pref_id`, `academic_sub`, `languages`, `comp_sub`, `support_sub`, `musical_inst`, `level_study`, `mode_study`),
  INDEX `fk_parent_pref_user1_idx` (`user_user_id` ASC),
  CONSTRAINT `fk_parent_pref_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `helping_hand`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helping_hand`.`child_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helping_hand`.`child_info` ;

CREATE TABLE IF NOT EXISTS `helping_hand`.`child_info` (
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `user_user_id` INT NOT NULL,
  INDEX `fk_child_info_user1_idx` (`user_user_id` ASC),
  CONSTRAINT `fk_child_info_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `helping_hand`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `helping_hand`.`student_pref`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `helping_hand`.`student_pref` ;

CREATE TABLE IF NOT EXISTS `helping_hand`.`student_pref` (
  `stud_id` VARCHAR(45) NOT NULL,
  `academic_sub` VARCHAR(45) NOT NULL,
  `languages` VARCHAR(45) NOT NULL,
  `comp_sub` VARCHAR(45) NOT NULL,
  `support_sub` VARCHAR(45) NOT NULL,
  `musical_inst` TEXT(100) NOT NULL,
  `level_study` VARCHAR(45) NOT NULL,
  `mode_study` VARCHAR(45) NOT NULL,
  `travel_dist` VARCHAR(45) NOT NULL,
  `parent_pref_pref_id` INT NOT NULL,
  INDEX `fk_student_pref_parent_pref1_idx` (`parent_pref_pref_id` ASC, `academic_sub` ASC, `languages` ASC, `comp_sub` ASC, `support_sub` ASC, `musical_inst` ASC, `level_study` ASC, `mode_study` ASC),
  PRIMARY KEY (`stud_id`),
  CONSTRAINT `fk_student_pref_parent_pref1`
    FOREIGN KEY (`parent_pref_pref_id` , `academic_sub` , `languages` , `comp_sub` , `support_sub` , `musical_inst` , `level_study` , `mode_study`)
    REFERENCES `helping_hand`.`parent_pref` (`pref_id` , `academic_sub` , `languages` , `comp_sub` , `support_sub` , `musical_inst` , `level_study` , `mode_study`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
