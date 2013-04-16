-- MySQL dump 10.13  Distrib 5.5.14, for osx10.6 (i386)
--
-- Host: localhost    Database: bubboli_kids_development
-- ------------------------------------------------------
-- Server version	5.5.14

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
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
INSERT INTO `blog_categories` VALUES (1,'blog cat 1','2012-04-10 22:53:58','2012-04-10 22:53:58'),(2,'blog cat 2','2012-04-10 22:54:07','2012-04-10 22:54:07');
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_categorizations`
--

DROP TABLE IF EXISTS `blog_categorizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_categorizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) DEFAULT NULL,
  `blog_category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_blog_categorizations_on_blog_id_and_blog_category_id` (`blog_id`,`blog_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categorizations`
--

LOCK TABLES `blog_categorizations` WRITE;
/*!40000 ALTER TABLE `blog_categorizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_categorizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_images`
--

DROP TABLE IF EXISTS `blog_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_blog_images_on_blog_id` (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_images`
--

LOCK TABLES `blog_images` WRITE;
/*!40000 ALTER TABLE `blog_images` DISABLE KEYS */;
INSERT INTO `blog_images` VALUES (1,1,'sleep_sheep.jpg',NULL,NULL,NULL,'2012-03-21 16:36:55','2012-03-21 16:49:01'),(2,2,'sleep_sheep.jpg','pTRU1-11814392dt.jpg',NULL,NULL,'2012-03-21 16:42:08','2012-03-21 16:42:08');
/*!40000 ALTER TABLE `blog_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `published` tinyint(1) DEFAULT '0',
  `author` varchar(255) DEFAULT NULL,
  `author_permalink` varchar(255) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'test 1','3. For an older child, you can both personalize a space and help your child channel their inner Picasso with this wall paper.  I first saw this at www.amazon.com on HGTV’s Genieve and fell in LOVE with it.  You can print out family pictures and stick them within the outlined frames.  Or, better yet, foster your  kids’ artistic development by letting them draw their own version of a family portrait in one of the many frames. ',1,'','','2012-03-21 16:35:00','2012-03-21 16:36:55','2012-03-30 19:03:52'),(2,'test 2','',1,'','','2012-03-21 16:41:00','2012-03-21 16:42:08','2012-03-21 16:42:08');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `child_images`
--

DROP TABLE IF EXISTS `child_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `profile` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_child_images_on_child_id` (`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child_images`
--

LOCK TABLES `child_images` WRITE;
/*!40000 ALTER TABLE `child_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `child_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `children`
--

DROP TABLE IF EXISTS `children`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `children` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `children`
--

LOCK TABLES `children` WRITE;
/*!40000 ALTER TABLE `children` DISABLE KEYS */;
INSERT INTO `children` VALUES (232,'Child One','2012-10-23','Female','2012-10-22 23:45:55','2012-12-17 20:07:53'),(233,'Child Two','2012-11-22','Male','2012-10-22 23:46:28','2012-12-17 20:08:08'),(234,'Child Three','2012-06-23','Female','2012-10-23 00:14:59','2012-12-17 20:08:31'),(235,'Child Four','2011-10-20','Female','2012-10-23 00:18:40','2012-12-17 20:08:58'),(236,'Child Five','2011-12-24','Female','2012-10-23 18:11:44','2012-12-17 20:09:11'),(237,'Child Six','2012-11-07','Female','2012-11-07 20:26:09','2012-12-17 20:09:21'),(238,'Child Seven','2011-11-12','male','2012-11-12 20:08:49','2012-12-17 20:09:30'),(239,'Child Eight','2012-11-27','Female','2012-11-13 16:15:55','2012-12-17 20:09:41'),(240,'Child Nine','2010-11-30','Female','2012-11-13 16:17:15','2012-12-17 20:09:52'),(241,'Child Ten','2012-11-27','Female','2012-11-27 18:43:13','2012-12-17 20:10:03'),(242,'Child Eleven','2012-12-05','Female','2012-12-05 22:52:58','2012-12-17 20:10:16'),(243,'Child Twelve','2012-12-07','Male','2012-12-07 21:43:19','2012-12-17 20:10:26'),(244,'Child 13','2012-12-07','Male','2012-12-07 21:44:44','2012-12-17 20:10:39'),(245,'Child 14','2012-12-12','Male','2012-12-12 18:31:21','2012-12-17 20:10:47'),(247,'Child 16','2012-12-15','Male','2012-12-15 21:26:53','2012-12-17 20:11:18'),(248,'Child 20','2012-12-23','Male','2012-12-23 21:24:46','2012-12-23 21:24:46'),(249,'Child 21','2012-12-23','Male','2012-12-23 22:15:23','2012-12-23 22:15:23'),(250,'Child 22','2012-10-23','Female','2012-12-23 22:15:35','2012-12-23 22:15:35'),(251,'Child 23','2012-08-23','Male','2012-12-23 22:21:51','2012-12-23 22:21:51'),(252,'Child 25','2012-12-23','Female','2012-12-23 22:28:33','2012-12-23 22:28:33'),(254,'Child 26','2012-04-02','Male','2012-12-23 22:29:57','2013-03-05 17:46:00'),(255,'Child 27','2012-12-23','Female','2012-12-23 22:32:19','2012-12-23 22:32:19'),(256,'Child 28','2012-12-23','Male','2012-12-23 22:33:17','2012-12-23 22:33:17'),(257,'Child 28','2012-11-24','Male','2012-12-24 18:24:18','2012-12-24 18:24:18'),(258,'Child 29','2012-03-21','Male','2013-01-08 00:42:08','2013-03-05 17:46:32'),(259,'Child 29','2013-01-08','Female','2013-01-08 01:16:44','2013-01-08 01:16:44'),(260,'Child 29','2013-01-08','Female','2013-01-08 15:46:22','2013-01-08 15:46:22'),(261,'Child 30','2013-01-08','Female','2013-01-08 15:47:15','2013-01-08 15:47:15'),(262,'Child 30','2013-01-16','Female','2013-01-16 06:31:17','2013-01-16 06:31:17'),(263,'Child 31','2013-01-17','Female','2013-01-17 18:11:33','2013-01-17 18:11:33'),(266,'my child name','2012-02-19','Male','2013-02-20 04:09:13','2013-02-20 04:09:13'),(267,'Child50','2012-02-21','Male','2013-02-21 18:31:10','2013-02-21 18:31:10'),(268,'New CHild','2012-02-22','Male','2013-02-22 22:23:03','2013-02-22 22:23:03'),(269,'Name','2012-03-01','male','2013-02-26 23:59:14','2013-02-26 23:59:14'),(273,'Andy Kid 1','2012-03-12','Male','2013-03-13 21:51:53','2013-03-13 21:51:53'),(274,'Andy Kid 1','2012-03-12','Male','2013-03-13 21:52:31','2013-03-13 21:52:31'),(275,'Andy Kid 1','2012-03-12','Male','2013-03-13 21:53:07','2013-03-13 21:53:07'),(276,'Andy Kid 1','2012-03-12','Male','2013-03-13 21:53:32','2013-03-13 21:53:32'),(277,'Andy Kid 1','2012-03-12','Male','2013-03-13 21:53:54','2013-03-13 21:53:54'),(278,'Andy Kid 1','2012-03-12','Male','2013-03-13 21:54:16','2013-03-13 21:54:16'),(279,'Andy Kid 1','2012-03-12','Male','2013-03-13 22:22:34','2013-03-13 22:22:34'),(280,'sandy kid 4','2008-01-09','Female','2013-03-13 22:33:18','2013-03-13 22:33:18'),(281,'sandy kid 5','2013-02-13','Male','2013-03-13 22:33:50','2013-03-13 22:33:50'),(282,'sandy kid 6','2013-03-13','Female','2013-03-13 22:36:05','2013-03-13 22:36:05'),(283,'mandy kid 1','2011-03-13','Female','2013-03-13 22:44:22','2013-03-13 22:44:22'),(284,'Andy Kid 1','2012-03-13','Male','2013-03-13 23:13:55','2013-03-13 23:13:55'),(285,'Andy Kid 1','2012-03-13','Male','2013-03-13 23:16:18','2013-03-13 23:16:18'),(287,'parent kid 1','2012-03-10','Female','2013-03-14 18:28:56','2013-03-14 18:28:56'),(291,'BB','2010-03-11','Female','2013-03-14 23:21:35','2013-03-14 23:21:35'),(292,'cc','2009-03-18','Male','2013-03-15 18:00:39','2013-03-15 18:00:39'),(293,'Mason','2013-03-21','Male','2013-03-21 17:21:43','2013-03-21 17:21:43'),(294,'Isabel','2012-03-30','Female','2013-03-22 14:51:36','2013-03-22 15:51:26'),(295,'test','2013-02-01','Male','2013-04-02 15:07:02','2013-04-02 15:07:02'),(296,'Mason','2013-03-04','Male','2013-04-04 19:12:06','2013-04-04 19:12:06');
/*!40000 ALTER TABLE `children` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) DEFAULT NULL,
  `content` text,
  `commenter` varchar(255) DEFAULT NULL,
  `commenter_email` varchar(255) DEFAULT NULL,
  `commenter_permalink` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_blog_id` (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,2,'comment test one','test','test@abc.com','',NULL,'2012-06-04 17:30:41','2012-06-04 17:30:41'),(2,1,'testing a new comment one','test','test@abc.com','',NULL,'2012-06-28 16:19:14','2012-06-28 16:19:14');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_accessions`
--

DROP TABLE IF EXISTS `gift_accessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_accessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gift_id` int(11) DEFAULT NULL,
  `child_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gift_accessions_on_child_id` (`child_id`),
  KEY `index_gift_accessions_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_accessions`
--

LOCK TABLES `gift_accessions` WRITE;
/*!40000 ALTER TABLE `gift_accessions` DISABLE KEYS */;
INSERT INTO `gift_accessions` VALUES (1,3,296,61,0,'2013-04-06 23:54:17','2013-04-06 23:54:17');
/*!40000 ALTER TABLE `gift_accessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_age_classifications`
--

DROP TABLE IF EXISTS `gift_age_classifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_age_classifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gift_id` int(11) DEFAULT NULL,
  `gift_age_range_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gift_age_classifications_on_gift_id_and_gift_age_range_id` (`gift_id`,`gift_age_range_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_age_classifications`
--

LOCK TABLES `gift_age_classifications` WRITE;
/*!40000 ALTER TABLE `gift_age_classifications` DISABLE KEYS */;
INSERT INTO `gift_age_classifications` VALUES (1,8,2,'2012-04-10 20:26:27','2012-04-10 20:26:27'),(2,7,2,'2012-04-10 20:58:45','2012-04-10 20:58:45'),(3,7,3,'2012-04-10 20:58:45','2012-04-10 20:58:45'),(5,2,3,'2012-11-20 22:21:20','2012-11-20 22:21:20'),(6,2,3,'2012-11-20 22:21:41','2012-11-20 22:21:41'),(7,9,2,'2012-11-28 03:57:42','2012-11-28 03:57:42'),(8,6,1,'2012-11-28 19:54:13','2012-11-28 19:54:13'),(9,8,1,'2012-11-28 19:56:08','2012-11-28 19:56:08'),(10,6,3,'2012-11-30 18:37:03','2012-11-30 18:37:03'),(11,9,3,'2012-11-30 21:30:15','2012-11-30 21:30:15'),(12,4,1,'2012-11-30 21:30:27','2012-11-30 21:30:27'),(13,4,3,'2012-11-30 21:30:27','2012-11-30 21:30:27'),(14,2,2,'2012-11-30 21:32:55','2012-11-30 21:32:55'),(15,1,1,'2012-12-10 22:19:42','2012-12-10 22:19:42'),(16,1,2,'2012-12-10 22:19:42','2012-12-10 22:19:42');
/*!40000 ALTER TABLE `gift_age_classifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_age_ranges`
--

DROP TABLE IF EXISTS `gift_age_ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_age_ranges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_age_ranges`
--

LOCK TABLES `gift_age_ranges` WRITE;
/*!40000 ALTER TABLE `gift_age_ranges` DISABLE KEYS */;
INSERT INTO `gift_age_ranges` VALUES (1,'Birth-12 Mos.','2012-04-10 20:25:00','2012-04-10 20:31:09'),(2,'12-24 Mos.','2012-04-10 20:25:33','2012-04-10 20:31:18'),(3,'2 Years','2012-04-10 20:25:44','2012-04-10 20:31:29');
/*!40000 ALTER TABLE `gift_age_ranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_categories`
--

DROP TABLE IF EXISTS `gift_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_categories`
--

LOCK TABLES `gift_categories` WRITE;
/*!40000 ALTER TABLE `gift_categories` DISABLE KEYS */;
INSERT INTO `gift_categories` VALUES (1,'New stuff','2012-04-02 21:19:59','2012-04-02 21:19:59'),(2,'fun stuff','2012-04-02 21:20:08','2012-04-02 21:20:08'),(3,'learning stuff','2012-04-02 21:20:15','2012-04-02 21:20:15'),(4,'fourth category','2012-12-20 15:34:56','2012-12-20 15:35:41'),(5,'Fifth category','2012-12-20 15:35:15','2012-12-20 15:35:15'),(6,'sixth category','2012-12-20 15:35:28','2012-12-20 15:35:28'),(7,'seventh category','2012-12-20 15:37:10','2012-12-20 15:37:10'),(8,'eigth category','2012-12-20 15:37:29','2012-12-20 15:37:29'),(9,'Baby Shower','2013-03-06 19:02:33','2013-03-06 19:02:33');
/*!40000 ALTER TABLE `gift_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_categorizations`
--

DROP TABLE IF EXISTS `gift_categorizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_categorizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gift_id` int(11) DEFAULT NULL,
  `gift_category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gift_categorizations_on_gift_id_and_gift_category_id` (`gift_id`,`gift_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_categorizations`
--

LOCK TABLES `gift_categorizations` WRITE;
/*!40000 ALTER TABLE `gift_categorizations` DISABLE KEYS */;
INSERT INTO `gift_categorizations` VALUES (1,7,2,'2012-04-02 21:20:28','2012-04-02 21:20:28'),(2,7,3,'2012-04-02 21:20:28','2012-04-02 21:20:28'),(4,4,2,'2012-04-04 14:28:27','2012-04-04 14:28:27'),(5,2,3,'2012-04-04 14:53:27','2012-04-04 14:53:27'),(7,3,3,'2012-04-04 14:54:06','2012-04-04 14:54:06'),(8,6,3,'2012-04-04 14:54:11','2012-04-04 14:54:11'),(9,6,2,'2012-04-04 15:51:49','2012-04-04 15:51:49'),(11,8,3,'2012-04-04 19:35:40','2012-04-04 19:35:40'),(12,4,3,'2012-04-04 21:49:31','2012-04-04 21:49:31'),(13,1,1,'2012-04-04 21:56:18','2012-04-04 21:56:18'),(14,7,1,'2012-04-04 22:22:48','2012-04-04 22:22:48'),(15,9,1,'2012-04-17 22:16:58','2012-04-17 22:16:58'),(16,9,2,'2012-06-01 22:23:04','2012-06-01 22:23:04'),(17,9,3,'2012-11-29 19:17:21','2012-11-29 19:17:21'),(18,6,1,'2012-11-29 19:17:38','2012-11-29 19:17:38'),(19,1,9,'2013-03-06 19:10:40','2013-03-06 19:10:40');
/*!40000 ALTER TABLE `gift_categorizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_images`
--

DROP TABLE IF EXISTS `gift_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gift_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gift_images_on_gift_id` (`gift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_images`
--

LOCK TABLES `gift_images` WRITE;
/*!40000 ALTER TABLE `gift_images` DISABLE KEYS */;
INSERT INTO `gift_images` VALUES (2,2,'LG_307500_XGA.jpg','2012-03-23 20:35:06','2012-03-23 20:35:06'),(3,3,'plasma_car_3.jpg','2012-03-26 04:36:23','2012-04-23 15:05:52'),(10,7,'pewi-2.gif','2012-03-26 18:09:33','2012-03-28 02:45:06'),(14,7,'pewi1.jpg','2012-03-27 15:34:31','2012-03-28 02:45:06'),(15,7,'pewi2.jpg','2012-03-27 19:13:04','2012-03-28 02:45:06'),(16,7,'pewi4.jpg','2012-03-28 02:45:06','2012-03-28 02:45:06'),(18,4,'Bloem_Drying_Rack.jpg','2012-04-04 14:43:38','2012-04-04 14:43:38'),(19,8,'keepsake_3.jpg','2012-04-04 19:35:40','2012-04-28 05:22:44'),(32,6,'3_sprouts_storage_6.jpeg','2012-04-26 19:05:39','2012-04-28 05:34:18'),(43,1,'sickemup_wall_decal.jpg','2012-04-26 23:57:46','2012-04-26 23:57:46'),(47,9,'sickemup_wall_decal.jpg','2012-04-27 00:01:25','2012-04-27 00:01:25'),(49,7,'trunki_3.jpg','2012-04-27 03:59:40','2012-04-27 03:59:40'),(50,9,'trunki_1.jpg','2012-04-27 04:00:35','2012-04-27 04:00:35'),(51,9,'trunk_2.jpg','2012-04-27 04:00:35','2012-04-27 04:00:35'),(55,9,'appCrayon_web2.jpg','2012-06-05 15:57:57','2012-06-05 15:57:57'),(56,9,'appCrayon_web2.jpg','2012-06-05 15:58:23','2012-06-05 15:58:23');
/*!40000 ALTER TABLE `gift_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_price_classifications`
--

DROP TABLE IF EXISTS `gift_price_classifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_price_classifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gift_id` int(11) DEFAULT NULL,
  `gift_price_range_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gift_price_classifications_on_gift_id` (`gift_id`),
  KEY `index_gift_price_classifications_on_gift_price_range_id` (`gift_price_range_id`),
  KEY `gift_price_classification` (`gift_id`,`gift_price_range_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_price_classifications`
--

LOCK TABLES `gift_price_classifications` WRITE;
/*!40000 ALTER TABLE `gift_price_classifications` DISABLE KEYS */;
INSERT INTO `gift_price_classifications` VALUES (1,1,1,'2013-04-04 21:14:04','2013-04-04 21:14:04'),(2,1,2,'2013-04-04 21:14:04','2013-04-04 21:14:04'),(3,2,3,'2013-04-04 21:14:10','2013-04-04 21:14:10'),(4,3,1,'2013-04-04 21:14:17','2013-04-04 21:14:17'),(5,3,2,'2013-04-04 21:14:17','2013-04-04 21:14:17'),(6,4,2,'2013-04-04 21:14:24','2013-04-04 21:14:24'),(7,4,3,'2013-04-04 21:14:24','2013-04-04 21:14:24'),(8,6,1,'2013-04-04 21:14:32','2013-04-04 21:14:32'),(9,7,2,'2013-04-04 21:14:39','2013-04-04 21:14:39'),(10,8,3,'2013-04-04 21:14:47','2013-04-04 21:14:47'),(11,9,1,'2013-04-04 21:14:56','2013-04-04 21:14:56'),(12,9,2,'2013-04-04 21:14:56','2013-04-04 21:14:56'),(13,9,3,'2013-04-04 21:14:56','2013-04-04 21:14:56');
/*!40000 ALTER TABLE `gift_price_classifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gift_price_ranges`
--

DROP TABLE IF EXISTS `gift_price_ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_price_ranges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gift_price_ranges`
--

LOCK TABLES `gift_price_ranges` WRITE;
/*!40000 ALTER TABLE `gift_price_ranges` DISABLE KEYS */;
INSERT INTO `gift_price_ranges` VALUES (1,'0-50','2013-04-04 21:13:14','2013-04-04 21:13:14'),(2,'51-100','2013-04-04 21:13:26','2013-04-04 21:13:26'),(3,'100-200','2013-04-04 21:13:35','2013-04-04 21:13:35');
/*!40000 ALTER TABLE `gift_price_ranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gifts`
--

DROP TABLE IF EXISTS `gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  `sku` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `merchant` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `description` text,
  `review` text,
  `why_bubboli_loves_it` text,
  `favorite` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `baby_shower` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gifts_on_favorite` (`favorite`),
  KEY `index_gifts_on_baby_shower` (`baby_shower`),
  KEY `index_gifts_on_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gifts`
--

LOCK TABLES `gifts` WRITE;
/*!40000 ALTER TABLE `gifts` DISABLE KEYS */;
INSERT INTO `gifts` VALUES (1,'Little Giraffe Chenille Blanket','www.abc.com',1,'','',14.50,'Little Giraffe Chenille Blanket','Female','knowing someon\'e got my baby. now you aint around, i cant think, i should;ve put it down should;ve got that ring. \r\n\r\nmy lover my life, my baby my wife',NULL,'',1,'2012-03-21 16:33:30','2013-03-06 20:49:58',NULL),(2,'test 2','www.abc.com',1,'','',14.50,'test 2','Female','Pewi is a new innovative \"Walking Buddy/Ride-on for the toddler market\". Beginning as young as 9 months Pewi is the coolest, sleekest walker around. However, unlike traditional Walkers on the market where the child is typically sitting in the walker the Pewi actually enhances body and space awareness. In a traditional walker a child does not learn to fall as he or she typically just sits or hangs in the unit. With the Pewi the Child stands freely in front of Pewi using it only as an aid. They can easily let go of Pewi and sit on the ground or knock other items themselves. This freedom of movement at a young age has proven to stimulate body in space awareness a key for balance and motor skill development. ',NULL,'',0,'2012-03-23 20:35:06','2012-11-30 21:32:18',NULL),(3,'test 3','abc.om',1,'','',23.99,'amazon','Male','',NULL,'',1,'2012-03-26 04:36:23','2012-03-26 04:36:23',NULL),(4,'test 4','abc.om',1,'','',25.00,'amazon','Unisex','',NULL,'',0,'2012-03-26 06:06:05','2012-04-10 23:12:28',NULL),(6,'test 5','www.abc.com',1,'','',14.50,'test 2','Unisex','will you come back, no one knows. i realized it was only jsut a dream, only just a dream. it was only just a fream.\r\n\r\ni was thinking about you, thinking about me, thinking about us, what we are going to be, opened my eyes it was only just a dream\r\n\r\nwull you come back, no one knows, i realize it was only just a dream.',NULL,'',1,'2012-03-26 14:24:53','2012-11-28 19:54:13',NULL),(7,'Bookshelf with Storage Bins','www.abc.com',1,'','',14.50,'test 2','Unisex','We all know kids can get a little excited when it comes to chocolate and other sweets. The dispenser only dispenses a certain amount of candy so they can learn to have candy in moderation.\r\n\r\nWe love it when kids\' faces light up every time it dispenses candy. Younger kids get a real kick out of how it appears almost out of thin air.\r\n\r\nThis is a great feature to have at any birthday party. Friends can take turns dispensing candy.\r\n\r\nOh, and don\'t worry about the pointy crown. It is made out of soft plastic.\r\n\r\nOur friends abroad love this iconic Statue of Liberty figure. They can\'t wait to take their kids to New York and see the real Statue of Liberty.',NULL,'',0,'2012-03-26 18:09:33','2012-04-10 23:09:13',NULL),(8,'girafffe','www.abc.com',1,'','',46.00,'test 2','Unisex','',NULL,'',0,'2012-04-04 19:35:40','2012-11-28 19:56:28',NULL),(9,'Wall Decal','www.abc.com',1,'','',12.00,'Amazon','Female','it was only just a dream. see your face at every turn, didnt give it all my love i geuss now i fet my payback',NULL,'',1,'2013-02-18 03:16:58','2013-02-20 03:16:58',NULL);
/*!40000 ALTER TABLE `gifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `child_id` int(11) DEFAULT NULL,
  `recipient_email` varchar(255) DEFAULT NULL,
  `invitation_token` varchar(255) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_invitations_on_sender_id` (`sender_id`),
  KEY `index_invitations_on_child_id` (`child_id`),
  KEY `index_invitations_on_sender_id_and_child_id` (`sender_id`,`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_types`
--

DROP TABLE IF EXISTS `relation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_types`
--

LOCK TABLES `relation_types` WRITE;
/*!40000 ALTER TABLE `relation_types` DISABLE KEYS */;
INSERT INTO `relation_types` VALUES (1,'Parent','2012-06-19 19:48:08','2013-03-01 18:26:09'),(2,'Uncle','2012-06-19 19:48:18','2013-03-01 18:26:31'),(3,'Aunt','2012-12-04 23:31:33','2012-12-04 23:31:33');
/*!40000 ALTER TABLE `relation_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `child_id` int(11) DEFAULT NULL,
  `relation_type_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'Pending',
  `accepted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `reminders` text,
  `next_reminder_due_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_relationships_on_user_id` (`user_id`),
  KEY `index_relationships_on_child_id` (`child_id`),
  KEY `index_relationships_on_relation_type_id` (`relation_type_id`),
  KEY `user_child_relationship_idx` (`user_id`,`child_id`,`relation_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES (1,61,295,2,'Pending',NULL,'2013-04-02 15:07:02','2013-04-02 15:07:02','--- {}\n',NULL),(2,61,296,3,'Pending',NULL,'2013-04-04 19:12:06','2013-04-04 19:12:06','--- {}\n',NULL);
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminder_options`
--

DROP TABLE IF EXISTS `reminder_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminder_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminder_options`
--

LOCK TABLES `reminder_options` WRITE;
/*!40000 ALTER TABLE `reminder_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminder_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120306203931'),('20120306204124'),('20120306204254'),('20120306204405'),('20120306204448'),('20120306204512'),('20120306204604'),('20120306204626'),('20120320174630'),('20120321162749'),('20120326043135'),('20120410142705'),('20120410143237'),('20120410215912'),('20120504215428'),('20120516210244'),('20120613152243'),('20120614193128'),('20120618205627'),('20120618205821'),('20120801143713'),('20121019202656'),('20121112191047'),('20121114221607'),('20121126203242'),('20121127214931'),('20121127220222'),('20121128034819'),('20121128183748'),('20121219153123'),('20121228185739'),('20130129162134'),('20130305184626'),('20130305184924'),('20130306203127'),('20130306204654');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_child_cat_prefs`
--

DROP TABLE IF EXISTS `user_child_cat_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_child_cat_prefs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relationship_id` int(11) DEFAULT NULL,
  `gift_category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_child_cat_prefs_on_relationship_id` (`relationship_id`),
  KEY `index_user_child_cat_prefs_on_gift_category_id` (`gift_category_id`),
  KEY `user_child_cat_pref` (`relationship_id`,`gift_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_child_cat_prefs`
--

LOCK TABLES `user_child_cat_prefs` WRITE;
/*!40000 ALTER TABLE `user_child_cat_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_child_cat_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_child_price_prefs`
--

DROP TABLE IF EXISTS `user_child_price_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_child_price_prefs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relationship_id` int(11) DEFAULT NULL,
  `gift_price_range_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_child_price_prefs_on_relationship_id` (`relationship_id`),
  KEY `index_user_child_price_prefs_on_gift_price_range_id` (`gift_price_range_id`),
  KEY `user_child_price_pref` (`relationship_id`,`gift_price_range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_child_price_prefs`
--

LOCK TABLES `user_child_price_prefs` WRITE;
/*!40000 ALTER TABLE `user_child_price_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_child_price_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `work_email` varchar(255) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `password_reset_sent_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmation_token_sent_at` datetime DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `gender` varchar(255) DEFAULT NULL,
  `address_street` varchar(255) DEFAULT NULL,
  `address_apt` varchar(255) DEFAULT NULL,
  `address_city` varchar(255) DEFAULT NULL,
  `address_state` varchar(255) DEFAULT NULL,
  `address_zip` int(11) DEFAULT NULL,
  `address_country` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `invitation_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email_and_work_email` (`email`,`work_email`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','','abc@test.com','','135d035bd84ed63727db5685f84bd1d9530dcb0aa8f145cac196fecef5fee1ae','648bf2a3507f4fc14c0a6d23bd02971bf18217e0956b58f4e2c0d78da1653340',NULL,NULL,NULL,NULL,0,'','','','NY','NY',NULL,NULL,1,'2012-03-21 16:32:45','2012-12-17 20:12:35',NULL,NULL),(30,'UserID30','','ming.f.huang@gmail.com','','2afbc3e11384bc022813177e38eabf89e82d60800fb47a88204b181ff24f4652','28ccd2aae1e81f381c012c1116e7822c0761716950eb6010464ec66303363662',NULL,NULL,NULL,NULL,1,'','','','','',NULL,NULL,0,'2012-06-07 22:04:21','2013-02-07 23:55:43',NULL,NULL),(31,'UserID31','','test11@abc.com','','88e56d9053ada3904068b38a2156fa65b699a660a7d2a797aad99fa4bd337905','d3d0855b1ea6fe440d51487f37af58af3ed9c0dcb7a67435dd5171ad4b100fcf',NULL,NULL,NULL,NULL,1,'','','','New York','NY',NULL,NULL,0,'2012-06-07 22:05:54','2013-01-29 18:01:17',NULL,NULL),(40,'UserID 32','','test15@abc.com','','1cf99cc957276ba8a123852e4b737072a944ed42f77f298e2fba37e247a23c04','76ca2647828b3f6c749d9ec661b537e048d24658a6e46387e3379fc997f5df18',NULL,NULL,'W5XOiwXma472-h3fzo4MNw','2012-12-26 20:03:11',0,'Female','','','','',NULL,NULL,0,'2012-12-26 20:03:11','2012-12-26 20:03:11',NULL,NULL),(42,'UserID 33','','test16@abc.com','','4b0bf62a88f35a1cc7afe335acc3f5dac36af4a92e6d8781ead4d1298f0fa89a','5d548a59fc1fc30d76f6eeae9a8653af3830d83f1abdee2157fe3e89a21a7d9e',NULL,NULL,'eDvZCAhBnTTHfBH5juSkmg','2012-12-26 20:04:36',0,'Female','','','','',NULL,NULL,0,'2012-12-26 20:04:36','2012-12-26 20:04:36',NULL,NULL),(43,'UserID 34','','test17@abc.com','','d3f000af405290bd703eb1af3fe6a578f9de528cc909f293ff69356b5a392d0a','cf69352b292a944cef6d2bbea998f4dc26f34791d6b7bca8c560b53f72838abb',NULL,NULL,'BcNXqk9LXXM90qRTWKQ_3w','2012-12-26 20:06:56',0,'Female','','','','',NULL,NULL,0,'2012-12-26 20:06:56','2012-12-26 20:06:56',NULL,NULL),(44,'UserID 35','','test18@abc.com','','3f53fb89e71d2f1d8ed0cba98c4bda97a3a03c08eaf4acc45069c7d298ba848f','272fc044e495a719c02d816fd97ba16fec3e5caede6e248cc2939060c478c111',NULL,NULL,'c7ykFn6LwIC7tnRdarxrgw','2012-12-26 20:07:26',0,'Female','','','','',NULL,NULL,0,'2012-12-26 20:07:26','2012-12-26 20:07:26',NULL,NULL),(46,'UserID 37','','test20@abc.com','','13e7bbe96da3ac35bbb19b10530d029a22d34e1625814e4a53acefd1428fedd6','dd213988df9c6422f0303c94c6975f27146c629a9e318eb75a109c7939117440',NULL,NULL,'zaO0JJc74PQBuBwXruqhtg','2012-12-26 20:11:42',0,'Female','','','','',NULL,NULL,0,'2012-12-26 20:11:42','2012-12-26 20:11:42',NULL,NULL),(48,'UserID 38','','test21@abc.com','','e5256e56d3d8593d8bcc7d0611af6d9a3b73b73502db5ef5c5fca61fed712eec','f06b0a7039e822909343c3db8fd3fb5a8a912ed4f59ec16ef43e944675044dd8',NULL,NULL,'Oeo-bvVkTevFIvEzoegCCQ','2012-12-26 20:16:18',0,'Female','','','','',NULL,NULL,0,'2012-12-26 20:16:18','2012-12-26 20:16:18',NULL,NULL),(50,'UserID 38','','test22@abc.com','','43d932f794142e2d47abd8661f942f7b69e1b0467dcad49266abfb71f2b3ac99','a29db57352a74d8d0b8d38f038158f7fd539f1f1d152bbdbcf9af9f31473d0be',NULL,NULL,'UAjqniO00xWlprZg4PSSOg','2012-12-26 20:23:10',0,'','','','','',NULL,NULL,0,'2012-12-26 20:23:10','2012-12-26 20:23:10',NULL,NULL),(51,'UserID 39','','test23@abc.com','','fcf127944fc8fd5cc174e61e24c6be40921f706dbac14a683d4e846edb3fc303','a19c434fe77a16b8a88562e7488ff4d69af2319ceaef3ce3efc8c7291cf740c6',NULL,NULL,'4KrnjydCWWgBaaagqsHdVA','2012-12-26 20:24:36',0,'','','','','',NULL,NULL,0,'2012-12-26 20:24:36','2012-12-26 20:24:36',NULL,NULL),(52,'UserID 40','','test24@abc.com','','66cfa82d274aff69939fed31c402b6e48d13c97fcc4e1a820836f0cab79d7ada','613753634f0f4b68d1c923a3327bfdf29885d4a54cb62a8c3cbbfe09e4fa6e4a',NULL,NULL,'vAPrzdBA7l0dgyR3aRNldQ','2012-12-26 20:25:15',0,'','','','','',NULL,NULL,0,'2012-12-26 20:25:15','2012-12-26 20:25:15',NULL,NULL),(54,'UserID 41','','test26@abc.com','','a54359c9b4ba3c4b8b4c49fe8925f1ca325e8489ab8bcd46160046fbdb283000','7470ea99c73494761bd44832fc4bbfb1b6b48a8e039f370f159484b46a2704de',NULL,NULL,'xbuVqXZ_bMNt9397lDiQrA','2012-12-26 20:44:24',0,'','','','','',NULL,NULL,0,'2012-12-26 20:44:24','2012-12-26 20:44:24',NULL,NULL),(55,'UserID 45','','test50@abc.com','','23d9b863640d03fbf6116bd8a8431d760c29d821f0cb5c3cc05220095a85ce0d','c19485311b38921e8b9a85449762d63e3fa5c5e66fb6e369dfc3a632b8c434ee',NULL,NULL,NULL,'2012-12-27 16:31:02',1,'Female','','','','',NULL,NULL,0,'2012-12-27 16:31:02','2012-12-27 16:42:31',NULL,NULL),(56,'Test 19','','test19@abc.com','','d708ee3875b2a430ebd4d945f8d96bdc0b8d32d12a20beffcd0dc284da129529','8cac91531541f85245fb11dac45f982419c80c58b3ac4db4e8cc85284682a8a9',NULL,NULL,NULL,'2013-01-08 18:19:18',1,'Female','','','','',NULL,NULL,0,'2013-01-08 18:19:18','2013-01-08 18:21:00',NULL,NULL),(57,'New Parent','','new@test.com','','a258a838d5b6d0f3432e642b887b49b0b1fd81d39b59754d1c47d54849c2d847','91d54518539fc99a4b36affee6d7b5d329feda2de02639069a396fb5696407aa',NULL,NULL,NULL,'2013-02-20 03:47:22',1,'','','','','',NULL,NULL,0,'2013-02-20 03:47:22','2013-02-20 03:48:19',NULL,NULL),(58,'New Parent','','parent@parent.com','','acf2f62d62dbe779e2d48334a90f6ea02d5b97d5129358b61d65c97cad3f5a1e','4d9588389199849a57584d485ed97b62ddc136119f8ca73e3a2975076bdd0303',NULL,NULL,NULL,'2013-02-21 19:07:48',1,'','','','','',NULL,NULL,0,'2013-02-21 19:07:48','2013-03-12 17:22:29',NULL,NULL),(59,'sandy','','sandy@test.com','','7c1b6c2cffeb5d5dee38cce0da64caf2381faacdd1e08825b6cfebf805f4e5d4','581e720f2bc1b06233d532da188475c2ea0091ef8da7ce1f023843b75e3991af',NULL,NULL,NULL,'2013-03-13 21:36:15',1,'','','','','',NULL,NULL,0,'2013-03-13 21:36:15','2013-03-13 21:36:33',NULL,NULL),(60,'parent 1','','parent1@parent.com','','4ac99aa6227b979d5899291470437aab0c4e52408c546704ebeb2e8af6c254b7','2d2ad6518a2087fafcebeb02ac0944e677f12c3d105a87191fe8bc95af3c2e8f',NULL,NULL,NULL,'2013-03-14 18:26:59',1,'','','','','',NULL,NULL,0,'2013-03-14 18:26:59','2013-03-14 18:27:17',NULL,NULL),(61,'Parent 2','','parent2@parent.com','','8830c042d4a811af996ad7c2ba1387e5eaaf2e067c26a544dc85b9b31cec97af','afba086edc7cbb5a9e3505be6649b8e97f6b66e76a28a3d5f1fcdcb1c4a9e147',NULL,NULL,NULL,'2013-03-14 22:55:15',1,'','','','','',NULL,NULL,0,'2013-03-14 22:55:15','2013-03-14 22:55:30',NULL,NULL),(62,'Sarah','','sarahdparker@yahoo.com','','54258203f9c4ade5922cd4b0d24f7594986abb9b041ec17a14baae94625337e7','e334ffc7570080393224e4216171dbd947f5d9adc80112afe50c8bd23f14d335',NULL,NULL,NULL,'2013-03-21 17:19:24',1,'','','','','',NULL,NULL,0,'2013-03-21 17:19:24','2013-04-01 21:35:32',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-15 15:26:00
