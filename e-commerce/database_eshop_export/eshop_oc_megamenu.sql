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
-- Table structure for table `oc_megamenu`
--

DROP TABLE IF EXISTS `oc_megamenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_megamenu` (
  `megamenu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `is_group` smallint(6) NOT NULL DEFAULT '2',
  `width` varchar(255) DEFAULT NULL,
  `submenu_width` varchar(255) DEFAULT NULL,
  `colum_width` varchar(255) DEFAULT NULL,
  `submenu_colum_width` varchar(255) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `colums` varchar(255) DEFAULT '1',
  `type` varchar(255) NOT NULL,
  `is_content` smallint(6) NOT NULL DEFAULT '2',
  `show_title` smallint(6) NOT NULL DEFAULT '1',
  `type_submenu` varchar(10) NOT NULL DEFAULT '1',
  `level_depth` smallint(6) NOT NULL DEFAULT '0',
  `published` smallint(6) NOT NULL DEFAULT '1',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  `show_sub` smallint(6) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(25) DEFAULT NULL,
  `privacy` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_type` varchar(25) DEFAULT 'top',
  `menu_class` varchar(25) DEFAULT NULL,
  `description` text,
  `content_text` text,
  `submenu_content` text,
  `level` int(11) NOT NULL,
  `left` int(11) NOT NULL,
  `right` int(11) NOT NULL,
  `widget_id` int(11) DEFAULT '0',
  `badges` text,
  PRIMARY KEY (`megamenu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_megamenu`
--

LOCK TABLES `oc_megamenu` WRITE;
/*!40000 ALTER TABLE `oc_megamenu` DISABLE KEYS */;
INSERT INTO `oc_megamenu` VALUES (434,'',1,0,NULL,NULL,NULL,'','','1','url',0,1,'menu',0,1,0,1,0,'index.php?route=common/home',NULL,0,'top','',NULL,'','',0,0,0,0,''),(436,'',442,0,NULL,NULL,NULL,NULL,'34','1','category',2,1,'menu',0,1,0,5,0,NULL,NULL,0,'top',NULL,NULL,NULL,NULL,0,0,0,1,NULL),(437,'',442,0,NULL,NULL,NULL,NULL,'33','1','category',2,1,'menu',0,1,0,3,0,NULL,NULL,0,'top',NULL,NULL,NULL,NULL,0,0,0,1,NULL),(439,'',1,0,'','400px',NULL,NULL,'18','1','category',0,1,'blkbuilder',0,1,0,3,0,'',NULL,0,'top','',NULL,'','',0,0,0,70,''),(440,'',442,0,NULL,NULL,NULL,NULL,'24','1','category',2,1,'menu',0,1,0,1,0,NULL,NULL,0,'top',NULL,NULL,NULL,NULL,0,0,0,1,NULL),(442,'',1,0,'','',NULL,NULL,'20','1','category',0,1,'menu',0,1,0,2,0,'',NULL,0,'top','',NULL,'','',0,0,0,68,''),(446,'',442,0,NULL,NULL,NULL,NULL,'27','1','category',2,1,'menu',0,1,0,2,0,NULL,NULL,0,'top',NULL,NULL,NULL,NULL,0,0,0,1,NULL),(447,'',442,0,NULL,NULL,NULL,NULL,'29','1','category',2,1,'menu',0,1,0,4,0,NULL,NULL,0,'top',NULL,NULL,NULL,NULL,0,0,0,1,NULL),(449,'',442,0,NULL,NULL,NULL,NULL,'31','1','category',2,1,'menu',0,1,0,6,0,NULL,NULL,0,'top',NULL,NULL,NULL,NULL,0,0,0,1,NULL),(450,'',442,0,NULL,NULL,NULL,NULL,'32','1','category',2,1,'menu',0,1,0,7,0,NULL,NULL,0,'top',NULL,NULL,NULL,NULL,0,0,0,1,NULL),(457,'',442,0,NULL,NULL,NULL,NULL,'41','1','category',2,1,'menu',0,1,0,8,0,NULL,NULL,0,'top',NULL,NULL,NULL,NULL,0,0,0,1,NULL),(459,'',1,0,NULL,NULL,NULL,'','39','1','url',0,1,'menu',0,1,0,4,0,'index.php?route=information/contact',NULL,0,'top','',NULL,'','',0,0,0,1,''),(462,'',1,0,NULL,NULL,NULL,'','','1','url',0,1,'menu',0,1,0,5,0,'?route=extension/pavoblog/archive',NULL,0,'top','',NULL,'','',0,0,0,0,''),(464,'',1,0,NULL,NULL,NULL,'','','1','url',0,1,'menu',0,1,0,6,0,'index.php?route=extension/module/pavflashsale',NULL,0,'top','',NULL,'','',0,0,0,0,''),(466,'',1,0,NULL,NULL,NULL,'','','1','url',0,1,'menu',0,1,0,8,0,'index.php?route=extension/module/pavstorelocator',NULL,0,'top','',NULL,'','',0,0,0,0,''),(467,'',1,0,'aligned-fullwidth','700px',NULL,NULL,'','1','url',0,1,'blkbuilder',0,1,0,9,0,'',NULL,0,'top','',NULL,'','',0,0,0,65,'');
/*!40000 ALTER TABLE `oc_megamenu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-28 21:59:33
