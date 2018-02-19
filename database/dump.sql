-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: autozone
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `autozone`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `autozone` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `autozone`;

--
-- Table structure for table `branch_discount_product`
--

DROP TABLE IF EXISTS `branch_discount_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_discount_product` (
  `branch_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`branch_id`,`discount_id`,`product_id`),
  KEY `discount_id` (`discount_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `branch_discount_product_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `branch_discount_product_ibfk_2` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`),
  CONSTRAINT `branch_discount_product_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_discount_product`
--

LOCK TABLES `branch_discount_product` WRITE;
/*!40000 ALTER TABLE `branch_discount_product` DISABLE KEYS */;
INSERT INTO `branch_discount_product` VALUES (1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),(1,6,6),(1,7,7),(1,8,8),(1,9,9),(1,10,10);
/*!40000 ALTER TABLE `branch_discount_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_price_product`
--

DROP TABLE IF EXISTS `branch_price_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_price_product` (
  `branch_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`branch_id`,`price_id`,`product_id`),
  KEY `price_id` (`price_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `branch_price_product_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `branch_price_product_ibfk_2` FOREIGN KEY (`price_id`) REFERENCES `prices` (`id`),
  CONSTRAINT `branch_price_product_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_price_product`
--

LOCK TABLES `branch_price_product` WRITE;
/*!40000 ALTER TABLE `branch_price_product` DISABLE KEYS */;
INSERT INTO `branch_price_product` VALUES (1,1,1),(1,2,1),(2,3,1),(1,4,2),(1,5,2),(2,6,2),(1,7,3),(1,8,3),(2,9,3),(1,10,4),(1,11,4),(2,12,4),(1,13,5),(1,14,5),(2,15,5),(1,16,6),(1,17,6),(2,18,6),(1,19,7),(1,20,7),(2,21,7),(1,22,8),(1,23,8),(2,24,8),(1,25,9),(1,26,9),(2,27,9),(1,28,10),(1,29,10),(2,30,10),(2,51,11),(2,52,12),(2,53,13),(2,54,14),(2,55,15),(2,56,16),(2,57,17),(2,58,18),(2,59,19),(2,60,20);
/*!40000 ALTER TABLE `branch_price_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_product`
--

DROP TABLE IF EXISTS `branch_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_product` (
  `quantity` int(11) NOT NULL,
  `restock` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`branch_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `branch_product_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `branch_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_product`
--

LOCK TABLES `branch_product` WRITE;
/*!40000 ALTER TABLE `branch_product` DISABLE KEYS */;
INSERT INTO `branch_product` VALUES (10,10,1,1),(10,10,1,2),(10,10,1,3),(10,10,1,4),(10,10,1,5),(10,10,1,6),(10,10,1,7),(10,10,1,8),(10,10,1,9),(10,10,1,10),(10,10,1,11),(10,10,1,12),(10,10,1,13),(10,10,1,14),(10,10,1,15),(10,10,1,16),(10,10,1,17),(10,10,1,18),(10,10,1,19),(10,10,1,20),(100,100,2,1),(50,100,2,2),(100,100,2,3),(100,100,2,4),(100,100,2,5),(100,100,2,6),(100,100,2,7),(100,100,2,8),(100,100,2,9),(100,100,2,10),(100,100,2,11),(100,100,2,12),(100,100,2,13),(100,100,2,14),(100,100,2,15),(100,100,2,16),(100,100,2,17),(100,100,2,18),(100,100,2,19),(100,100,2,20);
/*!40000 ALTER TABLE `branch_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER after_branch_product_update

AFTER UPDATE ON branch_product

FOR EACH ROW

BEGIN

    IF NEW.quantity = 0 THEN

        INSERT INTO purchases

        SET quantity = OLD.restock,

        branch_id = OLD.branch_id,

        price_id = getPurchaseValueId(OLD.product_id, NOW()),

        product_id = OLD.product_id,

        provider_id = 1,

        created_at = NOW();

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `schedule` varchar(511) NOT NULL,
  `balance` double NOT NULL,
  `address` varchar(511) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `manager_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `branches_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'Física','Lunes a sabado de 10:00 a 21:00',50000,'Av. astronomos 547',72500,19.614587,-90.123456,2),(2,'En linea','Lunes a domingo de 00:00 a 23:59',50000,'Av. astronomos 547',72500,19.614587,-90.123456,1);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'VW'),(2,'BMW'),(3,'Mazda'),(4,'LTH'),(5,'Roshfranz'),(6,'Michelin'),(7,'OEM'),(8,'Quaker state'),(9,'Supercar');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_product`
--

DROP TABLE IF EXISTS `cart_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_product` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`cart_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_product_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  CONSTRAINT `cart_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_product`
--

LOCK TABLES `cart_product` WRITE;
/*!40000 ALTER TABLE `cart_product` DISABLE KEYS */;
INSERT INTO `cart_product` VALUES (4,1,100),(5,2,50),(6,1,50);
/*!40000 ALTER TABLE `cart_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subdepartment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subdepartment_id` (`subdepartment_id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`subdepartment_id`) REFERENCES `subdepartments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Luces',1),(2,'Baleros',1),(3,'De motor',2),(4,'Genericos',2),(5,'Aromatizantes',3),(6,'Vinilos',3),(7,'Bastones',4),(8,'Controles a distancia',4),(9,'Llantas',1),(10,'Fundas y Protectores',5),(11,'Insumos de limpieza',5);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_location`
--

DROP TABLE IF EXISTS `client_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_location` (
  `client_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`client_id`,`location_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `client_location_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `client_location_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_location`
--

LOCK TABLES `client_location` WRITE;
/*!40000 ALTER TABLE `client_location` DISABLE KEYS */;
INSERT INTO `client_location` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `client_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_vehicle`
--

