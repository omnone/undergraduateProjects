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
-- Table structure for table `oc_api_session`
--

DROP TABLE IF EXISTS `oc_api_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_api_session`
--

LOCK TABLES `oc_api_session` WRITE;
/*!40000 ALTER TABLE `oc_api_session` DISABLE KEYS */;
INSERT INTO `oc_api_session` VALUES (12,1,'cda78c31ce7f1b04a76e1a2148','::1','2018-08-27 23:47:11','2018-08-27 23:47:11'),(11,1,'2ab32af5af7da3dd475c41d2f8','::1','2018-08-27 23:46:57','2018-08-27 23:47:03'),(10,1,'3fb1db54afecd4170c306616fd','::1','2018-08-27 23:46:55','2018-08-27 23:46:55'),(13,1,'146d0fd679b9d77752783d6048','::1','2018-08-27 23:47:24','2018-08-27 23:47:24'),(14,1,'aa6d567af3617ef4bd9a3b187b','::1','2018-08-27 23:47:28','2018-08-27 23:47:42'),(15,1,'3cb63724420f7450202b27715f','::1','2018-08-27 23:47:46','2018-08-27 23:47:46'),(16,1,'04fc429d9b9b253c5f932d239c','::1','2018-08-27 23:48:02','2018-08-27 23:48:13'),(17,1,'7865511771d6241cf406cdccd4','::1','2018-08-27 23:48:18','2018-08-27 23:48:18'),(18,1,'98ae7b2ea32a7c728d216b950d','::1','2018-08-27 23:48:21','2018-08-27 23:48:21'),(19,1,'e8640ce458697743e9711ae3f6','::1','2018-08-27 23:48:23','2018-08-27 23:48:23'),(20,1,'9f8e7b8b848e5cce6b8b99fa6b','::1','2018-08-27 23:48:24','2018-08-27 23:48:33'),(21,1,'81f3c9d41fb5c80185b89d13e8','::1','2018-08-27 23:48:36','2018-08-27 23:48:36'),(22,1,'0e39d8f7f777cd17696e205fde','::1','2018-08-27 23:48:40','2018-08-27 23:48:40'),(23,1,'c2dbf6522b8aaf7cfe48a7cd4a','::1','2018-08-27 23:48:44','2018-08-27 23:48:44'),(24,1,'d2e1f871458cfaa39a9a1c6ccf','::1','2018-08-27 23:48:48','2018-08-27 23:48:48'),(25,1,'d175391f7d175ce1f9ea71dc95','::1','2018-08-27 23:49:01','2018-08-27 23:49:01'),(26,1,'964bd808f3cc889c2457dcbd17','::1','2018-08-27 23:49:04','2018-08-27 23:49:04'),(27,1,'491f551f3de748655d03a5bee9','::1','2018-08-27 23:51:32','2018-08-27 23:51:32'),(28,1,'8d9ffe67a39872a9339394484d','::1','2018-08-27 23:52:08','2018-08-27 23:52:14'),(29,1,'7f00a35969404b80e9d8ebffa5','::1','2018-08-27 23:52:17','2018-08-27 23:52:17'),(30,1,'005fdea6c0fdd1f44fc0247ec4','::1','2018-08-27 23:52:20','2018-08-27 23:52:26'),(31,1,'e836ec9eae0f3f898e1268bad2','::1','2018-08-28 21:22:58','2018-08-28 21:22:58');
/*!40000 ALTER TABLE `oc_api_session` ENABLE KEYS */;
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
