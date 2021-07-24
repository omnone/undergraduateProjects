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
-- Table structure for table `oc_customer`
--

DROP TABLE IF EXISTS `oc_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer`
--

LOCK TABLES `oc_customer` WRITE;
/*!40000 ALTER TABLE `oc_customer` DISABLE KEYS */;
INSERT INTO `oc_customer` VALUES (3,3,0,1,'Nikos','Papadopoulos','papad86@gmail.com','6978676868','','d475765bfde541c2dbe0f62611765eee7ea7fb32','BwVo7mZQ5','','0',1,7,'[]','::1',1,0,'','','2018-08-13 20:51:13'),(7,3,0,1,'Γιώργος','Ιωάννου','gioan@mail.com','6984753454','','5aab4b62ad9de7078f70849f5c9d649ccbe38f3e','sJfoDfxs8',NULL,NULL,0,2,'[]','::1',1,0,'','','2018-08-13 20:56:19'),(5,2,0,1,'Joe','Doe','doej@gmail.com','6985868674','','943bbe05d16a4e1ce2a2797c72b3046253ebf486','3E4WJwPYW','','0',0,4,'[]','::1',1,0,'','','2018-08-13 20:55:05'),(1,3,0,1,'Kostas','Bourantas','kbouradas@gmail.com','2016212739','','35f320fb345a2dba6aae620cf6397d8e17ca49a6','63gMfxbaR','','0',0,6,'[]','::1',1,0,'','','2018-07-10 18:01:16'),(4,2,0,1,'Katerina','Papadopoulou','katerina86@hotmail.com','6989765435','','76ef85c6f6fbbbff7ca8b3b03508ae15eda2753b','grzYJ5O4Q','','0',0,5,'[]','::1',1,0,'','','2018-08-13 20:52:19'),(2,2,0,1,'Hlektra','Mekra','mek@mail.com','21029291','','939c2628de1d478b6f84b1b05620417eec21444c','N7H3Q3XmI','','0',0,0,'[]','::1',1,0,'','V8XmQQ1hVJkHQiXzf5Jm2HqaoTEsdQtt5oJvu71T','2018-07-11 15:14:12');
/*!40000 ALTER TABLE `oc_customer` ENABLE KEYS */;
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
