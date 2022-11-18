-- Create schema
CREATE SCHEMA ecom;

-- Create database user mapped to IAM role
CREATE USER 'pod_user'@'%' IDENTIFIED WITH AWSAuthenticationPlugin as 'RDS';
GRANT SELECT, INSERT, UPDATE, DELETE ON ecom.* TO 'pod_user'@'%' ;

-- Orders table
CREATE TABLE `ecom`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT ,
  `order_sku_id` INT NOT NULL,
  `order_qty` INT NOT NULL,
  `order_price` DECIMAL(10,2) NOT NULL,
  `order_timestamp` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE);

-- Inventory table
CREATE TABLE `ecom`.`inventory` (
  `sku_id` INT NOT NULL AUTO_INCREMENT ,
  `sku_qty` INT NOT NULL,
  `inventory_timestamp` DATETIME NOT NULL,
  PRIMARY KEY (`sku_id`),
  UNIQUE INDEX `sku_id_UNIQUE` (`sku_id` ASC) VISIBLE);

-- INSERT inventory rows

INSERT INTO `ecom`.`inventory` (`sku_id`, `sku_qty`, `inventory_timestamp`) VALUES  (1,100,CURRENT_TIMESTAMP);
INSERT INTO `ecom`.`inventory` (`sku_id`, `sku_qty`, `inventory_timestamp`) VALUES  (2,100,CURRENT_TIMESTAMP);
INSERT INTO `ecom`.`inventory` (`sku_id`, `sku_qty`, `inventory_timestamp`) VALUES  (3,100,CURRENT_TIMESTAMP);
