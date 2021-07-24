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
-- Table structure for table `oc_megamenu_description`
--

DROP TABLE IF EXISTS `oc_megamenu_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_megamenu_description` (
  `megamenu_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`megamenu_id`,`language_id`),
  KEY `name` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_megamenu_description`
--

LOCK TABLES `oc_megamenu_description` WRITE;
/*!40000 ALTER TABLE `oc_megamenu_description` DISABLE KEYS */;
INSERT INTO `oc_megamenu_description` VALUES (466,2,'Location',''),(466,1,'Location',''),(434,2,'Home',''),(434,1,'Home',''),(436,1,'Asos a-list',''),(436,2,'Asos a-list',''),(437,1,'Halloween',''),(437,2,'Halloween',''),(439,2,'Promotions',''),(439,1,'Promotions',''),(440,1,'Jeans',''),(440,2,'Jeans',''),(442,1,'Shop',''),(442,2,'Shop',''),(446,1,'Women',''),(446,2,'Women',''),(447,1,'Polo Shirts',''),(447,2,'Polo Shirts',''),(449,1,'Scanners',''),(449,2,'Scanners',''),(450,1,'Joggers',''),(450,2,'Joggers',''),(457,1,'Elesse',''),(457,2,'Elesse',''),(459,1,'Contact',''),(459,2,'Contact',''),(467,1,'Megamenu',''),(462,2,'Blogs',''),(462,1,'Blogs',''),(464,1,'Deals',''),(464,2,'Deals',''),(467,2,'Megamenu','');
/*!40000 ALTER TABLE `oc_megamenu_description` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-28 21:59:36
