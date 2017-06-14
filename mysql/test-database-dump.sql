-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Current Database: `estored-db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `estored-db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `estored-db`;

--
-- Table structure for table `data_element_subscription`
--

DROP TABLE IF EXISTS `data_element_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_element_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `datasource_parameters` varchar(255) DEFAULT NULL,
  `expression` varchar(255) DEFAULT NULL,
  `visualiser_id` int(11) DEFAULT NULL,
  `datatype_id` int(11) DEFAULT NULL,
  `data_type_id` varchar(255) DEFAULT NULL,
  `datasource_reference_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9yfmdwwinn94jx0tfd60hmi39` (`datatype_id`),
  KEY `FK_oi6qttpm6evqej88uu87yv4t8` (`data_type_id`),
  KEY `FK_hbxiilxunak6a5l6stj6mpmcp` (`datasource_reference_id`),
  CONSTRAINT `FK_9yfmdwwinn94jx0tfd60hmi39` FOREIGN KEY (`datatype_id`) REFERENCES `element` (`id`),
  CONSTRAINT `FK_hbxiilxunak6a5l6stj6mpmcp` FOREIGN KEY (`datasource_reference_id`) REFERENCES `datasource_reference` (`id`),
  CONSTRAINT `FK_oi6qttpm6evqej88uu87yv4t8` FOREIGN KEY (`data_type_id`) REFERENCES `data_type` (`mimetype`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_element_subscription`
--

