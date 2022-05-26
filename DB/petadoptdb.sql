-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema petadoptdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `petadoptdb` ;

-- -----------------------------------------------------
-- Schema petadoptdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `petadoptdb` DEFAULT CHARACTER SET utf8 ;
USE `petadoptdb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `street2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state_abbr` CHAR(2) NULL,
  `zipcode` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `account` ;

CREATE TABLE IF NOT EXISTS `account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `date_of_birth` DATETIME NULL,
  `address_id` INT NULL,
  `about_me` VARCHAR(2000) NULL,
  `active` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_account_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_account_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role` ;

CREATE TABLE IF NOT EXISTS `role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `active` TINYINT NULL,
  `account_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_account_idx` (`account_id` ASC),
  INDEX `fk_user_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_user_account`
    FOREIGN KEY (`account_id`)
    REFERENCES `account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `size` ;

CREATE TABLE IF NOT EXISTS `size` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `breed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `breed` ;

CREATE TABLE IF NOT EXISTS `breed` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `breed_name` VARCHAR(45) NULL,
  `hypoallergenic` TINYINT NULL,
  `description` VARCHAR(200) NULL,
  `size_id` INT NULL,
  `category_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_breed_size1_idx` (`size_id` ASC),
  INDEX `fk_breed_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_breed_size1`
    FOREIGN KEY (`size_id`)
    REFERENCES `size` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_breed_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_sex`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pet_sex` ;

CREATE TABLE IF NOT EXISTS `pet_sex` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pet` ;

CREATE TABLE IF NOT EXISTS `pet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `vaccinated` TINYINT NULL,
  `image_url` TEXT NULL,
  `date_of_birth` DATETIME NULL,
  `weight` DECIMAL(5,2) NULL,
  `temperament` VARCHAR(500) NULL COMMENT 'Temperament, personality - good with kids; energetic; needs attention; abused / neglected at some previous home; etc. ',
  `account_id` INT NULL,
  `neutered` TINYINT NULL,
  `breed_id` INT NULL,
  `about_me` TEXT NULL,
  `active` TINYINT NOT NULL,
  `pet_sex_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pet_account1_idx` (`account_id` ASC),
  INDEX `fk_pet_breed1_idx` (`breed_id` ASC),
  INDEX `fk_pet_pet_sex1_idx` (`pet_sex_id` ASC),
  CONSTRAINT `fk_pet_account1`
    FOREIGN KEY (`account_id`)
    REFERENCES `account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_breed1`
    FOREIGN KEY (`breed_id`)
    REFERENCES `breed` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_pet_sex1`
    FOREIGN KEY (`pet_sex_id`)
    REFERENCES `pet_sex` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS petadoptuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'petadoptuser'@'localhost' IDENTIFIED BY 'petadoptuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'petadoptuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `petadoptdb`;
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_abbr`, `zipcode`) VALUES (1, '1276 Sylveon Dr', 'Unit 17', 'San Jose', 'CA', '94088');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_abbr`, `zipcode`) VALUES (2, '908 Weaville Way', NULL, 'San Francisco', 'CA', '90416');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_abbr`, `zipcode`) VALUES (3, '123 Mercury Cir', NULL, 'Centennial', 'CO', '80112');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_abbr`, `zipcode`) VALUES (4, '35 American Way', NULL, 'Smallville', 'CO', '80123');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_abbr`, `zipcode`) VALUES (5, '4 Privet Drive', NULL, 'Berkshire', 'CO', '80144');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_abbr`, `zipcode`) VALUES (6, '720 Charizard Way', 'Apt 24', 'San Jose', 'CO', '80223');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state_abbr`, `zipcode`) VALUES (7, '3 Themiscyra Cir', NULL, 'Pontus', 'CO', '80321');

COMMIT;


