-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: eshop
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `oc_product_attribute`
--

DROP TABLE IF EXISTS `oc_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_attribute`
--

LOCK TABLES `oc_product_attribute` WRITE;
/*!40000 ALTER TABLE `oc_product_attribute` DISABLE KEYS */;
INSERT INTO `oc_product_attribute` VALUES (65,12,1,'yellow'),(50,12,1,'white'),(50,13,1,'leather'),(53,12,1,'brown'),(53,13,1,'suede'),(54,12,1,'blue'),(54,13,1,'leather'),(55,12,1,'brown'),(55,13,1,'leather'),(56,12,1,'brown'),(56,13,1,'fabric'),(57,12,1,'black'),(57,13,1,'leather'),(58,12,1,'brown'),(58,13,1,'plastic'),(60,12,1,'yellow'),(60,13,1,'fabric'),(61,12,1,'black'),(61,13,1,'suede'),(62,12,1,'green'),(62,13,1,'fabric'),(63,12,1,'red'),(63,13,1,'plastic'),(64,12,1,'red'),(64,13,1,'suede'),(65,13,1,'leather'),(70,12,1,'black'),(70,13,1,'leather'),(71,12,1,'blue'),(71,13,1,'plastic'),(72,12,1,'pink'),(72,13,1,'leather'),(73,12,1,'black'),(73,13,1,'fabric'),(74,12,1,'brown'),(74,13,1,'fabric'),(75,12,1,'green'),(75,13,1,'plastic'),(124,12,1,'yellow'),(124,13,1,'plastic'),(125,12,1,'white'),(125,13,1,'leather'),(126,12,1,'red'),(126,13,1,'leather'),(127,12,1,'red'),(127,13,1,'suede'),(128,12,1,'pink'),(128,13,1,'plastic'),(129,12,1,'white'),(129,13,1,'leather'),(130,12,1,'yellow'),(130,13,1,'suede'),(131,12,1,'blue'),(131,13,1,'fabric'),(132,12,1,'blue'),(132,13,1,'suede'),(133,12,1,'white'),(133,13,1,'fabric'),(134,12,1,'yellow'),(134,13,1,'plastic'),(140,12,1,'pink'),(140,13,1,'suede'),(141,12,1,'green'),(141,13,1,'plastic'),(142,12,1,'red'),(142,13,1,'plastic'),(143,12,1,'green'),(143,13,1,'leather'),(144,12,1,'yellow'),(144,13,1,'fabric'),(145,12,1,'green'),(145,13,1,'plastic'),(146,12,1,'green'),(146,13,1,'fabric'),(147,12,1,'white'),(147,13,1,'suede'),(149,12,1,'green'),(149,13,1,'fabric'),(150,12,1,'brown'),(150,13,1,'leather'),(151,12,1,'yellow'),(151,13,1,'leather'),(152,12,1,'black'),(152,13,1,'plastic'),(153,12,1,'black'),(153,13,1,'fabric'),(154,12,1,'black'),(154,13,1,'fabric'),(155,12,1,'yellow'),(155,13,1,'fabric'),(156,12,1,'blue'),(156,13,1,'leather'),(157,12,1,'yellow'),(157,13,1,'fabric'),(158,12,1,'green'),(158,13,1,'plastic'),(159,12,1,'yellow'),(159,13,1,'fabric'),(160,12,1,'blue'),(160,13,1,'plastic'),(161,12,1,'green'),(161,13,1,'suede'),(162,12,1,'pink'),(162,13,1,'suede'),(163,12,1,'red'),(163,13,1,'suede'),(164,12,1,'blue'),(164,13,1,'suede'),(165,12,1,'yellow'),(165,13,1,'suede'),(166,12,1,'yellow'),(166,13,1,'suede'),(167,12,1,'yellow'),(167,13,1,'leather'),(168,12,1,'red'),(168,13,1,'plastic');
/*!40000 ALTER TABLE `oc_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-28 21:59:34