LOCK TABLES `data_element_subscription` WRITE;
/*!40000 ALTER TABLE `data_element_subscription` DISABLE KEYS */;
INSERT INTO `data_element_subscription` VALUES (1,NULL,NULL,'examples.plain',3,2,'text/plain',NULL);
/*!40000 ALTER TABLE `data_element_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_type`
--

DROP TABLE IF EXISTS `data_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_type` (
  `mimetype` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mimetype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_type`
--

LOCK TABLES `data_type` WRITE;
/*!40000 ALTER TABLE `data_type` DISABLE KEYS */;
INSERT INTO `data_type` VALUES ('application/json','JSON'),('application/vnd.geo+json','GeoJSON'),('image/*','Image'),('text/csv','CSV'),('text/plain','Text');
/*!40000 ALTER TABLE `data_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datasource_reference`
--

DROP TABLE IF EXISTS `datasource_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datasource_reference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `credentials_password` varchar(255) DEFAULT NULL,
  `credentials_username` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `protocol` varchar(255) DEFAULT NULL,
  `owner_login` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_crkhw5cntm0rtqqmi58xd1pds` (`owner_login`),
  CONSTRAINT `FK_crkhw5cntm0rtqqmi58xd1pds` FOREIGN KEY (`owner_login`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datasource_reference`
--

LOCK TABLES `datasource_reference` WRITE;
/*!40000 ALTER TABLE `datasource_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `datasource_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element`
--

DROP TABLE IF EXISTS `element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element` (
  `type` varchar(31) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_edit_date` datetime DEFAULT NULL,
  `full_width` bit(1) DEFAULT NULL,
  `included` bit(1) DEFAULT NULL,
  `page_break_after` bit(1) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `show_dashboard` bit(1) DEFAULT NULL,
  `content` longblob,
  `content_type` varchar(255) DEFAULT NULL,
  `story_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_neuvlh5rntw45q71nlxw4qghq` (`story_id`),
  CONSTRAINT `FK_neuvlh5rntw45q71nlxw4qghq` FOREIGN KEY (`story_id`) REFERENCES `story` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element`
--

LOCK TABLES `element` WRITE;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
INSERT INTO `element` VALUES ('InputElement',1,'Input Element Name','2017-06-14 00:52:07','2017-06-14 00:52:07','','','\0',0,NULL,NULL,'Some test content for input element','type',1),('DataElement',2,'Plain Text Example','2017-06-14 00:52:07','2017-06-14 00:52:07','','','\0',1,NULL,NULL,NULL,NULL,1),('InputElement',3,'','2017-06-14 00:56:54','2017-06-14 00:56:54','','','\0',0,NULL,NULL,'This is an input Element !','text/plain',2);
/*!40000 ALTER TABLE `element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk`
--

DROP TABLE IF EXISTS `risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_edit_date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `include_in_dashboard` bit(1) DEFAULT NULL,
  `responsible` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `consequence_id` int(11) DEFAULT NULL,
  `likelihood_id` int(11) DEFAULT NULL,
  `rating_scale_id` int(11) DEFAULT NULL,
  `risktable_id` int(11) DEFAULT NULL,
  `trend_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d9r2v9g4v3a9getaa75ps53lm` (`category_id`),
  KEY `FK_n6ff8vo9hi2bc5pwv2ir0qo0r` (`consequence_id`),
  KEY `FK_hxep6aoo6j68x103vkx2byabk` (`likelihood_id`),
  KEY `FK_bw4elqgb2aigbxxn4smpn4rjf` (`rating_scale_id`),
  KEY `FK_mxnihsab08wpoc0gfq7hiev5k` (`risktable_id`),
  KEY `FK_lw263nyjt9ffcgfsso0177gke` (`trend_id`),
  CONSTRAINT `FK_bw4elqgb2aigbxxn4smpn4rjf` FOREIGN KEY (`rating_scale_id`) REFERENCES `scale` (`id`),
  CONSTRAINT `FK_d9r2v9g4v3a9getaa75ps53lm` FOREIGN KEY (`category_id`) REFERENCES `scale_item` (`id`),
  CONSTRAINT `FK_hxep6aoo6j68x103vkx2byabk` FOREIGN KEY (`likelihood_id`) REFERENCES `scale_item` (`id`),
  CONSTRAINT `FK_lw263nyjt9ffcgfsso0177gke` FOREIGN KEY (`trend_id`) REFERENCES `scale_item` (`id`),
  CONSTRAINT `FK_mxnihsab08wpoc0gfq7hiev5k` FOREIGN KEY (`risktable_id`) REFERENCES `element` (`id`),
  CONSTRAINT `FK_n6ff8vo9hi2bc5pwv2ir0qo0r` FOREIGN KEY (`consequence_id`) REFERENCES `scale_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk`
--

LOCK TABLES `risk` WRITE;
/*!40000 ALTER TABLE `risk` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_aggregator_risk_element`
--

DROP TABLE IF EXISTS `risk_aggregator_risk_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_aggregator_risk_element` (
  `risk_aggregator_id` int(11) NOT NULL,
  `risk_element_id` int(11) NOT NULL,
  KEY `FK_pvvndmkrq3krxw87p3tjjky03` (`risk_element_id`),
  KEY `FK_dfg00rupjtjnu49608s82bj5e` (`risk_aggregator_id`),
  CONSTRAINT `FK_dfg00rupjtjnu49608s82bj5e` FOREIGN KEY (`risk_aggregator_id`) REFERENCES `element` (`id`),
  CONSTRAINT `FK_pvvndmkrq3krxw87p3tjjky03` FOREIGN KEY (`risk_element_id`) REFERENCES `element` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_aggregator_risk_element`
--

LOCK TABLES `risk_aggregator_risk_element` WRITE;
/*!40000 ALTER TABLE `risk_aggregator_risk_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_aggregator_risk_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_control`
--

DROP TABLE IF EXISTS `risk_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_edit_date` datetime DEFAULT NULL,
  `actual_completion_date` datetime DEFAULT NULL,
  `actual_start_date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `planned_completion_date` datetime DEFAULT NULL,
  `planned_start_date` datetime DEFAULT NULL,
  `effectiveness_id` int(11) DEFAULT NULL,
  `risk_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a5ewg89tb9x1i8g0p5mri5y6v` (`effectiveness_id`),
  KEY `FK_ijs94hw4fyycxlydch4lh8nbe` (`risk_id`),
  CONSTRAINT `FK_a5ewg89tb9x1i8g0p5mri5y6v` FOREIGN KEY (`effectiveness_id`) REFERENCES `scale_item` (`id`),
  CONSTRAINT `FK_ijs94hw4fyycxlydch4lh8nbe` FOREIGN KEY (`risk_id`) REFERENCES `risk` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_control`
--

LOCK TABLES `risk_control` WRITE;
/*!40000 ALTER TABLE `risk_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scale`
--

DROP TABLE IF EXISTS `scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scale` (
  `dtype` varchar(31) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `serialized_dependency_matrix` longblob,
  `owner_login` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_eaj99yb3l2g8kj0ut4579cmyd` (`owner_login`),
  CONSTRAINT `FK_eaj99yb3l2g8kj0ut4579cmyd` FOREIGN KEY (`owner_login`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scale`
--

LOCK TABLES `scale` WRITE;
/*!40000 ALTER TABLE `scale` DISABLE KEYS */;
INSERT INTO `scale` VALUES ('Scale',1,'Category',0,NULL,NULL),('Scale',2,'Likelihood',0,NULL,NULL),('Scale',3,'Consequence',0,NULL,NULL),('CalculatedScale',4,'Rating',0,'¨\Ì\0ur\0[[Ljava.lang.Integer;PGa7\Á[\0\0xp\0\0\0ur\0[Ljava.lang.Integer;˛ó≠†É\‚\0\0xp\0\0\0sr\0java.lang.Integer‚†§˜Åá8\0I\0valuexr\0java.lang.NumberÜ¨ïî\‡ã\0\0xp\0\0\0q\0~\0q\0~\0sq\0~\0\0\0\0q\0~\0uq\0~\0\0\0\0q\0~\0q\0~\0q\0~\0sq\0~\0\0\0\0q\0~\0	uq\0~\0\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0	sq\0~\0\0\0\0uq\0~\0\0\0\0q\0~\0q\0~\0q\0~\0	q\0~\0q\0~\0uq\0~\0\0\0\0q\0~\0q\0~\0q\0~\0	q\0~\0q\0~\0',NULL),('Scale',5,'Trend',0,NULL,NULL),('Scale',6,'Effectiveness',1,NULL,NULL);
/*!40000 ALTER TABLE `scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scale_item`
--

DROP TABLE IF EXISTS `scale_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scale_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `scale_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hpl02a7lmlfjshsevmu5xp4ie` (`scale_id`),
  CONSTRAINT `FK_hpl02a7lmlfjshsevmu5xp4ie` FOREIGN KEY (`scale_id`) REFERENCES `scale` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scale_item`
--

LOCK TABLES `scale_item` WRITE;
/*!40000 ALTER TABLE `scale_item` DISABLE KEYS */;
INSERT INTO `scale_item` VALUES (1,'Business development and competition','Risks relating to developing new business opportunities, marketing, satisfaction of RMIT‚Äôs customers, students and/or other stakeholders; also includes political risks and any risks that may have an impact on the organisation\'s brand / image and reputation.','#26B99A',NULL,1,1),(2,'People and OHS','Risks relating to management of the organisation\'s staff, including occupational health and safety concerns.','#34495E',NULL,2,1),(3,'Operations, facilities and environment','Risks relating to management practices, policies and processes, including asset management, and potential failures in the provision of the organisation\'s services or products. Also includes risks relating to the management of the environment.','#BDC3C7',NULL,3,1),(4,'Information technology','Risks relating to IT security, operation and/or management, including IT implementation.','#3498DB',NULL,4,1),(5,'Finance and funding','Risks relating to financial management and/or transactions.','#9B59B6',NULL,5,1),(6,'Regulatory, legislative and commercial','Risks relating to non-compliance with legal obligations, and/or government policy (either new or existing), and/or internal policies and processes. Risks relating to products, services, advice, etc resulting in legal liability or action against the organisation and/or its staff.','#8abb6f',NULL,6,1),(7,'Academic, Teaching and Learning','Risks relating to the objectives of the current Academic Plan e.g. alignment of academic profile (VET & HE) to achieve the goals set out in the Strategic Plan; also includes risks that may impact student satisfaction.','#759c6a',NULL,7,1),(8,'Rare','The event may only occur in exceptional circumstances. Not likely to occur within next five years','#5cb85c',NULL,1,2),(9,'Unlikely','The event is unlikely to occur. Risk has less than 25% chance of occurring. May occur within 48 months','#5bc0de',NULL,2,2),(10,'Possible','The event could occur at some time. Risk has 25-49% chance of occurring. Will occur within 36 months','#faebcc',NULL,3,2),(11,'Likely','The event will probably occur in most circumstances. Risk has 50-74% chance of occurring. Will occur within 18 months','#f0ad4e',NULL,4,2),(12,'Almost Certain','The event is expected to occur in most circumstances. Risk has more than a 75% chance of occurring. Will occur within the next six months','#d9534f',NULL,5,2),(13,'Insignificant','Risk consequences are dealt with routine operations','#5cb85c',NULL,1,3),(14,'Minor','Financial impact less than $5M(1) / 1% of project budget Single injury. Low impact on client sensitivity. Minimal damage to University‚Äôs image and reputation. Censure by regulators. Minimal impact on Business and Strategic objectives. Risk consequences are dealt with by routine operations','#5bc0de',NULL,2,3),(15,'Moderate','Financial impact $5M-$20M / 1-5% of project budget. Multiple injuries. Moderate client sensitivity. Medium damage to University‚Äôs image and reputation. Fines and penalties by regulators (e.g. delay in payment to client). Moderate impact on Business and Strategic objectives','#faebcc',NULL,3,3),(16,'Major','Financial impact $20M-$30M / 5-10% of project budget. Single death and/or multiple significant injuries. Significant client sensitivity. Significant damage to University‚Äôs image and reputation. Restriction of business due by regulators. Significant impact on Business and Strategic objectives','#f0ad4e',NULL,4,3),(17,'Catastrophic / Outstanding','Financial impact exceeds $30M / 10% of project budget. Multiple deaths. Very high client sensitivity. Irreparable damage to University‚Äôs image and reputation. Cessation of business due to non-compliance with regulations. Business and Strategic objectives unable to be achieved','#d9534f',NULL,5,3),(18,'Low','Eliminate / reduce risk with control measures and documented action plans, or document the rationale for accepting the risk. Ownership of these risks may be delegated by an executive to management. Manage through routine operating procedures.','#5cb85c',NULL,1,4),(19,'Moderate','Eliminate / reduce risk with control measures and documented action plans, or document the rationale for accepting the risk. Ownership of these risks may be delegated by an executive to management. Develop and implement actions as required.','#5bc0de',NULL,2,4),(20,'High','Eliminate or reduce risk through control measures and documented action plans. Executive management action / attention required.','#f0ad4e',NULL,3,4),(21,'Very High','Eliminate or reduce risk through control measures and documented action plans. Executive management action / attention required.','#d9534f',NULL,4,4),(22,'Decreasing','The risk is becoming less likely to happen and/or its consequence become less severe over time.','#26B99A',NULL,1,5),(23,'Stable','The risk likelihood and consequence remain the same over time.','#3498DB',NULL,2,5),(24,'Increasing','The risk is becoming more likely to happen and/or its consequence become more severe over time.','#FF0000',NULL,3,5),(25,'Not effective or absent','The control implemented to mitigate the risk is not effective','#d9534f',NULL,1,6),(26,'Needs improvement','The control implemented to mitigate the risk require improvement','#f0ad4e',NULL,2,6),(27,'Working effectively','The control effectively mitigates the risk','#5cb85c',NULL,3,6);
/*!40000 ALTER TABLE `scale_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scale_scales`
--

DROP TABLE IF EXISTS `scale_scales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scale_scales` (
  `scale` int(11) NOT NULL,
  `scales` int(11) NOT NULL,
  UNIQUE KEY `UK_h5qosf1lknjxxkjmiw3ix00hd` (`scales`),
  KEY `FK_cdybtc8amdsss19w7fnwlnec4` (`scale`),
  CONSTRAINT `FK_cdybtc8amdsss19w7fnwlnec4` FOREIGN KEY (`scale`) REFERENCES `scale` (`id`),
  CONSTRAINT `FK_h5qosf1lknjxxkjmiw3ix00hd` FOREIGN KEY (`scales`) REFERENCES `scale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scale_scales`
--

LOCK TABLES `scale_scales` WRITE;
/*!40000 ALTER TABLE `scale_scales` DISABLE KEYS */;
INSERT INTO `scale_scales` VALUES (4,2),(4,3);
/*!40000 ALTER TABLE `scale_scales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share`
--

DROP TABLE IF EXISTS `share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `share` (
  `type` varchar(31) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `can_edit` bit(1) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `story_id` int(11) DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_olyg2i45y3u2wnajnm7tblq7v` (`story_id`),
  KEY `FK_rw9dg0w3r0ws7270vihyy8o74` (`user_username`),
  CONSTRAINT `FK_olyg2i45y3u2wnajnm7tblq7v` FOREIGN KEY (`story_id`) REFERENCES `story` (`id`),
  CONSTRAINT `FK_rw9dg0w3r0ws7270vihyy8o74` FOREIGN KEY (`user_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share`
--

LOCK TABLES `share` WRITE;
/*!40000 ALTER TABLE `share` DISABLE KEYS */;
/*!40000 ALTER TABLE `share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sharing_token`
--

DROP TABLE IF EXISTS `sharing_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sharing_token` (
  `hash` int(11) NOT NULL,
  `email_shared_with` varchar(255) DEFAULT NULL,
  `share_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hash`),
  KEY `FK_5drc8ovxdfym4w7uyc67jsjd6` (`share_id`),
  CONSTRAINT `FK_5drc8ovxdfym4w7uyc67jsjd6` FOREIGN KEY (`share_id`) REFERENCES `share` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sharing_token`
--

LOCK TABLES `sharing_token` WRITE;
/*!40000 ALTER TABLE `sharing_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `sharing_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story`
--

DROP TABLE IF EXISTS `story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_edit_date` datetime DEFAULT NULL,
  `access` bit(1) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `risks_unit` varchar(255) DEFAULT NULL,
  `owner_login` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1lfo9hgjvy4x0s47blrwti89r` (`owner_login`),
  CONSTRAINT `FK_1lfo9hgjvy4x0s47blrwti89r` FOREIGN KEY (`owner_login`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story`
--

LOCK TABLES `story` WRITE;
/*!40000 ALTER TABLE `story` DISABLE KEYS */;
INSERT INTO `story` VALUES (1,'Example Story','2017-06-14 00:52:06','2017-06-14 00:52:06','','This is an example story visible to all users of the platform. It uses the example data provided by the \'Examples\' datasource.','$x1000','estored'),(2,'Test Story','2017-06-14 00:56:45','2017-06-14 00:56:54','\0','My Test Story','$x1000','admin');
/*!40000 ALTER TABLE `story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `non_locked` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','estored-admin@rmit.edu.au','','Administrator','Administrator','','$2a$10$WYjP8YukSpMMuOtZ5Ga6EeCsiB2IDXc9UuTGNNPzyXbZ37MiTWz7C','ROLE_ADMIN'),('estored','estoreduser@estored.rmit.edu.au','','eStoRED','User','','$2a$10$RV7r.33U3f9t1aLmS.OmUuK.bp1VLR/cRCBjoqOZIw0CWuQPRdCm2','ROLE_USER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-14  0:59:47
