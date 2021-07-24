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
-- Table structure for table `oc_order_total`
--

DROP TABLE IF EXISTS `oc_order_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_total`
--

LOCK TABLES `oc_order_total` WRITE;
/*!40000 ALTER TABLE `oc_order_total` DISABLE KEYS */;
INSERT INTO `oc_order_total` VALUES (1,1,'sub_total','Sub-Total',100.0000,1),(2,1,'shipping','Flat Shipping Rate',5.0000,3),(3,1,'total','Total',105.0000,9),(4,2,'sub_total','Sub-Total',511.0000,1),(5,2,'shipping','Flat Shipping Rate',5.0000,3),(6,2,'total','Total',516.0000,9),(7,3,'sub_total','Sub-Total',300.0000,1),(8,3,'shipping','Flat Shipping Rate',5.0000,3),(9,3,'total','Total',305.0000,9),(10,4,'sub_total','Sub-Total',158.0000,1),(11,4,'shipping','Flat Shipping Rate',5.0000,3),(12,4,'total','Total',163.0000,9),(13,5,'sub_total','Sub-Total',107.0000,1),(14,5,'shipping','Flat Shipping Rate',5.0000,3),(15,5,'total','Total',112.0000,9),(16,6,'sub_total','Sub-Total',107.0000,1),(17,6,'shipping','Flat Shipping Rate',5.0000,3),(18,6,'total','Total',112.0000,9),(19,7,'sub_total','Sub-Total',107.0000,1),(20,7,'shipping','Flat Shipping Rate',5.0000,3),(21,7,'total','Total',112.0000,9),(22,8,'sub_total','Sub-Total',107.0000,1),(23,8,'shipping','Flat Shipping Rate',5.0000,3),(24,8,'total','Total',112.0000,9),(25,9,'sub_total','Sub-Total',107.0000,1),(26,9,'shipping','Flat Shipping Rate',5.0000,3),(27,9,'total','Total',112.0000,9),(28,10,'sub_total','Sub-Total',107.0000,1),(29,10,'shipping','Flat Shipping Rate',5.0000,3),(30,10,'total','Total',112.0000,9),(31,11,'sub_total','Sub-Total',107.0000,1),(32,11,'shipping','Flat Shipping Rate',5.0000,3),(33,11,'total','Total',112.0000,9),(34,12,'sub_total','Sub-Total',107.0000,1),(35,12,'shipping','Flat Shipping Rate',5.0000,3),(36,12,'total','Total',112.0000,9),(37,13,'sub_total','Sub-Total',107.0000,1),(38,13,'shipping','Flat Shipping Rate',5.0000,3),(39,13,'total','Total',112.0000,9),(40,14,'sub_total','Sub-Total',107.0000,1),(41,14,'shipping','Flat Shipping Rate',5.0000,3),(42,14,'total','Total',112.0000,9),(43,15,'sub_total','Sub-Total',107.0000,1),(44,15,'shipping','Flat Shipping Rate',5.0000,3),(45,15,'total','Total',112.0000,9),(46,16,'sub_total','Sub-Total',107.0000,1),(47,16,'shipping','Flat Shipping Rate',5.0000,3),(48,16,'total','Total',112.0000,9),(49,17,'sub_total','Sub-Total',107.0000,1),(50,17,'shipping','Flat Shipping Rate',5.0000,3),(51,17,'total','Total',112.0000,9),(52,18,'sub_total','Sub-Total',158.0000,1),(53,18,'shipping','Flat Shipping Rate',5.0000,3),(54,18,'coupon','Coupon (1337)',-31.6000,4),(55,18,'total','Total',131.4000,9),(56,19,'sub_total','Sub-Total',231.0000,1),(57,19,'shipping','Flat Shipping Rate',5.0000,3),(58,19,'total','Total',236.0000,9),(59,20,'sub_total','Sub-Total',338.0000,1),(60,20,'shipping','Flat Shipping Rate',5.0000,3),(61,20,'coupon','Coupon (summer20)',-67.6000,4),(62,20,'total','Total',275.4000,9),(63,21,'sub_total','Sub-Total',120.0000,1),(64,21,'shipping','Flat Shipping Rate',5.0000,3),(65,21,'total','Total',125.0000,9),(66,22,'sub_total','Sub-Total',20.0000,1),(67,22,'shipping','Flat Shipping Rate',5.0000,3),(68,22,'total','Total',25.0000,9),(69,23,'sub_total','Sub-Total',158.0000,1),(70,23,'shipping','Flat Shipping Rate',5.0000,3),(71,23,'coupon','Coupon (summer20)',-31.6000,4),(72,23,'total','Total',131.4000,9),(73,24,'sub_total','Sub-Total',3.0000,1),(74,24,'shipping','Flat Shipping Rate',5.0000,3),(75,24,'total','Total',8.0000,9),(76,25,'sub_total','Sub-Total',157.0000,1),(77,25,'shipping','Flat Shipping Rate',5.0000,3),(78,25,'coupon','Coupon (summer20)',-31.4000,4),(79,25,'total','Total',130.6000,9),(80,26,'sub_total','Sub-Total',158.0000,1),(81,26,'shipping','Flat Shipping Rate',5.0000,3),(82,26,'coupon','Coupon (summer20)',-31.6000,4),(83,26,'total','Total',131.4000,9),(84,27,'sub_total','Sub-Total',569.0000,1),(85,27,'shipping','Flat Shipping Rate',5.0000,3),(86,27,'coupon','Coupon (summer20)',-113.8000,4),(87,27,'total','Total',460.2000,9),(88,28,'sub_total','Sub-Total',308.0000,1),(89,28,'shipping','Flat Shipping Rate',5.0000,3),(90,28,'total','Total',313.0000,9),(91,29,'sub_total','Sub-Total',60.0000,1),(92,29,'shipping','Flat Shipping Rate',5.0000,3),(93,29,'coupon','Coupon (summer20)',-12.0000,4),(94,29,'total','Total',53.0000,9),(95,30,'sub_total','Sub-Total',228.0000,1),(96,30,'shipping','Flat Shipping Rate',5.0000,3),(97,30,'coupon','Coupon (summer20)',-45.6000,4),(98,30,'total','Total',187.4000,9),(99,31,'sub_total','Sub-Total',158.0000,1),(100,31,'shipping','Flat Shipping Rate',5.0000,3),(101,31,'coupon','Coupon (summer20)',-31.6000,4),(102,31,'total','Total',131.4000,9),(103,32,'sub_total','Sub-Total',9.0000,1),(104,32,'shipping','Flat Shipping Rate',5.0000,3),(105,32,'total','Total',14.0000,9),(106,33,'sub_total','Sub-Total',184.0000,1),(107,33,'shipping','Flat Shipping Rate',5.0000,3),(108,33,'total','Total',189.0000,9),(109,34,'sub_total','Sub-Total',6.0000,1),(110,34,'shipping','Flat Shipping Rate',5.0000,3),(111,34,'coupon','Coupon (summer20)',-1.2000,4),(112,34,'total','Total',9.8000,9),(113,35,'sub_total','Sub-Total',157.0000,1),(114,35,'shipping','Flat Shipping Rate',5.0000,3),(115,35,'coupon','Coupon (summer20)',-31.4000,4),(116,35,'total','Total',130.6000,9),(117,36,'sub_total','Sub-Total',40.0000,1),(118,36,'shipping','Flat Shipping Rate',5.0000,3),(119,36,'coupon','Coupon (summer20)',-8.0000,4),(120,36,'total','Total',37.0000,9);
/*!40000 ALTER TABLE `oc_order_total` ENABLE KEYS */;
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
