-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: craftcms
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `assets_folderId_idx` (`folderId`),
  KEY `assets_volumeId_idx` (`volumeId`),
  KEY `assets_uploaderId_fk` (`uploaderId`),
  CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (16,1,1,1,'image1.jpg','image',300,200,4710,NULL,NULL,NULL,'2020-04-10 22:53:44','2020-04-10 22:53:44','2020-04-10 22:53:51','6aa8a32c-123c-4406-9549-e22b10131ca5'),(17,1,1,1,'image2_200410_225344.jpg','image',300,200,10116,NULL,NULL,NULL,'2020-04-10 22:53:44','2020-04-10 22:53:44','2020-04-10 22:53:44','8e9106c0-bd87-4aa4-bd8c-aeaa6bcfc5ae'),(18,1,1,1,'image3.jpg','image',300,200,16653,NULL,NULL,NULL,'2020-04-10 22:53:44','2020-04-10 22:53:44','2020-04-10 22:53:44','e921b155-b91d-478c-a7fb-b7dbf20d2119'),(19,1,1,1,'image4.jpg','image',300,200,14343,NULL,NULL,NULL,'2020-04-10 22:53:44','2020-04-10 22:53:45','2020-04-10 22:53:45','b6dc504d-c719-4095-82aa-1a4b20af841d'),(20,2,4,1,'image1.jpg','image',300,200,4711,NULL,NULL,NULL,'2020-04-10 22:54:33','2020-04-10 22:54:33','2020-04-10 22:54:33','d2010f6a-c7dc-4777-9fe0-0ea1245393a4'),(21,2,4,1,'image2.jpg','image',300,200,10116,NULL,NULL,NULL,'2020-04-10 22:54:33','2020-04-10 22:54:33','2020-04-10 22:54:33','b227ff8a-5633-4335-ab16-9111b307bd51'),(22,2,4,1,'image3.jpg','image',300,200,16643,NULL,NULL,NULL,'2020-04-10 22:54:33','2020-04-10 22:54:33','2020-04-10 22:54:33','9441d20d-e2f0-4143-822f-35262505c1dd'),(23,2,4,1,'image4.jpg','image',300,200,14338,NULL,NULL,NULL,'2020-04-10 22:54:33','2020-04-10 22:54:33','2020-04-10 22:54:33','9cedb1fc-d811-40b6-a689-6f5ba22b59a8');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransformindex`
--

LOCK TABLES `assettransformindex` WRITE;
/*!40000 ALTER TABLE `assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories_groupId_idx` (`groupId`),
  KEY `categories_parentId_fk` (`parentId`),
  CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categorygroups_name_idx` (`name`),
  KEY `categorygroups_handle_idx` (`handle`),
  KEY `categorygroups_structureId_idx` (`structureId`),
  KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `categorygroups_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
INSERT INTO `categorygroups` VALUES (1,1,NULL,'HVAC Categories','hvacCategories','2020-04-10 21:49:16','2020-04-10 21:49:16',NULL,'89f0f2e7-ce07-414b-89be-d4fcea12094c');
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
INSERT INTO `categorygroups_sites` VALUES (1,1,1,1,'hvac/category/{slug}','hvac/_category','2020-04-10 21:49:16','2020-04-10 21:49:16','ff3383c9-cca9-415d-890c-45bb0b6bf834');
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedattributes_siteId_fk` (`siteId`),
  KEY `changedattributes_userId_fk` (`userId`),
  CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES (3,1,'enabled','2020-04-09 23:53:27',0,1),(6,1,'authorId','2020-04-10 21:39:41',0,1),(6,1,'fieldLayoutId','2020-04-10 00:06:39',0,1),(6,1,'title','2020-04-11 17:55:26',0,1),(6,1,'uri','2020-04-10 21:47:39',0,1),(13,1,'fieldLayoutId','2020-04-10 22:56:22',0,1),(36,1,'title','2020-04-11 17:55:21',0,1),(47,1,'title','2020-04-11 17:55:16',0,1),(58,1,'title','2020-04-11 17:10:30',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedfields_siteId_fk` (`siteId`),
  KEY `changedfields_fieldId_fk` (`fieldId`),
  KEY `changedfields_userId_fk` (`userId`),
  CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES (6,1,13,'2020-04-11 16:35:51',0,1),(6,1,15,'2020-04-11 16:35:51',0,1),(6,1,16,'2020-04-11 16:35:51',0,1),(13,1,13,'2020-04-10 23:09:37',0,1),(13,1,16,'2020-04-10 23:09:37',0,1),(13,1,20,'2020-04-10 23:09:37',0,1),(36,1,13,'2020-04-11 16:35:11',0,1),(36,1,15,'2020-04-11 16:35:11',0,1),(36,1,16,'2020-04-11 16:35:11',0,1),(47,1,13,'2020-04-11 16:34:47',0,1),(47,1,15,'2020-04-11 16:35:23',0,1),(47,1,16,'2020-04-11 16:34:47',0,1),(58,1,13,'2020-04-11 16:36:15',0,1),(58,1,15,'2020-04-11 16:34:27',0,1),(58,1,16,'2020-04-11 16:34:27',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_summary` text,
  `field_rowContent` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `content_siteId_idx` (`siteId`),
  KEY `content_title_idx` (`title`),
  CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2020-04-07 01:09:58','2020-04-07 01:09:58','edc51e81-9388-49a5-be64-7b97eafc6e8b',NULL,NULL),(3,3,1,'Header','2020-04-09 23:53:18','2020-04-09 23:53:27','161cbaf9-4f60-4ba5-8ebf-aedd816c46dc',NULL,NULL),(4,4,1,'Header','2020-04-09 23:53:19','2020-04-09 23:53:19','73e9c16d-a16b-4aa7-b093-461807d55f08',NULL,NULL),(5,5,1,'Header','2020-04-09 23:53:27','2020-04-09 23:53:27','381b84d4-b1bd-4a5b-a5f1-125ac82a1c1e',NULL,NULL),(6,6,1,'4','2020-04-10 00:01:17','2020-04-11 17:55:26','0c66d03b-2d37-45b7-8d9d-f952cfe402b2','Titles talisman soft reckless meadow Kingdom. Orcrist arm matters useless unlikely threads? Spirits pieces ceases wear better fifth aloft signal Thorin Oakenshield drums pain election.','Let Us Know How We Did'),(7,7,1,'HVAC Info Page','2020-04-10 00:01:17','2020-04-10 00:01:17','4d271c0f-b4d5-43bb-900e-fc186ff8d1bc',NULL,NULL),(8,8,1,'HVAC Info Page','2020-04-10 00:06:39','2020-04-10 00:06:39','7e573227-2a03-406b-8c5d-a4b7455fd0dc',NULL,NULL),(9,9,1,'HVAC Info Page','2020-04-10 00:27:34','2020-04-10 00:27:34','ad31917b-fccd-4df1-8aa7-03340fac4a0c',NULL,NULL),(10,10,1,NULL,'2020-04-10 00:35:21','2020-04-10 00:39:37','eaa39d45-8436-4ab9-b11f-863c71d572f9',NULL,NULL),(11,11,1,'HVAC Info Page','2020-04-10 21:19:03','2020-04-10 21:19:03','4767ce2b-00b2-48e4-ac79-877ee130eac6',NULL,NULL),(12,12,1,'HVAC Info Page','2020-04-10 21:39:07','2020-04-10 21:39:07','de12b666-f1dc-4806-bc71-e3c47d6be869',NULL,NULL),(13,13,1,'About','2020-04-10 22:52:21','2020-04-10 23:09:37','90380fe1-545a-44e4-9eaa-91d123093c39','Not fiddle draws threats unspoiled quietly great-great-great-great-uncle dog Frogmorton. Wilds prophecy pouring bestow well-wishers relatives thirty-four. Guldur rise travel childhood master\'s. Call <a href=\'\'>843-708-5186',NULL),(14,14,1,'About','2020-04-10 22:52:21','2020-04-10 22:52:21','bf93cd70-228e-4441-8f66-1f7cce741d9c',NULL,NULL),(15,15,1,'About','2020-04-10 22:52:22','2020-04-10 22:52:22','61cdabd9-ac7d-4552-bc90-a61821ba6b86',NULL,NULL),(16,16,1,'Image1','2020-04-10 22:53:43','2020-04-10 22:53:51','2f85f9fa-be0a-4aa8-8437-333d6db1475a',NULL,NULL),(17,17,1,'Image2','2020-04-10 22:53:44','2020-04-10 22:53:44','3a4d4b2a-b61c-4199-b9a1-83209d20f41a',NULL,NULL),(18,18,1,'Image3','2020-04-10 22:53:44','2020-04-10 22:53:44','70dea1fb-a779-4eef-ab98-d81bf30c1a2c',NULL,NULL),(19,19,1,'Image4','2020-04-10 22:53:44','2020-04-10 22:53:44','394f1543-fb42-497f-8764-c925979df07c',NULL,NULL),(20,20,1,'Image1','2020-04-10 22:54:33','2020-04-10 22:54:33','fb0ec5e5-8685-4861-a0ac-f9c95ac96fbe',NULL,NULL),(21,21,1,'Image2','2020-04-10 22:54:33','2020-04-10 22:54:33','ad1daeff-b55e-46e6-960c-b7531583313a',NULL,NULL),(22,22,1,'Image3','2020-04-10 22:54:33','2020-04-10 22:54:33','13334b86-631f-4cc1-b806-0b5ecac66194',NULL,NULL),(23,23,1,'Image4','2020-04-10 22:54:33','2020-04-10 22:54:33','4965e284-0b6f-4715-8b9d-6ca3c5e99037',NULL,NULL),(24,24,1,'About','2020-04-10 22:56:22','2020-04-10 22:56:22','5b5888d2-94aa-42f5-8673-9e7d05c2eacf',NULL,NULL),(25,26,1,'About','2020-04-10 23:09:37','2020-04-10 23:09:37','4b8bf99b-b12b-4c02-854c-15a19530796f','Not fiddle draws threats unspoiled quietly great-great-great-great-uncle dog Frogmorton. Wilds prophecy pouring bestow well-wishers relatives thirty-four. Guldur rise travel childhood master\'s. Call <a href=\'\'>843-708-5186',NULL),(26,29,1,'HVAC Info Page','2020-04-11 16:12:43','2020-04-11 16:12:43','d7a8ade0-cfaf-4d12-960e-d36ef056197b','Testing writing a template',NULL),(28,36,1,'3','2020-04-11 16:21:02','2020-04-11 17:55:21','ab54b049-e8a9-4350-9a70-65eb9a55fae0','Stirring guest plan Ringwraiths enchanted alone disappearance condone travel pull? Don\'t you leave him, Samwise Gamgee. Ruling release listened Dori bargeman ha simply salted painted tapestry.','Get Your System Working Again'),(29,38,1,'2','2020-04-11 16:21:02','2020-04-11 16:21:02','2c7ae2e1-ec24-4d21-9713-390630329fb8','Holes maiden explain deadliest Dimrill calamity sleeping trailing food perfected language. Raid sigh leave takes chair Brandywine. Lady nothing\'s tea smirking gaining Sméagol. You are full of surprises, Master Baggins.',NULL),(30,40,1,'1','2020-04-11 16:21:15','2020-04-11 16:21:15','0f4b04c7-10ab-4986-beef-7875d1f906db','Testing writing a template',NULL),(32,47,1,'2','2020-04-11 16:21:40','2020-04-11 17:55:16','6d834d06-fa4e-48b8-917d-375eb2673089','Holes maiden explain deadliest Dimrill calamity sleeping trailing food perfected language. Raid sigh leave takes chair Brandywine. Lady nothing\'s tea smirking gaining Sméagol. You are full of surprises, Master Baggins.','Meet Your Technician'),(33,49,1,'3','2020-04-11 16:21:40','2020-04-11 16:21:40','3a150af2-ce79-42cf-89c4-72e1647c4ab3','Stirring guest plan Ringwraiths enchanted alone disappearance condone travel pull? Don\'t you leave him, Samwise Gamgee. Ruling release listened Dori bargeman ha simply salted painted tapestry.',NULL),(34,51,1,'1','2020-04-11 16:21:59','2020-04-11 16:21:59','1d370f85-fd8b-4664-b05b-270c4eb819ca','Testing writing a template',NULL),(36,58,1,'1','2020-04-11 16:22:24','2020-04-11 17:10:30','8f109fe0-fd43-47b5-aa08-76f20892c34f','Not fiddle draws threats unspoiled quietly great-great-great-great-uncle dog Frogmorton. Wilds prophecy pouring bestow well-wishers relatives thirty-four. Guldur rise travel childhood master\'s. Call 843-708-5186','Schedule Your Repair'),(37,60,1,'4','2020-04-11 16:22:24','2020-04-11 16:22:24','93e6e3af-9c28-4f06-9300-27ce864f531b','Titles talisman soft reckless meadow Kingdom. Orcrist arm matters useless unlikely threads? Spirits pieces ceases wear better fifth aloft signal Thorin Oakenshield drums pain election.',NULL),(38,62,1,'1','2020-04-11 16:22:39','2020-04-11 16:22:39','a3069d78-733a-4056-b45f-2e5d6af3cc81','Not fiddle draws threats unspoiled quietly great-great-great-great-uncle dog Frogmorton. Wilds prophecy pouring bestow well-wishers relatives thirty-four. Guldur rise travel childhood master\'s. Call <a href=\'\'>843-708-5186',NULL),(39,64,1,'1','2020-04-11 16:34:27','2020-04-11 16:34:27','dcd3fcbc-2c34-460c-8599-ab68003ab341','Not fiddle draws threats unspoiled quietly great-great-great-great-uncle dog Frogmorton. Wilds prophecy pouring bestow well-wishers relatives thirty-four. Guldur rise travel childhood master\'s. Call <a href=\'\'>843-708-5186</a>','Schedule Your Repair'),(40,65,1,'2','2020-04-11 16:34:47','2020-04-11 16:34:47','9e0dbf1a-b8d9-462f-b86a-0d5b4811e38b','Holes maiden explain deadliest Dimrill calamity sleeping trailing food perfected language. Raid sigh leave takes chair Brandywine. Lady nothing\'s tea smirking gaining Sméagol. You are full of surprises, Master Baggins.','Meet Your Technician'),(41,66,1,'Row 3','2020-04-11 16:35:11','2020-04-11 16:35:11','c868edde-e88a-45ae-b490-201b1a0776b7','Stirring guest plan Ringwraiths enchanted alone disappearance condone travel pull? Don\'t you leave him, Samwise Gamgee. Ruling release listened Dori bargeman ha simply salted painted tapestry.','Get Your System Working Again'),(42,67,1,'Row 2','2020-04-11 16:35:23','2020-04-11 16:35:23','7a2c297a-ff6a-488d-a6b6-1ccb63d3a1c9','Holes maiden explain deadliest Dimrill calamity sleeping trailing food perfected language. Raid sigh leave takes chair Brandywine. Lady nothing\'s tea smirking gaining Sméagol. You are full of surprises, Master Baggins.','Meet Your Technician'),(43,68,1,'Row 1','2020-04-11 16:35:29','2020-04-11 16:35:29','905a0a90-20cd-4c37-9c47-c17ec33968c6','Not fiddle draws threats unspoiled quietly great-great-great-great-uncle dog Frogmorton. Wilds prophecy pouring bestow well-wishers relatives thirty-four. Guldur rise travel childhood master\'s. Call <a href=\'\'>843-708-5186</a>','Schedule Your Repair'),(44,69,1,'Row 4','2020-04-11 16:35:51','2020-04-11 16:35:51','95729594-112d-4efa-9d6a-bcb4e8bf10a6','Titles talisman soft reckless meadow Kingdom. Orcrist arm matters useless unlikely threads? Spirits pieces ceases wear better fifth aloft signal Thorin Oakenshield drums pain election.','Let Us Know How We Did'),(45,70,1,'Row 1','2020-04-11 16:36:15','2020-04-11 16:36:15','381d78c1-c701-4b76-b0e9-95b4c166df07','Not fiddle draws threats unspoiled quietly great-great-great-great-uncle dog Frogmorton. Wilds prophecy pouring bestow well-wishers relatives thirty-four. Guldur rise travel childhood master\'s. Call 843-708-5186','Schedule Your Repair'),(46,71,1,'1','2020-04-11 17:10:30','2020-04-11 17:10:30','ad17f864-0c44-41f0-a0e4-e3d92f806cdb','Not fiddle draws threats unspoiled quietly great-great-great-great-uncle dog Frogmorton. Wilds prophecy pouring bestow well-wishers relatives thirty-four. Guldur rise travel childhood master\'s. Call 843-708-5186','Schedule Your Repair'),(47,72,1,'2','2020-04-11 17:55:16','2020-04-11 17:55:16','0291adf4-5a1f-4d20-a59c-5f11dad871f7','Holes maiden explain deadliest Dimrill calamity sleeping trailing food perfected language. Raid sigh leave takes chair Brandywine. Lady nothing\'s tea smirking gaining Sméagol. You are full of surprises, Master Baggins.','Meet Your Technician'),(48,73,1,'3','2020-04-11 17:55:21','2020-04-11 17:55:21','90410a88-080c-4d96-928a-a6bdb9025b34','Stirring guest plan Ringwraiths enchanted alone disappearance condone travel pull? Don\'t you leave him, Samwise Gamgee. Ruling release listened Dori bargeman ha simply salted painted tapestry.','Get Your System Working Again'),(49,74,1,'4','2020-04-11 17:55:26','2020-04-11 17:55:26','aa92b3f9-1385-4e88-ab9b-be90c64da54f','Titles talisman soft reckless meadow Kingdom. Orcrist arm matters useless unlikely threads? Spirits pieces ceases wear better fifth aloft signal Thorin Oakenshield drums pain election.','Let Us Know How We Did');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drafts_creatorId_fk` (`creatorId`),
  KEY `drafts_sourceId_fk` (`sourceId`),
  CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `elements_dateDeleted_idx` (`dateDeleted`),
  KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `elements_type_idx` (`type`),
  KEY `elements_enabled_idx` (`enabled`),
  KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  KEY `elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `elements_draftId_fk` (`draftId`),
  KEY `elements_revisionId_fk` (`revisionId`),
  CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2020-04-07 01:09:58','2020-04-07 01:09:58',NULL,'def4d4e5-06d7-4c82-a726-c7de35c2e4e7'),(3,NULL,NULL,NULL,'craft\\elements\\Entry',1,0,'2020-04-09 23:53:18','2020-04-09 23:53:27','2020-04-09 23:59:10','ea06783c-d84e-4181-85f8-35377ba15b1d'),(4,NULL,1,NULL,'craft\\elements\\Entry',0,0,'2020-04-09 23:53:18','2020-04-09 23:53:18','2020-04-09 23:59:10','82c5f2e3-4a48-496c-8b54-a6df5e589724'),(5,NULL,2,NULL,'craft\\elements\\Entry',1,0,'2020-04-09 23:53:27','2020-04-09 23:53:27','2020-04-09 23:59:10','48cffbc9-65a7-4705-bfd0-6ee85a30d914'),(6,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2020-04-10 00:01:17','2020-04-11 17:55:26',NULL,'8ee44821-0db7-48c3-9f43-c30e062fe3dc'),(7,NULL,3,NULL,'craft\\elements\\Entry',1,0,'2020-04-10 00:01:17','2020-04-10 00:01:17',NULL,'5ce1e45f-c061-440c-92c2-f0e8d0a344d4'),(8,NULL,4,1,'craft\\elements\\Entry',1,0,'2020-04-10 00:06:39','2020-04-10 00:06:39',NULL,'8fe1576b-4bd3-4011-a165-10a3e67d139e'),(9,NULL,5,1,'craft\\elements\\Entry',1,0,'2020-04-10 00:27:34','2020-04-10 00:27:34',NULL,'da11efa0-70b7-4eec-a8b3-abb7747c1303'),(10,NULL,NULL,3,'craft\\elements\\GlobalSet',1,0,'2020-04-10 00:35:21','2020-04-10 00:39:37','2020-04-10 21:18:07','11670ff8-607b-4df0-8e66-1f0247a4048c'),(11,NULL,6,1,'craft\\elements\\Entry',1,0,'2020-04-10 21:19:03','2020-04-10 21:19:03',NULL,'80f20356-5f9d-4c3f-ae26-f9b3c5478712'),(12,NULL,7,1,'craft\\elements\\Entry',1,0,'2020-04-10 21:39:07','2020-04-10 21:39:07',NULL,'953ecfd2-516d-487c-ad3f-559d940aa89d'),(13,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2020-04-10 22:52:21','2020-04-10 23:09:37',NULL,'0eb33e16-8589-4db9-be39-7698e7c176f5'),(14,NULL,8,NULL,'craft\\elements\\Entry',1,0,'2020-04-10 22:52:21','2020-04-10 22:52:21',NULL,'576640c4-2629-43e1-a91f-978027c4b47d'),(15,NULL,9,NULL,'craft\\elements\\Entry',1,0,'2020-04-10 22:52:22','2020-04-10 22:52:22',NULL,'870090b2-e689-4b7a-becc-1eeaa25d9f7c'),(16,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-04-10 22:53:43','2020-04-10 22:53:51',NULL,'ebb9ea34-b832-432c-a41c-945c452e1c4c'),(17,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-04-10 22:53:44','2020-04-10 22:53:44',NULL,'18f821b5-65ce-4a79-a461-d786812cca0b'),(18,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-04-10 22:53:44','2020-04-10 22:53:44',NULL,'e37b44f0-6df8-4b66-b027-878ce6e356bd'),(19,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-04-10 22:53:44','2020-04-10 22:53:44',NULL,'1a092455-71f9-4ff0-adc0-92bb95b788f2'),(20,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-04-10 22:54:33','2020-04-10 22:54:33',NULL,'fdeff278-974b-4132-bce5-47d8fd5723fd'),(21,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-04-10 22:54:33','2020-04-10 22:54:33',NULL,'ee2cecbb-4eb5-47c2-be48-a188e96cb7b3'),(22,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-04-10 22:54:33','2020-04-10 22:54:33',NULL,'08bf6d78-a8af-48c0-9248-a28af1c92a67'),(23,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2020-04-10 22:54:33','2020-04-10 22:54:33',NULL,'46ceb29a-cff3-4888-985b-602b466d1cf3'),(24,NULL,10,6,'craft\\elements\\Entry',1,0,'2020-04-10 22:56:22','2020-04-10 22:56:22',NULL,'46ca96e5-d75a-4afd-8c2e-181900e7b086'),(25,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-10 23:09:37','2020-04-10 23:09:37',NULL,'4e42d187-f0ed-4548-8438-ec7d476f1999'),(26,NULL,11,6,'craft\\elements\\Entry',1,0,'2020-04-10 23:09:37','2020-04-10 23:09:37',NULL,'7d083791-b9f8-4420-8224-6f1c890da521'),(27,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-10 23:09:37','2020-04-10 23:09:37',NULL,'f71f8951-03b4-42b0-9c2f-59dd2335288c'),(28,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:12:43','2020-04-11 16:22:39',NULL,'097c25bc-9ff6-4ecb-b68e-02ab6639f262'),(29,NULL,12,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:12:43','2020-04-11 16:12:43',NULL,'d560bb29-9dce-433e-99c7-12446d089f6d'),(30,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:12:43','2020-04-11 16:12:43',NULL,'494004c3-fe91-4509-b354-46d6af6b4a79'),(32,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:20:41','2020-04-11 16:20:41','2020-04-11 16:20:49','945acd05-c6b4-4d10-9360-a48c632169a2'),(33,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:20:49','2020-04-11 16:20:49','2020-04-11 16:20:54','624784bf-02d1-4355-9ae7-2da63418d9d6'),(34,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:20:54','2020-04-11 16:20:54','2020-04-11 16:21:02','855ec187-276e-4424-9890-07a06463b543'),(36,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:21:02','2020-04-11 17:55:21',NULL,'bc954e85-18f7-4596-b52f-6078f563f1ec'),(37,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:21:02','2020-04-11 16:21:02',NULL,'e20fb717-0726-40e7-adb5-68d2d806746c'),(38,NULL,13,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:21:02','2020-04-11 16:21:02',NULL,'9e853439-3331-4d33-8b79-4ee77a6b390f'),(39,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:21:02','2020-04-11 16:21:02',NULL,'3cbd289b-4077-47a3-a6c7-32017cfff2e1'),(40,NULL,14,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:21:15','2020-04-11 16:21:15',NULL,'0ea4e056-dfe9-4e14-9b19-baf38af3a3e5'),(41,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:21:15','2020-04-11 16:12:43',NULL,'b802d7f3-ffde-4d37-8f79-1c3207ed9f32'),(43,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:21:24','2020-04-11 16:21:24','2020-04-11 16:21:32','501ea3cb-d208-4b49-8c0d-8cf05c594c88'),(44,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:21:32','2020-04-11 16:21:32','2020-04-11 16:21:38','33bcc475-840d-454e-8475-c2c2b570f133'),(45,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:21:38','2020-04-11 16:21:38','2020-04-11 16:21:40','75c4074c-e491-4492-81f4-966ef2c121cd'),(47,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:21:40','2020-04-11 17:55:16',NULL,'ff741cf6-8ddc-4e6f-86f0-111a59539e04'),(48,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:21:40','2020-04-11 16:21:40',NULL,'7810116e-95de-4758-9a63-706dff443fa8'),(49,NULL,15,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:21:40','2020-04-11 16:21:40',NULL,'4f75aeb1-8dd1-4c83-8978-9bd87737bea2'),(50,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:21:40','2020-04-11 16:21:40',NULL,'a7ce2ad9-4cd9-4acd-ab5f-180ae06d5f7b'),(51,NULL,16,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:21:59','2020-04-11 16:21:59',NULL,'bb9e610f-348f-47d1-a31b-2cec707a8968'),(52,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:21:59','2020-04-11 16:12:43',NULL,'5bf25d53-974b-4d3d-b459-a96671c2b629'),(54,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:22:12','2020-04-11 16:22:12','2020-04-11 16:22:19','2ceaa04f-0e7e-487b-9628-e8abdeb580e8'),(55,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:22:19','2020-04-11 16:22:19','2020-04-11 16:22:23','f40b6d5c-4161-4ebb-9ddd-72659b09b622'),(56,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:22:23','2020-04-11 16:22:23','2020-04-11 16:22:24','2e014753-6191-47ff-8c8e-7b52e120e81c'),(58,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:22:24','2020-04-11 17:10:30',NULL,'4ad9314c-898a-43be-92b1-030358a18afd'),(59,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:22:24','2020-04-11 16:22:24',NULL,'13e6bcdc-d568-412b-8a11-5a3fcb1225db'),(60,NULL,17,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:22:24','2020-04-11 16:22:24',NULL,'d433e9df-5f15-4442-b433-18601a4858ec'),(61,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:22:24','2020-04-11 16:22:24',NULL,'f33e10c3-4066-44e7-b8b3-acfa8777f552'),(62,NULL,18,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:22:39','2020-04-11 16:22:39',NULL,'03fcf46a-ed8a-4764-b943-5cdf5f45561d'),(63,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2020-04-11 16:22:39','2020-04-11 16:22:39',NULL,'51a5c47a-42ec-48a5-bee6-dee1c6456c09'),(64,NULL,19,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:34:27','2020-04-11 16:34:27',NULL,'84bee0e8-07c6-443a-8e12-cf2e56672e61'),(65,NULL,20,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:34:47','2020-04-11 16:34:47',NULL,'38f0a661-0585-4b7c-863f-94d2611fd1fd'),(66,NULL,21,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:35:11','2020-04-11 16:35:11',NULL,'8cae76dd-56e1-45b9-9d42-f511fbc6001c'),(67,NULL,22,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:35:23','2020-04-11 16:35:23',NULL,'dfcd7ef4-ca9c-47b0-9bc5-a7c3251fe588'),(68,NULL,23,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:35:29','2020-04-11 16:35:29',NULL,'ccbbec53-8bce-4e44-bc2c-d4aa8df0c97f'),(69,NULL,24,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:35:51','2020-04-11 16:35:51',NULL,'9e27fe37-a79e-4797-9d6e-a6f3e3c9ac44'),(70,NULL,25,1,'craft\\elements\\Entry',1,0,'2020-04-11 16:36:15','2020-04-11 16:36:15',NULL,'f7d6d8ba-fae2-475e-954d-0f26e783fbb7'),(71,NULL,26,1,'craft\\elements\\Entry',1,0,'2020-04-11 17:10:30','2020-04-11 17:10:30',NULL,'59cc488d-aba5-4869-a789-74b66f1433ef'),(72,NULL,27,1,'craft\\elements\\Entry',1,0,'2020-04-11 17:55:16','2020-04-11 17:55:16',NULL,'181a1ac5-0ad4-4eeb-8d61-7032a18b77ec'),(73,NULL,28,1,'craft\\elements\\Entry',1,0,'2020-04-11 17:55:21','2020-04-11 17:55:21',NULL,'a0fdb064-761b-461c-bcdb-c1aefa47df8c'),(74,NULL,29,1,'craft\\elements\\Entry',1,0,'2020-04-11 17:55:26','2020-04-11 17:55:26',NULL,'54b5450a-4595-4437-94c6-6e82397c2281');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `elements_sites_siteId_idx` (`siteId`),
  KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `elements_sites_enabled_idx` (`enabled`),
  KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2020-04-07 01:09:58','2020-04-07 01:09:58','92908532-d628-4ad9-8fd9-4fa1fd9259b2'),(3,3,1,'header','rows/header',1,'2020-04-09 23:53:18','2020-04-09 23:53:18','99695903-4a3f-4ec7-9b2c-02e4a69a9477'),(4,4,1,'header','rows/header',1,'2020-04-09 23:53:19','2020-04-09 23:53:19','d55a6d4d-c874-4dbb-9d43-8d1a9a44c535'),(5,5,1,'header','rows/header',1,'2020-04-09 23:53:27','2020-04-09 23:53:27','252ba58b-373d-40c2-ab3d-c56205bea77d'),(6,6,1,'hvac-info-page','hvacInfoPage/hvac-info-page',1,'2020-04-10 00:01:17','2020-04-10 21:47:39','c239c589-7ac7-46bf-a058-15cdd6cbd8d7'),(7,7,1,'hvac-info-page','__home__',1,'2020-04-10 00:01:17','2020-04-10 00:01:17','e6f8523d-1af4-481a-9fdd-2fdef59f5fbc'),(8,8,1,'hvac-info-page','__home__',1,'2020-04-10 00:06:39','2020-04-10 00:06:39','ed75f430-e7ce-41a5-80c5-debda17a0dee'),(9,9,1,'hvac-info-page','__home__',1,'2020-04-10 00:27:34','2020-04-10 00:27:34','0fdba526-05aa-4e51-8046-890044c86964'),(10,10,1,NULL,NULL,1,'2020-04-10 00:35:21','2020-04-10 00:35:21','ef67fbe8-80ce-46fb-a97e-7b4f357654c2'),(11,11,1,'hvac-info-page','__home__',1,'2020-04-10 21:19:03','2020-04-10 21:19:03','4d66cc33-356f-4dd1-a888-67fc37764442'),(12,12,1,'hvac-info-page','__home__',1,'2020-04-10 21:39:07','2020-04-10 21:39:07','b76c2814-f79c-45fe-8184-e4a097e15fcc'),(13,13,1,'about','about',1,'2020-04-10 22:52:21','2020-04-10 22:52:21','5bfceec3-c486-4a8a-866a-eb641ae81b87'),(14,14,1,'about','about',1,'2020-04-10 22:52:21','2020-04-10 22:52:21','6fa24664-1423-4f7e-b72a-7893a4fbafb8'),(15,15,1,'about','about',1,'2020-04-10 22:52:22','2020-04-10 22:52:22','98367dc9-0825-4970-8ba4-f54608eec7ed'),(16,16,1,NULL,NULL,1,'2020-04-10 22:53:43','2020-04-10 22:53:43','fdc8c344-c68e-49f1-95e3-9ebcfd8894ac'),(17,17,1,NULL,NULL,1,'2020-04-10 22:53:44','2020-04-10 22:53:44','5dca66ab-e258-4244-9761-f97a53773876'),(18,18,1,NULL,NULL,1,'2020-04-10 22:53:44','2020-04-10 22:53:44','1cd2405d-c4b7-4ac7-9a87-993838ca6ecc'),(19,19,1,NULL,NULL,1,'2020-04-10 22:53:44','2020-04-10 22:53:44','bb7653a2-5b3d-4d76-b408-e143f72b7e4d'),(20,20,1,NULL,NULL,1,'2020-04-10 22:54:33','2020-04-10 22:54:33','e20b9459-fc39-44b5-a186-7715f3c44f52'),(21,21,1,NULL,NULL,1,'2020-04-10 22:54:33','2020-04-10 22:54:33','c53e816a-64d9-4d27-b4bc-07ffe3acc533'),(22,22,1,NULL,NULL,1,'2020-04-10 22:54:33','2020-04-10 22:54:33','39bee684-6597-4f68-a541-24bb525e170b'),(23,23,1,NULL,NULL,1,'2020-04-10 22:54:33','2020-04-10 22:54:33','29524786-b74a-4fba-afeb-aeedd209b0a8'),(24,24,1,'about','about',1,'2020-04-10 22:56:22','2020-04-10 22:56:22','87ea21b9-8380-468f-8738-2ae054a989af'),(25,25,1,NULL,NULL,1,'2020-04-10 23:09:37','2020-04-10 23:09:37','f36df84f-b39c-4275-bc2c-60e72bfb9462'),(26,26,1,'about','about',1,'2020-04-10 23:09:37','2020-04-10 23:09:37','8da459b9-e414-4ebd-83cb-359bb07eff6a'),(27,27,1,NULL,NULL,1,'2020-04-10 23:09:37','2020-04-10 23:09:37','f6157d56-7fd6-43af-840d-08d36f1bfee7'),(28,28,1,NULL,NULL,1,'2020-04-11 16:12:43','2020-04-11 16:12:43','0c36d8b9-3de3-4858-8ec4-2e420b75c978'),(29,29,1,'hvac-info-page','hvacInfoPage/hvac-info-page',1,'2020-04-11 16:12:43','2020-04-11 16:12:43','8bd39168-8b97-4d4b-84a8-57f35e077ed3'),(30,30,1,NULL,NULL,1,'2020-04-11 16:12:43','2020-04-11 16:12:43','157bcfd6-3811-43fd-a557-8c55d2ab415a'),(32,32,1,NULL,NULL,1,'2020-04-11 16:20:41','2020-04-11 16:20:41','82eb8c16-ce00-4a75-8833-16e61798f77e'),(33,33,1,NULL,NULL,1,'2020-04-11 16:20:49','2020-04-11 16:20:49','821f0b10-4fac-4949-b258-d79e237024d3'),(34,34,1,NULL,NULL,1,'2020-04-11 16:20:54','2020-04-11 16:20:54','eeb313ae-5fcb-4e0c-8742-559a5aa88c0e'),(36,36,1,'2','hvacInfoPage/2',1,'2020-04-11 16:21:02','2020-04-11 16:21:02','d8ea6d48-6cef-4912-81c7-da803995dd0c'),(37,37,1,NULL,NULL,1,'2020-04-11 16:21:02','2020-04-11 16:21:02','9281f289-7592-45a7-be80-9ca2e5e4e183'),(38,38,1,'2','hvacInfoPage/2',1,'2020-04-11 16:21:02','2020-04-11 16:21:02','feeac99a-bf5a-4b6b-addc-f69db4b9cc02'),(39,39,1,NULL,NULL,1,'2020-04-11 16:21:02','2020-04-11 16:21:02','32244842-135c-4b97-b633-d1e013465927'),(40,40,1,'hvac-info-page','hvacInfoPage/hvac-info-page',1,'2020-04-11 16:21:15','2020-04-11 16:21:15','eb4ad495-bae9-4ec9-8cf2-150ff990a7da'),(41,41,1,NULL,NULL,1,'2020-04-11 16:21:15','2020-04-11 16:21:15','f06b001b-4d38-4a71-9cce-62db30c7805e'),(43,43,1,NULL,NULL,1,'2020-04-11 16:21:24','2020-04-11 16:21:24','b4254e4f-80ee-47a9-a718-7a40884bf36a'),(44,44,1,NULL,NULL,1,'2020-04-11 16:21:32','2020-04-11 16:21:32','772d1770-3809-4c24-ae18-879a774296cc'),(45,45,1,NULL,NULL,1,'2020-04-11 16:21:38','2020-04-11 16:21:38','1734edf8-c3a5-488c-b092-294f39886855'),(47,47,1,'3','hvacInfoPage/3',1,'2020-04-11 16:21:40','2020-04-11 16:21:40','8d806fc2-ea3b-4c60-9559-674c9e0fefac'),(48,48,1,NULL,NULL,1,'2020-04-11 16:21:40','2020-04-11 16:21:40','9c99cd25-9b79-44c5-9b5f-4fb114b8b123'),(49,49,1,'3','hvacInfoPage/3',1,'2020-04-11 16:21:40','2020-04-11 16:21:40','502302ba-eed9-4c2c-aae4-8d31cb714203'),(50,50,1,NULL,NULL,1,'2020-04-11 16:21:40','2020-04-11 16:21:40','e0826351-b942-4dd0-a7ea-c6a008f75b5a'),(51,51,1,'hvac-info-page','hvacInfoPage/hvac-info-page',1,'2020-04-11 16:21:59','2020-04-11 16:21:59','000edb7e-1033-4906-a9ef-22e9ed31e2c9'),(52,52,1,NULL,NULL,1,'2020-04-11 16:21:59','2020-04-11 16:21:59','dc850f13-2cd5-46e5-bb1a-7a0bfc07e743'),(54,54,1,NULL,NULL,1,'2020-04-11 16:22:12','2020-04-11 16:22:12','e91dda5d-e677-4e76-b1e5-dec0154bdefc'),(55,55,1,NULL,NULL,1,'2020-04-11 16:22:19','2020-04-11 16:22:19','b0a53c19-d382-4ff8-92f4-faf8cfb89090'),(56,56,1,NULL,NULL,1,'2020-04-11 16:22:23','2020-04-11 16:22:23','553ad9e8-4be4-4822-a89a-722167504386'),(58,58,1,'4','hvacInfoPage/4',1,'2020-04-11 16:22:24','2020-04-11 16:22:24','1b57fdb9-de97-4780-ba51-70b46523d1f7'),(59,59,1,NULL,NULL,1,'2020-04-11 16:22:24','2020-04-11 16:22:24','24b43270-4b1f-46e8-aa98-575356c01fad'),(60,60,1,'4','hvacInfoPage/4',1,'2020-04-11 16:22:24','2020-04-11 16:22:24','fd0ad22d-0dba-4689-84e7-85092bfee542'),(61,61,1,NULL,NULL,1,'2020-04-11 16:22:24','2020-04-11 16:22:24','9c462777-b1ef-407a-9057-343b43bc25b7'),(62,62,1,'hvac-info-page','hvacInfoPage/hvac-info-page',1,'2020-04-11 16:22:39','2020-04-11 16:22:39','d78db8ec-3007-4cba-992e-2c9458c98fcc'),(63,63,1,NULL,NULL,1,'2020-04-11 16:22:39','2020-04-11 16:22:39','801613be-9ba7-414d-b8d7-1b2033cc13d1'),(64,64,1,'4','hvacInfoPage/4',1,'2020-04-11 16:34:27','2020-04-11 16:34:27','b11cc120-9311-4b40-a7c3-ffdb73a02b88'),(65,65,1,'3','hvacInfoPage/3',1,'2020-04-11 16:34:47','2020-04-11 16:34:47','a0c8cd3a-59d5-4b4b-a335-d96acfe8d85d'),(66,66,1,'2','hvacInfoPage/2',1,'2020-04-11 16:35:11','2020-04-11 16:35:11','3c3628fc-fd59-4435-ba77-f30f39b5ad54'),(67,67,1,'3','hvacInfoPage/3',1,'2020-04-11 16:35:23','2020-04-11 16:35:23','a345619b-c56a-411a-ae80-1c50b29a991a'),(68,68,1,'4','hvacInfoPage/4',1,'2020-04-11 16:35:29','2020-04-11 16:35:29','c69dfb47-717b-46b7-89ff-2efbafe64f36'),(69,69,1,'hvac-info-page','hvacInfoPage/hvac-info-page',1,'2020-04-11 16:35:51','2020-04-11 16:35:51','075f60a2-d749-4f1b-a7bf-74ee4bda52f4'),(70,70,1,'4','hvacInfoPage/4',1,'2020-04-11 16:36:15','2020-04-11 16:36:15','bb0d76b3-f89f-4627-870d-cb247af70def'),(71,71,1,'4','hvacInfoPage/4',1,'2020-04-11 17:10:30','2020-04-11 17:10:30','704a154a-e18e-41f0-8e3f-504c12c16d3b'),(72,72,1,'3','hvacInfoPage/3',1,'2020-04-11 17:55:16','2020-04-11 17:55:16','8e6ce9aa-d899-48e2-8085-a09ba24f5c76'),(73,73,1,'2','hvacInfoPage/2',1,'2020-04-11 17:55:21','2020-04-11 17:55:21','78e823f3-8435-4bdf-a585-cf6e9875a14c'),(74,74,1,'hvac-info-page','hvacInfoPage/hvac-info-page',1,'2020-04-11 17:55:26','2020-04-11 17:55:26','45334f4d-1300-415d-9572-311951c87b8b');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entries_postDate_idx` (`postDate`),
  KEY `entries_expiryDate_idx` (`expiryDate`),
  KEY `entries_authorId_idx` (`authorId`),
  KEY `entries_sectionId_idx` (`sectionId`),
  KEY `entries_typeId_idx` (`typeId`),
  KEY `entries_parentId_fk` (`parentId`),
  CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (3,6,NULL,6,1,'2020-04-09 23:53:00',NULL,1,'2020-04-09 23:53:18','2020-04-09 23:53:18','8e69337d-737b-4767-aeda-4119b14b9bf6'),(4,6,NULL,6,1,'2020-04-09 23:53:00',NULL,NULL,'2020-04-09 23:53:19','2020-04-09 23:53:19','a98bf1fe-f101-4297-9450-44b87f634fd5'),(5,6,NULL,6,1,'2020-04-09 23:53:00',NULL,NULL,'2020-04-09 23:53:27','2020-04-09 23:53:27','41d70c25-894d-4b73-ac8a-fc202271ab66'),(6,7,NULL,7,1,'2020-04-10 00:01:00',NULL,NULL,'2020-04-10 00:01:17','2020-04-10 21:39:41','90df251e-9edd-48fa-90ca-6fa7157e1452'),(7,7,NULL,7,NULL,'2020-04-10 00:01:00',NULL,NULL,'2020-04-10 00:01:17','2020-04-10 00:01:17','b6266f36-4d96-43a8-be21-d30df4e6c736'),(8,7,NULL,7,NULL,'2020-04-10 00:01:00',NULL,NULL,'2020-04-10 00:06:39','2020-04-10 00:06:39','afbda79d-5683-437c-b89c-25effeeb97bc'),(9,7,NULL,7,NULL,'2020-04-10 00:01:00',NULL,NULL,'2020-04-10 00:27:34','2020-04-10 00:27:34','c8757cb3-9a0a-4220-ab0d-78b7a4037c59'),(11,7,NULL,7,NULL,'2020-04-10 00:01:00',NULL,NULL,'2020-04-10 21:19:03','2020-04-10 21:19:03','02ddc4e4-a1c4-42c5-bbce-7daead003abc'),(12,7,NULL,7,NULL,'2020-04-10 00:01:00',NULL,NULL,'2020-04-10 21:39:07','2020-04-10 21:39:07','ca2dd966-b12a-44d9-a3a8-1123d2b8b2e6'),(13,8,NULL,8,NULL,'2020-04-10 22:52:00',NULL,NULL,'2020-04-10 22:52:21','2020-04-10 22:52:21','0447aefa-0157-41bd-9600-f67cd70cccb5'),(14,8,NULL,8,NULL,'2020-04-10 22:52:00',NULL,NULL,'2020-04-10 22:52:21','2020-04-10 22:52:21','d3c27bf5-8927-435f-bc23-3325f7adba61'),(15,8,NULL,8,NULL,'2020-04-10 22:52:00',NULL,NULL,'2020-04-10 22:52:22','2020-04-10 22:52:22','633d981d-941b-4252-b9ab-85647dd2bee2'),(24,8,NULL,8,NULL,'2020-04-10 22:52:00',NULL,NULL,'2020-04-10 22:56:22','2020-04-10 22:56:22','7b826713-ff97-4355-85cd-6ada1910fd3c'),(26,8,NULL,8,NULL,'2020-04-10 22:52:00',NULL,NULL,'2020-04-10 23:09:37','2020-04-10 23:09:37','1f255b2c-fa5c-481e-87e7-113555cc0931'),(29,7,NULL,7,1,'2020-04-10 00:01:00',NULL,NULL,'2020-04-11 16:12:43','2020-04-11 16:12:43','7cb18ed6-6713-4c25-a7bd-9ea37e64f29b'),(36,7,NULL,7,1,'2020-04-11 16:20:00',NULL,NULL,'2020-04-11 16:21:02','2020-04-11 16:21:02','d22dceaa-1692-4855-8ef5-2654cae508fa'),(38,7,NULL,7,1,'2020-04-11 16:20:00',NULL,NULL,'2020-04-11 16:21:02','2020-04-11 16:21:02','c511f674-a5eb-4502-8241-af194b643480'),(40,7,NULL,7,1,'2020-04-10 00:01:00',NULL,NULL,'2020-04-11 16:21:15','2020-04-11 16:21:15','68649318-27d9-45fb-8bd2-e839a0eeaff2'),(47,7,NULL,7,1,'2020-04-11 16:21:00',NULL,NULL,'2020-04-11 16:21:40','2020-04-11 16:21:40','5d377e9e-a3d0-4c25-a767-95952988fdda'),(49,7,NULL,7,1,'2020-04-11 16:21:00',NULL,NULL,'2020-04-11 16:21:40','2020-04-11 16:21:40','9eaa87c6-c9da-4d74-a054-7301674051a8'),(51,7,NULL,7,1,'2020-04-10 00:01:00',NULL,NULL,'2020-04-11 16:21:59','2020-04-11 16:21:59','65f1f38a-0f0d-414c-b71e-af34c2650c1b'),(58,7,NULL,7,1,'2020-04-11 16:22:00',NULL,NULL,'2020-04-11 16:22:24','2020-04-11 16:22:24','d7517789-b5f8-4961-8c26-a3b76aca1929'),(60,7,NULL,7,1,'2020-04-11 16:22:00',NULL,NULL,'2020-04-11 16:22:24','2020-04-11 16:22:24','2e7cb529-bb79-49c7-be73-e08b3496e9d0'),(62,7,NULL,7,1,'2020-04-10 00:01:00',NULL,NULL,'2020-04-11 16:22:39','2020-04-11 16:22:39','44ae2318-8ae2-4aa5-9755-785fbaf1d475'),(64,7,NULL,7,1,'2020-04-11 16:22:00',NULL,NULL,'2020-04-11 16:34:27','2020-04-11 16:34:27','76dfd058-7bcd-4414-8c87-38486891748f'),(65,7,NULL,7,1,'2020-04-11 16:21:00',NULL,NULL,'2020-04-11 16:34:47','2020-04-11 16:34:47','f96fb17e-28a9-4f18-81c4-779030875105'),(66,7,NULL,7,1,'2020-04-11 16:20:00',NULL,NULL,'2020-04-11 16:35:11','2020-04-11 16:35:11','3f107dcd-db53-441c-9b6c-6f00ca6950cc'),(67,7,NULL,7,1,'2020-04-11 16:21:00',NULL,NULL,'2020-04-11 16:35:23','2020-04-11 16:35:23','002b9414-8812-48e3-a5b6-1b96a5c4beab'),(68,7,NULL,7,1,'2020-04-11 16:22:00',NULL,NULL,'2020-04-11 16:35:29','2020-04-11 16:35:29','4287067d-9011-4601-b388-0ae054a1cae8'),(69,7,NULL,7,1,'2020-04-10 00:01:00',NULL,NULL,'2020-04-11 16:35:51','2020-04-11 16:35:51','a92d432a-6fee-43be-a1a8-e0d7ec0d4fb3'),(70,7,NULL,7,1,'2020-04-11 16:22:00',NULL,NULL,'2020-04-11 16:36:15','2020-04-11 16:36:15','ead41d79-8216-44d5-8c60-a85cd18412fc'),(71,7,NULL,7,1,'2020-04-11 16:22:00',NULL,NULL,'2020-04-11 17:10:30','2020-04-11 17:10:30','e19a9652-7294-4849-94d5-6751ebc4519c'),(72,7,NULL,7,1,'2020-04-11 16:21:00',NULL,NULL,'2020-04-11 17:55:16','2020-04-11 17:55:16','2c0a8147-fbc6-442f-bdfd-131dcbe881c8'),(73,7,NULL,7,1,'2020-04-11 16:20:00',NULL,NULL,'2020-04-11 17:55:21','2020-04-11 17:55:21','8780fade-a332-4cbf-8c34-419f77a94120'),(74,7,NULL,7,1,'2020-04-10 00:01:00',NULL,NULL,'2020-04-11 17:55:26','2020-04-11 17:55:26','b8b66399-8edf-4893-a49a-8585e9b307ee');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `entrytypes_sectionId_idx` (`sectionId`),
  KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `entrytypes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,NULL,'HVAC','hvac',1,'Title',NULL,1,'2020-04-09 23:46:12','2020-04-09 23:46:12','2020-04-09 23:46:48','6f2acea0-4685-44c3-a0c8-3ef986602f73'),(2,2,NULL,'Row 1','row1',1,'Title',NULL,1,'2020-04-09 23:48:01','2020-04-09 23:48:01','2020-04-09 23:52:29','24a821f0-f4cc-4644-a11e-d6e48e1c67c0'),(3,3,NULL,'Row 2','row2',1,'Title',NULL,1,'2020-04-09 23:48:32','2020-04-09 23:48:32','2020-04-09 23:52:31','05fe875a-7e70-482e-87c8-b6f883f25477'),(4,4,NULL,'Row 3','row3',1,'Title',NULL,1,'2020-04-09 23:48:41','2020-04-09 23:48:41','2020-04-09 23:52:32','3ac77ff3-9c0b-4717-965b-8cda14b68121'),(5,5,NULL,'Row 4','row4',1,'Title',NULL,1,'2020-04-09 23:48:51','2020-04-09 23:48:51','2020-04-09 23:52:33','7aa17696-61eb-42a8-80b8-a1a732b25d2e'),(6,6,NULL,'Rows','rows',1,'Title',NULL,1,'2020-04-09 23:52:57','2020-04-09 23:52:57','2020-04-09 23:59:10','d2b1561b-55fe-4830-bd8d-52fbc8629c36'),(7,7,1,'HVAC Info Page','hvacInfoPage',1,'HVAC Info Page','',1,'2020-04-10 00:01:03','2020-04-10 22:10:17',NULL,'26cc6005-c526-467d-904f-313072e585b7'),(8,8,6,'About','about',0,'','{section.name|raw}',1,'2020-04-10 22:52:21','2020-04-10 22:56:22',NULL,'8571f5b3-b31b-43c8-add3-1c1cffb140d6');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2020-04-07 01:09:57','2020-04-07 01:09:57','80be06ab-6921-4742-a810-b86f29b4d5ae'),(3,'HVAC Post Fields','2020-04-10 21:53:21','2020-04-10 21:53:21','23b3731e-53a3-4d07-b47c-f80ee371e0dc'),(4,'Single Fields','2020-04-10 22:48:32','2020-04-10 22:48:32','6b4719fb-8b68-4dae-953f-b3a2479c7622');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `fieldlayoutfields` VALUES (15,4,6,17,1,1,'2020-04-10 22:07:21','2020-04-10 22:07:21','4cda5067-c08a-44b6-becc-1e7a4f890a7b'),(16,5,7,19,1,1,'2020-04-10 22:07:21','2020-04-10 22:07:21','22064426-dfc8-4102-8a1c-f427ea87094e'),(20,1,9,16,1,2,'2020-04-10 22:10:17','2020-04-10 22:10:17','a983835c-ea3d-4d83-833d-c4156c5f7e83'),(21,1,9,13,1,3,'2020-04-10 22:10:17','2020-04-10 22:10:17','00394c2d-59a6-461f-8e15-89b4a83e061d'),(22,1,9,15,1,1,'2020-04-10 22:10:17','2020-04-10 22:10:17','e18be375-7a0a-4d13-bdad-9524d48b9cbe'),(23,6,10,20,0,1,'2020-04-10 22:56:22','2020-04-10 22:56:22','80e3f19d-93fd-484c-bd91-366b530ebfc7'),(24,6,11,16,0,1,'2020-04-10 22:56:22','2020-04-10 22:56:22','9d6e07ae-5460-443c-b451-c20b85b10279'),(25,6,11,13,0,2,'2020-04-10 22:56:22','2020-04-10 22:56:22','8db95337-721f-4fef-a84e-d655b9af7b39');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2020-04-10 00:06:39','2020-04-10 00:06:39',NULL,'e565c44b-c5c8-41ad-98a0-7a8f42768297'),(2,'craft\\elements\\MatrixBlock','2020-04-10 00:39:20','2020-04-10 00:39:20','2020-04-10 21:20:18','82b45b02-ee89-448d-ac8e-f6c0610915d2'),(3,'craft\\elements\\GlobalSet','2020-04-10 00:39:37','2020-04-10 00:39:37','2020-04-10 21:18:07','1036f898-7bfd-495e-b299-4e02866b84f2'),(4,'craft\\elements\\MatrixBlock','2020-04-10 22:03:53','2020-04-10 22:03:53',NULL,'661cd86e-1ee1-4bf1-92f8-06b0d834478e'),(5,'craft\\elements\\MatrixBlock','2020-04-10 22:07:21','2020-04-10 22:07:21',NULL,'4cb56655-cfbe-420b-a06d-5d5c0155c857'),(6,'craft\\elements\\Entry','2020-04-10 22:56:22','2020-04-10 22:56:22',NULL,'b234fc48-08b2-4d82-83f7-5b9943818773');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (2,2,'Content',1,'2020-04-10 00:39:20','2020-04-10 00:39:20','10c5f19c-5667-4ec3-a1c0-fc34193fdfdc'),(3,3,'Tab 1',1,'2020-04-10 00:39:37','2020-04-10 00:39:37','fd0605d1-582e-4c6e-9958-59cae26012a8'),(6,4,'Content',1,'2020-04-10 22:07:21','2020-04-10 22:07:21','ba89c091-8b95-4fe3-bccd-ab26330a2dd5'),(7,5,'Content',1,'2020-04-10 22:07:21','2020-04-10 22:07:21','8a3e2291-f346-490a-b0f8-7024e47c57e4'),(9,1,'HVAC Post Fields',1,'2020-04-10 22:10:17','2020-04-10 22:10:17','0cf88bf3-abcf-4028-97ae-9b5671bdf419'),(10,6,'Single Fields',1,'2020-04-10 22:56:22','2020-04-10 22:56:22','f46262ec-2991-4aa4-af89-074dd125b541'),(11,6,'HVAC Post Fields',2,'2020-04-10 22:56:22','2020-04-10 22:56:22','ce23648c-f25d-4984-af3c-896a391b3bcc');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `fields_groupId_idx` (`groupId`),
  KEY `fields_context_idx` (`context`),
  CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (12,1,'Row Description','rowDescription','global','',1,'site',NULL,'craft\\fields\\Entries','{\"limit\":\"\",\"localizeRelations\":false,\"selectionLabel\":\"Schedule Your Repair\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":\"\",\"viewMode\":null}','2020-04-10 00:41:03','2020-04-11 16:32:56','201ceda6-aab2-4302-8a89-c1da10106ac8'),(13,3,'Summary','summary','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"2\",\"multiline\":\"1\",\"placeholder\":\"\"}','2020-04-10 21:54:34','2020-04-10 21:54:34','325a4227-571b-42d8-9fa1-93880757046c'),(14,3,'HVAC Category','hvacCategory','global','',1,'site',NULL,'craft\\fields\\Categories','{\"allowLimit\":false,\"allowMultipleSources\":false,\"branchLimit\":\"\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"\",\"source\":\"group:89f0f2e7-ce07-414b-89be-d4fcea12094c\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":\"\",\"viewMode\":null}','2020-04-10 21:55:44','2020-04-10 21:55:44','70165a12-8d75-437a-ae10-5ad3b901b2c2'),(15,3,'Row Image','rowImage','global','',1,'site',NULL,'craft\\fields\\Assets','{\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:72aa9b18-a718-4c43-9d85-d7c641d8c0ec\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:72aa9b18-a718-4c43-9d85-d7c641d8c0ec\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":\"\",\"viewMode\":\"list\"}','2020-04-10 21:57:17','2020-04-10 21:57:17','f5bde98c-a65f-4788-8948-87388b0e8f61'),(16,3,'Row Content','rowContent','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2020-04-10 22:03:52','2020-04-11 16:33:38','00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e'),(17,NULL,'Row Title','rowTitle','matrixBlockType:5e82eb46-d41e-450b-bc76-8a09b438cd2b','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\"}','2020-04-10 22:03:53','2020-04-10 22:07:21','2b81be85-9d90-4689-a633-cffa1e7b08cd'),(19,NULL,'Row Image','rowImage','matrixBlockType:681254ae-c268-469b-8cbd-3a2c335714a4','',1,'site',NULL,'craft\\fields\\Assets','{\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:72aa9b18-a718-4c43-9d85-d7c641d8c0ec\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:72aa9b18-a718-4c43-9d85-d7c641d8c0ec\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":\"\",\"viewMode\":\"list\"}','2020-04-10 22:07:21','2020-04-10 22:07:21','e662caae-72d1-4ac9-947d-003010cf6b7b'),(20,4,'About Image','aboutImage','global','',1,'site',NULL,'craft\\fields\\Assets','{\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:72aa9b18-a718-4c43-9d85-d7c641d8c0ec\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:b4f5e577-033d-4447-b1fb-9003e4537968\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":\"\",\"viewMode\":\"list\"}','2020-04-10 22:51:37','2020-04-10 22:51:37','d9424fbd-70e1-498e-b832-f2c4d65eb2b3');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `globalsets_name_idx` (`name`),
  KEY `globalsets_handle_idx` (`handle`),
  KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
INSERT INTO `globalsets` VALUES (10,'Navigation','navigation',3,'2020-04-10 00:35:21','2020-04-10 00:39:37','11670ff8-607b-4df0-8e66-1f0247a4048c');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gqltokens_accessToken_unq_idx` (`accessToken`),
  UNIQUE KEY `gqltokens_name_unq_idx` (`name`),
  KEY `gqltokens_schemaId_fk` (`schemaId`),
  CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'3.4.15','3.4.10',0,'[]','FaJ52WZe15bf','2020-04-07 01:09:57','2020-04-11 16:33:38','44f927d8-e563-4e31-83b7-db63053a9378');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocks_ownerId_idx` (`ownerId`),
  KEY `matrixblocks_fieldId_idx` (`fieldId`),
  KEY `matrixblocks_typeId_idx` (`typeId`),
  KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
INSERT INTO `matrixblocks` VALUES (25,13,16,2,1,NULL,'2020-04-10 23:09:37','2020-04-10 23:09:37','8e84be39-e8a8-4881-a268-c7c88a47eb95'),(27,26,16,2,1,NULL,'2020-04-10 23:09:37','2020-04-10 23:09:37','2ddc2bd8-ec54-44df-9284-9b4a43c7986f'),(28,6,16,2,1,NULL,'2020-04-11 16:12:43','2020-04-11 16:12:43','2efd45ac-5766-4b3b-95ff-343ab6c1a43f'),(30,29,16,2,1,NULL,'2020-04-11 16:12:43','2020-04-11 16:12:43','ad000669-2798-453a-9462-0f72716a377e'),(37,36,16,2,1,NULL,'2020-04-11 16:21:02','2020-04-11 16:21:02','6d9ee5c9-e7b7-4b6f-b1ec-66242ecb16e0'),(39,38,16,2,1,NULL,'2020-04-11 16:21:02','2020-04-11 16:21:02','ea8a8fdf-676b-4bf2-afde-0d9d6469ef1b'),(41,40,16,2,1,NULL,'2020-04-11 16:21:15','2020-04-11 16:21:15','c7810c0d-d0a2-4823-b851-6c01cf5189c1'),(48,47,16,2,1,NULL,'2020-04-11 16:21:40','2020-04-11 16:21:40','fc626663-4392-458c-9187-70e2001b308a'),(50,49,16,2,1,NULL,'2020-04-11 16:21:40','2020-04-11 16:21:40','05e01d2a-acc8-4b3c-a53c-d2b8404abbdd'),(52,51,16,2,1,NULL,'2020-04-11 16:21:59','2020-04-11 16:21:59','29b8e077-7e08-4e6c-8bcd-d9fab7d6f7b6'),(59,58,16,2,1,NULL,'2020-04-11 16:22:24','2020-04-11 16:22:24','e64e7bf0-5c64-480f-8b82-c33d87ad31d0'),(61,60,16,2,1,NULL,'2020-04-11 16:22:24','2020-04-11 16:22:24','e9f828f7-7b16-4110-959e-8d20c6d556b9'),(63,62,16,2,1,NULL,'2020-04-11 16:22:39','2020-04-11 16:22:39','54c6c51b-a368-4d1e-aa90-c5fb1ff889e8');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
INSERT INTO `matrixblocktypes` VALUES (2,16,4,'Text','text',1,'2020-04-10 22:03:53','2020-04-10 22:03:53','5e82eb46-d41e-450b-bc76-8a09b438cd2b'),(3,16,5,'Image','image',2,'2020-04-10 22:07:21','2020-04-10 22:07:21','681254ae-c268-469b-8cbd-3a2c335714a4');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_rowcontent`
--

