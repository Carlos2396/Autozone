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
INSERT INTO `branch_price_product` VALUES (1,1,1),(1,2,1),(2,3,1),(1,4,2),(1,5,2),(2,6,2),(1,7,3),(1,8,3),(2,9,3),(1,10,4),(1,11,4),(2,12,4),(1,13,5),(1,14,5),(2,15,5),(1,16,6),(1,17,6),(2,18,6),(1,19,7),(1,20,7),(2,21,7),(1,22,8),(1,23,8),(2,24,8),(1,25,9),(1,26,9),(2,27,9),(1,28,10),(1,29,10),(2,30,10);
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
INSERT INTO `branch_product` VALUES (10,1,1),(10,1,2),(10,1,3),(10,1,4),(10,1,6),(10,1,7),(10,1,8),(10,1,9),(10,1,10),(5,2,1),(5,2,2),(5,2,3),(5,2,4),(5,2,5),(5,2,6),(5,2,7),(5,2,8),(5,2,9),(5,2,10);
/*!40000 ALTER TABLE `branch_product` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'VW'),(2,'BMW'),(3,'Mazda'),(4,'LTH'),(5,'Roshfranz'),(6,'Michelin'),(7,'OEM'),(8,'Quaker state');
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
INSERT INTO `cart_product` VALUES (1,2,3),(1,3,4),(1,5,1),(2,7,3),(2,9,1),(3,10,10);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,1),(2,2),(3,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Luces',1),(2,'Baleros',1),(3,'De motor',2),(4,'Genericos',2),(5,'Aromatizantes',3),(6,'Vinilos',3),(7,'Bastones',4),(8,'Controles a distancia',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Endy Flores','1952-10-20','endy@gmail.com','2295638417','secret'),(2,'Rosa Paredes','1978-10-20','rosa@gmail.com','2221639845','secret'),(3,'JM González Calleros','1970-05-17','jmgc@gmail.com','2221458596','secret');
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
INSERT INTO `discounts` VALUES (1,85,'2018-02-07 20:26:00'),(2,45,'2018-02-07 20:26:00'),(3,190,'2018-02-07 20:26:00'),(4,280,'2018-02-07 20:26:00'),(5,135,'2018-02-07 20:26:00'),(6,85,'2018-02-07 20:26:00'),(7,45,'2018-02-07 20:26:00'),(8,190,'2018-02-07 20:26:00'),(9,280,'2018-02-07 20:26:00'),(10,135,'2018-02-07 20:26:00');
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
INSERT INTO `employees` VALUES (1,'Dan Perez','1975-05-10','danperez@itesm.mx','2224778563','secret','2018-02-05 20:26:00','',2,1),(2,'Alberto Oliart','1970-05-10','aoliart@itesm.mx','2224789563','secret','2018-02-05 20:26:00','',1,1),(3,'Juan Calleros','1978-05-10','jmcalleros@itesm.mx','2224781563','secret','2018-02-05 20:26:00','',1,2),(4,'David Sol','1965-05-10','dsol@itesm.mx','2224789514','secret','2018-02-05 20:26:00','',1,2),(5,'Alberto Palomares','1980-05-10','apalomares@itesm.mx','2224789203','secret','2018-02-05 20:26:00','',1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'images/1a.jpg',1),(2,'images/1b.jpg',1),(3,'images/2a.jpg',2),(4,'images/2b.jpg',2),(5,'images/3a.jpg',3),(6,'images/4a.jpg',4),(7,'images/5a.jpg',5),(8,'images/6a.jpg',6),(9,'images/7a.jpg',7),(10,'images/8a.jpg',8),(11,'images/9a.jpg',9),(12,'images/10a.jpg',10);
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
INSERT INTO `model_product` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,3),(1,4),(2,4),(2,5),(1,6),(3,6),(2,7),(3,8),(1,9),(2,9),(3,9),(1,10),(2,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,90,'2018-02-05 20:26:00'),(2,100,'2018-02-07 20:26:00'),(3,110,'2018-02-05 20:26:00'),(4,50,'2018-02-05 20:26:00'),(5,55,'2018-02-07 20:26:00'),(6,60,'2018-02-05 20:26:00'),(7,200,'2018-02-05 20:26:00'),(8,220,'2018-02-07 20:26:00'),(9,225,'2018-02-05 20:26:00'),(10,300,'2018-02-05 20:26:00'),(11,330,'2018-02-07 20:26:00'),(12,320,'2018-02-05 20:26:00'),(13,150,'2018-02-05 20:26:00'),(14,160,'2018-02-07 20:26:00'),(15,155,'2018-02-05 20:26:00'),(16,90,'2018-02-05 20:26:00'),(17,100,'2018-02-07 20:26:00'),(18,110,'2018-02-05 20:26:00'),(19,50,'2018-02-05 20:26:00'),(20,55,'2018-02-07 20:26:00'),(21,60,'2018-02-05 20:26:00'),(22,200,'2018-02-05 20:26:00'),(23,220,'2018-02-07 20:26:00'),(24,225,'2018-02-05 20:26:00'),(25,300,'2018-02-05 20:26:00'),(26,330,'2018-02-07 20:26:00'),(27,320,'2018-02-05 20:26:00'),(28,150,'2018-02-05 20:26:00'),(29,160,'2018-02-07 20:26:00'),(30,155,'2018-02-05 20:26:00'),(31,70,'2018-02-05 20:26:00'),(32,35,'2018-02-05 20:26:00'),(33,150,'2018-02-05 20:26:00'),(34,220,'2018-02-05 20:26:00'),(35,120,'2018-02-05 20:26:00'),(36,70,'2018-02-05 20:26:00'),(37,35,'2018-02-05 20:26:00'),(38,150,'2018-02-05 20:26:00'),(39,220,'2018-02-05 20:26:00'),(40,120,'2018-02-05 20:26:00'),(41,72,'2018-02-05 20:26:00'),(42,33,'2018-02-05 20:26:00'),(43,152,'2018-02-05 20:26:00'),(44,217,'2018-02-05 20:26:00'),(45,122,'2018-02-05 20:26:00'),(46,72,'2018-02-05 20:26:00'),(47,33,'2018-02-05 20:26:00'),(48,152,'2018-02-05 20:26:00'),(49,217,'2018-02-05 20:26:00'),(50,122,'2018-02-05 20:26:00');
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
INSERT INTO `product_provider_price` VALUES (31,1,1),(33,1,3),(35,1,5),(37,1,7),(39,1,9),(32,2,2),(34,2,4),(36,2,6),(38,2,8),(40,2,10),(41,3,1),(43,3,3),(45,3,5),(47,3,7),(49,3,9),(42,4,2),(44,4,4),(46,4,6),(48,4,8),(50,4,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1234,'Faros de halogeno','Faros para automovil ...',4,1),(2,1235,'Faros de niebla','Faros para automovil ...',4,1),(3,1236,'Baleros profesionales','Baleros para automovil ...',7,2),(4,1237,'Aceite estandar','Aceite para automovil ...',5,3),(5,1238,'Aceite protector','Aceite protector para automovil ...',5,4),(6,1239,'Aceite para bizagras','Aceite para bizagras de automovil ...',5,4),(7,1241,'Aromatizante de pino','Aromatizante para automovil ...',8,5),(8,1242,'Vinilos de parabrizas','Vinilos de parabrizas para automovil ...',7,6),(9,1243,'Bastones para volante','Bastones para volante para automovil ...',6,7),(10,1249,'Controles de puertas','Controles de puertas para automovil ...',5,8);
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
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  KEY `price_id` (`price_id`),
  KEY `product_id` (`product_id`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`price_id`) REFERENCES `prices` (`id`),
  CONSTRAINT `purchases_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `purchases_ibfk_4` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,5,1,31,1,1),(2,12,1,45,5,3);
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
INSERT INTO `requisition_status` VALUES ('2018-02-05 20:26:01',1,4),('2018-02-05 20:26:01',2,4),('2018-02-05 20:26:01',3,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisitions`
--

LOCK TABLES `requisitions` WRITE;
/*!40000 ALTER TABLE `requisitions` DISABLE KEYS */;
INSERT INTO `requisitions` VALUES (1,'2018-02-05 20:26:01',1,1,1,1,3),(2,'2018-02-05 20:26:01',2,2,1,3,3),(3,'2018-02-05 20:26:01',3,3,2,2,3);
/*!40000 ALTER TABLE `requisitions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specifications`
--

LOCK TABLES `specifications` WRITE;
/*!40000 ALTER TABLE `specifications` DISABLE KEYS */;
INSERT INTO `specifications` VALUES (1,'Voltaje','220 volts',1),(2,'Garantia','2 años',1),(3,'Voltaje','220 volts',2),(4,'Garantia','2 años',2),(5,'Voltaje','220 volts',3),(6,'Garantia','2 años',3),(7,'Voltaje','220 volts',4),(8,'Garantia','2 años',4),(9,'Voltaje','220 volts',5),(10,'Garantia','2 años',5),(11,'Voltaje','220 volts',6),(12,'Garantia','2 años',6),(13,'Voltaje','220 volts',7),(14,'Garantia','2 años',7),(15,'Voltaje','220 volts',8),(16,'Garantia','2 años',8),(17,'Voltaje','220 volts',9),(18,'Garantia','2 años',9),(19,'Voltaje','220 volts',10),(20,'Garantia','2 años',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subdepartments`
--

LOCK TABLES `subdepartments` WRITE;
/*!40000 ALTER TABLE `subdepartments` DISABLE KEYS */;
INSERT INTO `subdepartments` VALUES (1,'Partes',1),(2,'Aceites',1),(3,'Decorativos',2),(4,'Seguridad',2);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-05 20:29:08
