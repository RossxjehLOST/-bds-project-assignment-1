-- -----------------------------------------------------
-- Schema Schema MySQL-databse-scheme-Zacek-and-Matas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas` DEFAULT CHARACTER SET latin1 ;
USE `MySQL-database-scheme-Zacek-and-Matas` ;

-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`type_of_computer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`type_of_computer` (
  `id_type_of_computer` INT(11) NOT NULL AUTO_INCREMENT,
  `type_of_device` VARCHAR(45) NOT NULL,
  `is_selection_valid` TINYINT(1) NOT NULL,
  `accesories` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_type_of_computer`),
  UNIQUE INDEX `id_type_of_computer_UNIQUE` (`id_type_of_computer` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`accesories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`accesories` (
  `id_accesories` INT(11) NOT NULL AUTO_INCREMENT,
  `type_of_accesories` VARCHAR(45) NOT NULL,
  `is_selection_valid` TINYINT(1) NOT NULL,
  `fk_id_accesorries` INT(11) NOT NULL,
  PRIMARY KEY (`id_accesories`),
  UNIQUE INDEX `id_accesories_UNIQUE` (`id_accesories` ASC),
  INDEX `fk_id_accesories_idx` (`fk_id_accesorries` ASC),
  CONSTRAINT `fk_id_accesories`
    FOREIGN KEY (`fk_id_accesorries`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`type_of_computer` (`id_type_of_computer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`address` (
  `id_address` INT(11) NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `home_number` VARCHAR(45) NOT NULL,
  `optional_information` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_address`),
  UNIQUE INDEX `id_address_UNIQUE` (`id_address` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`person` (
  `id_person` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surename` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `bio` VARCHAR(45) NULL DEFAULT NULL,
  `profile_picture` VARCHAR(45) NULL DEFAULT NULL,
  `is_student` TINYINT(1) NULL DEFAULT NULL,
  `is_vip` TINYINT(1) NULL DEFAULT NULL,
  `phone_number` INT(9) NOT NULL,
  PRIMARY KEY (`id_person`),
  UNIQUE INDEX `id_person_UNIQUE` (`id_person` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`payment` (
  `id_payment` INT(11) NOT NULL AUTO_INCREMENT,
  `was_payment_succesfull` TINYINT(1) NOT NULL,
  `type_of_payment` VARCHAR(45) NOT NULL,
  `date_of_payment` DATE NOT NULL,
  `has_money_back_thing` TINYINT(1) NOT NULL,
  `fk_id_payment_person` INT(11) NOT NULL,
  PRIMARY KEY (`id_payment`),
  UNIQUE INDEX `id_payment_UNIQUE` (`id_payment` ASC),
  INDEX `fk_id_payment_person_idx` (`fk_id_payment_person` ASC),
  CONSTRAINT `fk_id_payment_person`
    FOREIGN KEY (`fk_id_payment_person`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`person` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`shipping` (
  `id_shipping` INT(11) NOT NULL AUTO_INCREMENT,
  `type_of_shipping` VARCHAR(45) NOT NULL,
  `was_payment_succesfull` TINYINT(1) NOT NULL,
  `expected_date_of_shipping` DATE NOT NULL,
  `company_that_will_ship_the_order` VARCHAR(45) NOT NULL,
  `is_address_valid` TINYINT(1) NOT NULL,
  `fk_id_shipping_payment` INT(11) NOT NULL,
  `fk_id_shipping_address` INT(11) NOT NULL,
  PRIMARY KEY (`id_shipping`),
  UNIQUE INDEX `id_shipping_UNIQUE` (`id_shipping` ASC),
  INDEX `fk_id_shipping_address_idx` (`fk_id_shipping_address` ASC),
  INDEX `fk_id_shipping_payment_idx` (`fk_id_shipping_payment` ASC),
  CONSTRAINT `fk_id_shipping_address`
    FOREIGN KEY (`fk_id_shipping_address`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`address` (`id_address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_shipping_payment`
    FOREIGN KEY (`fk_id_shipping_payment`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`payment` (`id_payment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`cart_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`cart_info` (
  `id_cart_info` INT(11) NOT NULL AUTO_INCREMENT,
  `items` VARCHAR(45) NOT NULL,
  `has_valid_shiping` TINYINT(1) NOT NULL,
  `was_payment_succesfull` TINYINT(1) NOT NULL,
  `fk_id_cart_info_shipping` INT(11) NOT NULL,
  `fk_id_cart_info_payment` INT(11) NOT NULL,
  `fk_id_cart_info_person` INT(11) NOT NULL,
  PRIMARY KEY (`id_cart_info`),
  UNIQUE INDEX `id_cart_info_UNIQUE` (`id_cart_info` ASC),
  INDEX `fk_if_cart_info_person_idx` (`fk_id_cart_info_person` ASC),
  INDEX `fk_id_cart_info_shipping_idx` (`fk_id_cart_info_shipping` ASC),
  INDEX `fk_id_cart_info_payment_idx` (`fk_id_cart_info_payment` ASC),
  CONSTRAINT `fk_id_cart_info_payment`
    FOREIGN KEY (`fk_id_cart_info_payment`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`payment` (`id_payment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_cart_info_shipping`
    FOREIGN KEY (`fk_id_cart_info_shipping`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`shipping` (`id_shipping`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_if_cart_info_person`
    FOREIGN KEY (`fk_id_cart_info_person`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`person` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`feedback` (
  `id_feedback` INT(11) NOT NULL AUTO_INCREMENT,
  `rate` VARCHAR(255) NOT NULL,
  `how_to_get_a_in_bds` VARCHAR(45) NOT NULL,
  `what_to_change` VARCHAR(45) NULL DEFAULT NULL,
  `what_nice` VARCHAR(45) NULL DEFAULT NULL,
  `fk_id_feedback` INT(11) NOT NULL,
  PRIMARY KEY (`id_feedback`),
  UNIQUE INDEX `id_feedback_UNIQUE` (`id_feedback` ASC),
  INDEX `fk_id_feedback_idx` (`fk_id_feedback` ASC),
  CONSTRAINT `fk_id_feedback`
    FOREIGN KEY (`fk_id_feedback`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`person` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`login` (
  `id_login` INT(11) NOT NULL AUTO_INCREMENT,
  `is_login_true` TINYINT(1) NOT NULL,
  `is_acount_active` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_login`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`notebook_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`notebook_type` (
  `id_notebook_type` INT(11) NOT NULL AUTO_INCREMENT,
  `type_of_notebook` VARCHAR(45) NOT NULL,
  `has_charger` TINYINT(1) NOT NULL,
  `warranty` DATE NOT NULL,
  `has_os` TINYINT(1) NULL DEFAULT NULL,
  `fk_id_notebook_type` INT(11) NOT NULL,
  PRIMARY KEY (`id_notebook_type`),
  INDEX `fk_id_notebook_type_idx` (`fk_id_notebook_type` ASC),
  UNIQUE INDEX `id_notebook_type_UNIQUE` (`id_notebook_type` ASC),
  CONSTRAINT `fk_id_notebook_type`
    FOREIGN KEY (`fk_id_notebook_type`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`type_of_computer` (`id_type_of_computer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`pc_config`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`pc_config` (
  `id_pc_config` INT(11) NOT NULL AUTO_INCREMENT,
  `type_of_tower` VARCHAR(45) NULL DEFAULT NULL,
  `prebuild` boolean NULL DEFAULT NULL,
  `is_selection_valid` TINYINT(1) NOT NULL,
  `fk_id_pc_config` INT(11) NOT NULL,
  PRIMARY KEY (`id_pc_config`),
  UNIQUE INDEX `id_pc_config_UNIQUE` (`id_pc_config` ASC),
  INDEX `fk_id_pc_config__idx` (`fk_id_pc_config` ASC),
  CONSTRAINT `fk_id_pc_config_`
    FOREIGN KEY (`fk_id_pc_config`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`type_of_computer` (`id_type_of_computer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`pc_parts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`pc_parts` (
  `id_pc_parts` INT(11) NOT NULL AUTO_INCREMENT,
  `cpu` VARCHAR(45) NOT NULL,
  `cpu_cooler` VARCHAR(45) NOT NULL,
  `ram` VARCHAR(45) NOT NULL,
  `motherboard` VARCHAR(45) NOT NULL,
  `storage` VARCHAR(45) NOT NULL,
  `gpu` VARCHAR(45) NOT NULL,
  `psu` VARCHAR(45) NOT NULL,
  `case` VARCHAR(45) NOT NULL,
  `has_os` TINYINT(1) NULL DEFAULT NULL,
  `is_selection_valid` TINYINT(1) NOT NULL,
  `fk_id_pc_parts` INT(11) NOT NULL,
  PRIMARY KEY (`id_pc_parts`),
  UNIQUE INDEX `id_pc_parts_UNIQUE` (`id_pc_parts` ASC),
  INDEX `fk_id_pc_parts_idx` (`fk_id_pc_parts` ASC),
  CONSTRAINT `fk_id_pc_parts`
    FOREIGN KEY (`fk_id_pc_parts`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`pc_config` (`id_pc_config`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`pc_prebuild`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`pc_prebuild` (
  `id_pc_prebuild` INT(11) NOT NULL AUTO_INCREMENT,
  `type_of_prebuild` VARCHAR(45) NOT NULL,
  `prebuild_company_name` VARCHAR(45) NOT NULL,
  `has_os` TINYINT(1) NOT NULL,
  `fk_id_pc_prebuild` INT(11) NOT NULL,
  PRIMARY KEY (`id_pc_prebuild`),
  UNIQUE INDEX `id_pc_prebuild_UNIQUE` (`id_pc_prebuild` ASC),
  INDEX `fk_id_pc_prebuild_idx` (`fk_id_pc_prebuild` ASC),
  CONSTRAINT `fk_id_pc_prebuild`
    FOREIGN KEY (`fk_id_pc_prebuild`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`pc_config` (`id_pc_config`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`person_has_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`person_has_address` (
  `id_person` INT(11) NOT NULL,
  `id_address` INT(11) NOT NULL,
  `company_address` VARCHAR(45) NULL DEFAULT NULL,
  `personal_address` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_person`, `id_address`),
  INDEX `fk_id_address_idx` (`id_address` ASC),
  CONSTRAINT `fk_id_address`
    FOREIGN KEY (`id_address`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`address` (`id_address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_person`
    FOREIGN KEY (`id_person`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`person` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`person_has_login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`person_has_login` (
  `id_person` INT(11) NOT NULL,
  `id_login` INT(11) NOT NULL,
  `last_time_acount_loged_in` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id_person`, `id_login`),
  INDEX `fk_id_person_idx` (`id_person` ASC),
  INDEX `fk_id_login_idx` (`id_login` ASC),
  CONSTRAINT `fk_id_login`
    FOREIGN KEY (`id_login`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`login` (`id_login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_login_id_person`
    FOREIGN KEY (`id_person`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`person` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`roles` (
  `id_roles` INT(11) NOT NULL AUTO_INCREMENT,
  `type_of_role` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_roles`),
  UNIQUE INDEX `id_roles_UNIQUE` (`id_roles` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`person_has_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`person_has_roles` (
  `id_person` INT(11) NOT NULL AUTO_INCREMENT,
  `id_roles` INT(11) NOT NULL,
  `role_is_active` DATE NOT NULL,
  PRIMARY KEY (`id_person`, `id_roles`),
  INDEX `fk_id_roles_idx` (`id_roles` ASC),
  CONSTRAINT `fk_id_person`
    FOREIGN KEY (`id_person`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`person` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_roles`
    FOREIGN KEY (`id_roles`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`roles` (`id_roles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`person_has_shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`person_has_shipping` (
  `id_person` INT(11) NOT NULL,
  `id_shipping` INT(11) NOT NULL,
  PRIMARY KEY (`id_person`, `id_shipping`),
  INDEX `fk_id_shipping_idx` (`id_shipping` ASC),
  CONSTRAINT `fk_id_shipping`
    FOREIGN KEY (`id_shipping`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`shipping` (`id_shipping`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_something_id_person`
    FOREIGN KEY (`id_person`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`person` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`person_has_type_of_computer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`person_has_type_of_computer` (
  `id_person` INT(11) NOT NULL,
  `id_type_of_computer` INT(11) NOT NULL,
  `optional` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_person`, `id_type_of_computer`),
  INDEX `id_type_of_computer` (`id_type_of_computer` ASC),
  CONSTRAINT `fk_dsfsdfsdf_id_person`
    FOREIGN KEY (`id_person`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`person` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_type_of_computer`
    FOREIGN KEY (`id_type_of_computer`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`type_of_computer` (`id_type_of_computer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Schema MySQL-database-scheme-Zacek-and-Matas`.`warranty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MySQL-database-scheme-Zacek-and-Matas`.`warranty` (
  `id_warranty` INT(11) NOT NULL AUTO_INCREMENT,
  `is_warranty_valid` TINYINT(1) NOT NULL,
  `type_of_warranty` VARCHAR(45) NOT NULL,
  `expiration_date` DATE NOT NULL,
  `fk_id_warranty` INT(11) NOT NULL,
  PRIMARY KEY (`id_warranty`),
  UNIQUE INDEX `id_warranty_UNIQUE` (`id_warranty` ASC),
  INDEX `fk_id_warranty_idx` (`fk_id_warranty` ASC),
  CONSTRAINT `fk_id_warranty`
    FOREIGN KEY (`fk_id_warranty`)
    REFERENCES `MySQL-database-scheme-Zacek-and-Matas`.`person` (`id_person`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