DROP TABLE IF EXISTS `matrixcontent_rowcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_rowcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_text_rowTitle` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_rowcontent_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_rowcontent_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_rowcontent_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_rowcontent_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_rowcontent`
--

LOCK TABLES `matrixcontent_rowcontent` WRITE;
/*!40000 ALTER TABLE `matrixcontent_rowcontent` DISABLE KEYS */;
INSERT INTO `matrixcontent_rowcontent` VALUES (1,25,1,'2020-04-10 23:09:37','2020-04-10 23:09:37','c119b8d6-07e2-4d11-bf6a-63b9c787a8c8','Schedule your repair'),(2,27,1,'2020-04-10 23:09:37','2020-04-10 23:09:37','8e4d1ba8-2f8b-4645-b18c-14863a191c11','Schedule your repair'),(3,28,1,'2020-04-11 16:12:43','2020-04-11 16:22:39','2c304bd3-52e6-4080-aecf-1b0f6515143c','Schedule Your Repair'),(4,30,1,'2020-04-11 16:12:43','2020-04-11 16:12:43','f0431414-fc21-4bbb-8aea-ffc763d84fe9','Testing this shiz'),(5,32,1,'2020-04-11 16:20:41','2020-04-11 16:20:41','b34af370-b483-46c9-9c29-0b7614d3feec',NULL),(6,33,1,'2020-04-11 16:20:49','2020-04-11 16:20:49','8a2cf4da-a44d-43cf-9f35-f20b754ec301','Meet Your Technician'),(7,34,1,'2020-04-11 16:20:54','2020-04-11 16:20:54','b39c3ece-b5ee-4176-a247-56d5c3976718','Meet Your Technician'),(9,37,1,'2020-04-11 16:21:02','2020-04-11 16:21:02','ddc2e204-cb56-45f7-b9b4-24d5a729ffbc','Meet Your Technician'),(10,39,1,'2020-04-11 16:21:02','2020-04-11 16:21:02','a50bcc93-d3af-4d58-bd66-43472fdf9760','Meet Your Technician'),(11,41,1,'2020-04-11 16:21:15','2020-04-11 16:21:15','54460123-4704-4c6b-810d-1551d265a27e','Testing this shiz'),(12,43,1,'2020-04-11 16:21:24','2020-04-11 16:21:24','4b90bd88-ee0b-4980-8304-2015c247070b',NULL),(13,44,1,'2020-04-11 16:21:32','2020-04-11 16:21:32','9fe4f1c7-8d4b-44f5-9237-060d749afa53','Get Your System Working Again'),(14,45,1,'2020-04-11 16:21:38','2020-04-11 16:21:38','8117ce70-d183-4413-b536-48e634616d0f','Get Your System Working Again'),(16,48,1,'2020-04-11 16:21:40','2020-04-11 16:21:40','dc311368-3caa-441a-b936-c0f4c9be509e','Get Your System Working Again'),(17,50,1,'2020-04-11 16:21:40','2020-04-11 16:21:40','5e2d6099-736c-43b1-b071-2cdfb024d2b5','Get Your System Working Again'),(18,52,1,'2020-04-11 16:21:59','2020-04-11 16:21:59','ab8254f5-d5a0-45f6-aeea-8c3fc99f1c4f','Testing this shiz'),(19,54,1,'2020-04-11 16:22:12','2020-04-11 16:22:12','5197bf26-9558-4970-8031-0a8648982feb',NULL),(20,55,1,'2020-04-11 16:22:19','2020-04-11 16:22:19','28673a7b-04f8-4960-a12d-2438e3956fda','Let Us Know How We Did'),(21,56,1,'2020-04-11 16:22:23','2020-04-11 16:22:23','d2356016-a7b2-4860-8033-be2f798639f4','Let Us Know How We Did'),(23,59,1,'2020-04-11 16:22:24','2020-04-11 16:22:24','a5106c61-0657-4b22-aa20-578937aff5dd','Let Us Know How We Did'),(24,61,1,'2020-04-11 16:22:24','2020-04-11 16:22:24','bf307b21-6575-4670-a370-300982b316d2','Let Us Know How We Did'),(25,63,1,'2020-04-11 16:22:39','2020-04-11 16:22:39','5a4605bc-d329-4e4a-8bd1-d7fd39a1cd53','Schedule Your Repair');
/*!40000 ALTER TABLE `matrixcontent_rowcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `migrations_pluginId_idx` (`pluginId`),
  KEY `migrations_type_pluginId_idx` (`type`,`pluginId`),
  CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,NULL,'app','Install','2020-04-07 01:09:59','2020-04-07 01:09:59','2020-04-07 01:09:59','6f2f6e46-5bca-4e42-976a-2863636df692'),(2,NULL,'app','m150403_183908_migrations_table_changes','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','ac11444a-26fd-4b3f-9c08-330fee814121'),(3,NULL,'app','m150403_184247_plugins_table_changes','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','69374df3-1df2-4ef7-91d1-2df6c8672fcf'),(4,NULL,'app','m150403_184533_field_version','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','643ab1d1-f04a-4783-8151-01b7ff886286'),(5,NULL,'app','m150403_184729_type_columns','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','d0338504-175f-451c-9ba1-0dafa73761ae'),(6,NULL,'app','m150403_185142_volumes','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','b11db60e-f10c-4d7f-9252-a6192928fa71'),(7,NULL,'app','m150428_231346_userpreferences','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','5f953b02-533e-4af2-882c-e64a8de66f1f'),(8,NULL,'app','m150519_150900_fieldversion_conversion','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','f84ec1b6-1d9c-4f1f-8367-013b8b835153'),(9,NULL,'app','m150617_213829_update_email_settings','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','b2772d12-08fc-4b7d-9506-382ae75a2e37'),(10,NULL,'app','m150721_124739_templatecachequeries','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','0901f408-578c-459b-8a6b-652c61f8cb94'),(11,NULL,'app','m150724_140822_adjust_quality_settings','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','b8677c3a-0682-4c69-93bc-b8792e43cd58'),(12,NULL,'app','m150815_133521_last_login_attempt_ip','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','95202013-2d42-4822-bd46-b3f8d7481595'),(13,NULL,'app','m151002_095935_volume_cache_settings','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','e8f827b1-76a7-4dc0-9f6c-a0a3e4724663'),(14,NULL,'app','m151005_142750_volume_s3_storage_settings','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','2a7bccb7-c0d0-423d-b8a9-54bd5b3fd134'),(15,NULL,'app','m151016_133600_delete_asset_thumbnails','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','6f09077e-c713-435c-b253-0898ea2d8d76'),(16,NULL,'app','m151209_000000_move_logo','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','d6026cc7-d80e-4f21-9c05-c932d25f7195'),(17,NULL,'app','m151211_000000_rename_fileId_to_assetId','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','a149bcb9-d98e-44c2-893f-fb9982e26f4c'),(18,NULL,'app','m151215_000000_rename_asset_permissions','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','26562b41-56ba-4db7-a29c-0977f6a0b754'),(19,NULL,'app','m160707_000001_rename_richtext_assetsource_setting','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','7ad6ba41-1c1b-49fc-b41f-4f78f73da4cd'),(20,NULL,'app','m160708_185142_volume_hasUrls_setting','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','80cc5bfe-0910-47d5-b49e-249de7dbd1c7'),(21,NULL,'app','m160714_000000_increase_max_asset_filesize','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','8917fcbe-9acd-407d-a1db-7e83f352de02'),(22,NULL,'app','m160727_194637_column_cleanup','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','658d9a8c-e0b9-4b05-bf74-7e51d3a4a029'),(23,NULL,'app','m160804_110002_userphotos_to_assets','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','96ba7d0b-9152-4d95-aa14-10401ea475e9'),(24,NULL,'app','m160807_144858_sites','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','1738022a-bffe-496a-8883-23e0003111f6'),(25,NULL,'app','m160829_000000_pending_user_content_cleanup','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','72a7e9b2-3ff1-4f15-9f50-a27e378b5829'),(26,NULL,'app','m160830_000000_asset_index_uri_increase','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','0ed61510-a70a-4518-922c-ccf97fc0739d'),(27,NULL,'app','m160912_230520_require_entry_type_id','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','c073227a-b93e-4691-86e6-8c7b94158bf4'),(28,NULL,'app','m160913_134730_require_matrix_block_type_id','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','fe7d6848-15a6-490f-84e0-d9827548a03c'),(29,NULL,'app','m160920_174553_matrixblocks_owner_site_id_nullable','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','0febb356-fab4-412b-96a4-8baf63471cca'),(30,NULL,'app','m160920_231045_usergroup_handle_title_unique','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','77accc15-69b9-4165-885e-4c5ba1c8f5a1'),(31,NULL,'app','m160925_113941_route_uri_parts','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','d260c2c1-29e5-4e71-a983-ef48ea7e8868'),(32,NULL,'app','m161006_205918_schemaVersion_not_null','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','f905d7c5-574b-4476-95f0-76a41d82a5c0'),(33,NULL,'app','m161007_130653_update_email_settings','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','6de301f5-6c8b-425e-a263-9082039be22d'),(34,NULL,'app','m161013_175052_newParentId','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','6c5dff89-3274-4fb9-a49c-847ed0356ee3'),(35,NULL,'app','m161021_102916_fix_recent_entries_widgets','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','b9f51f54-2df7-47fe-a725-3679d66cde0d'),(36,NULL,'app','m161021_182140_rename_get_help_widget','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','045455ec-d7d6-46f1-be85-8047b657fc5e'),(37,NULL,'app','m161025_000000_fix_char_columns','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','5910ced8-3cd7-4d97-b74d-0d36c740642a'),(38,NULL,'app','m161029_124145_email_message_languages','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','0341fa93-1bff-4248-87c9-3e94755698c4'),(39,NULL,'app','m161108_000000_new_version_format','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','b01e3b67-2d64-41b9-aadf-fd596c366f66'),(40,NULL,'app','m161109_000000_index_shuffle','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','0c5f5a7c-0d9b-402f-b41f-c51a4b96bc8c'),(41,NULL,'app','m161122_185500_no_craft_app','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','e3b6c01b-e8c2-4cbc-8cd4-20dec0c5a7c0'),(42,NULL,'app','m161125_150752_clear_urlmanager_cache','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','be112069-0c5b-4877-83b8-44349cab962c'),(43,NULL,'app','m161220_000000_volumes_hasurl_notnull','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','9714bcc4-5e60-49e0-8382-6d4868442994'),(44,NULL,'app','m170114_161144_udates_permission','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','e4f10ed6-07a2-4aeb-aab3-f2a7c1a51faf'),(45,NULL,'app','m170120_000000_schema_cleanup','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','a497f820-168a-4575-bfbc-a6bd72c5d4e8'),(46,NULL,'app','m170126_000000_assets_focal_point','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','59965e1b-39c0-4ffe-b89e-ea579ba394ca'),(47,NULL,'app','m170206_142126_system_name','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','ed7774b3-7c37-45a6-91e8-53bb48f382ad'),(48,NULL,'app','m170217_044740_category_branch_limits','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','ee0b3f0f-0eae-4a92-b47b-ef61929fdab5'),(49,NULL,'app','m170217_120224_asset_indexing_columns','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','cd3a1942-1a04-4f3f-8600-55c444268573'),(50,NULL,'app','m170223_224012_plain_text_settings','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','bb1fd781-2622-43ec-bb3c-11258d10e510'),(51,NULL,'app','m170227_120814_focal_point_percentage','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','3b71140f-97da-4ae0-9b76-bb7fa65cdd76'),(52,NULL,'app','m170228_171113_system_messages','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','223e49ae-8e52-4abc-850c-e044fff8cd39'),(53,NULL,'app','m170303_140500_asset_field_source_settings','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','4457b752-77c1-4f44-9ded-f3975d71520e'),(54,NULL,'app','m170306_150500_asset_temporary_uploads','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','48ceb631-429b-4b39-b913-fe163bd0a0e9'),(55,NULL,'app','m170523_190652_element_field_layout_ids','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','793bb16e-f7a5-4e4e-9b6d-a733010a5a3f'),(56,NULL,'app','m170612_000000_route_index_shuffle','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','1c0d15f7-5b58-4667-9ec3-00c8623cf5cf'),(57,NULL,'app','m170621_195237_format_plugin_handles','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','298e4b0c-349c-4599-911c-8c91c5ef1180'),(58,NULL,'app','m170630_161027_deprecation_line_nullable','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','d195f0f9-23b5-49b0-bf7e-e570471c5fd9'),(59,NULL,'app','m170630_161028_deprecation_changes','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','16054aae-bc67-4f00-ac41-66d38c856d74'),(60,NULL,'app','m170703_181539_plugins_table_tweaks','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','22661169-5443-451f-aa46-8dc7768349ba'),(61,NULL,'app','m170704_134916_sites_tables','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','3e554971-8f51-44c8-a7ec-4ec4247be5c4'),(62,NULL,'app','m170706_183216_rename_sequences','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','911279ec-2293-4367-9c68-1e0b6c31bdca'),(63,NULL,'app','m170707_094758_delete_compiled_traits','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','258f425d-aef6-4b1d-81e1-35ac328658dc'),(64,NULL,'app','m170731_190138_drop_asset_packagist','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','8246b216-e3d5-440d-97c1-f5032e0bfee4'),(65,NULL,'app','m170810_201318_create_queue_table','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','644d9bb5-c277-431a-8015-a1f688b4fd5e'),(66,NULL,'app','m170903_192801_longblob_for_queue_jobs','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','03e2af48-71f7-48f4-989b-07d5332b4db7'),(67,NULL,'app','m170914_204621_asset_cache_shuffle','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','3a17dd6b-793d-494f-86ce-fd4e3c0c65ec'),(68,NULL,'app','m171011_214115_site_groups','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','20cdceae-7924-4eed-b984-511084606986'),(69,NULL,'app','m171012_151440_primary_site','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','bc9bf5b6-f862-4cc8-9557-d181eb255da7'),(70,NULL,'app','m171013_142500_transform_interlace','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','d3d8b9e8-0b9a-4b65-ab5a-e4809662b70d'),(71,NULL,'app','m171016_092553_drop_position_select','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','9988e725-6637-4c9c-828d-75448fe31ae6'),(72,NULL,'app','m171016_221244_less_strict_translation_method','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','0a76b33f-b6e7-4ec7-8c28-b10374bb1c09'),(73,NULL,'app','m171107_000000_assign_group_permissions','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','97e2a147-3397-4ae3-aea0-266293f7c61d'),(74,NULL,'app','m171117_000001_templatecache_index_tune','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','59175a47-01b3-4fc4-bd61-8bba14b75383'),(75,NULL,'app','m171126_105927_disabled_plugins','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','eac914b9-6a7e-4159-939b-93c976c1dcf3'),(76,NULL,'app','m171130_214407_craftidtokens_table','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','387eef8b-faa1-41e2-92cd-b6de3132a969'),(77,NULL,'app','m171202_004225_update_email_settings','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','c7e85440-7cfb-482c-818c-33a2ed6e77b7'),(78,NULL,'app','m171204_000001_templatecache_index_tune_deux','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','4ad692dc-1512-4276-9b93-4bce2f8a703d'),(79,NULL,'app','m171205_130908_remove_craftidtokens_refreshtoken_column','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','118db0fc-e169-48df-96f6-f21fd67945d0'),(80,NULL,'app','m171218_143135_longtext_query_column','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','44e01542-cff1-4179-8a5c-7966661bdab8'),(81,NULL,'app','m171231_055546_environment_variables_to_aliases','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','ebdd776f-dd79-41dd-9d49-09db4b4550ee'),(82,NULL,'app','m180113_153740_drop_users_archived_column','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','a42a7cb0-33bd-42cd-8585-cabd8abe7536'),(83,NULL,'app','m180122_213433_propagate_entries_setting','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','60c2f80f-5874-4765-b836-b9c5c445c749'),(84,NULL,'app','m180124_230459_fix_propagate_entries_values','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','f1ecec05-20ab-48d5-a49f-c6ac3feb9e18'),(85,NULL,'app','m180128_235202_set_tag_slugs','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','e91e7116-dced-49dc-b083-f54aa3f7e07a'),(86,NULL,'app','m180202_185551_fix_focal_points','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','a1e6f1de-f9db-4049-ab62-ddc0636b67e8'),(87,NULL,'app','m180217_172123_tiny_ints','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','1102e433-5f41-42cd-acef-1d543d04996a'),(88,NULL,'app','m180321_233505_small_ints','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','70f13c99-ed25-455f-80a2-fbe50552e800'),(89,NULL,'app','m180328_115523_new_license_key_statuses','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','12c11014-6739-4dbe-8431-c879e6fb6903'),(90,NULL,'app','m180404_182320_edition_changes','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','24214a1d-6798-4a5f-8c1e-fcbd39593d9d'),(91,NULL,'app','m180411_102218_fix_db_routes','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','eff47c97-ad26-42cd-9588-a6a5d4a287f2'),(92,NULL,'app','m180416_205628_resourcepaths_table','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','700d61c4-4a8e-44e9-8ee5-3c846d3fbf03'),(93,NULL,'app','m180418_205713_widget_cleanup','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','539ddd0b-5034-459b-935e-ed38a345c131'),(94,NULL,'app','m180425_203349_searchable_fields','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','b3f5f42e-9d93-43fe-92c5-a35617df04ae'),(95,NULL,'app','m180516_153000_uids_in_field_settings','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','ce4adfe1-53d0-41e3-93a4-6741ab3d5385'),(96,NULL,'app','m180517_173000_user_photo_volume_to_uid','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','b23ce68f-c072-48c9-b7c4-3a6813acd606'),(97,NULL,'app','m180518_173000_permissions_to_uid','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','9ad6474d-ee54-460a-b65e-bc59bd978f5e'),(98,NULL,'app','m180520_173000_matrix_context_to_uids','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','a82cc0c5-6103-49fe-9338-06879c2ae89d'),(99,NULL,'app','m180521_172900_project_config_table','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','9edcca80-a55c-47b3-816a-9529018a4a62'),(100,NULL,'app','m180521_173000_initial_yml_and_snapshot','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','1c9b2b1f-501d-40ab-ae38-72d26e9627d2'),(101,NULL,'app','m180731_162030_soft_delete_sites','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','b4085711-9ff5-4cf5-b3ab-21451ec28b63'),(102,NULL,'app','m180810_214427_soft_delete_field_layouts','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','c150a172-9451-4ea1-a56e-5173a370d72f'),(103,NULL,'app','m180810_214439_soft_delete_elements','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','6fa2387f-ffea-40ca-b776-c5690bd143a9'),(104,NULL,'app','m180824_193422_case_sensitivity_fixes','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','92f142a4-ff91-4c47-a37c-b995a1f54986'),(105,NULL,'app','m180901_151639_fix_matrixcontent_tables','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','cb24504e-e01a-483a-a603-6178771d0e36'),(106,NULL,'app','m180904_112109_permission_changes','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','4bd8c12b-89b4-44de-9297-b45f512c4002'),(107,NULL,'app','m180910_142030_soft_delete_sitegroups','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','d77a2dfd-f7b5-4fe1-88cf-0aa708f1ec4b'),(108,NULL,'app','m181011_160000_soft_delete_asset_support','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','c710bbe3-1c1c-416a-8d01-ee1f646b222a'),(109,NULL,'app','m181016_183648_set_default_user_settings','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','7310ff93-6fe7-4b36-a772-41714169f13a'),(110,NULL,'app','m181017_225222_system_config_settings','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','916c9531-3919-4687-8d12-d184fddb8d7c'),(111,NULL,'app','m181018_222343_drop_userpermissions_from_config','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','6482aae0-cddf-4cc8-a26a-1f7641f3593e'),(112,NULL,'app','m181029_130000_add_transforms_routes_to_config','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','28ef18b4-0343-44b5-a1da-f741e417acc3'),(113,NULL,'app','m181112_203955_sequences_table','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','2beb7d5c-7765-4b58-849a-a0846c9e2837'),(114,NULL,'app','m181121_001712_cleanup_field_configs','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','93a7753c-b405-4570-aa81-168d58268018'),(115,NULL,'app','m181128_193942_fix_project_config','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','5c8653d9-34f2-4c89-8395-97f0f56b875a'),(116,NULL,'app','m181130_143040_fix_schema_version','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','70ede352-b33f-4536-b22f-0a58c5d37309'),(117,NULL,'app','m181211_143040_fix_entry_type_uids','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','3a420493-cbae-4f9a-a474-33ce5d110891'),(118,NULL,'app','m181213_102500_config_map_aliases','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','6f154185-403c-455c-837e-d43627419da1'),(119,NULL,'app','m181217_153000_fix_structure_uids','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','5b9f9be3-8cd2-4f76-bcc3-3df0c67bfbd2'),(120,NULL,'app','m190104_152725_store_licensed_plugin_editions','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','57ef340a-7413-4531-9582-f703303db8f3'),(121,NULL,'app','m190108_110000_cleanup_project_config','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','27b9fd9c-9b7a-46c1-9969-bcf91453adb4'),(122,NULL,'app','m190108_113000_asset_field_setting_change','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','6c7cae9a-7eb0-4eb6-8f4b-d1690f27a59d'),(123,NULL,'app','m190109_172845_fix_colspan','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','f051ec6e-1ee7-46c7-8082-bbe4737d8f2d'),(124,NULL,'app','m190110_150000_prune_nonexisting_sites','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','0b743944-9c7c-4369-89c3-63e0ee5ee2e9'),(125,NULL,'app','m190110_214819_soft_delete_volumes','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','c52f5142-e605-4100-98a5-e082d8317fca'),(126,NULL,'app','m190112_124737_fix_user_settings','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','849a0de2-c3ef-4f52-8623-870054cc2dae'),(127,NULL,'app','m190112_131225_fix_field_layouts','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','619caecb-9a34-4eb6-badc-bc2f25a0e18f'),(128,NULL,'app','m190112_201010_more_soft_deletes','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','5e05b301-8c22-4b7f-8b5e-1aa35d465521'),(129,NULL,'app','m190114_143000_more_asset_field_setting_changes','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','968801de-de6c-493b-be42-7ef26d5885b3'),(130,NULL,'app','m190121_120000_rich_text_config_setting','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','1ffea812-65c3-4be7-a4fe-c0de143a1835'),(131,NULL,'app','m190125_191628_fix_email_transport_password','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','7b05cfad-2186-45fd-ac1c-18f27fc0fc4c'),(132,NULL,'app','m190128_181422_cleanup_volume_folders','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','b1deda38-24a6-474b-88f1-ed257ca00e9d'),(133,NULL,'app','m190205_140000_fix_asset_soft_delete_index','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','90f7e1a4-6077-48c6-bef9-f7b72962b3df'),(134,NULL,'app','m190208_140000_reset_project_config_mapping','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','c1d380a4-b063-47e7-8515-a270c65e2652'),(135,NULL,'app','m190218_143000_element_index_settings_uid','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','e086c395-cdbe-4885-949d-43627a3da904'),(136,NULL,'app','m190312_152740_element_revisions','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','d7100d54-5e02-4975-8489-d7aaf55fd765'),(137,NULL,'app','m190327_235137_propagation_method','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','80d7b296-43c8-4561-80ed-1b66cd08302a'),(138,NULL,'app','m190401_223843_drop_old_indexes','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','07b70698-493a-480d-bf9a-42d6b6d2f80a'),(139,NULL,'app','m190416_014525_drop_unique_global_indexes','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','f2a1083c-079d-48ea-bedb-33972541e6f0'),(140,NULL,'app','m190417_085010_add_image_editor_permissions','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','0aae6a1e-9e16-48af-b6f5-506c760d5627'),(141,NULL,'app','m190502_122019_store_default_user_group_uid','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','936204bf-4c2a-4fd3-85c4-5c78facac034'),(142,NULL,'app','m190504_150349_preview_targets','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','bd97f620-b503-44d4-9c01-60de62606749'),(143,NULL,'app','m190516_184711_job_progress_label','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','b03180c6-308b-40cd-a243-595f5e53c3b5'),(144,NULL,'app','m190523_190303_optional_revision_creators','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','e9356cd5-c7ee-43db-8d1a-c18add785c4b'),(145,NULL,'app','m190529_204501_fix_duplicate_uids','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','d0c46750-8dfd-4265-a608-278af4eb1866'),(146,NULL,'app','m190605_223807_unsaved_drafts','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','9fb7360d-d7f4-4a6d-b7a9-3d5930233992'),(147,NULL,'app','m190607_230042_entry_revision_error_tables','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','828bbff1-5768-4942-a733-f1f60bd579a9'),(148,NULL,'app','m190608_033429_drop_elements_uid_idx','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','1f30c1f0-a539-4673-86d2-f0d58225cdc7'),(149,NULL,'app','m190617_164400_add_gqlschemas_table','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','b9ebddb8-caf8-4125-802f-28349597ba7b'),(150,NULL,'app','m190624_234204_matrix_propagation_method','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','107c0eb0-9b07-490b-a946-70ea1fdde3f2'),(151,NULL,'app','m190711_153020_drop_snapshots','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','f45a92dc-6f66-41a3-8c48-cca65a689e9f'),(152,NULL,'app','m190712_195914_no_draft_revisions','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','5e2eac77-ae81-46e4-8e1b-a67a6484b33a'),(153,NULL,'app','m190723_140314_fix_preview_targets_column','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','92acabff-6acc-4178-840e-9f8bbe65e8e6'),(154,NULL,'app','m190820_003519_flush_compiled_templates','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','cc09a664-1681-4797-8706-23ac31a610a3'),(155,NULL,'app','m190823_020339_optional_draft_creators','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','8abec631-3a55-465c-b0bb-19ffca4bd5dd'),(156,NULL,'app','m190913_152146_update_preview_targets','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','f1e40836-bb65-4704-ad68-ef3734aa4eb6'),(157,NULL,'app','m191107_122000_add_gql_project_config_support','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','398e7e57-e66b-4fba-9fc8-85faa6986a32'),(158,NULL,'app','m191204_085100_pack_savable_component_settings','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','dbd6ef9c-f9f6-4356-991e-e94dc805650a'),(159,NULL,'app','m191206_001148_change_tracking','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','f467ace3-2cf4-4b90-bd74-d17c9dbe3fab'),(160,NULL,'app','m191216_191635_asset_upload_tracking','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','28689200-7b5e-47c8-b9cd-d88c89801abc'),(161,NULL,'app','m191222_002848_peer_asset_permissions','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','de7c7080-be75-4c81-be10-9c5b4a34ca5a'),(162,NULL,'app','m200127_172522_queue_channels','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','fbe7d5b0-7401-484a-b562-e6aab84ce2ea'),(163,NULL,'app','m200211_175048_truncate_element_query_cache','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','f9ed6dd1-8ad3-4519-afd9-65d958fd3c18'),(164,NULL,'app','m200213_172522_new_elements_index','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','5a0f553a-c534-42a1-a820-949930bab56d'),(165,NULL,'app','m200228_195211_long_deprecation_messages','2020-04-07 01:10:03','2020-04-07 01:10:03','2020-04-07 01:10:03','26c51465-8194-4d7a-ae73-7e8401ac465b'),(166,1,'plugin','m180430_204710_remove_old_plugins','2020-04-10 21:52:39','2020-04-10 21:52:39','2020-04-10 21:52:39','7db7755b-66eb-465c-98f5-dda94861b79f'),(167,1,'plugin','Install','2020-04-10 21:52:39','2020-04-10 21:52:39','2020-04-10 21:52:39','02601617-5242-434e-b775-586749c827c0'),(168,1,'plugin','m190225_003922_split_cleanup_html_settings','2020-04-10 21:52:39','2020-04-10 21:52:39','2020-04-10 21:52:39','614dc687-5060-4572-b5a8-8d607ed101b9');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (1,'redactor','2.6.1','2.3.0','unknown',NULL,'2020-04-10 21:52:39','2020-04-10 21:52:39','2020-04-10 21:59:55','9acdf027-7e88-4129-9739-1140cd07605d');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('categoryGroups.89f0f2e7-ce07-414b-89be-d4fcea12094c.handle','\"hvacCategories\"'),('categoryGroups.89f0f2e7-ce07-414b-89be-d4fcea12094c.name','\"HVAC Categories\"'),('categoryGroups.89f0f2e7-ce07-414b-89be-d4fcea12094c.siteSettings.94d019ff-7280-4a06-8867-b672726e923d.hasUrls','true'),('categoryGroups.89f0f2e7-ce07-414b-89be-d4fcea12094c.siteSettings.94d019ff-7280-4a06-8867-b672726e923d.template','\"hvac/_category\"'),('categoryGroups.89f0f2e7-ce07-414b-89be-d4fcea12094c.siteSettings.94d019ff-7280-4a06-8867-b672726e923d.uriFormat','\"hvac/category/{slug}\"'),('categoryGroups.89f0f2e7-ce07-414b-89be-d4fcea12094c.structure.maxLevels','1'),('categoryGroups.89f0f2e7-ce07-414b-89be-d4fcea12094c.structure.uid','\"be0f0763-1d56-4732-9b9d-b09157d64934\"'),('dateModified','1586622818'),('email.fromEmail','\"benreeves23@gmail.com\"'),('email.fromName','\"Server - RM\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('fieldGroups.23b3731e-53a3-4d07-b47c-f80ee371e0dc.name','\"HVAC Post Fields\"'),('fieldGroups.6b4719fb-8b68-4dae-953f-b3a2479c7622.name','\"Single Fields\"'),('fieldGroups.80be06ab-6921-4742-a810-b86f29b4d5ae.name','\"Common\"'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.contentColumnType','\"text\"'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.fieldGroup','\"23b3731e-53a3-4d07-b47c-f80ee371e0dc\"'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.handle','\"rowContent\"'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.instructions','\"\"'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.name','\"Row Content\"'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.searchable','true'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.settings.byteLimit','null'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.settings.charLimit','null'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.settings.code','\"\"'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.settings.columnType','null'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.settings.initialRows','\"4\"'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.settings.multiline','\"\"'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.settings.placeholder','\"\"'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.translationKeyFormat','null'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.translationMethod','\"none\"'),('fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.type','\"craft\\\\fields\\\\PlainText\"'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.contentColumnType','\"string\"'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.fieldGroup','\"80be06ab-6921-4742-a810-b86f29b4d5ae\"'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.handle','\"rowDescription\"'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.instructions','\"\"'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.name','\"Row Description\"'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.searchable','true'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.settings.limit','\"\"'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.settings.localizeRelations','false'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.settings.selectionLabel','\"Schedule Your Repair\"'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.settings.source','null'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.settings.sources','\"*\"'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.settings.targetSiteId','null'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.settings.validateRelatedElements','\"\"'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.settings.viewMode','null'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.translationKeyFormat','null'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.translationMethod','\"site\"'),('fields.201ceda6-aab2-4302-8a89-c1da10106ac8.type','\"craft\\\\fields\\\\Entries\"'),('fields.325a4227-571b-42d8-9fa1-93880757046c.contentColumnType','\"text\"'),('fields.325a4227-571b-42d8-9fa1-93880757046c.fieldGroup','\"23b3731e-53a3-4d07-b47c-f80ee371e0dc\"'),('fields.325a4227-571b-42d8-9fa1-93880757046c.handle','\"summary\"'),('fields.325a4227-571b-42d8-9fa1-93880757046c.instructions','\"\"'),('fields.325a4227-571b-42d8-9fa1-93880757046c.name','\"Summary\"'),('fields.325a4227-571b-42d8-9fa1-93880757046c.searchable','true'),('fields.325a4227-571b-42d8-9fa1-93880757046c.settings.byteLimit','null'),('fields.325a4227-571b-42d8-9fa1-93880757046c.settings.charLimit','null'),('fields.325a4227-571b-42d8-9fa1-93880757046c.settings.code','\"\"'),('fields.325a4227-571b-42d8-9fa1-93880757046c.settings.columnType','null'),('fields.325a4227-571b-42d8-9fa1-93880757046c.settings.initialRows','\"2\"'),('fields.325a4227-571b-42d8-9fa1-93880757046c.settings.multiline','\"1\"'),('fields.325a4227-571b-42d8-9fa1-93880757046c.settings.placeholder','\"\"'),('fields.325a4227-571b-42d8-9fa1-93880757046c.translationKeyFormat','null'),('fields.325a4227-571b-42d8-9fa1-93880757046c.translationMethod','\"none\"'),('fields.325a4227-571b-42d8-9fa1-93880757046c.type','\"craft\\\\fields\\\\PlainText\"'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.contentColumnType','\"string\"'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.fieldGroup','\"23b3731e-53a3-4d07-b47c-f80ee371e0dc\"'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.handle','\"hvacCategory\"'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.instructions','\"\"'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.name','\"HVAC Category\"'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.searchable','true'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.settings.allowLimit','false'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.settings.allowMultipleSources','false'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.settings.branchLimit','\"\"'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.settings.limit','null'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.settings.localizeRelations','false'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.settings.selectionLabel','\"\"'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.settings.source','\"group:89f0f2e7-ce07-414b-89be-d4fcea12094c\"'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.settings.sources','\"*\"'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.settings.targetSiteId','null'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.settings.validateRelatedElements','\"\"'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.settings.viewMode','null'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.translationKeyFormat','null'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.translationMethod','\"site\"'),('fields.70165a12-8d75-437a-ae10-5ad3b901b2c2.type','\"craft\\\\fields\\\\Categories\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.contentColumnType','\"string\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.fieldGroup','\"6b4719fb-8b68-4dae-953f-b3a2479c7622\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.handle','\"aboutImage\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.instructions','\"\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.name','\"About Image\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.searchable','true'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.allowedKinds.0','\"image\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.defaultUploadLocationSource','\"volume:72aa9b18-a718-4c43-9d85-d7c641d8c0ec\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.defaultUploadLocationSubpath','\"\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.limit','\"\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.localizeRelations','false'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.restrictFiles','\"1\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.selectionLabel','\"\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.showUnpermittedFiles','false'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.showUnpermittedVolumes','false'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.singleUploadLocationSource','\"volume:b4f5e577-033d-4447-b1fb-9003e4537968\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.singleUploadLocationSubpath','\"\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.source','null'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.sources','\"*\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.targetSiteId','null'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.useSingleFolder','true'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.validateRelatedElements','\"\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.settings.viewMode','\"list\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.translationKeyFormat','null'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.translationMethod','\"site\"'),('fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.type','\"craft\\\\fields\\\\Assets\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.contentColumnType','\"string\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.fieldGroup','\"23b3731e-53a3-4d07-b47c-f80ee371e0dc\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.handle','\"rowImage\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.instructions','\"\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.name','\"Row Image\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.searchable','true'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.allowedKinds.0','\"image\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.defaultUploadLocationSource','\"volume:72aa9b18-a718-4c43-9d85-d7c641d8c0ec\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.defaultUploadLocationSubpath','\"\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.limit','\"1\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.localizeRelations','false'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.restrictFiles','\"1\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.selectionLabel','\"\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.showUnpermittedFiles','false'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.showUnpermittedVolumes','false'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.singleUploadLocationSource','\"volume:72aa9b18-a718-4c43-9d85-d7c641d8c0ec\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.singleUploadLocationSubpath','\"\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.source','null'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.sources','\"*\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.targetSiteId','null'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.useSingleFolder','true'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.validateRelatedElements','\"\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.settings.viewMode','\"list\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.translationKeyFormat','null'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.translationMethod','\"site\"'),('fields.f5bde98c-a65f-4788-8948-87388b0e8f61.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.field','\"00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fieldLayouts.661cd86e-1ee1-4bf1-92f8-06b0d834478e.tabs.0.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.required','true'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fieldLayouts.661cd86e-1ee1-4bf1-92f8-06b0d834478e.tabs.0.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.sortOrder','1'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fieldLayouts.661cd86e-1ee1-4bf1-92f8-06b0d834478e.tabs.0.name','\"Content\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fieldLayouts.661cd86e-1ee1-4bf1-92f8-06b0d834478e.tabs.0.sortOrder','1'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.contentColumnType','\"text\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.fieldGroup','null'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.handle','\"rowTitle\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.instructions','\"\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.name','\"Row Title\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.searchable','true'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.settings.byteLimit','null'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.settings.charLimit','null'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.settings.code','\"\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.settings.columnType','null'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.settings.initialRows','\"4\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.settings.multiline','\"\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.settings.placeholder','\"\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.translationKeyFormat','null'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.translationMethod','\"none\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.fields.2b81be85-9d90-4689-a633-cffa1e7b08cd.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.handle','\"text\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.name','\"Text\"'),('matrixBlockTypes.5e82eb46-d41e-450b-bc76-8a09b438cd2b.sortOrder','1'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.field','\"00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fieldLayouts.4cb56655-cfbe-420b-a06d-5d5c0155c857.tabs.0.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.required','true'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fieldLayouts.4cb56655-cfbe-420b-a06d-5d5c0155c857.tabs.0.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.sortOrder','1'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fieldLayouts.4cb56655-cfbe-420b-a06d-5d5c0155c857.tabs.0.name','\"Content\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fieldLayouts.4cb56655-cfbe-420b-a06d-5d5c0155c857.tabs.0.sortOrder','1'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.contentColumnType','\"string\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.fieldGroup','null'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.handle','\"rowImage\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.instructions','\"\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.name','\"Row Image\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.searchable','true'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.allowedKinds.0','\"image\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.defaultUploadLocationSource','\"volume:72aa9b18-a718-4c43-9d85-d7c641d8c0ec\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.limit','\"1\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.localizeRelations','false'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.restrictFiles','\"1\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.selectionLabel','\"\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.showUnpermittedFiles','false'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.singleUploadLocationSource','\"volume:72aa9b18-a718-4c43-9d85-d7c641d8c0ec\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.source','null'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.sources','\"*\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.targetSiteId','null'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.useSingleFolder','true'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.validateRelatedElements','\"\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.settings.viewMode','\"list\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.translationKeyFormat','null'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.translationMethod','\"site\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.fields.e662caae-72d1-4ac9-947d-003010cf6b7b.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.handle','\"image\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.name','\"Image\"'),('matrixBlockTypes.681254ae-c268-469b-8cbd-3a2c335714a4.sortOrder','2'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.enableVersioning','true'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.entryTypes.26cc6005-c526-467d-904f-313072e585b7.fieldLayouts.e565c44b-c5c8-41ad-98a0-7a8f42768297.tabs.0.fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.required','true'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.entryTypes.26cc6005-c526-467d-904f-313072e585b7.fieldLayouts.e565c44b-c5c8-41ad-98a0-7a8f42768297.tabs.0.fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.sortOrder','2'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.entryTypes.26cc6005-c526-467d-904f-313072e585b7.fieldLayouts.e565c44b-c5c8-41ad-98a0-7a8f42768297.tabs.0.fields.325a4227-571b-42d8-9fa1-93880757046c.required','true'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.entryTypes.26cc6005-c526-467d-904f-313072e585b7.fieldLayouts.e565c44b-c5c8-41ad-98a0-7a8f42768297.tabs.0.fields.325a4227-571b-42d8-9fa1-93880757046c.sortOrder','3'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.entryTypes.26cc6005-c526-467d-904f-313072e585b7.fieldLayouts.e565c44b-c5c8-41ad-98a0-7a8f42768297.tabs.0.fields.f5bde98c-a65f-4788-8948-87388b0e8f61.required','true'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.entryTypes.26cc6005-c526-467d-904f-313072e585b7.fieldLayouts.e565c44b-c5c8-41ad-98a0-7a8f42768297.tabs.0.fields.f5bde98c-a65f-4788-8948-87388b0e8f61.sortOrder','1'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.entryTypes.26cc6005-c526-467d-904f-313072e585b7.fieldLayouts.e565c44b-c5c8-41ad-98a0-7a8f42768297.tabs.0.name','\"HVAC Post Fields\"'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.entryTypes.26cc6005-c526-467d-904f-313072e585b7.fieldLayouts.e565c44b-c5c8-41ad-98a0-7a8f42768297.tabs.0.sortOrder','1'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.entryTypes.26cc6005-c526-467d-904f-313072e585b7.handle','\"hvacInfoPage\"'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.entryTypes.26cc6005-c526-467d-904f-313072e585b7.hasTitleField','true'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.entryTypes.26cc6005-c526-467d-904f-313072e585b7.name','\"HVAC Info Page\"'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.entryTypes.26cc6005-c526-467d-904f-313072e585b7.sortOrder','1'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.entryTypes.26cc6005-c526-467d-904f-313072e585b7.titleFormat','\"\"'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.entryTypes.26cc6005-c526-467d-904f-313072e585b7.titleLabel','\"HVAC Info Page\"'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.handle','\"hvacInfoPage\"'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.name','\"HVAC Info Page\"'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.propagationMethod','\"all\"'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.siteSettings.94d019ff-7280-4a06-8867-b672726e923d.enabledByDefault','true'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.siteSettings.94d019ff-7280-4a06-8867-b672726e923d.hasUrls','true'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.siteSettings.94d019ff-7280-4a06-8867-b672726e923d.template','\"hvacInfoPage/_template\"'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.siteSettings.94d019ff-7280-4a06-8867-b672726e923d.uriFormat','\"hvacInfoPage/{slug}\"'),('sections.d2cae04a-9710-48e5-b489-32ed254dec09.type','\"channel\"'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.enableVersioning','true'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.fieldLayouts.b234fc48-08b2-4d82-83f7-5b9943818773.tabs.0.fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.required','false'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.fieldLayouts.b234fc48-08b2-4d82-83f7-5b9943818773.tabs.0.fields.d9424fbd-70e1-498e-b832-f2c4d65eb2b3.sortOrder','1'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.fieldLayouts.b234fc48-08b2-4d82-83f7-5b9943818773.tabs.0.name','\"Single Fields\"'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.fieldLayouts.b234fc48-08b2-4d82-83f7-5b9943818773.tabs.0.sortOrder','1'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.fieldLayouts.b234fc48-08b2-4d82-83f7-5b9943818773.tabs.1.fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.required','false'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.fieldLayouts.b234fc48-08b2-4d82-83f7-5b9943818773.tabs.1.fields.00fcf0ef-1e56-4cf7-b96c-db8dd5e1789e.sortOrder','1'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.fieldLayouts.b234fc48-08b2-4d82-83f7-5b9943818773.tabs.1.fields.325a4227-571b-42d8-9fa1-93880757046c.required','false'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.fieldLayouts.b234fc48-08b2-4d82-83f7-5b9943818773.tabs.1.fields.325a4227-571b-42d8-9fa1-93880757046c.sortOrder','2'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.fieldLayouts.b234fc48-08b2-4d82-83f7-5b9943818773.tabs.1.name','\"HVAC Post Fields\"'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.fieldLayouts.b234fc48-08b2-4d82-83f7-5b9943818773.tabs.1.sortOrder','2'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.handle','\"about\"'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.hasTitleField','false'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.name','\"About\"'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.sortOrder','1'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.titleFormat','\"{section.name|raw}\"'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.entryTypes.8571f5b3-b31b-43c8-add3-1c1cffb140d6.titleLabel','\"\"'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.handle','\"about\"'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.name','\"About\"'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.propagationMethod','\"all\"'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.siteSettings.94d019ff-7280-4a06-8867-b672726e923d.enabledByDefault','true'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.siteSettings.94d019ff-7280-4a06-8867-b672726e923d.hasUrls','true'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.siteSettings.94d019ff-7280-4a06-8867-b672726e923d.template','\"_singles/about\"'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.siteSettings.94d019ff-7280-4a06-8867-b672726e923d.uriFormat','\"about\"'),('sections.de4299f7-ac02-494c-a70c-38b3d48f0447.type','\"single\"'),('siteGroups.1dd3f51e-6261-4018-9010-7f9379e978a6.name','\"Server - RM\"'),('sites.94d019ff-7280-4a06-8867-b672726e923d.baseUrl','\"$DEFAULT_SITE_URL\"'),('sites.94d019ff-7280-4a06-8867-b672726e923d.handle','\"default\"'),('sites.94d019ff-7280-4a06-8867-b672726e923d.hasUrls','true'),('sites.94d019ff-7280-4a06-8867-b672726e923d.language','\"en-US\"'),('sites.94d019ff-7280-4a06-8867-b672726e923d.name','\"Server - RM\"'),('sites.94d019ff-7280-4a06-8867-b672726e923d.primary','true'),('sites.94d019ff-7280-4a06-8867-b672726e923d.siteGroup','\"1dd3f51e-6261-4018-9010-7f9379e978a6\"'),('sites.94d019ff-7280-4a06-8867-b672726e923d.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Server - RM\"'),('system.schemaVersion','\"3.4.10\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','\"\"'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.72aa9b18-a718-4c43-9d85-d7c641d8c0ec.handle','\"hvacphotos\"'),('volumes.72aa9b18-a718-4c43-9d85-d7c641d8c0ec.hasUrls','true'),('volumes.72aa9b18-a718-4c43-9d85-d7c641d8c0ec.name','\"hvacPhotos\"'),('volumes.72aa9b18-a718-4c43-9d85-d7c641d8c0ec.settings.path','\"@webroot/assets/hvac\"'),('volumes.72aa9b18-a718-4c43-9d85-d7c641d8c0ec.sortOrder','1'),('volumes.72aa9b18-a718-4c43-9d85-d7c641d8c0ec.type','\"craft\\\\volumes\\\\Local\"'),('volumes.72aa9b18-a718-4c43-9d85-d7c641d8c0ec.url','\"@web/assets/hvac\"'),('volumes.b4f5e577-033d-4447-b1fb-9003e4537968.handle','\"general\"'),('volumes.b4f5e577-033d-4447-b1fb-9003e4537968.hasUrls','true'),('volumes.b4f5e577-033d-4447-b1fb-9003e4537968.name','\"General\"'),('volumes.b4f5e577-033d-4447-b1fb-9003e4537968.settings.path','\"@webroot/assets/general\"'),('volumes.b4f5e577-033d-4447-b1fb-9003e4537968.sortOrder','2'),('volumes.b4f5e577-033d-4447-b1fb-9003e4537968.type','\"craft\\\\volumes\\\\Local\"'),('volumes.b4f5e577-033d-4447-b1fb-9003e4537968.url','\"@web/assets/general\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `relations_sourceId_idx` (`sourceId`),
  KEY `relations_targetId_idx` (`targetId`),
  KEY `relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (1,20,13,NULL,20,1,'2020-04-10 23:09:37','2020-04-10 23:09:37','3da08fce-87a7-4215-9688-a6096a8e2482'),(2,20,26,NULL,20,1,'2020-04-10 23:09:37','2020-04-10 23:09:37','bf8d2fc6-c2e2-44ce-b076-575763322432'),(4,15,29,NULL,17,1,'2020-04-11 16:12:43','2020-04-11 16:12:43','ac8b6a87-c6dd-49b9-ad5a-23b568db4c98'),(8,15,38,NULL,17,1,'2020-04-11 16:21:02','2020-04-11 16:21:02','4a97b6eb-9b08-4c23-9ae6-98ac99fcd8ea'),(9,15,40,NULL,17,1,'2020-04-11 16:21:15','2020-04-11 16:21:15','8a8342a5-20c1-404d-9fa8-3acb3c494670'),(12,15,49,NULL,18,1,'2020-04-11 16:21:40','2020-04-11 16:21:40','845e4c1a-cc22-4913-b5fc-e4e797008647'),(14,15,51,NULL,16,1,'2020-04-11 16:21:59','2020-04-11 16:21:59','645e901b-231b-4380-874a-ae4bf7f79e7e'),(17,15,60,NULL,19,1,'2020-04-11 16:22:24','2020-04-11 16:22:24','36233f4b-f62e-40f3-acb9-8d6c00dd6c54'),(18,15,62,NULL,16,1,'2020-04-11 16:22:39','2020-04-11 16:22:39','5ec56adf-5718-4d6a-9b0b-11d829d14bbc'),(19,15,58,NULL,16,1,'2020-04-11 16:34:27','2020-04-11 16:34:27','9971614e-d4ac-40c1-942c-3e5da393ab24'),(20,15,64,NULL,16,1,'2020-04-11 16:34:27','2020-04-11 16:34:27','ee36e402-6299-49ea-aa04-3ab2c21a8740'),(21,15,65,NULL,18,1,'2020-04-11 16:34:47','2020-04-11 16:34:47','825ec980-18c2-4be3-b487-bec3a3e23f69'),(22,15,36,NULL,18,1,'2020-04-11 16:35:11','2020-04-11 16:35:11','3f6c6ff7-d0c6-4eba-a0f9-480405f617c4'),(23,15,66,NULL,18,1,'2020-04-11 16:35:11','2020-04-11 16:35:11','5377ffcc-d31d-4f6c-a9dc-f8d95119fd75'),(24,15,47,NULL,17,1,'2020-04-11 16:35:23','2020-04-11 16:35:23','153d094f-db71-4f2f-9c36-910fa5ddf146'),(25,15,67,NULL,17,1,'2020-04-11 16:35:23','2020-04-11 16:35:23','9c047c49-2dac-4639-acd4-dabc5707626c'),(26,15,68,NULL,16,1,'2020-04-11 16:35:29','2020-04-11 16:35:29','15877533-9244-4e0b-8845-71192540bbbb'),(27,15,6,NULL,19,1,'2020-04-11 16:35:51','2020-04-11 16:35:51','d28932f1-ee73-430a-a3ae-9c8663303425'),(28,15,69,NULL,19,1,'2020-04-11 16:35:51','2020-04-11 16:35:51','028e2416-00ad-47ce-983a-1524faf621ee'),(29,15,70,NULL,16,1,'2020-04-11 16:36:15','2020-04-11 16:36:15','f7db3660-d114-45f1-bb59-0bbd11f161e7'),(30,15,71,NULL,16,1,'2020-04-11 17:10:30','2020-04-11 17:10:30','cc14447d-0eaf-4cb1-8e06-c85cc7dce3a0'),(31,15,72,NULL,17,1,'2020-04-11 17:55:16','2020-04-11 17:55:16','6009ac0a-0163-484a-a409-8a51116f3278'),(32,15,73,NULL,18,1,'2020-04-11 17:55:21','2020-04-11 17:55:21','105f7ad7-c156-4005-8fa0-d845ee7045e9'),(33,15,74,NULL,19,1,'2020-04-11 17:55:26','2020-04-11 17:55:26','be083246-e643-468a-a3c9-b048b682b82a');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('1176f372','@app/web/assets/tablesettings/dist'),('185c9d2d','@app/web/assets/utilities/dist'),('1ab3343b','@app/web/assets/feed/dist'),('1b4f4ef5','@app/web/assets/editsection/dist'),('1d33d14','@app/web/assets/utilities/dist'),('1fca6a90','@lib/element-resize-detector'),('24e9a8b1','@lib/jquery.payment'),('2553ba17','@app/web/assets/editsection/dist'),('29326ebf','@app/web/assets/cp/dist'),('2941f024','@bower/jquery/dist'),('2b796054','@app/web/assets/matrixsettings/dist'),('31157191','@lib/jquery-ui'),('33a58a8','@bower/jquery/dist'),('38ce0759','@lib/velocity'),('3a4b537f','@app/web/assets/craftsupport/dist'),('405f1a66','@app/web/assets/updateswidget/dist'),('42952b86','@app/web/assets/pluginstore/dist'),('486c61cc','@app/web/assets/updateswidget/dist'),('4985e860','@app/web/assets/updater/dist'),('4e86be37','@lib/axios'),('4ecdb6a7','@app/web/assets/craftsupport/dist'),('500a4859','@app/web/assets/updater/dist'),('515b7fc0','@lib/vue'),('5298cef','@app/web/assets/edituser/dist'),('52b1416e','@lib/d3'),('54dce690','@app/web/assets/fields/dist'),('59d0ba5f','@app/web/assets/updateswidget/dist'),('5c1c3470','@lib/jquery-ui'),('623be60d','@lib/vue'),('639b45dc','@lib/jquery.payment'),('63a87f85','@app/web/assets/cp/dist'),('652419ab','@app/web/assets/matrix/dist'),('66a7db75','@lib/velocity'),('676af831','@app/web/assets/recententries/dist'),('67966afb','@app/web/assets/login/dist'),('6a8ee57f','@lib/element-resize-detector'),('6ac01272','@app/web/assets/fields/dist'),('6c3b2e39','@app/web/assets/deprecationerrors/dist'),('6da73c3c','@app/web/assets/dashboard/dist'),('6e331d49','@bower/jquery/dist'),('731d0ade','@app/web/assets/editentry/dist'),('76679cfc','@lib/jquery-ui'),('76d623a2','@app/web/assets/recententries/dist'),('7804a3d6','@app/web/assets/pluginstore/dist'),('789032ae','@app/web/assets/pluginstore/dist'),('7ee55808','@app/web/assets/recententries/dist'),('8003f3c9','@app/web/assets/editentry/dist'),('81e8ca35','@lib/garnishjs'),('824462bc','@app/web/assets/installer/dist'),('83cfbb52','@app/web/assets/craftsupport/dist'),('86bb48c','@app/web/assets/plugins/dist'),('883458ed','@lib/jquery-touch-events'),('8d93a2ad','@app/web/assets/login/dist'),('8f21d1fd','@app/web/assets/matrix/dist'),('8f90642f','@lib/picturefill'),('8f9534b','@app/web/assets/tablesettings/dist'),('8fe7f87e','@app/web/assets/sites/dist'),('94ae1e0b','@lib/fabric'),('956f6bf1','@app/web/assets/findreplace/dist'),('977865d1','@lib/fileupload'),('9a6f21f4','@lib/timepicker'),('9c544068','@lib/axios'),('9e046be','@app/web/assets/utilities/dist'),('9f4535a','@lib/axios'),('a0a531c9','@app/web/assets/dashboard/dist'),('a0b4f00c','@app/web/assets/clearcaches/dist'),('a418fc1c','@lib/fileupload'),('a5907981','@lib/xregexp'),('a5ebcca3','@lib/picturefill'),('a6d75e81','@app/web/assets/updates/dist'),('a7c21f87','@app/web/assets/fields/dist'),('a7ce87c6','@lib/fabric'),('ade1d5e2','@app/web/assets/admintable/dist'),('affc3d0b','@lib/selectize'),('b255ddb3','@lib/d3'),('b28853f8','@lib/garnishjs'),('b38f564f','@app/web/assets/login/dist'),('b781fbec','@app/web/assets/queuemanager/dist'),('b8d072c3','@app/web/assets/admintable/dist'),('bae9e94','@lib/velocity'),('bb54c120','@lib/jquery-touch-events'),('bf58feb8','@app/web/assets/updates/dist'),('c17ca802','@app/web/assets/matrixsettings/dist'),('c406fdd8','@lib/timepicker'),('c711525c','@lib/d3'),('c8993c60','@lib/xregexp'),('ca28e1','@app/web/assets/tablesettings/dist'),('cac7c227','@lib/fabric'),('d423d411','@app/web/assets/dashboard/dist'),('d7b139ce','@app/web/assets/feed/dist'),('dbee49ab','@lib/selectize'),('df811619','@lib/garnishjs'),('e29921ce','@lib/picturefill'),('e35ab1c','@app/web/assets/cp/dist'),('e53d1d0c','@lib/jquery-touch-events'),('e7bb1785','@lib/prismjs'),('e851b7e2','@app/web/assets/editsection/dist'),('e92003d','@lib/jquery.payment'),('e9adcd2c','@app/web/assets/feed/dist'),('f195e127','@lib/selectize'),('f32a3ec','@lib/vue'),('f7666415','@lib/timepicker'),('fa712030','@lib/fileupload'),('fbf9a5ad','@lib/xregexp'),('fe60f599','@app/web/assets/admintable/dist'),('ff2ef64d','@lib/element-resize-detector'),('ff605ce0','@app/web/assets/matrixsettings/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  KEY `revisions_creatorId_fk` (`creatorId`),
  CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,3,1,1,NULL),(2,3,1,2,NULL),(3,6,1,1,NULL),(4,6,1,2,NULL),(5,6,1,3,NULL),(6,6,1,4,NULL),(7,6,1,5,NULL),(8,13,1,1,NULL),(9,13,1,2,NULL),(10,13,1,3,NULL),(11,13,1,4,NULL),(12,6,1,6,NULL),(13,36,1,1,NULL),(14,6,1,7,NULL),(15,47,1,1,NULL),(16,6,1,8,NULL),(17,58,1,1,NULL),(18,6,1,9,NULL),(19,58,1,2,NULL),(20,47,1,2,NULL),(21,36,1,2,NULL),(22,47,1,3,NULL),(23,58,1,3,NULL),(24,6,1,10,NULL),(25,58,1,4,NULL),(26,58,1,5,NULL),(27,47,1,4,NULL),(28,36,1,3,NULL),(29,6,1,11,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' benreevesrocketmedia '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' benreeves23 gmail com '),(1,'slug',0,1,''),(3,'title',0,1,' header '),(3,'slug',0,1,' header '),(13,'title',0,1,' about '),(6,'title',0,1,' 4 '),(6,'slug',0,1,' hvac info page '),(10,'slug',0,1,''),(13,'slug',0,1,' about '),(16,'kind',0,1,' image '),(16,'extension',0,1,' jpg '),(16,'filename',0,1,' image1 jpg '),(17,'filename',0,1,' image2 200410 225344 jpg '),(17,'extension',0,1,' jpg '),(17,'kind',0,1,' image '),(17,'slug',0,1,''),(17,'title',0,1,' image2 '),(18,'filename',0,1,' image3 jpg '),(18,'extension',0,1,' jpg '),(18,'kind',0,1,' image '),(18,'slug',0,1,''),(18,'title',0,1,' image3 '),(19,'filename',0,1,' image4 jpg '),(19,'extension',0,1,' jpg '),(19,'kind',0,1,' image '),(19,'slug',0,1,''),(19,'title',0,1,' image4 '),(16,'slug',0,1,''),(16,'title',0,1,' image1 '),(20,'filename',0,1,' image1 jpg '),(20,'extension',0,1,' jpg '),(20,'kind',0,1,' image '),(20,'slug',0,1,''),(20,'title',0,1,' image1 '),(21,'filename',0,1,' image2 jpg '),(21,'extension',0,1,' jpg '),(21,'kind',0,1,' image '),(21,'slug',0,1,''),(21,'title',0,1,' image2 '),(22,'filename',0,1,' image3 jpg '),(22,'extension',0,1,' jpg '),(22,'kind',0,1,' image '),(22,'slug',0,1,''),(22,'title',0,1,' image3 '),(23,'filename',0,1,' image4 jpg '),(23,'extension',0,1,' jpg '),(23,'kind',0,1,' image '),(23,'slug',0,1,''),(23,'title',0,1,' image4 '),(25,'slug',0,1,''),(25,'field',17,1,' schedule your repair '),(13,'field',20,1,' image1 '),(13,'field',16,1,' schedule your repair '),(13,'field',13,1,' not fiddle draws threats unspoiled quietly great great great great uncle dog frogmorton wilds prophecy pouring bestow well wishers relatives thirty four guldur rise travel childhood masters call 843 708 5186 '),(28,'slug',0,1,''),(28,'field',17,1,' schedule your repair '),(6,'field',13,1,' titles talisman soft reckless meadow kingdom orcrist arm matters useless unlikely threads spirits pieces ceases wear better fifth aloft signal thorin oakenshield drums pain election '),(6,'field',15,1,' image4 '),(6,'field',16,1,' let us know how we did '),(36,'title',0,1,' 3 '),(36,'slug',0,1,' 2 '),(36,'field',15,1,' image3 '),(36,'field',16,1,' get your system working again '),(36,'field',13,1,' stirring guest plan ringwraiths enchanted alone disappearance condone travel pull dont you leave him samwise gamgee ruling release listened dori bargeman ha simply salted painted tapestry '),(37,'slug',0,1,''),(37,'field',17,1,' meet your technician '),(47,'title',0,1,' 2 '),(47,'slug',0,1,' 3 '),(47,'field',16,1,' meet your technician '),(47,'field',13,1,' holes maiden explain deadliest dimrill calamity sleeping trailing food perfected language raid sigh leave takes chair brandywine lady nothings tea smirking gaining smeagol you are full of surprises master baggins '),(48,'slug',0,1,''),(48,'field',17,1,' get your system working again '),(58,'slug',0,1,' 4 '),(58,'title',0,1,' 1 '),(58,'field',15,1,' image1 '),(58,'field',16,1,' schedule your repair '),(59,'slug',0,1,''),(59,'field',17,1,' let us know how we did '),(58,'field',13,1,' not fiddle draws threats unspoiled quietly great great great great uncle dog frogmorton wilds prophecy pouring bestow well wishers relatives thirty four guldur rise travel childhood masters call 843 708 5186 '),(47,'field',15,1,' image2 ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sections_handle_idx` (`handle`),
  KEY `sections_name_idx` (`name`),
  KEY `sections_structureId_idx` (`structureId`),
  KEY `sections_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'HVAC','hvac','channel',1,'all',NULL,'2020-04-09 23:46:12','2020-04-09 23:46:12','2020-04-09 23:46:48','c1389ca1-f247-460d-aaf2-b472941f49d8'),(2,NULL,'Row 1','row1','channel',1,'all',NULL,'2020-04-09 23:48:01','2020-04-09 23:48:01','2020-04-09 23:52:29','a9224abe-8ec9-4c7e-94ad-efe6e9fa4fd7'),(3,NULL,'Row 2','row2','channel',1,'all',NULL,'2020-04-09 23:48:32','2020-04-09 23:48:32','2020-04-09 23:52:31','c41a8b3c-e25e-4a47-afdb-dc9eda31d7ae'),(4,NULL,'Row 3','row3','channel',1,'all',NULL,'2020-04-09 23:48:41','2020-04-09 23:48:41','2020-04-09 23:52:32','481679a2-db44-4c47-a085-54e3c3f6423b'),(5,NULL,'Row 4','row4','channel',1,'all',NULL,'2020-04-09 23:48:51','2020-04-09 23:48:51','2020-04-09 23:52:33','0a2c09df-972e-45fb-b6ee-06f4d776b5f0'),(6,NULL,'Rows','rows','channel',1,'all',NULL,'2020-04-09 23:52:57','2020-04-09 23:52:57','2020-04-09 23:59:10','eaa0fe5e-e19a-4130-8392-115430ddeaf9'),(7,NULL,'HVAC Info Page','hvacInfoPage','channel',1,'all',NULL,'2020-04-10 00:01:03','2020-04-10 21:39:40',NULL,'d2cae04a-9710-48e5-b489-32ed254dec09'),(8,NULL,'About','about','single',1,'all',NULL,'2020-04-10 22:52:21','2020-04-10 22:52:21',NULL,'de4299f7-ac02-494c-a70c-38b3d48f0447');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'hvac/{slug}','_layout',1,'2020-04-09 23:46:12','2020-04-09 23:46:12','7c3e0101-909e-4ff5-8464-b9b8f9be75b0'),(2,2,1,1,'row-1/{slug}','row1',1,'2020-04-09 23:48:01','2020-04-09 23:48:01','c32b0876-71b2-4e36-8656-3468b77d3ee9'),(3,3,1,1,'row-2/{slug}','row2',1,'2020-04-09 23:48:32','2020-04-09 23:48:32','1994fb16-1f61-4388-8663-51791e27e837'),(4,4,1,1,'row-3/{slug}','row3',1,'2020-04-09 23:48:41','2020-04-09 23:48:41','54ffc6a2-642b-47b3-a1a9-b8e9f72cf4f5'),(5,5,1,1,'row-4/{slug}','row4',1,'2020-04-09 23:48:51','2020-04-09 23:48:51','f6dc8b5e-b754-4e9e-864f-26e36ac7c8e6'),(6,6,1,1,'rows/{slug}','_rows/head',1,'2020-04-09 23:52:57','2020-04-09 23:52:57','98ad67cc-24cc-427a-bed9-3f685837a22d'),(7,7,1,1,'hvacInfoPage/{slug}','hvacInfoPage/_template',1,'2020-04-10 00:01:03','2020-04-11 16:10:49','728975f9-abdd-4159-8562-f1186e24c2aa'),(8,8,1,1,'about','_singles/about',1,'2020-04-10 22:52:21','2020-04-10 22:52:21','ab58bd7e-3c76-4357-a8b6-95421f0c894c');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sessions_uid_idx` (`uid`),
  KEY `sessions_token_idx` (`token`),
  KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `sessions_userId_idx` (`userId`),
  CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (3,1,'v0Gh9lTtJtjQAKpKRmnIOsH5o98MQ6bFBTeaay08hhVWhaGSsWuMBZRapoYWWobWhJGDVhtzZVfahrccAm_S_O0IBCbpZLW7QHAo','2020-04-08 23:04:41','2020-04-08 23:13:07','1e02c548-21f7-475e-b066-69b89b09ac02'),(6,1,'mDBesGtucXhrSiyFhcNOApsZj0GB7Bcy4LM6BZlHClsfG8KZu6iGAujXOfswo2lQ4Nnsa8tspu4kN3sIezlnZiZ08f1qwMPnojGh','2020-04-11 15:49:44','2020-04-11 18:41:50','cfad5272-421c-421f-93ba-17c1a5141757');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sitegroups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'Server - RM','2020-04-07 01:09:58','2020-04-07 01:09:58',NULL,'1dd3f51e-6261-4018-9010-7f9379e978a6');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sites_dateDeleted_idx` (`dateDeleted`),
  KEY `sites_handle_idx` (`handle`),
  KEY `sites_sortOrder_idx` (`sortOrder`),
  KEY `sites_groupId_fk` (`groupId`),
  CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,'Server - RM','default','en-US',1,'$DEFAULT_SITE_URL',1,'2020-04-07 01:09:58','2020-04-07 01:09:58',NULL,'94d019ff-7280-4a06-8867-b672726e923d');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `structureelements_root_idx` (`root`),
  KEY `structureelements_lft_idx` (`lft`),
  KEY `structureelements_rgt_idx` (`rgt`),
  KEY `structureelements_level_idx` (`level`),
  KEY `structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
