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
-- Table structure for table `oc_pavoblog_comment`
--

DROP TABLE IF EXISTS `oc_pavoblog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_pavoblog_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_title` varchar(255) DEFAULT NULL,
  `comment_email` varchar(96) NOT NULL,
  `comment_post_id` int(11) NOT NULL,
  `comment_user_id` int(11) NOT NULL DEFAULT '0',
  `comment_customer_id` int(11) NOT NULL DEFAULT '0',
  `comment_name` varchar(64) NOT NULL,
  `comment_text` text NOT NULL,
  `comment_rating` int(1) NOT NULL,
  `comment_status` tinyint(1) NOT NULL DEFAULT '0',
  `comment_parent_id` int(11) NOT NULL DEFAULT '0',
  `comment_subscribe` tinyint(1) NOT NULL DEFAULT '0',
  `comment_store_id` int(11) NOT NULL DEFAULT '0',
  `comment_language_id` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comment_post_id` (`comment_post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_pavoblog_comment`
--

LOCK TABLES `oc_pavoblog_comment` WRITE;
/*!40000 ALTER TABLE `oc_pavoblog_comment` DISABLE KEYS */;
INSERT INTO `oc_pavoblog_comment` VALUES (1,'test comments','Musa@gmail.com',2,0,0,'Musa','El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las letras, al contrario de usar textos como por ejemplo “Contenido aquí, contenido aquí”. Estos textos hacen parecerlo un español que se puede leer.\r\n',0,1,0,0,0,1,'2017-11-16 10:45:25','2017-11-16 10:45:25'),(2,'test comments','obama@gmail.com',6,0,0,'Obama','Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur mag Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur mag',0,0,0,0,0,1,'2017-11-23 08:54:04','2017-11-23 08:54:04'),(3,'','obama@gmail.com',4,0,0,'Obama','Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur mag Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur mag',0,1,0,0,0,1,'2017-11-23 08:54:04','2017-11-23 08:54:04'),(4,'test comments','Trump@gmail.com',6,0,0,'Trump','Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur mag Commodo laoreet semper tincidunt lorem Vestibulum nunc at In Curabitur mag',0,1,0,0,0,1,'2017-11-23 08:54:40','2017-11-23 08:54:40'),(5,'Nice blogpost','demo@gmail.com',8,0,0,'Hahami','Thanks for your Blog. It is very useful for me',0,1,0,0,0,1,'2017-12-04 14:46:54','2017-12-04 14:46:54');
/*!40000 ALTER TABLE `oc_pavoblog_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-28 21:59:29
