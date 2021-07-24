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
-- Table structure for table `oc_pavoblog_post`
--

DROP TABLE IF EXISTS `oc_pavoblog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_pavoblog_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `gallery` text,
  `video` varchar(255) DEFAULT NULL,
  `viewed` int(5) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_pavoblog_post`
--

LOCK TABLES `oc_pavoblog_post` WRITE;
/*!40000 ALTER TABLE `oc_pavoblog_post` DISABLE KEYS */;
INSERT INTO `oc_pavoblog_post` VALUES (1,'catalog/demo/blogs/blogs1.jpg','[]','',0,1,1,1,'image','2017-11-08 00:00:00','2017-11-23 16:13:50'),(2,'catalog/demo/blogs/blogs2.jpg','[]','',0,1,1,1,'image','2017-11-10 00:00:00','2017-11-27 10:32:26'),(3,'catalog/demo/blogs/blogs3.jpg','[]','',0,1,1,1,'image','2017-11-10 00:00:00','2017-11-23 16:14:47'),(4,'catalog/demo/blogs/blogs4.jpg','[]','',0,1,1,1,'image','2017-11-10 00:00:00','2017-11-27 10:30:05'),(5,'catalog/demo/blogs/blogs5.jpg','[]','',0,1,1,1,'image','2017-11-10 00:00:00','2017-11-27 15:11:00'),(6,'catalog/demo/blogs/blogs7.jpg','[]','',0,1,1,1,'image','2017-11-10 00:00:00','2017-11-23 16:12:58'),(7,'catalog/demo/blogs/blogs6.jpg','[]','',0,1,1,1,'image','2017-11-10 00:00:00','2017-11-23 16:13:22'),(8,'catalog/demo/blogs/blogs8.jpg','[]','',0,1,1,2,'image','2017-11-11 00:00:00','2017-12-07 13:42:09');
/*!40000 ALTER TABLE `oc_pavoblog_post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-28 21:59:37
