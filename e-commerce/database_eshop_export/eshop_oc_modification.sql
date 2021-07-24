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
-- Table structure for table `oc_modification`
--

DROP TABLE IF EXISTS `oc_modification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_modification`
--

LOCK TABLES `oc_modification` WRITE;
/*!40000 ALTER TABLE `oc_modification` DISABLE KEYS */;
INSERT INTO `oc_modification` VALUES (1,1,'TMD Footer Module','#OFM07','TMD(opencartextensions.in)','3.x','http://opencartextensions.in/','<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n	<name>TMD Footer Module</name>\n	<version>3.x</version>\n	<code>#OFM07</code>\n	<author>TMD(opencartextensions.in)</author>\n	<link>http://opencartextensions.in/</link>\n	\n	<file path=\"admin/language/*/common/column_left.php\">\n		<operation error=\"skip\">\n			<search ><![CDATA[// Text]]></search>\n			<add position=\"after\"><![CDATA[\n				// FooterMenu\n			$_[\'text_footertitle\']                 = \' Footer title\';\n			$_[\'text_footerlink\']                  = \'Footer link\';\n			$_[\'text_footermenu\']                  = \'TMD Footer Menu\';\n			]]></add>\n		</operation>\n	</file>\n	\n	<file path=\"admin/controller/common/column_left.php\">\n		<operation error=\"skip\">\n			<search><![CDATA[// System]]></search>\n			<add position=\"before\"><![CDATA[\n			/* TMD Custom Footer Menu */						\n			$customfooter = array();\n		\n			if ($this->user->hasPermission(\'access\', \'extension/footerlink\')) {		\n				$customfooter[] = array(\n					\'name\'	   => $this->language->get(\'text_footerlink\'),\n					\'href\'     => $this->url->link(\'extension/footerlink\', \'user_token=\' . $this->session->data[\'user_token\'], true),\n					\'children\' => array()		\n				);					\n			}	\n			\n			if ($this->user->hasPermission(\'access\', \'extension/footertitle\')) {		\n				$customfooter[] = array(\n					\'name\'	   => $this->language->get(\'text_footertitle\'),\n					\'href\'     => $this->url->link(\'extension/footertitle\', \'user_token=\' . $this->session->data[\'user_token\'], true),\n					\'children\' => array()		\n				);					\n			}	\n					\n			if ($customfooter) {					\n				$data[\'menus\'][] = array(\n					\'id\'       => \'menu-customfooter\',\n					\'icon\'	   => \'fa fa-share-alt fa-fw\', \n					\'name\'	   => $this->language->get(\'text_footermenu\'),\n					\'href\'     => \'\',\n					\'children\' => $customfooter\n				);		\n			}\n			\n			/* TMD Custom Footer Menu */ ]]></add>\n		</operation>\n	</file>\n	\n	\n	<file path=\"catalog/controller/common/footer.php\">\n		<operation>\n			<search ><![CDATA[return $this->load->view(\'common/footer\', $data);]]></search>\n			<add position=\"before\"><![CDATA[$this->load->model(\'catalog/information\');\n\n		$data[\'footer_titles\'] = $this->model_catalog_information->getFotterTitle();]]></add>\n		</operation>\n	</file>	\n	\n	<file path=\"catalog/model/catalog/information.php\">\n		<operation>\n			<search ><![CDATA[public function getInformations() {]]></search>\n			<add position=\"before\"><![CDATA[\n				public function getFotterTitle(){\n			$data=array();\n			$query =$this->db->query(\"SELECT ftd.title,ft.footertitle_id FROM \" . DB_PREFIX . \"footertitle ft LEFT JOIN \" . DB_PREFIX . \"footertitle_description ftd ON (ft.footertitle_id = ftd.footertitle_id) where ftd.language_id = \'\" . (int)$this->config->get(\'config_language_id\') . \"\' and ft.status=1 order by ft.sort_order\");\n\n			\n			\n			foreach($query->rows as $row){\n				$query2 = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"footerlink f LEFT JOIN \" . DB_PREFIX . \"footerlink_description fd ON (f.footerlink_id = fd.footerlink_id) where fd.language_id = \'\" . (int)$this->config->get(\'config_language_id\') . \"\' and f.status=1 and f.selectheading=\'\".$row[\'footertitle_id\'].\"\' order by f.sort_order\");\n				$subtitle=array();\n				foreach($query2->rows as $row2){\n					$subtitle[]=array(\'title\' => $row2[\'title\'], \'link\' =>$row2[\'link\']);\n				}\n				\n				$data[]=array(\n					\'title\' => $row[\'title\'],\n					\'sub_title\' => $subtitle\n				);\n			}\n			\n			return $data;\n		}]]></add>\n		</operation>\n	</file>	\n	\n	<file path=\"catalog/view/theme/*/template/common/footer.twig\">\n		<operation>\n			<search ><![CDATA[<div class=\"row\">]]></search>\n			<add position=\"after\"><![CDATA[{% if footer_titles %}\n	{% for footer_title in footer_titles %}  \n		  <div class=\"col-sm-3\" style=\"min-height:125px;\">\n			<h5>{{ footer_title.title }}</h5>\n			{% if footer_title.sub_title %}\n				<ul class=\"list-unstyled\">\n					{% for subtitle in footer_title.sub_title  %} \n						{% if subtitle.href %}		\n						<li><a href=\"{{ subtitle.href }}\">{{ subtitle.title }}</a></li>\n						{% else %}\n						<li><a href=\"{{ subtitle.link }}\">{{ subtitle.title }}</a></li>\n						{% endif %}\n					{% endfor %}\n				</ul>\n			{% endif %}\n		  </div>\n	{% endfor %}\n{% endif %}\n		  \n		<div style=\"display:none\">\n		\n		]]></add>\n		</operation>\n		<operation>\n			<search ><![CDATA[<p>{{ powered }}</p> ]]></search>\n			<add position=\"replace\"><![CDATA[</div>\n    <hr>\n    <p>{{ powered }}</p>]]></add>\n		</operation>\n	</file>	\n</modification>\n',1,'2018-07-12 19:30:01'),(4,4,'Export/Import Tool (V3.20) for OpenCart 3.x','Export/Import Tool (V3.20) for OpenCart 3.x','mhccorp.com','3.x-3.20','https://www.mhccorp.com','<modification>\n	<name>Export/Import Tool (V3.20) for OpenCart 3.x</name>\n	<code>Export/Import Tool (V3.20) for OpenCart 3.x</code>\n	<version>3.x-3.20</version>\n	<author>mhccorp.com</author>\n	<link>https://www.mhccorp.com</link>\n	<file path=\"admin/controller/common/column_left.php\">\n		<operation>\n			<search><![CDATA[if ($this->user->hasPermission(\'access\', \'tool/upload\')) {]]></search>\n			<add position=\"before\"><![CDATA[\n			if ($this->user->hasPermission(\'access\', \'extension/export_import\')) {\n				$maintenance[] = array(\n					\'name\'	   => $this->language->get(\'text_export_import\'),\n					\'href\'     => $this->url->link(\'extension/export_import\', \'user_token=\' . $this->session->data[\'user_token\'], true),\n					\'children\' => array()		\n				);\n			}\n			]]></add>\n		</operation>\n	</file>\n	<file path=\"admin/language/*/common/column_left.php\">\n		<operation>\n			<search><![CDATA[$_[\'text_backup\']]]></search>\n			<add position=\"after\"><![CDATA[\n$_[\'text_export_import\']             = \'Export / Import\';\n			]]></add>\n		</operation>\n	</file>\n</modification>\n',1,'2018-08-28 15:48:33');
/*!40000 ALTER TABLE `oc_modification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-28 21:59:35