INSERT INTO `structures` VALUES (1,1,'2020-04-10 21:49:16','2020-04-10 21:49:16',NULL,'be0f0763-1d56-4732-9b9d-b09157d64934');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taggroups_name_idx` (`name`),
  KEY `taggroups_handle_idx` (`handle`),
  KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tags_groupId_idx` (`groupId`),
  CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecacheelements`
--

LOCK TABLES `templatecacheelements` WRITE;
/*!40000 ALTER TABLE `templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `templatecachequeries_type_idx` (`type`),
  CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecachequeries`
--

LOCK TABLES `templatecachequeries` WRITE;
/*!40000 ALTER TABLE `templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecaches`
--

LOCK TABLES `templatecaches` WRITE;
/*!40000 ALTER TABLE `templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unq_idx` (`token`),
  KEY `tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  UNIQUE KEY `usergroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_uid_idx` (`uid`),
  KEY `users_verificationCode_idx` (`verificationCode`),
  KEY `users_email_idx` (`email`),
  KEY `users_username_idx` (`username`),
  KEY `users_photoId_fk` (`photoId`),
  CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'benreevesrocketmedia',NULL,NULL,NULL,'benreeves23@gmail.com','$2y$13$hDXg8HB53O/c.n5qzklkJOtZFBHOeVPA.gmUGBw.rMFlawovJybFi',1,0,0,0,'2020-04-11 15:49:44',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2020-04-07 01:09:59','2020-04-07 01:09:59','2020-04-11 15:49:44','fc129cc1-53c0-4064-9592-6c93fbc97c64');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `volumefolders_parentId_idx` (`parentId`),
  KEY `volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'hvacPhotos','','2020-04-10 21:46:01','2020-04-10 21:46:01','1edcc144-adb5-49ef-8274-e5021ac55bc2'),(2,NULL,NULL,'Temporary source',NULL,'2020-04-10 22:45:08','2020-04-10 22:45:08','855a82f6-1313-4dd5-86c2-b52a7c36095d'),(3,2,NULL,'user_1','user_1/','2020-04-10 22:45:08','2020-04-10 22:45:08','7c1e206f-3fe2-4977-b9b4-79c0e37065f6'),(4,NULL,2,'General','','2020-04-10 22:47:58','2020-04-10 22:47:58','d7abdb91-c363-4dfa-9d27-29970d8bbadb');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `volumes_name_idx` (`name`),
  KEY `volumes_handle_idx` (`handle`),
  KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `volumes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,NULL,'hvacPhotos','hvacphotos','craft\\volumes\\Local',1,'@web/assets/hvac','{\"path\":\"@webroot/assets/hvac\"}',1,'2020-04-10 21:46:01','2020-04-10 21:46:01',NULL,'72aa9b18-a718-4c43-9d85-d7c641d8c0ec'),(2,NULL,'General','general','craft\\volumes\\Local',1,'@web/assets/general','{\"path\":\"@webroot/assets/general\"}',2,'2020-04-10 22:47:58','2020-04-10 22:47:58',NULL,'b4f5e577-033d-4447-b1fb-9003e4537968');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widgets_userId_idx` (`userId`),
  CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":\"10\"}',1,'2020-04-07 01:10:08','2020-04-08 23:09:03','7b936689-4b32-4d1c-a7fd-ef9504d77c7e'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2020-04-07 01:10:08','2020-04-07 01:10:08','d8bc31fb-0ba3-4d49-9f78-ec3b42a0874c'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2020-04-07 01:10:08','2020-04-07 01:10:08','37f95896-4523-4582-9436-6fa95d85c2ac'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2020-04-07 01:10:08','2020-04-07 01:10:08','d1b2191d-1596-445b-b430-552fc95e1e08'),(5,1,'craft\\widgets\\RecentEntries',5,NULL,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":\"10\"}',1,'2020-04-08 23:07:01','2020-04-08 23:07:01','1e68df77-4f88-4cd6-ba64-b50304b1f0fe');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-11 18:42:42