DROP TABLE IF EXISTS `client_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_vehicle` (
  `client_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  KEY `client_id` (`client_id`),
  KEY `vehicle_id` (`vehicle_id`),
  CONSTRAINT `client_vehicle_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `client_vehicle_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_vehicle`
--

LOCK TABLES `client_vehicle` WRITE;
/*!40000 ALTER TABLE `client_vehicle` DISABLE KEYS */;
INSERT INTO `client_vehicle` VALUES (1,1),(2,1),(3,2),(3,3);
/*!40000 ALTER TABLE `client_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `birth` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Endy Flores','1952-10-20','endy@gmail.com','2295638417','secret'),(2,'Rosa Paredes','1978-10-20','rosa@gmail.com','2221639845','secret'),(3,'JM González Calleros','1970-05-17','jmgc@gmail.com','2221458596','secret'),(4,'Carlos','1985-11-09','test@test.com','2221548621','secret'),(5,'Moni','1985-11-09','test@test.com','2221548621','secret'),(6,'Compu','1985-11-09','test@test.com','2221548621','secret');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rfc` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Big provider company','rfc123456'),(2,'Small provider company','rfc123457');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES (1,'En tienda'),(2,'Envío a domicilio');
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Refacciones'),(2,'Accesorios');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,85,'2018-02-19 19:24:49'),(2,45,'2018-02-19 19:24:49'),(3,190,'2018-02-19 19:24:49'),(4,280,'2018-02-19 19:24:49'),(5,135,'2018-02-19 19:24:49'),(6,85,'2018-02-19 19:24:49'),(7,45,'2018-02-19 19:24:49'),(8,190,'2018-02-19 19:24:49'),(9,280,'2018-02-19 19:24:49'),(10,135,'2018-02-19 19:24:49');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `birth` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `active` bit(1) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `position_id` (`position_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Dan Perez','1975-05-10','danperez@itesm.mx','2224778563','secret','2018-02-17 19:24:48','',2,1),(2,'Alberto Oliart','1970-05-10','aoliart@itesm.mx','2224789563','secret','2018-02-17 19:24:48','',1,1),(3,'Juan Calleros','1978-05-10','jmcalleros@itesm.mx','2224781563','secret','2018-02-17 19:24:48','',1,2),(4,'David Sol','1965-05-10','dsol@itesm.mx','2224789514','secret','2018-02-17 19:24:48','',1,2),(5,'Alberto Palomares','1980-05-10','apalomares@itesm.mx','2224789203','secret','2018-02-17 19:24:48','',1,3);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'images/1a.jpg',1),(2,'images/1b.jpg',1),(3,'images/2a.jpg',2),(4,'images/2b.jpg',2),(5,'images/3a.jpg',3),(6,'images/4a.jpg',4),(7,'images/5a.jpg',5),(8,'images/6a.jpg',6),(9,'images/7a.jpg',7),(10,'images/8a.jpg',8),(11,'images/9a.jpg',9),(12,'images/10a.jpg',10),(13,'images/11a.jpg',11),(14,'images/12a.jpg',12),(15,'images/12b.jpg',12),(16,'images/13a.jpg',13),(17,'images/13b.jpg',13),(18,'images/14a.jpg',14),(19,'images/15a.jpg',15),(20,'images/16a.jpg',16),(21,'images/17a.jpg',17),(22,'images/18a.jpg',18),(23,'images/19a.jpg',19),(24,'images/20a.jpg',20);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(511) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Av. tec 547',72510,19.614587,-90.123456),(2,'Av. juarez 547',72500,19.614587,-90.123456),(3,'Av. bosques 547',72520,19.614587,-90.123456),(4,'Av. 5 de mayo 547',72530,19.614587,-90.123456),(5,'Av. las torres 547',72570,19.614587,-90.123456),(6,'Av. margaritas 547',72540,19.614587,-90.123456);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `employee_id` int(11) NOT NULL,
  `till_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  KEY `till_id` (`till_id`),
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `logs_ibfk_2` FOREIGN KEY (`till_id`) REFERENCES `tills` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,'2018-01-25 08:00:00','2018-01-25 10:00:00',3,1),(2,'2018-01-25 08:00:00','2018-01-25 10:00:00',4,2),(3,'2018-01-25 12:00:00','2018-01-25 14:00:00',3,2),(4,'2018-01-25 12:00:00','2018-01-25 14:00:00',4,1);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_motor`
--

DROP TABLE IF EXISTS `model_motor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_motor` (
  `model_id` int(11) NOT NULL,
  `motor_id` int(11) NOT NULL,
  PRIMARY KEY (`model_id`,`motor_id`),
  KEY `motor_id` (`motor_id`),
  CONSTRAINT `model_motor_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`),
  CONSTRAINT `model_motor_ibfk_2` FOREIGN KEY (`motor_id`) REFERENCES `motors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_motor`
--

LOCK TABLES `model_motor` WRITE;
/*!40000 ALTER TABLE `model_motor` DISABLE KEYS */;
INSERT INTO `model_motor` VALUES (1,1),(3,1),(2,2),(3,2);
/*!40000 ALTER TABLE `model_motor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_product`
--

DROP TABLE IF EXISTS `model_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_product` (
  `model_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`model_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `model_product_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`),
  CONSTRAINT `model_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_product`
--

LOCK TABLES `model_product` WRITE;
/*!40000 ALTER TABLE `model_product` DISABLE KEYS */;
INSERT INTO `model_product` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,3),(1,4),(2,4),(2,5),(1,6),(3,6),(2,7),(3,8),(1,9),(2,9),(3,9),(1,10),(2,10),(1,11),(2,11),(3,11),(1,12),(2,12),(3,13),(1,14),(2,14),(2,15),(1,16),(3,16),(2,17),(3,18),(1,19),(2,19),(3,19),(1,20),(2,20);
/*!40000 ALTER TABLE `model_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `models_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (1,'Vento',1),(2,'Serie 4 Coupé',2),(3,'CX7',3);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motors`
--

DROP TABLE IF EXISTS `motors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motors`
--

LOCK TABLES `motors` WRITE;
/*!40000 ALTER TABLE `motors` DISABLE KEYS */;
INSERT INTO `motors` VALUES (1,'Turbo TSI'),(2,'428i');
/*!40000 ALTER TABLE `motors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_types`
--

DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_types`
--

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;
INSERT INTO `payment_types` VALUES (1,'Efectivo'),(2,'Débito'),(3,'Crédito');
/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `salary` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Manager',22750),(2,'Cashier',12000),(3,'Salesman',10000);
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,90,'2018-02-17 19:24:49'),(2,100,'2018-02-19 19:24:49'),(3,110,'2018-02-17 19:24:49'),(4,50,'2018-02-17 19:24:49'),(5,55,'2018-02-19 19:24:49'),(6,60,'2018-02-17 19:24:49'),(7,200,'2018-02-17 19:24:49'),(8,220,'2018-02-19 19:24:49'),(9,225,'2018-02-17 19:24:49'),(10,300,'2018-02-17 19:24:49'),(11,330,'2018-02-19 19:24:49'),(12,320,'2018-02-17 19:24:49'),(13,150,'2018-02-17 19:24:49'),(14,160,'2018-02-19 19:24:49'),(15,155,'2018-02-17 19:24:49'),(16,90,'2018-02-17 19:24:49'),(17,100,'2018-02-19 19:24:49'),(18,110,'2018-02-17 19:24:49'),(19,50,'2018-02-17 19:24:49'),(20,55,'2018-02-19 19:24:49'),(21,60,'2018-02-17 19:24:49'),(22,200,'2018-02-17 19:24:49'),(23,220,'2018-02-19 19:24:49'),(24,225,'2018-02-17 19:24:49'),(25,300,'2018-02-17 19:24:49'),(26,330,'2018-02-19 19:24:49'),(27,320,'2018-02-17 19:24:49'),(28,150,'2018-02-17 19:24:49'),(29,160,'2018-02-19 19:24:49'),(30,155,'2018-02-17 19:24:49'),(31,70,'2018-02-17 19:24:49'),(32,35,'2018-02-17 19:24:49'),(33,150,'2018-02-17 19:24:49'),(34,220,'2018-02-17 19:24:49'),(35,120,'2018-02-17 19:24:49'),(36,70,'2018-02-17 19:24:49'),(37,35,'2018-02-17 19:24:49'),(38,150,'2018-02-17 19:24:49'),(39,220,'2018-02-17 19:24:49'),(40,120,'2018-02-17 19:24:49'),(41,72,'2018-02-17 19:24:49'),(42,33,'2018-02-17 19:24:49'),(43,152,'2018-02-17 19:24:49'),(44,217,'2018-02-17 19:24:49'),(45,122,'2018-02-17 19:24:49'),(46,72,'2018-02-17 19:24:49'),(47,33,'2018-02-17 19:24:49'),(48,152,'2018-02-17 19:24:49'),(49,217,'2018-02-17 19:24:49'),(50,122,'2018-02-17 19:24:49'),(51,172,'2018-02-17 19:24:49'),(52,353,'2018-02-17 19:24:49'),(53,107.5,'2018-02-17 19:24:49'),(54,25.3,'2018-02-17 19:24:49'),(55,1220,'2018-02-17 19:24:49'),(56,175.1,'2018-02-17 19:24:49'),(57,335,'2018-02-17 19:24:49'),(58,140,'2018-02-17 19:24:49'),(59,227,'2018-02-17 19:24:49'),(60,422,'2018-02-17 19:24:49');
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_provider_price`
--

DROP TABLE IF EXISTS `product_provider_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_provider_price` (
  `price_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`price_id`,`provider_id`,`product_id`),
  KEY `provider_id` (`provider_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_provider_price_ibfk_1` FOREIGN KEY (`price_id`) REFERENCES `prices` (`id`),
  CONSTRAINT `product_provider_price_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`),
  CONSTRAINT `product_provider_price_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_provider_price`
--

LOCK TABLES `product_provider_price` WRITE;
/*!40000 ALTER TABLE `product_provider_price` DISABLE KEYS */;
INSERT INTO `product_provider_price` VALUES (31,1,1),(33,1,3),(35,1,5),(37,1,7),(39,1,9),(32,2,2),(34,2,4),(36,2,6),(38,2,8),(40,2,10),(41,3,1),(41,3,11),(43,3,3),(43,3,13),(45,3,5),(45,3,15),(47,3,7),(47,3,17),(49,3,9),(49,3,19),(42,4,2),(42,4,12),(44,4,4),(44,4,14),(46,4,6),(46,4,16),(48,4,8),(48,4,18),(50,4,10),(50,4,20);
/*!40000 ALTER TABLE `product_provider_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `secondary_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(511) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1234,'Faros de halógeno','Faros para automovil ...',4,1),(2,1235,'Faros de niebla','Faros para automovil ...',4,1),(3,1236,'Baleros profesionales','Baleros para automovil ...',7,2),(4,1237,'Aceite estandar','Aceite para automovil ...',5,3),(5,1238,'Aceite protector','Aceite protector para automovil ...',5,4),(6,1239,'Aceite para bisagras','Aceite para bisagras de automovil ...',5,4),(7,1241,'Aromatizante de pino','Aromatizante para automovil ...',8,5),(8,1242,'Vinilos de parabrizas','Vinilos de parabrizas para automovil ...',7,6),(9,1243,'Bastones para volante','Bastones para volante para automovil ...',6,7),(10,1249,'Controles de puertas','Controles de puertas para automovil ...',5,8),(11,1251,'Llantas de goma','Llantas para automovil ...',6,9),(12,1254,'Llantas de alto desempeño','Llantas para automovil ...',6,9),(13,1234,'Jabón protector','Jabón para automóvil ...',5,11),(14,1256,'Tapete de vinilo','Tapete para automovil ...',5,10),(15,1257,'Tapete de alfombra','Tapete alfombrado para automovil ...',5,10),(16,1258,'Tapete de hule','Tapete protector de automovil ...',6,10),(17,1261,'Calcomanía perro','Decoración en forma de perro ...',9,6),(18,1263,'Calcomanía corazón','Decoración con piedras rosa ...',9,6),(19,1264,'Fundas para volante','Fundas para volante para automovil ...',6,10),(20,1270,'Cera premium','Cera de alta calidad para automovil ...',5,11);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `providers_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (1,'Juan proovedor','juan@proveedor.com','554477889',1),(2,'Jose proovedor','jose@proveedor.com','554477880',1),(3,'Pedro proovedor','pedro@proveedor.com','554477887',2),(4,'Miguel proovedor','miguel@proveedor.com','554477886',2);
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `done` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  KEY `price_id` (`price_id`),
  KEY `product_id` (`product_id`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`price_id`) REFERENCES `prices` (`id`),
  CONSTRAINT `purchases_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `purchases_ibfk_4` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,5,1,31,1,1,'2018-02-17 19:24:49',0),(2,12,1,45,5,3,'2018-02-17 19:24:49',0),(3,100,2,31,1,1,'2018-02-18 12:49:12',0),(4,50,2,31,1,1,'2018-02-18 12:49:27',1),(5,100,2,31,1,1,'2018-02-18 22:06:20',0),(7,100,2,31,1,1,'2018-02-18 22:07:11',1);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisition_status`
--

DROP TABLE IF EXISTS `requisition_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisition_status` (
  `created_at` datetime NOT NULL,
  `requisition_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`requisition_id`,`status_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `requisition_status_ibfk_1` FOREIGN KEY (`requisition_id`) REFERENCES `requisitions` (`id`),
  CONSTRAINT `requisition_status_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisition_status`
--

LOCK TABLES `requisition_status` WRITE;
/*!40000 ALTER TABLE `requisition_status` DISABLE KEYS */;
INSERT INTO `requisition_status` VALUES ('2018-02-18 12:49:12',1,4),('2018-02-18 12:52:50',2,4),('2018-02-18 22:06:20',3,4);
/*!40000 ALTER TABLE `requisition_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisitions`
--

DROP TABLE IF EXISTS `requisitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `cart_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `till_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`),
  KEY `client_id` (`client_id`),
  KEY `delivery_id` (`delivery_id`),
  KEY `payment_type_id` (`payment_type_id`),
  KEY `till_id` (`till_id`),
  CONSTRAINT `requisitions_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  CONSTRAINT `requisitions_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `requisitions_ibfk_3` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`id`),
  CONSTRAINT `requisitions_ibfk_4` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_types` (`id`),
  CONSTRAINT `requisitions_ibfk_5` FOREIGN KEY (`till_id`) REFERENCES `tills` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisitions`
--

LOCK TABLES `requisitions` WRITE;
/*!40000 ALTER TABLE `requisitions` DISABLE KEYS */;
INSERT INTO `requisitions` VALUES (1,'2018-02-18 12:49:12',4,4,1,1,3),(2,'2018-02-18 12:52:50',5,5,1,1,3),(3,'2018-02-18 22:06:20',6,6,1,1,3);
/*!40000 ALTER TABLE `requisitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesPerHour`
--

DROP TABLE IF EXISTS `salesPerHour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesPerHour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` float(7,2) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesPerHour`
--

LOCK TABLES `salesPerHour` WRITE;
/*!40000 ALTER TABLE `salesPerHour` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesPerHour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specifications`
--

DROP TABLE IF EXISTS `specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(511) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `specifications_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specifications`
--

LOCK TABLES `specifications` WRITE;
/*!40000 ALTER TABLE `specifications` DISABLE KEYS */;
INSERT INTO `specifications` VALUES (1,'Voltaje','220 volts',1),(2,'Garantia','2 años',1),(3,'Voltaje','220 volts',2),(4,'Garantia','2 años',2),(5,'Voltaje','220 volts',3),(6,'Garantia','2 años',3),(7,'Voltaje','220 volts',4),(8,'Garantia','2 años',4),(9,'Voltaje','220 volts',5),(10,'Garantia','2 años',5),(11,'Voltaje','220 volts',6),(12,'Garantia','2 años',6),(13,'Voltaje','220 volts',7),(14,'Garantia','2 años',7),(15,'Voltaje','220 volts',8),(16,'Garantia','2 años',8),(17,'Voltaje','220 volts',9),(18,'Garantia','2 años',9),(19,'Voltaje','220 volts',10),(20,'Garantia','2 años',10),(21,'Voltaje','220 volts',11),(22,'Garantia','2 años',11),(23,'Voltaje','220 volts',12),(24,'Garantia','2 años',12),(25,'Voltaje','220 volts',13),(26,'Garantia','2 años',13),(27,'Voltaje','220 volts',14),(28,'Garantia','2 años',14),(29,'Voltaje','220 volts',15),(30,'Garantia','2 años',15),(31,'Voltaje','220 volts',16),(32,'Garantia','2 años',16),(33,'Voltaje','220 volts',17),(34,'Garantia','2 años',17),(35,'Voltaje','220 volts',18),(36,'Garantia','2 años',18),(37,'Voltaje','220 volts',19),(38,'Garantia','2 años',19),(39,'Voltaje','220 volts',20),(40,'Garantia','2 años',20);
/*!40000 ALTER TABLE `specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Apartado en tienda'),(2,'En proceso de envío'),(3,'En tránsito'),(4,'Entregado');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subdepartments`
--

DROP TABLE IF EXISTS `subdepartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subdepartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `subdepartments_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subdepartments`
--

LOCK TABLES `subdepartments` WRITE;
/*!40000 ALTER TABLE `subdepartments` DISABLE KEYS */;
INSERT INTO `subdepartments` VALUES (1,'Partes',1),(2,'Aceites',1),(3,'Decorativos',2),(4,'Seguridad',2),(5,'Protección',2);
/*!40000 ALTER TABLE `subdepartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tills`
--

DROP TABLE IF EXISTS `tills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` double NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `tills_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tills`
--

LOCK TABLES `tills` WRITE;
/*!40000 ALTER TABLE `tills` DISABLE KEYS */;
INSERT INTO `tills` VALUES (1,2350.5,1),(2,1200.5,1),(3,10300,2);
/*!40000 ALTER TABLE `tills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `motor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`),
  KEY `motor_id` (`motor_id`),
  CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`),
  CONSTRAINT `vehicles_ibfk_2` FOREIGN KEY (`motor_id`) REFERENCES `motors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,2011,1,1),(2,2015,2,2),(3,2017,3,2);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'autozone'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `activateHourlyValues` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`admin`@`localhost`*/ /*!50106 EVENT `activateHourlyValues` ON SCHEDULE EVERY 1 DAY STARTS '2018-02-18 04:59:00' ON COMPLETION NOT PRESERVE ENABLE DO ALTER EVENT hourlyValues

        ENABLE */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `deactivateHourlyValues` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`admin`@`localhost`*/ /*!50106 EVENT `deactivateHourlyValues` ON SCHEDULE EVERY 1 DAY STARTS '2018-02-17 23:01:00' ON COMPLETION NOT PRESERVE ENABLE DO ALTER EVENT hourlyValues

        DISABLE */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `hourlyValues` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`admin`@`localhost`*/ /*!50106 EVENT `hourlyValues` ON SCHEDULE EVERY 1 HOUR STARTS '2018-02-17 14:00:00' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN

        START TRANSACTION;

        INSERT INTO salesPerHour(total, created_at) VALUES (getLastHourValue(), NOW());

        COMMIT;

    END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'autozone'
--
/*!50003 DROP FUNCTION IF EXISTS `getCartTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getCartTotal`(cart_id INT) RETURNS float(7,2)
    DETERMINISTIC
BEGIN

    DECLARE total FLOAT(7,2);

    SET total = 0;



    SELECT sum((getValue(p.id, 2, NOW()) * cp.quantity))

    INTO total

    FROM products p, carts c, cart_product cp

    WHERE c.id = cart_id and cp.cart_id = c.id and p.id = cp.product_id;



    RETURN (total);

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getDayValue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getDayValue`(date Date) RETURNS float(7,2)
    DETERMINISTIC
BEGIN

        DECLARE total FLOAT(7,2);

        SET total = 0;



        SELECT SUM(getCartTotal(r.cart_id))

        INTO total

        FROM requisitions r

        WHERE DATE(r.created_at) = date;



        RETURN (total);

    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getDiscount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getDiscount`(product_id INT, branch_id INT, date DATETIME) RETURNS float(7,2)
    DETERMINISTIC
BEGIN

    DECLARE discount FLOAT(7,2);

    SET discount = 0;



    SELECT if(d.price = NULL, 0.0, d.price)

    INTO discount

    FROM branch_discount_product bdp, discounts d

    WHERE bdp.branch_id = 1 and bdp.product_id = 1 and bdp.discount_id = d.id and NOW() >= d.created_at

    GROUP BY bdp.discount_id

    ORDER BY d.created_at desc

    limit 1;



    RETURN (discount);

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getLastHourValue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getLastHourValue`() RETURNS float(7,2)
    DETERMINISTIC
BEGIN
        DECLARE total FLOAT(7,2);
        SET total = 0.0;

        SELECT SUM(getCartTotal(r.cart_id))
        INTO total
        FROM requisitions r
        WHERE r.created_at >= (NOW() - INTERVAL 1 HOUR);

        IF total is NULL THEN
          SET total = 0.0;
        END IF;

        RETURN (total);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getPrice`(product_id INT, branch_id INT, date DATETIME) RETURNS float(7,2)
    DETERMINISTIC
BEGIN

    DECLARE price FLOAT(7,2);

    SET price = 0;



    SELECT if (p.price = NULL, 0.0, p.price)

    INTO price

    FROM branch_price_product bpp, prices p

    WHERE bpp.branch_id = branch_id and bpp.product_id = product_id and bpp.price_id = p.id and date >= p.created_at

    GROUP BY bpp.price_id

    ORDER BY p.created_at desc

    limit 1;



    RETURN (price);

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getPurchaseCartTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getPurchaseCartTotal`(cart_id INT) RETURNS float(7,2)
    DETERMINISTIC
BEGIN

    DECLARE total FLOAT(7,2);

    SET total = 0;



    SELECT sum((getPurchaseValue(p.id, 2, NOW()) * cp.quantity))

    INTO total

    FROM products p, carts c, cart_product cp

    WHERE c.id = cart_id and cp.cart_id = c.id and p.id = cp.product_id;



    RETURN (total);

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getPurchaseValue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getPurchaseValue`(product_id INT, date DATETIME) RETURNS float(7,2)
    DETERMINISTIC
BEGIN

    DECLARE price FLOAT(7,2);

    SET price = 0;



    

    SELECT if (pri.price = NULL, 0.0, pri.price)

    INTO price

    FROM product_provider_price ppp, prices pri, providers pro

    WHERE ppp.product_id = product_id and ppp.provider_id = pro.id and ppp.price_id = pri.id and date >= pri.created_at

    GROUP BY ppp.price_id, ppp.provider_id

    ORDER BY pri.price asc

    limit 1;



    RETURN (price);

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getPurchaseValueId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getPurchaseValueId`(product_id INT, date DATETIME) RETURNS int(11)
    DETERMINISTIC
BEGIN

    DECLARE id INT;

    

    SELECT if (pri.id = NULL, 1, pri.id)

    INTO id

    FROM product_provider_price ppp, prices pri, providers pro

    WHERE ppp.product_id = product_id and ppp.provider_id = pro.id and ppp.price_id = pri.id and date >= pri.created_at

    GROUP BY ppp.price_id, ppp.provider_id

    ORDER BY pri.price asc

    limit 1;



    RETURN (id);

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getValue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` FUNCTION `getValue`(product_id INT, branch_id INT, date DATETIME) RETURNS float(7,2)
    DETERMINISTIC
BEGIN

    DECLARE value FLOAT(7,2);

    

    SET value = getPrice(product_id, branch_id, date) - getDiscount(product_id, branch_id, date);



    RETURN (value);

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCategories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getCategories`()
BEGIN

    SELECT c.id, d.name as department, sd.name as subdepartment, c.name as name, count(p.id) as products

    FROM departments d, subdepartments sd, categories c, products p

    WHERE c.subdepartment_id = sd.id and sd.department_id = d.id and p.category_id = c.id

    GROUP BY c.id

    ORDER BY d.name;

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCompletedRequisitions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`localhost` PROCEDURE `getCompletedRequisitions`(IN branch_id INT)
BEGIN

    SELECT r.id, getCartTotal(r.cart_id) as total, b.name as branch, s.name as status, rs.created_at as completed, c.name as client, pt.name as payment_type, d.name as delivery, r.created_at

    FROM requisitions r, statuses s, requisition_status rs, clients c, payment_types pt, deliveries d, branches b, tills t

    WHERE s.id = rs.status_id and r.id = rs.requisition_id and s.name = "Entregado" and t.branch_id = b.id

          and c.id = r.client_id and pt.id = r.payment_type_id and d.id = r.delivery_id and r.till_id = t.id

          and t.id IN(

            SELECT t.id

            FROM tills t

            WHERE t.branch_id = branch_id)

    ORDER BY rs.created_at;

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-18 22:25:50
