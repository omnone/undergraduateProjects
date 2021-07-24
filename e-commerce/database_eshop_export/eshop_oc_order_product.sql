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
-- Table structure for table `oc_order_product`
--

DROP TABLE IF EXISTS `oc_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_product`
--

LOCK TABLES `oc_order_product` WRITE;
/*!40000 ALTER TABLE `oc_order_product` DISABLE KEYS */;
INSERT INTO `oc_order_product` VALUES (1,1,50,'Nike Airmax','nike airmax',1,100.0000,100.0000,0.0000,0),(2,2,50,'Nike Airmax','nike airmax',2,100.0000,200.0000,0.0000,0),(3,2,54,'Air Max Torch 3 Men\'s Running Shoes','model54',1,154.0000,154.0000,0.0000,0),(4,2,57,'Air Max 90 ','model57',1,157.0000,157.0000,0.0000,0),(5,3,50,'Nike Airmax','nike airmax',3,100.0000,300.0000,0.0000,0),(6,4,65,'9 Inch Desert Tan Boots ','model58',1,158.0000,158.0000,0.0000,0),(7,5,70,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(8,6,70,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(9,7,70,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(10,8,70,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(11,9,70,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(12,10,70,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(13,11,70,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(14,12,70,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(15,13,70,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(16,14,70,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(17,15,70,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(18,16,70,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(19,17,70,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(20,18,65,'9 Inch Desert Tan Boots ','model58',1,158.0000,158.0000,0.0000,0),(21,19,131,'Armada English Oxford','model131',1,231.0000,231.0000,0.0000,0),(22,20,70,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(23,20,131,'Armada English Oxford','model131',1,231.0000,231.0000,0.0000,0),(24,21,50,'Nike Airmax','nike airmax',1,100.0000,100.0000,0.0000,0),(25,21,149,'Complete Shoe Cleaning Care Kit','model149',1,20.0000,20.0000,0.0000,0),(26,22,152,'Jason Markk Essential Kit PLUS Repel','model152',1,20.0000,20.0000,0.0000,0),(27,23,65,'9 Inch Desert Tan Boots ','model58',1,158.0000,158.0000,0.0000,0),(28,24,164,'BIRCH\'s Oval Shoelaces 27 Colors Half Round 1/4&quot;','model164',1,3.0000,3.0000,0.0000,0),(29,25,57,'Air Max 90 ','model57',1,157.0000,157.0000,0.0000,0),(30,26,65,'9 Inch Desert Tan Boots ','model58',1,158.0000,158.0000,0.0000,0),(31,27,131,'Armada English Oxford','model131',1,231.0000,231.0000,0.0000,0),(32,27,75,'adidas Stan Smith White Green','model7',1,107.0000,107.0000,0.0000,0),(33,27,131,'Armada English Oxford','model131',1,231.0000,231.0000,0.0000,0),(34,28,54,'Air Max Torch 3 Men\'s Running Shoes','model54',2,154.0000,308.0000,0.0000,0),(35,29,152,'Jason Markk Essential Kit PLUS Repel','model152',1,20.0000,20.0000,0.0000,0),(36,29,158,'Jason Markk Men\'s Repel Shoe Spray 5.4 Oz White ','model158',1,20.0000,20.0000,0.0000,0),(37,29,155,'Jason Markk Premium Shoe Cleaning Brush ','model155',1,20.0000,20.0000,0.0000,0),(38,30,128,'Benero Race Driving Style ','model128',1,228.0000,228.0000,0.0000,0),(39,31,65,'9 Inch Desert Tan Boots ','model58',1,158.0000,158.0000,0.0000,0),(40,32,162,'BIRCH\'s Oval Shoelaces 27 Colors Half Round 1/4&quot;','model162',1,3.0000,3.0000,0.0000,0),(41,32,167,'BIRCH\'s Oval Shoelaces 27 Colors Half Round 1/4&quot;','model167',1,3.0000,3.0000,0.0000,0),(42,32,168,'BIRCH\'s Oval Shoelaces 27 Colors Half Round 1/4&quot;','model168',1,3.0000,3.0000,0.0000,0),(43,33,65,'9 Inch Desert Tan Boots ','model58',1,158.0000,158.0000,0.0000,0),(44,33,165,'BIRCH\'s Oval Shoelaces 27 Colors Half Round 1/4&quot;','model165',1,3.0000,3.0000,0.0000,0),(45,33,168,'BIRCH\'s Oval Shoelaces 27 Colors Half Round 1/4&quot;','model168',1,3.0000,3.0000,0.0000,0),(46,33,149,'Complete Shoe Cleaning Care Kit','model149',1,20.0000,20.0000,0.0000,0),(47,34,162,'BIRCH\'s Oval Shoelaces 27 Colors Half Round 1/4&quot;','model162',1,3.0000,3.0000,0.0000,0),(48,34,168,'BIRCH\'s Oval Shoelaces 27 Colors Half Round 1/4&quot;','model168',1,3.0000,3.0000,0.0000,0),(49,35,57,'Air Max 90 ','model57',1,157.0000,157.0000,0.0000,0),(50,36,150,'Jason Markk Premium Shoe Cleaner Starter Kit ','model150',1,20.0000,20.0000,0.0000,0),(51,36,152,'Jason Markk Essential Kit PLUS Repel','model152',1,20.0000,20.0000,0.0000,0);
/*!40000 ALTER TABLE `oc_order_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-28 21:59:32