-- -----------------------------------------------------
-- Data for table `account`
-- -----------------------------------------------------
START TRANSACTION;
USE `petadoptdb`;
INSERT INTO `account` (`id`, `first_name`, `last_name`, `email`, `phone`, `date_of_birth`, `address_id`, `about_me`, `active`) VALUES (1, 'Ron', 'Weasley', 'ron@hogwarts.com', '7205550202', '1984-10-31', 1, 'Hi, I have a cat called Fluffy that I can no longer take care of due to a loved one\'s allergies. While it\'s sad, I really want a wonderful new home for Fluffy.', 1);
INSERT INTO `account` (`id`, `first_name`, `last_name`, `email`, `phone`, `date_of_birth`, `address_id`, `about_me`, `active`) VALUES (2, 'Sarah', 'Nelson', 'sarah551@adoptapet.com', '5518965478', '1990-07-20', 2, 'Hi, my name\'s Sarah. I love animals. ', 1);
INSERT INTO `account` (`id`, `first_name`, `last_name`, `email`, `phone`, `date_of_birth`, `address_id`, `about_me`, `active`) VALUES (3, 'Admin', 'User', 'admin@adoptapet.com', '7205550910', '1983-10-27', 3, 'I\'m the Admin of the site!', 1);
INSERT INTO `account` (`id`, `first_name`, `last_name`, `email`, `phone`, `date_of_birth`, `address_id`, `about_me`, `active`) VALUES (4, 'Clark', 'Kent', 'clark@smallville.com', '9745552231', '1984-10-10', 4, 'Hi, I\'m Clark. I love animals, especially dogs. I am looking to adopt a dog. ', 1);
INSERT INTO `account` (`id`, `first_name`, `last_name`, `email`, `phone`, `date_of_birth`, `address_id`, `about_me`, `active`) VALUES (5, 'Harry', 'Potter', 'hpotter@hogwarts.com', '7205550123', '1990-10-31', 5, 'Hi, I\'m Harry! I love dogs, cats and owls. I also love animals of a more magical variety. ', 1);
INSERT INTO `account` (`id`, `first_name`, `last_name`, `email`, `phone`, `date_of_birth`, `address_id`, `about_me`, `active`) VALUES (6, 'Charlie', 'Spring', 'charlie-spring@adoptapet.com', '2015955694', '2000-04-25', 6, 'Hi, I\'m Charlie. Every pet deserves a good home. I\'m looking for a pet to adopt.', 1);
INSERT INTO `account` (`id`, `first_name`, `last_name`, `email`, `phone`, `date_of_birth`, `address_id`, `about_me`, `active`) VALUES (7, 'Diana', 'Prince', 'diana-wonder@adoptapet.com', '7208956214', '1931-07-04', 7, 'Hello, my name is Diana. I love all animals. I have fostered many needy ones over the years. While I love fostering, I have a passion for finding a caring, forever home for the animals in my care. I will be creating listings for sweet animals who deserve a wonderful home. My contact information is available for registered users. ', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `role`
-- -----------------------------------------------------
START TRANSACTION;
USE `petadoptdb`;
INSERT INTO `role` (`id`, `name`) VALUES (1, 'admin');
INSERT INTO `role` (`id`, `name`) VALUES (2, 'registered_user');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `petadoptdb`;
INSERT INTO `user` (`id`, `username`, `password`, `active`, `account_id`, `role_id`) VALUES (1, 'ron', 'password', 1, 1, 2);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `account_id`, `role_id`) VALUES (2, 'sarah', 'sarahnelson', 1, 2, 2);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `account_id`, `role_id`) VALUES (3, 'admin', 'admin', 1, 3, 1);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `account_id`, `role_id`) VALUES (4, 'clark', 'clark-kent', 1, 4, 2);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `account_id`, `role_id`) VALUES (5, 'harry', 'hogwarts', 1, 5, 2);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `account_id`, `role_id`) VALUES (6, 'charlie-spring', 'charlie-spring', 1, 6, 2);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `account_id`, `role_id`) VALUES (7, 'diana-prince', 'diana-prince', 1, 7, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `size`
-- -----------------------------------------------------
START TRANSACTION;
USE `petadoptdb`;
INSERT INTO `size` (`id`, `name`) VALUES (1, 'xsmall');
INSERT INTO `size` (`id`, `name`) VALUES (2, 'small');
INSERT INTO `size` (`id`, `name`) VALUES (3, 'medium');
INSERT INTO `size` (`id`, `name`) VALUES (4, 'large');
INSERT INTO `size` (`id`, `name`) VALUES (5, 'xlarge');
INSERT INTO `size` (`id`, `name`) VALUES (6, 'giant');
INSERT INTO `size` (`id`, `name`) VALUES (7, 'unspecified');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `petadoptdb`;
INSERT INTO `category` (`id`, `name`) VALUES (1, 'dog');
INSERT INTO `category` (`id`, `name`) VALUES (2, 'cat');
INSERT INTO `category` (`id`, `name`) VALUES (3, 'bird');
INSERT INTO `category` (`id`, `name`) VALUES (4, 'hamster');
INSERT INTO `category` (`id`, `name`) VALUES (5, 'other');

COMMIT;


-- -----------------------------------------------------
-- Data for table `breed`
-- -----------------------------------------------------
START TRANSACTION;
USE `petadoptdb`;
INSERT INTO `breed` (`id`, `breed_name`, `hypoallergenic`, `description`, `size_id`, `category_id`) VALUES (1, 'Golden Retriever', 1, 'The Golden Retriever, an exuberant Scottish gundog of great beauty, stands among America\'s most popular dog breeds.', 4, 1);
INSERT INTO `breed` (`id`, `breed_name`, `hypoallergenic`, `description`, `size_id`, `category_id`) VALUES (2, 'Persian', 1, 'The Persian cat (Persian is a long-haired breed of cat characterized by its round face and short muzzle. It is also known as the \"Persian Longhair\" in English-speaking countries. ', 2, 2);
INSERT INTO `breed` (`id`, `breed_name`, `hypoallergenic`, `description`, `size_id`, `category_id`) VALUES (3, 'Mixed breed medium dog', 0, 'Mixed breed medium sized dog.', 3, 1);
INSERT INTO `breed` (`id`, `breed_name`, `hypoallergenic`, `description`, `size_id`, `category_id`) VALUES (4, 'Mixed breed small dog', 0, 'Mixed breed small dog.', 2, 1);
INSERT INTO `breed` (`id`, `breed_name`, `hypoallergenic`, `description`, `size_id`, `category_id`) VALUES (5, 'Mixed breed large dog', 0, 'Mixed breed large dog.', 4, 1);
INSERT INTO `breed` (`id`, `breed_name`, `hypoallergenic`, `description`, `size_id`, `category_id`) VALUES (6, 'Great Dane', 1, 'Patient with kids, Danes are people pleasers who make friends easily.', 6, 1);
INSERT INTO `breed` (`id`, `breed_name`, `hypoallergenic`, `description`, `size_id`, `category_id`) VALUES (7, 'Other', 0, 'Breed is unknown or unspecified', 7, 5);
INSERT INTO `breed` (`id`, `breed_name`, `hypoallergenic`, `description`, `size_id`, `category_id`) VALUES (8, 'French Bulldog', 0, 'Small dog breed. Energetic. Friendly.', 2, 1);
INSERT INTO `breed` (`id`, `breed_name`, `hypoallergenic`, `description`, `size_id`, `category_id`) VALUES (9, 'Ragdoll Cat', 0, 'Ragdoll breed of cat. ', 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet_sex`
-- -----------------------------------------------------
START TRANSACTION;
USE `petadoptdb`;
INSERT INTO `pet_sex` (`id`, `name`) VALUES (1, 'male');
INSERT INTO `pet_sex` (`id`, `name`) VALUES (2, 'female');
INSERT INTO `pet_sex` (`id`, `name`) VALUES (DEFAULT, '');
INSERT INTO `pet_sex` (`id`, `name`) VALUES (DEFAULT, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet`
-- -----------------------------------------------------
START TRANSACTION;
USE `petadoptdb`;
INSERT INTO `pet` (`id`, `name`, `vaccinated`, `image_url`, `date_of_birth`, `weight`, `temperament`, `account_id`, `neutered`, `breed_id`, `about_me`, `active`, `pet_sex_id`) VALUES (1, 'Fluffy', 1, 'https://media.istockphoto.com/photos/young-white-persian-kitten-picture-id1219045070?k=20&m=1219045070&s=170667a&w=0&h=IjkxQCS7XfARM_ujIBKghXg1X42O_5QktWyg_xsJMMM=', '2020-10-31', 12.50, 'Friendly', 1, 1, 2, 'I love taking naps, drinking milk, and playing with yarn!', 1, 1);
INSERT INTO `pet` (`id`, `name`, `vaccinated`, `image_url`, `date_of_birth`, `weight`, `temperament`, `account_id`, `neutered`, `breed_id`, `about_me`, `active`, `pet_sex_id`) VALUES (2, 'Kam', 1, 'https://www.akc.org/wp-content/uploads/2017/11/French-Bulldog-puppy-standing-in-the-grass-holding-a-ball-in-its-mouth.jpg', '2019-05-11', 20.24, 'Aloof', 2, 1, 4, 'I like taking naps, resting in the sunshine, and getting treats!', 1, 2);
INSERT INTO `pet` (`id`, `name`, `vaccinated`, `image_url`, `date_of_birth`, `weight`, `temperament`, `account_id`, `neutered`, `breed_id`, `about_me`, `active`, `pet_sex_id`) VALUES (3, 'Luna', 1, 'https://www.dogalize.com/wp-content/uploads/2017/03/animals-1056412_640.jpg', '2021-06-15', 27.90, 'Friendly, curious, loving', 7, 0, 3, 'I love to be around people and see what they\'re up to! I like playing fetch. Ear scratches are great!', 1, 2);
INSERT INTO `pet` (`id`, `name`, `vaccinated`, `image_url`, `date_of_birth`, `weight`, `temperament`, `account_id`, `neutered`, `breed_id`, `about_me`, `active`, `pet_sex_id`) VALUES (4, 'Pearl', 1, 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F47%2F2021%2F09%2F21%2Fragdoll-lying-on-wood-floor-417857939.jpg', '2020-07-30', 10.20, 'Curious, lovable', 7, 0, 9, 'I love people-watching, but I don\'t love to participate in activities. ', 1, 2);
INSERT INTO `pet` (`id`, `name`, `vaccinated`, `image_url`, `date_of_birth`, `weight`, `temperament`, `account_id`, `neutered`, `breed_id`, `about_me`, `active`, `pet_sex_id`) VALUES (5, 'Rue', 1, 'https://www.loveyourdog.com/wp-content/uploads/2021/09/Great-Dane-Prices-900x500.jpg', '2021-05-19', 100.22, 'Friendly, sweet, does not know his own size', 7, 1, 6, 'I love to play with other dogs. I love people. I like to see what\'s on countertops. I love taking naps on my favorite couch.', 1, 1);
INSERT INTO `pet` (`id`, `name`, `vaccinated`, `image_url`, `date_of_birth`, `weight`, `temperament`, `account_id`, `neutered`, `breed_id`, `about_me`, `active`, `pet_sex_id`) VALUES (6, 'Grogu', 1, 'https://popshopsite.com/wp-content/uploads/2020/05/baby-yoda-chia-pet_IG-and-FEATURE-1170x871.png', '2022-05-26', 1.75, 'Chia Pet, Grogu is. ', 7, 0, 7, 'Chia Pet, I am.', 1, 1);

COMMIT;

