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
-- Table structure for table `oc_order_option`
--

DROP TABLE IF EXISTS `oc_order_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_option`
--

LOCK TABLES `oc_order_option` WRITE;
/*!40000 ALTER TABLE `oc_order_option` DISABLE KEYS */;
INSERT INTO `oc_order_option` VALUES (1,4,6,13,668,'Size','44.5','select'),(2,5,7,14,209,'Size','46','select'),(3,6,8,14,209,'Size','46','select'),(4,7,9,14,209,'Size','46','select'),(5,8,10,14,209,'Size','46','select'),(6,9,11,14,209,'Size','46','select'),(7,10,12,14,209,'Size','46','select'),(8,11,13,14,209,'Size','46','select'),(9,12,14,14,209,'Size','46','select'),(10,13,15,14,209,'Size','46','select'),(11,14,16,14,209,'Size','46','select'),(12,15,17,14,209,'Size','46','select'),(13,16,18,14,209,'Size','46','select'),(14,17,19,14,209,'Size','46','select'),(15,18,20,13,669,'Size','45.5','select'),(16,19,21,46,1092,'Size','46','select'),(17,20,22,14,207,'Size','45','select'),(18,20,23,46,1086,'Size','43','select'),(19,21,24,1,583,'Size','43.5','select'),(20,23,27,13,182,'Size','40','select'),(21,25,29,6,81,'Size','42','select'),(22,26,30,13,669,'Size','45.5','select'),(23,27,31,46,1092,'Size','46','select'),(24,27,32,19,707,'Size','41.5','select'),(25,27,33,46,1085,'Size','42.5','select'),(26,28,34,3,594,'Size','40.5','select'),(27,30,38,43,1043,'Size','44','select'),(28,31,39,13,190,'Size','44','select'),(29,33,43,13,192,'Size','45','select'),(30,35,49,6,620,'Size','45.5','select');
/*!40000 ALTER TABLE `oc_order_option` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-28 21:59:30
