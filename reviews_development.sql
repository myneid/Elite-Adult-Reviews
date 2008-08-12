-- MySQL dump 10.9
--
-- Host: localhost    Database: reviews_development
-- ------------------------------------------------------
-- Server version       4.1.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Anal','2008-05-27 10:10:18','2008-05-27 10:10:18'),(2,'Ass','2008-05-27 10:10:34','2008-05-27 10:10:34'),(3,'Amateur','2008-05-27 10:10:43','2008-05-27 10:10:43'),(4,'Blonde','2008-05-27 16:58:13','2008-05-27 16:58:13'),(5,'Fisting','2008-05-27 17:38:14','2008-05-27 17:38:14'),(6,'Straight','2008-05-29 15:10:51','2008-05-29 15:10:51'),(7,'Gay','2008-05-29 15:11:03','2008-05-29 15:11:03'),(8,'Dating','2008-05-29 15:11:16','2008-05-29 15:11:16'),(9,'Cam','2008-05-29 15:11:27','2008-05-29 15:11:27'),(10,'Toys','2008-05-29 15:11:37','2008-05-29 15:11:37');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
CREATE TABLE `prices` (
  `id` int(11) NOT NULL auto_increment,
  `site_id` int(11) default NULL,
  `description` varchar(255) default NULL,
  `price` float default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL auto_increment,
  `category_id` int(11) default NULL,
  `site_id` int(11) default NULL,
  `rating` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (91,1,4,82,'2008-05-28 17:23:07','2008-05-28 17:23:07'),(92,2,4,82,'2008-05-28 17:23:07','2008-05-28 17:23:07'),(93,3,4,0,'2008-05-28 17:23:07','2008-05-28 17:23:07'),(94,4,4,0,'2008-05-28 17:23:07','2008-05-28 17:23:07'),(95,5,4,100,'2008-05-28 17:23:07','2008-05-28 17:23:07'),(101,1,3,100,'2008-05-29 13:01:38','2008-05-29 13:01:38'),(102,2,3,0,'2008-05-29 13:01:38','2008-05-29 13:01:38'),(103,3,3,13,'2008-05-29 13:01:38','2008-05-29 13:01:38'),(104,4,3,47,'2008-05-29 13:01:38','2008-05-29 13:01:38'),(105,5,3,0,'2008-05-29 13:01:38','2008-05-29 13:01:38'),(106,6,1,83,'2008-05-29 15:15:13','2008-05-29 15:15:13'),(107,7,1,0,'2008-05-29 15:15:13','2008-05-29 15:15:13'),(108,8,1,0,'2008-05-29 15:15:13','2008-05-29 15:15:13'),(109,9,1,0,'2008-05-29 15:15:13','2008-05-29 15:15:13'),(110,1,1,11,'2008-05-29 15:15:13','2008-05-29 15:15:13'),(111,2,1,60,'2008-05-29 15:15:13','2008-05-29 15:15:13'),(112,3,1,32,'2008-05-29 15:15:13','2008-05-29 15:15:13'),(113,4,1,70,'2008-05-29 15:15:13','2008-05-29 15:15:13'),(114,10,1,25,'2008-05-29 15:15:13','2008-05-29 15:15:13'),(115,5,1,85,'2008-05-29 15:15:13','2008-05-29 15:15:13');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_info`
--

DROP TABLE IF EXISTS `schema_info`;
CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_info`
--

LOCK TABLES `schema_info` WRITE;
/*!40000 ALTER TABLE `schema_info` DISABLE KEYS */;
INSERT INTO `schema_info` VALUES (10);
/*!40000 ALTER TABLE `schema_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screenshots`
--

DROP TABLE IF EXISTS `screenshots`;
CREATE TABLE `screenshots` (
  `id` int(11) NOT NULL auto_increment,
  `site_id` int(11) default NULL,
  `location` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `screenshots`
--

LOCK TABLES `screenshots` WRITE;
/*!40000 ALTER TABLE `screenshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `screenshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(255) NOT NULL default '',
  `data` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,'d5c1648bf0975fa7cce7c273eedcb2d5','BAh7CzoPZ3Vlc3RfbmFtZTA6EGd1ZXN0X2VtYWlsMDoOcmV0dXJuX3RvIhto\ndHRwOi8vbG9jYWxob3N0OjMwMDAvOgx1c2VyX2lkMDoQdG9waWNfcmVhZHN7\nACIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFz\naHsABjoKQHVzZWR7AA==\n','2008-05-24 01:00:48','2008-05-24 01:45:58'),(2,'c0d7316899a173261823c15afad2efce','BAh7CzoQdG9waWNfcmVhZHN7ADoPZ3Vlc3RfbmFtZTA6EGd1ZXN0X2VtYWls\nMDoOcmV0dXJuX3RvIiZodHRwOi8vbG9jYWxob3N0OjMwMDAvYWRtaW4vc2l0\nZXMiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhh\nc2h7AAY6CkB1c2VkewA6DHVzZXJfaWRpBg==\n','2008-05-24 01:19:44','2008-05-24 02:11:54'),(3,'99abd796259b3cb1927c905bcc9d725e','BAh7CzoQZ3Vlc3RfZW1haWwwOg5yZXR1cm5fdG8iG2h0dHA6Ly9sb2NhbGhv\nc3Q6MzAwMC86DHVzZXJfaWRpBjoQdG9waWNfcmVhZHN7ACIKZmxhc2hJQzon\nQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7\nADoPZ3Vlc3RfbmFtZTA=\n','2008-05-27 08:57:16','2008-05-27 10:54:24'),(4,'df4c1b10833f87c10136f570445c6fb3','BAh7CzoQZ3Vlc3RfZW1haWwwOg5yZXR1cm5fdG8iHmh0dHA6Ly83MS45NS4y\nMzQuNTQ6MzAwMC86DHVzZXJfaWRpBjoQdG9waWNfcmVhZHN7ACIKZmxhc2hJ\nQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVz\nZWR7ADoPZ3Vlc3RfbmFtZTA=\n','2008-05-27 10:56:38','2008-05-27 10:59:49'),(5,'e56953b19181acbc3aa9eb24377cf40a','BAh7CzoPZ3Vlc3RfbmFtZTA6EGd1ZXN0X2VtYWlsMDoOcmV0dXJuX3RvIjJo\ndHRwOi8vdGFuLndlYmFpci5jb206MzAwMC9hZG1pbi9zaXRlcy8xL2VkaXQ6\nDHVzZXJfaWRpBiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6\nOkZsYXNoSGFzaHsABjoKQHVzZWR7ADoQdG9waWNfcmVhZHN7AA==\n','2008-05-27 11:19:28','2008-05-28 10:01:43'),(6,'c86626d5ee81131de14770f455e12476','BAh7CzoPZ3Vlc3RfbmFtZTA6EGd1ZXN0X2VtYWlsMDoOcmV0dXJuX3RvIiBo\ndHRwOi8vdGFuLndlYmFpci5jb206MzAwMC86DHVzZXJfaWRpBiIKZmxhc2hJ\nQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVz\nZWR7ADoQdG9waWNfcmVhZHN7AA==\n','2008-05-27 15:06:28','2008-05-27 19:25:09'),(7,'fd172580b21034c19688a4b6cf0e099d','BAh7CzoPZ3Vlc3RfbmFtZTA6EGd1ZXN0X2VtYWlsMDoOcmV0dXJuX3RvIiBo\ndHRwOi8vdGFuLndlYmFpci5jb206MzAwMC86DHVzZXJfaWRpBiIKZmxhc2hJ\nQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVz\nZWR7ADoQdG9waWNfcmVhZHN7AA==\n','2008-05-27 16:50:37','2008-05-27 17:45:08'),(8,'73a78d8a21c804b82b3081699522780c','BAh7CzoPZ3Vlc3RfbmFtZTA6EGd1ZXN0X2VtYWlsMDoOcmV0dXJuX3RvIito\ndHRwOi8vdGFuLndlYmFpci5jb206MzAwMC9hZG1pbi9zaXRlczoMdXNlcl9p\nZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewAGOgpAdXNlZHsAOhB0b3BpY19yZWFkc3sA\n','2008-05-28 09:24:49','2008-05-28 14:35:35'),(9,'26193fc3ffdf4875566d966b14fff1bf','BAh7CzoPZ3Vlc3RfbmFtZTA6EGd1ZXN0X2VtYWlsMDoOcmV0dXJuX3RvIjJo\ndHRwOi8vdGFuLndlYmFpci5jb206MzAwMC9hZG1pbi9zaXRlcy8xL2VkaXQ6\nDHVzZXJfaWRpBjoQdG9waWNfcmVhZHN7ACIKZmxhc2hJQzonQWN0aW9uQ29u\ndHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7AA==\n','2008-05-28 09:28:09','2008-05-28 10:30:01'),(10,'eddecc7265afc51c8e27e62ed648480b','BAh7CzoPZ3Vlc3RfbmFtZTA6EGd1ZXN0X2VtYWlsMDoOcmV0dXJuX3RvIi1o\ndHRwOi8vdGFuLndlYmFpci5jb206MzAwMC9hZG1pbi9zaXRlcy80Ogx1c2Vy\nX2lkaQYiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz\naEhhc2h7AAY6CkB1c2VkewA6EHRvcGljX3JlYWRzewA=\n','2008-05-28 10:26:31','2008-05-28 17:23:09'),(11,'be80355c764940a755e3be6491df934c','BAh7CzoOcmV0dXJuX3RvIiBodHRwOi8vdGFuLndlYmFpci5jb206MzAwMC86\nDHVzZXJfaWRpBjoQdG9waWNfcmVhZHN7ADoPZ3Vlc3RfbmFtZTAiCmZsYXNo\nSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1\nc2VkewA6EGd1ZXN0X2VtYWlsMA==\n','2008-05-28 17:27:04','2008-05-29 12:29:34'),(12,'65df19c8c52326f97773a14aa77891dc','BAh7CzoQdG9waWNfcmVhZHN7ADoPZ3Vlc3RfbmFtZTA6EGd1ZXN0X2VtYWls\nMCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFz\naHsABjoKQHVzZWR7ADoOcmV0dXJuX3RvIitodHRwOi8vdGFuLndlYmFpci5j\nb206MzAwMC9hZG1pbi9zaXRlczoMdXNlcl9pZGkG\n','2008-05-28 17:43:15','2008-05-28 17:54:09'),(13,'c6c4985a410cd5b30b6509afeb297879','BAh7CzoOcmV0dXJuX3RvIjJodHRwOi8vdGFuLndlYmFpci5jb206MzAwMC9z\nZWFyY2gvYXNkZmd0YWRzZmc6DHVzZXJfaWRpBjoQdG9waWNfcmVhZHN7ADoP\nZ3Vlc3RfbmFtZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNo\nOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6EGd1ZXN0X2VtYWlsMA==\n','2008-05-29 10:37:15','2008-05-29 12:45:40'),(14,'5c5524c4e06628c3b23231ccb67192e5','BAh7CzoOcmV0dXJuX3RvIiVodHRwOi8vdGFuLndlYmFpci5jb206MzAwMC9u\naWNoZToMdXNlcl9pZGkGOhB0b3BpY19yZWFkc3sAOg9ndWVzdF9uYW1lMCIK\nZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsA\nBjoKQHVzZWR7ADoQZ3Vlc3RfZW1haWww\n','2008-05-29 10:44:32','2008-05-29 15:18:25'),(15,'3cd1568037db15ccbc222fabd7ef32d7','BAh7CzoOcmV0dXJuX3RvIiVodHRwOi8vdGFuLndlYmFpci5jb206MzAwMC9h\nZG1pbjoMdXNlcl9pZGkGOhB0b3BpY19yZWFkc3sAOg9ndWVzdF9uYW1lMCIK\nZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsA\nBjoKQHVzZWR7ADoQZ3Vlc3RfZW1haWww\n','2008-05-29 12:48:42','2008-05-29 13:03:05'),(16,'9e5b285efa02398d80c66e11dc8071b1','BAh7CzoOcmV0dXJuX3RvIiVodHRwOi8vdGFuLndlYmFpci5jb206MzAwMC9h\nZG1pbjoMdXNlcl9pZGkGOhB0b3BpY19yZWFkc3sAOg9ndWVzdF9uYW1lMCIK\nZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsA\nBjoKQHVzZWR7ADoQZ3Vlc3RfZW1haWww\n','2008-05-29 12:50:11','2008-05-29 16:49:13'),(17,'e5841de9e199ba724b4661b4e63c350e','BAh7CzoOcmV0dXJuX3RvIjJodHRwOi8vdGFuLndlYmFpci5jb206MzAwMC9h\nZG1pbi91c2Vycy8xL2VkaXQ6DHVzZXJfaWRpBjoQdG9waWNfcmVhZHN7ADoP\nZ3Vlc3RfbmFtZTAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNo\nOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6EGd1ZXN0X2VtYWlsMA==\n','2008-05-29 14:57:20','2008-05-29 23:12:55'),(18,'3220fc7963b4de45cf73c31e84e59526','BAh7CzoOcmV0dXJuX3RvIiVodHRwOi8vdGFuLndlYmFpci5jb206MzAwMC9u\naWNoZToMdXNlcl9pZGkGOhB0b3BpY19yZWFkc3sAOg9ndWVzdF9uYW1lMCIK\nZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsA\nBjoKQHVzZWR7ADoQZ3Vlc3RfZW1haWww\n','2008-05-29 15:21:15','2008-05-29 16:57:13'),(19,'9d438f27a525bf216eab3fb13296e660','BAh7CzoOcmV0dXJuX3RvIiBodHRwOi8vdGFuLndlYmFpci5jb206MzAwMC86\nDHVzZXJfaWQwOhB0b3BpY19yZWFkc3sAOg9ndWVzdF9uYW1lMCIKZmxhc2hJ\nQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVz\nZWR7ADoQZ3Vlc3RfZW1haWww\n','2008-05-29 16:28:07','2008-05-29 16:30:08');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL auto_increment,
  `short_review` text,
  `content` text,
  `features_and_navigation` text,
  `conclusion` text,
  `pros_and_cons` text,
  `display_url` varchar(255) default NULL,
  `track_url` varchar(255) default NULL,
  `screenshot_location` varchar(255) default NULL,
  `created_at` date default NULL,
  `updated_at` date default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'Huster is awesome!','Here we describe the sites content in detail.','Here we describe features and navigation in detail.','Here we describe the conclusion in detail.','Here we describe the pros and cons in detail.','Hustler.com','http://www.hustler.com/?trackfoo','http://tan.webair.com:3000/images/review_images/movieclub.jpg','2008-05-27','2008-05-29','Hustler'),(3,'testing 1 2 3','testing 4 5 6','testing 7 8 9','testing 10 11 12','testing 13 14 15','TestFoo.com','http://www.testfoo.com/o','http://tan.webair.com:3000/images/review_images/movieclub.jpg','2008-05-28','2008-05-29','TestFoo'),(4,'On Teach Me Fisting, you\'ll witness curious hotties experience their first fisting session. The horny ladies will be educated in the age old act of shoving an entire fist down a tight little snatch, which is definately easier said then done. The site offers a massive collection of 100% exclusive content, starring a wide variety of gorgeous women. So get those fists lubed up people, because things are about to get mighty tight.','Teach Me Fisting is currently the largest fisting site I\'ve reviewed thus far. With 140 episodes, which are all exclusive to the site, it\'s definately doesn\'t come as a surprise. Obviously the site is strongly based on the ancient art of fisting, truly one of the more extreme acts a girl can do, because they certainly need to have fairly flexible snatches, otherwise things could turn ugly. This site in particular focuses on the model\'s first time fist, there\'s no way to prove it\'s their first time, but I suppose we can take their word for it.\r\n\r\nOther than fisting, some scenes also involve large object insertions. One episode I won\'t forget had the main model shoving a wooden baseball bat up her pussy, the whole time I was watching it, I thought how painful it would be if she got splinters off the thing. There\'s a nice mix of man on women fisting, and women on women fisting, so there\'s definately some potential here for lesbian fans. All in all the scenes were very arousing, and the line up of models is simply mouth watering.\r\n\r\nThe first ever episode was loaded on the 2nd of October \'05. Needless to say, having been up for quite some time, the guys behind this site certainly no what fisting fans want. 140 episodes later, and the site is still active on updates, with the last one loaded on the 26th of August \'07. Updates occur every week, and there\'s no signs of them slowing down, so I\'m sure we\'ll be in for plenty more fisting episodes.\r\n\r\nAll the episodes can be downloaded, and streamed in Wmv, and Mpeg format. Scenes run for a solid 30 minutes each, and are available in short clips, with the option of viewing full scenes kept open. The videos have been encoded in decent bit rates, out of the two formats, the Mpegs are available in the highest. This version clocks in at (1300kbps @ 512x384). The Wmvs aren\'t far behind at (1100kbps @ 400x300). The streamed videos are only available in Wmv format, this particular version is available in (1000kbps @ 448x336). I personally thought the videos are quite a decent watch, despite the fairly average specs.\r\n\r\nTeach Me Fisting also does very well on providing picture content. Most of the 140 episodes come complete with a set of pictures that go along with the video footage. There are even images of the models striking poses towards the start of the galleries. The photos provided look spectacular, they\'re slightly grainy but I\'m probably just being anal about it, as it\'s hardly noticeable. The images are very colorful, and come in large dimensions of (1280x851 pixels).\r\n\r\nEvery 2 months, members who keep their membership will be granted access to 2 exclusive bonus sites. All up there\'s a total of 30 sites available, and is definately a good incentive to keep a recurring membership. The collection of bonus sites is quite diverse, and it\'s pretty safe to say that there\'s something here for just about all types of porn lovers. Sites range from kinky fetishes, solo models, and popular mainstream categories.','I was quite impressed with how Teach Me Fisting looks. The color scheme is mild, and is never straining on the eyes, the site banner looks great, and the site generally looks quite clean. Browsing the site is also a breeze, as there\'s nothing too complicated to figure out here. It\'s all quite standard stuff, which is a plus in my books.\r\n\r\nThe handy navigation menu includes links which will take you back to the homepage, direct you to the episodes archive, check out the other sites on the network, and browse through the content via models. Further down the homepage you\'ll come across the latest updates, the most popular episodes, and links to the 30 plus bonus sites. If you wish to view the entire archive of episodes, simply use the link marked \"exclusive content\" within the navigation menu.\r\n\r\nThe episode archive is simple enough to use. All episodes are organized in 24 indexed pages, with a total of 6 episodes per page. Each episode is represented by a number of small pictures, and a short description. Below the pictures I mentioned, you\'ll find links to the video, and photo section of the episode. From there it\'s as simple as choosing whether you wish to view, or download the videos, and which segment you wish to view. Image galleries are available to download in zip files.\r\n\r\nSo that\'s pretty much all I can say about how the site looks, and works. It\'s all very simple, and self explanatory. You\'ll also notice that all the sites on the network basically have the same layout, so you never have to learn something new as you go site hopping. Overall the site is a pleasure to browse, and looks quite nice to boot.','What I was most impressed with, was the extensive archive of exclusive episodes. I haven\'t reviewed a whole heap of fisting sites, but I have a feeling this is one of the largest I\'ll come across in a while. Also worth mentioning is the quality of the content, and the consistent updates. The site certainly doesn\'t leave room for any mistakes, certainly a top notch fisting site. Check it out now!','+ Intense fisting scenes\r\n+ Lots of eye candy\r\n+ Content looks great\r\n+ All exclusive episodes\r\n+ Nice amount of content\r\n+ Site looks nice\r\n+ very easy to navigate','ILoveFisting.com','http://testfoo.com/testfoo','http://tan.webair.com:3000/images/review_images/fisting.jpg','2008-05-28','2008-05-28','Teach Me Fisting');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_ratings`
--

DROP TABLE IF EXISTS `sub_ratings`;
CREATE TABLE `sub_ratings` (
  `id` int(11) NOT NULL auto_increment,
  `exclusivity` int(11) default NULL,
  `updates` int(11) default NULL,
  `originality` int(11) default NULL,
  `quality` int(11) default NULL,
  `speed` int(11) default NULL,
  `quantity` int(11) default NULL,
  `design` int(11) default NULL,
  `navigation_ease` int(11) default NULL,
  `features` int(11) default NULL,
  `price` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `site_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_ratings`
--

LOCK TABLES `sub_ratings` WRITE;
/*!40000 ALTER TABLE `sub_ratings` DISABLE KEYS */;
INSERT INTO `sub_ratings` VALUES (1,92,12,73,88,0,100,0,0,0,0,'2008-05-28 12:29:12','2008-05-29 15:15:13',1),(2,0,11,27,35,46,55,64,71,78,87,'2008-05-28 12:51:06','2008-05-29 13:01:38',3),(3,54,67,47,87,56,61,62,52,77,100,'2008-05-28 15:54:40','2008-05-28 17:23:07',4);
/*!40000 ALTER TABLE `sub_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `created_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL default '0000-00-00 00:00:00',
  `role` varchar(50) NOT NULL default '',
  `name` varchar(20) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `firstname` varchar(30) default NULL,
  `surname` varchar(30) default NULL,
  `password` varchar(60) NOT NULL default '',
  `security_token` varchar(32) default NULL,
  `additional_information` text,
  `token_expiry` datetime default NULL,
  `receives_email` int(11) NOT NULL default '0',
  `sends_email` int(11) NOT NULL default '0',
  `activated` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `users_1uq` (`name`),
  KEY `users_1ix` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2008-05-24 01:33:03','2008-05-24 01:33:03','Admin','admin','wsr@rushforthnetworks.com',NULL,NULL,'892ce6bc75a412bcbdaa3e1caf648149',NULL,NULL,NULL,0,0,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

