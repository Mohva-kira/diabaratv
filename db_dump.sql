-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: diabaratv
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `action_parameters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`action_parameters`)),
  `subject` varchar(255) DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_permissions_created_by_id_fk` (`created_by_id`),
  KEY `admin_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES
(1,'plugin::content-manager.explorer.create','{}','api::album.album','{\"fields\":[\"name\",\"artist\",\"songs\",\"year\",\"Description\",\"image\"]}','[]','2024-01-11 16:14:01.803000','2024-01-11 16:14:01.803000',NULL,NULL),
(2,'plugin::content-manager.explorer.create','{}','api::artist.artist','{\"fields\":[\"name\",\"image\",\"date_naissance\",\"adresse\",\"Pays\",\"ville\",\"email\",\"Biographie\"]}','[]','2024-01-11 16:14:01.856000','2024-01-12 09:38:15.187000',NULL,NULL),
(3,'plugin::content-manager.explorer.create','{}','api::category.category','{\"fields\":[\"name\"]}','[]','2024-01-11 16:14:01.877000','2024-01-11 16:14:01.877000',NULL,NULL),
(4,'plugin::content-manager.explorer.create','{}','api::genre.genre','{\"fields\":[\"name\"]}','[]','2024-01-11 16:14:01.899000','2024-01-11 16:14:01.899000',NULL,NULL),
(5,'plugin::content-manager.explorer.create','{}','api::like.like','{\"fields\":[\"user\",\"song\"]}','[]','2024-01-11 16:14:01.940000','2024-01-11 16:14:01.940000',NULL,NULL),
(6,'plugin::content-manager.explorer.create','{}','api::playlist.playlist','{\"fields\":[\"name\",\"user\"]}','[]','2024-01-11 16:14:01.959000','2024-01-11 16:14:01.959000',NULL,NULL),
(7,'plugin::content-manager.explorer.create','{}','api::playlist-song.playlist-song','{\"fields\":[\"playlist\",\"song\",\"position\"]}','[]','2024-01-11 16:14:01.975000','2024-01-11 16:14:01.975000',NULL,NULL),
(8,'plugin::content-manager.explorer.create','{}','api::revenu.revenu','{\"fields\":[\"artist\",\"montant\"]}','[]','2024-01-11 16:14:02.017000','2024-01-11 16:14:02.017000',NULL,NULL),
(9,'plugin::content-manager.explorer.create','{}','api::song.song','{\"fields\":[\"name\",\"cover\",\"artist\",\"date_de_sortie\",\"streams\",\"audio\",\"genre\",\"pays\",\"ville\",\"album\"]}','[]','2024-01-11 16:14:02.043000','2024-01-11 16:14:02.043000',NULL,NULL),
(10,'plugin::content-manager.explorer.read','{}','api::album.album','{\"fields\":[\"name\",\"artist\",\"songs\",\"year\",\"Description\",\"image\"]}','[]','2024-01-11 16:14:02.067000','2024-01-11 16:14:02.067000',NULL,NULL),
(11,'plugin::content-manager.explorer.read','{}','api::artist.artist','{\"fields\":[\"name\",\"image\",\"date_naissance\",\"adresse\",\"Pays\",\"ville\",\"email\",\"Biographie\"]}','[]','2024-01-11 16:14:02.083000','2024-01-12 09:38:15.187000',NULL,NULL),
(12,'plugin::content-manager.explorer.read','{}','api::category.category','{\"fields\":[\"name\"]}','[]','2024-01-11 16:14:02.115000','2024-01-11 16:14:02.115000',NULL,NULL),
(13,'plugin::content-manager.explorer.read','{}','api::genre.genre','{\"fields\":[\"name\"]}','[]','2024-01-11 16:14:02.133000','2024-01-11 16:14:02.133000',NULL,NULL),
(14,'plugin::content-manager.explorer.read','{}','api::like.like','{\"fields\":[\"user\",\"song\"]}','[]','2024-01-11 16:14:02.146000','2024-01-11 16:14:02.146000',NULL,NULL),
(15,'plugin::content-manager.explorer.read','{}','api::playlist.playlist','{\"fields\":[\"name\",\"user\"]}','[]','2024-01-11 16:14:02.158000','2024-01-11 16:14:02.158000',NULL,NULL),
(16,'plugin::content-manager.explorer.read','{}','api::playlist-song.playlist-song','{\"fields\":[\"playlist\",\"song\",\"position\"]}','[]','2024-01-11 16:14:02.175000','2024-01-11 16:14:02.175000',NULL,NULL),
(17,'plugin::content-manager.explorer.read','{}','api::revenu.revenu','{\"fields\":[\"artist\",\"montant\"]}','[]','2024-01-11 16:14:02.191000','2024-01-11 16:14:02.191000',NULL,NULL),
(18,'plugin::content-manager.explorer.read','{}','api::song.song','{\"fields\":[\"name\",\"cover\",\"artist\",\"date_de_sortie\",\"streams\",\"audio\",\"genre\",\"pays\",\"ville\",\"album\"]}','[]','2024-01-11 16:14:02.217000','2024-01-11 16:14:02.217000',NULL,NULL),
(19,'plugin::content-manager.explorer.update','{}','api::album.album','{\"fields\":[\"name\",\"artist\",\"songs\",\"year\",\"Description\",\"image\"]}','[]','2024-01-11 16:14:02.243000','2024-01-11 16:14:02.243000',NULL,NULL),
(20,'plugin::content-manager.explorer.update','{}','api::artist.artist','{\"fields\":[\"name\",\"image\",\"date_naissance\",\"adresse\",\"Pays\",\"ville\",\"email\",\"Biographie\"]}','[]','2024-01-11 16:14:02.282000','2024-01-12 09:38:15.187000',NULL,NULL),
(21,'plugin::content-manager.explorer.update','{}','api::category.category','{\"fields\":[\"name\"]}','[]','2024-01-11 16:14:02.307000','2024-01-11 16:14:02.307000',NULL,NULL),
(22,'plugin::content-manager.explorer.update','{}','api::genre.genre','{\"fields\":[\"name\"]}','[]','2024-01-11 16:14:02.337000','2024-01-11 16:14:02.337000',NULL,NULL),
(23,'plugin::content-manager.explorer.update','{}','api::like.like','{\"fields\":[\"user\",\"song\"]}','[]','2024-01-11 16:14:02.366000','2024-01-11 16:14:02.366000',NULL,NULL),
(24,'plugin::content-manager.explorer.update','{}','api::playlist.playlist','{\"fields\":[\"name\",\"user\"]}','[]','2024-01-11 16:14:02.380000','2024-01-11 16:14:02.380000',NULL,NULL),
(25,'plugin::content-manager.explorer.update','{}','api::playlist-song.playlist-song','{\"fields\":[\"playlist\",\"song\",\"position\"]}','[]','2024-01-11 16:14:02.408000','2024-01-11 16:14:02.408000',NULL,NULL),
(26,'plugin::content-manager.explorer.update','{}','api::revenu.revenu','{\"fields\":[\"artist\",\"montant\"]}','[]','2024-01-11 16:14:02.430000','2024-01-11 16:14:02.430000',NULL,NULL),
(27,'plugin::content-manager.explorer.update','{}','api::song.song','{\"fields\":[\"name\",\"cover\",\"artist\",\"date_de_sortie\",\"streams\",\"audio\",\"genre\",\"pays\",\"ville\",\"album\"]}','[]','2024-01-11 16:14:02.446000','2024-01-11 16:14:02.446000',NULL,NULL),
(28,'plugin::content-manager.explorer.delete','{}','api::album.album','{}','[]','2024-01-11 16:14:02.458000','2024-01-11 16:14:02.458000',NULL,NULL),
(29,'plugin::content-manager.explorer.delete','{}','api::artist.artist','{}','[]','2024-01-11 16:14:02.468000','2024-01-11 16:14:02.468000',NULL,NULL),
(30,'plugin::content-manager.explorer.delete','{}','api::category.category','{}','[]','2024-01-11 16:14:02.482000','2024-01-11 16:14:02.482000',NULL,NULL),
(31,'plugin::content-manager.explorer.delete','{}','api::genre.genre','{}','[]','2024-01-11 16:14:02.490000','2024-01-11 16:14:02.490000',NULL,NULL),
(32,'plugin::content-manager.explorer.delete','{}','api::like.like','{}','[]','2024-01-11 16:14:02.504000','2024-01-11 16:14:02.504000',NULL,NULL),
(33,'plugin::content-manager.explorer.delete','{}','api::playlist.playlist','{}','[]','2024-01-11 16:14:02.513000','2024-01-11 16:14:02.513000',NULL,NULL),
(34,'plugin::content-manager.explorer.delete','{}','api::playlist-song.playlist-song','{}','[]','2024-01-11 16:14:02.533000','2024-01-11 16:14:02.533000',NULL,NULL),
(35,'plugin::content-manager.explorer.delete','{}','api::revenu.revenu','{}','[]','2024-01-11 16:14:02.547000','2024-01-11 16:14:02.547000',NULL,NULL),
(36,'plugin::content-manager.explorer.delete','{}','api::song.song','{}','[]','2024-01-11 16:14:02.561000','2024-01-11 16:14:02.561000',NULL,NULL),
(37,'plugin::content-manager.explorer.publish','{}','api::album.album','{}','[]','2024-01-11 16:14:02.579000','2024-01-11 16:14:02.579000',NULL,NULL),
(38,'plugin::content-manager.explorer.publish','{}','api::artist.artist','{}','[]','2024-01-11 16:14:02.597000','2024-01-11 16:14:02.597000',NULL,NULL),
(39,'plugin::content-manager.explorer.publish','{}','api::category.category','{}','[]','2024-01-11 16:14:02.613000','2024-01-11 16:14:02.613000',NULL,NULL),
(40,'plugin::content-manager.explorer.publish','{}','api::genre.genre','{}','[]','2024-01-11 16:14:02.626000','2024-01-11 16:14:02.626000',NULL,NULL),
(41,'plugin::content-manager.explorer.publish','{}','api::like.like','{}','[]','2024-01-11 16:14:02.644000','2024-01-11 16:14:02.644000',NULL,NULL),
(42,'plugin::content-manager.explorer.publish','{}','api::playlist.playlist','{}','[]','2024-01-11 16:14:02.660000','2024-01-11 16:14:02.660000',NULL,NULL),
(43,'plugin::content-manager.explorer.publish','{}','api::playlist-song.playlist-song','{}','[]','2024-01-11 16:14:02.678000','2024-01-11 16:14:02.678000',NULL,NULL),
(44,'plugin::content-manager.explorer.publish','{}','api::revenu.revenu','{}','[]','2024-01-11 16:14:02.698000','2024-01-11 16:14:02.698000',NULL,NULL),
(45,'plugin::content-manager.explorer.publish','{}','api::song.song','{}','[]','2024-01-11 16:14:02.707000','2024-01-11 16:14:02.707000',NULL,NULL),
(46,'plugin::upload.read','{}',NULL,'{}','[]','2024-01-11 16:14:02.718000','2024-01-11 16:14:02.718000',NULL,NULL),
(47,'plugin::upload.configure-view','{}',NULL,'{}','[]','2024-01-11 16:14:02.727000','2024-01-11 16:14:02.727000',NULL,NULL),
(48,'plugin::upload.assets.create','{}',NULL,'{}','[]','2024-01-11 16:14:02.737000','2024-01-11 16:14:02.737000',NULL,NULL),
(49,'plugin::upload.assets.update','{}',NULL,'{}','[]','2024-01-11 16:14:02.747000','2024-01-11 16:14:02.747000',NULL,NULL),
(50,'plugin::upload.assets.download','{}',NULL,'{}','[]','2024-01-11 16:14:02.755000','2024-01-11 16:14:02.755000',NULL,NULL),
(51,'plugin::upload.assets.copy-link','{}',NULL,'{}','[]','2024-01-11 16:14:02.765000','2024-01-11 16:14:02.765000',NULL,NULL),
(52,'plugin::content-manager.explorer.create','{}','api::album.album','{\"fields\":[\"name\",\"artist\",\"songs\",\"year\",\"Description\",\"image\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:02.962000','2024-01-11 16:14:02.962000',NULL,NULL),
(53,'plugin::content-manager.explorer.create','{}','api::artist.artist','{\"fields\":[\"name\",\"image\",\"date_naissance\",\"adresse\",\"Pays\",\"ville\",\"email\",\"Biographie\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.021000','2024-01-12 09:38:15.187000',NULL,NULL),
(54,'plugin::content-manager.explorer.create','{}','api::category.category','{\"fields\":[\"name\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.102000','2024-01-11 16:14:03.102000',NULL,NULL),
(55,'plugin::content-manager.explorer.create','{}','api::genre.genre','{\"fields\":[\"name\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.131000','2024-01-11 16:14:03.131000',NULL,NULL),
(56,'plugin::content-manager.explorer.create','{}','api::like.like','{\"fields\":[\"user\",\"song\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.151000','2024-01-11 16:14:03.151000',NULL,NULL),
(57,'plugin::content-manager.explorer.create','{}','api::playlist.playlist','{\"fields\":[\"name\",\"user\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.163000','2024-01-11 16:14:03.163000',NULL,NULL),
(58,'plugin::content-manager.explorer.create','{}','api::playlist-song.playlist-song','{\"fields\":[\"playlist\",\"song\",\"position\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.172000','2024-01-11 16:14:03.172000',NULL,NULL),
(59,'plugin::content-manager.explorer.create','{}','api::revenu.revenu','{\"fields\":[\"artist\",\"montant\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.188000','2024-01-11 16:14:03.188000',NULL,NULL),
(60,'plugin::content-manager.explorer.create','{}','api::song.song','{\"fields\":[\"name\",\"cover\",\"artist\",\"date_de_sortie\",\"streams\",\"audio\",\"genre\",\"pays\",\"ville\",\"album\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.199000','2024-01-11 16:14:03.199000',NULL,NULL),
(61,'plugin::content-manager.explorer.read','{}','api::album.album','{\"fields\":[\"name\",\"artist\",\"songs\",\"year\",\"Description\",\"image\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.209000','2024-01-11 16:14:03.209000',NULL,NULL),
(62,'plugin::content-manager.explorer.read','{}','api::artist.artist','{\"fields\":[\"name\",\"image\",\"date_naissance\",\"adresse\",\"Pays\",\"ville\",\"email\",\"Biographie\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.220000','2024-01-12 09:38:15.187000',NULL,NULL),
(63,'plugin::content-manager.explorer.read','{}','api::category.category','{\"fields\":[\"name\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.228000','2024-01-11 16:14:03.228000',NULL,NULL),
(64,'plugin::content-manager.explorer.read','{}','api::genre.genre','{\"fields\":[\"name\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.238000','2024-01-11 16:14:03.238000',NULL,NULL),
(65,'plugin::content-manager.explorer.read','{}','api::like.like','{\"fields\":[\"user\",\"song\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.250000','2024-01-11 16:14:03.250000',NULL,NULL),
(66,'plugin::content-manager.explorer.read','{}','api::playlist.playlist','{\"fields\":[\"name\",\"user\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.266000','2024-01-11 16:14:03.266000',NULL,NULL),
(67,'plugin::content-manager.explorer.read','{}','api::playlist-song.playlist-song','{\"fields\":[\"playlist\",\"song\",\"position\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.280000','2024-01-11 16:14:03.280000',NULL,NULL),
(68,'plugin::content-manager.explorer.read','{}','api::revenu.revenu','{\"fields\":[\"artist\",\"montant\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.295000','2024-01-11 16:14:03.295000',NULL,NULL),
(69,'plugin::content-manager.explorer.read','{}','api::song.song','{\"fields\":[\"name\",\"cover\",\"artist\",\"date_de_sortie\",\"streams\",\"audio\",\"genre\",\"pays\",\"ville\",\"album\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.304000','2024-01-11 16:14:03.304000',NULL,NULL),
(70,'plugin::content-manager.explorer.update','{}','api::album.album','{\"fields\":[\"name\",\"artist\",\"songs\",\"year\",\"Description\",\"image\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.314000','2024-01-11 16:14:03.314000',NULL,NULL),
(71,'plugin::content-manager.explorer.update','{}','api::artist.artist','{\"fields\":[\"name\",\"image\",\"date_naissance\",\"adresse\",\"Pays\",\"ville\",\"email\",\"Biographie\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.334000','2024-01-12 09:38:15.187000',NULL,NULL),
(72,'plugin::content-manager.explorer.update','{}','api::category.category','{\"fields\":[\"name\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.346000','2024-01-11 16:14:03.346000',NULL,NULL),
(73,'plugin::content-manager.explorer.update','{}','api::genre.genre','{\"fields\":[\"name\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.361000','2024-01-11 16:14:03.361000',NULL,NULL),
(74,'plugin::content-manager.explorer.update','{}','api::like.like','{\"fields\":[\"user\",\"song\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.377000','2024-01-11 16:14:03.377000',NULL,NULL),
(75,'plugin::content-manager.explorer.update','{}','api::playlist.playlist','{\"fields\":[\"name\",\"user\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.402000','2024-01-11 16:14:03.402000',NULL,NULL),
(76,'plugin::content-manager.explorer.update','{}','api::playlist-song.playlist-song','{\"fields\":[\"playlist\",\"song\",\"position\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.418000','2024-01-11 16:14:03.418000',NULL,NULL),
(77,'plugin::content-manager.explorer.update','{}','api::revenu.revenu','{\"fields\":[\"artist\",\"montant\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.434000','2024-01-11 16:14:03.434000',NULL,NULL),
(78,'plugin::content-manager.explorer.update','{}','api::song.song','{\"fields\":[\"name\",\"cover\",\"artist\",\"date_de_sortie\",\"streams\",\"audio\",\"genre\",\"pays\",\"ville\",\"album\"]}','[\"admin::is-creator\"]','2024-01-11 16:14:03.446000','2024-01-11 16:14:03.446000',NULL,NULL),
(79,'plugin::content-manager.explorer.delete','{}','api::album.album','{}','[\"admin::is-creator\"]','2024-01-11 16:14:03.461000','2024-01-11 16:14:03.461000',NULL,NULL),
(80,'plugin::content-manager.explorer.delete','{}','api::artist.artist','{}','[\"admin::is-creator\"]','2024-01-11 16:14:03.482000','2024-01-11 16:14:03.482000',NULL,NULL),
(81,'plugin::content-manager.explorer.delete','{}','api::category.category','{}','[\"admin::is-creator\"]','2024-01-11 16:14:03.501000','2024-01-11 16:14:03.501000',NULL,NULL),
(82,'plugin::content-manager.explorer.delete','{}','api::genre.genre','{}','[\"admin::is-creator\"]','2024-01-11 16:14:03.541000','2024-01-11 16:14:03.541000',NULL,NULL),
(83,'plugin::content-manager.explorer.delete','{}','api::like.like','{}','[\"admin::is-creator\"]','2024-01-11 16:14:03.559000','2024-01-11 16:14:03.559000',NULL,NULL),
(84,'plugin::content-manager.explorer.delete','{}','api::playlist.playlist','{}','[\"admin::is-creator\"]','2024-01-11 16:14:03.575000','2024-01-11 16:14:03.575000',NULL,NULL),
(85,'plugin::content-manager.explorer.delete','{}','api::playlist-song.playlist-song','{}','[\"admin::is-creator\"]','2024-01-11 16:14:03.593000','2024-01-11 16:14:03.593000',NULL,NULL),
(86,'plugin::content-manager.explorer.delete','{}','api::revenu.revenu','{}','[\"admin::is-creator\"]','2024-01-11 16:14:03.604000','2024-01-11 16:14:03.604000',NULL,NULL),
(87,'plugin::content-manager.explorer.delete','{}','api::song.song','{}','[\"admin::is-creator\"]','2024-01-11 16:14:03.620000','2024-01-11 16:14:03.620000',NULL,NULL),
(88,'plugin::upload.read','{}',NULL,'{}','[\"admin::is-creator\"]','2024-01-11 16:14:03.628000','2024-01-11 16:14:03.628000',NULL,NULL),
(89,'plugin::upload.configure-view','{}',NULL,'{}','[]','2024-01-11 16:14:03.641000','2024-01-11 16:14:03.641000',NULL,NULL),
(90,'plugin::upload.assets.create','{}',NULL,'{}','[]','2024-01-11 16:14:03.651000','2024-01-11 16:14:03.651000',NULL,NULL),
(91,'plugin::upload.assets.update','{}',NULL,'{}','[\"admin::is-creator\"]','2024-01-11 16:14:03.661000','2024-01-11 16:14:03.661000',NULL,NULL),
(92,'plugin::upload.assets.download','{}',NULL,'{}','[]','2024-01-11 16:14:03.669000','2024-01-11 16:14:03.669000',NULL,NULL),
(93,'plugin::upload.assets.copy-link','{}',NULL,'{}','[]','2024-01-11 16:14:03.677000','2024-01-11 16:14:03.677000',NULL,NULL),
(94,'plugin::content-manager.explorer.create','{}','plugin::users-permissions.user','{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}','[]','2024-01-11 16:14:03.898000','2024-01-11 16:14:03.898000',NULL,NULL),
(95,'plugin::content-manager.explorer.create','{}','api::album.album','{\"fields\":[\"name\",\"artist\",\"songs\",\"year\",\"Description\",\"image\"]}','[]','2024-01-11 16:14:03.910000','2024-01-11 16:14:03.910000',NULL,NULL),
(97,'plugin::content-manager.explorer.create','{}','api::category.category','{\"fields\":[\"name\"]}','[]','2024-01-11 16:14:03.942000','2024-01-11 16:14:03.942000',NULL,NULL),
(99,'plugin::content-manager.explorer.create','{}','api::like.like','{\"fields\":[\"user\",\"song\"]}','[]','2024-01-11 16:14:03.962000','2024-01-11 16:14:03.962000',NULL,NULL),
(100,'plugin::content-manager.explorer.create','{}','api::playlist.playlist','{\"fields\":[\"name\",\"user\"]}','[]','2024-01-11 16:14:03.970000','2024-01-11 16:14:03.970000',NULL,NULL),
(101,'plugin::content-manager.explorer.create','{}','api::playlist-song.playlist-song','{\"fields\":[\"playlist\",\"song\",\"position\"]}','[]','2024-01-11 16:14:03.978000','2024-01-11 16:14:03.978000',NULL,NULL),
(102,'plugin::content-manager.explorer.create','{}','api::revenu.revenu','{\"fields\":[\"artist\",\"montant\"]}','[]','2024-01-11 16:14:03.990000','2024-01-11 16:14:03.990000',NULL,NULL),
(103,'plugin::content-manager.explorer.create','{}','api::song.song','{\"fields\":[\"name\",\"cover\",\"artist\",\"date_de_sortie\",\"streams\",\"audio\",\"genre\",\"pays\",\"ville\",\"album\"]}','[]','2024-01-11 16:14:03.997000','2024-01-11 16:14:03.997000',NULL,NULL),
(104,'plugin::content-manager.explorer.read','{}','plugin::users-permissions.user','{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}','[]','2024-01-11 16:14:04.005000','2024-01-11 16:14:04.005000',NULL,NULL),
(105,'plugin::content-manager.explorer.read','{}','api::album.album','{\"fields\":[\"name\",\"artist\",\"songs\",\"year\",\"Description\",\"image\"]}','[]','2024-01-11 16:14:04.015000','2024-01-11 16:14:04.015000',NULL,NULL),
(107,'plugin::content-manager.explorer.read','{}','api::category.category','{\"fields\":[\"name\"]}','[]','2024-01-11 16:14:04.034000','2024-01-11 16:14:04.034000',NULL,NULL),
(109,'plugin::content-manager.explorer.read','{}','api::like.like','{\"fields\":[\"user\",\"song\"]}','[]','2024-01-11 16:14:04.079000','2024-01-11 16:14:04.079000',NULL,NULL),
(110,'plugin::content-manager.explorer.read','{}','api::playlist.playlist','{\"fields\":[\"name\",\"user\"]}','[]','2024-01-11 16:14:04.087000','2024-01-11 16:14:04.087000',NULL,NULL),
(111,'plugin::content-manager.explorer.read','{}','api::playlist-song.playlist-song','{\"fields\":[\"playlist\",\"song\",\"position\"]}','[]','2024-01-11 16:14:04.095000','2024-01-11 16:14:04.095000',NULL,NULL),
(112,'plugin::content-manager.explorer.read','{}','api::revenu.revenu','{\"fields\":[\"artist\",\"montant\"]}','[]','2024-01-11 16:14:04.103000','2024-01-11 16:14:04.103000',NULL,NULL),
(113,'plugin::content-manager.explorer.read','{}','api::song.song','{\"fields\":[\"name\",\"cover\",\"artist\",\"date_de_sortie\",\"streams\",\"audio\",\"genre\",\"pays\",\"ville\",\"album\"]}','[]','2024-01-11 16:14:04.126000','2024-01-11 16:14:04.126000',NULL,NULL),
(114,'plugin::content-manager.explorer.update','{}','plugin::users-permissions.user','{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\"]}','[]','2024-01-11 16:14:04.135000','2024-01-11 16:14:04.135000',NULL,NULL),
(115,'plugin::content-manager.explorer.update','{}','api::album.album','{\"fields\":[\"name\",\"artist\",\"songs\",\"year\",\"Description\",\"image\"]}','[]','2024-01-11 16:14:04.148000','2024-01-11 16:14:04.148000',NULL,NULL),
(117,'plugin::content-manager.explorer.update','{}','api::category.category','{\"fields\":[\"name\"]}','[]','2024-01-11 16:14:04.184000','2024-01-11 16:14:04.184000',NULL,NULL),
(119,'plugin::content-manager.explorer.update','{}','api::like.like','{\"fields\":[\"user\",\"song\"]}','[]','2024-01-11 16:14:04.204000','2024-01-11 16:14:04.204000',NULL,NULL),
(120,'plugin::content-manager.explorer.update','{}','api::playlist.playlist','{\"fields\":[\"name\",\"user\"]}','[]','2024-01-11 16:14:04.212000','2024-01-11 16:14:04.212000',NULL,NULL),
(121,'plugin::content-manager.explorer.update','{}','api::playlist-song.playlist-song','{\"fields\":[\"playlist\",\"song\",\"position\"]}','[]','2024-01-11 16:14:04.221000','2024-01-11 16:14:04.221000',NULL,NULL),
(122,'plugin::content-manager.explorer.update','{}','api::revenu.revenu','{\"fields\":[\"artist\",\"montant\"]}','[]','2024-01-11 16:14:04.236000','2024-01-11 16:14:04.236000',NULL,NULL),
(123,'plugin::content-manager.explorer.update','{}','api::song.song','{\"fields\":[\"name\",\"cover\",\"artist\",\"date_de_sortie\",\"streams\",\"audio\",\"genre\",\"pays\",\"ville\",\"album\"]}','[]','2024-01-11 16:14:04.249000','2024-01-11 16:14:04.249000',NULL,NULL),
(124,'plugin::content-manager.explorer.delete','{}','plugin::users-permissions.user','{}','[]','2024-01-11 16:14:04.257000','2024-01-11 16:14:04.257000',NULL,NULL),
(125,'plugin::content-manager.explorer.delete','{}','api::album.album','{}','[]','2024-01-11 16:14:04.271000','2024-01-11 16:14:04.271000',NULL,NULL),
(126,'plugin::content-manager.explorer.delete','{}','api::artist.artist','{}','[]','2024-01-11 16:14:04.294000','2024-01-11 16:14:04.294000',NULL,NULL),
(127,'plugin::content-manager.explorer.delete','{}','api::category.category','{}','[]','2024-01-11 16:14:04.306000','2024-01-11 16:14:04.306000',NULL,NULL),
(128,'plugin::content-manager.explorer.delete','{}','api::genre.genre','{}','[]','2024-01-11 16:14:04.318000','2024-01-11 16:14:04.318000',NULL,NULL),
(129,'plugin::content-manager.explorer.delete','{}','api::like.like','{}','[]','2024-01-11 16:14:04.325000','2024-01-11 16:14:04.325000',NULL,NULL),
(130,'plugin::content-manager.explorer.delete','{}','api::playlist.playlist','{}','[]','2024-01-11 16:14:04.336000','2024-01-11 16:14:04.336000',NULL,NULL),
(131,'plugin::content-manager.explorer.delete','{}','api::playlist-song.playlist-song','{}','[]','2024-01-11 16:14:04.346000','2024-01-11 16:14:04.346000',NULL,NULL),
(132,'plugin::content-manager.explorer.delete','{}','api::revenu.revenu','{}','[]','2024-01-11 16:14:04.361000','2024-01-11 16:14:04.361000',NULL,NULL),
(133,'plugin::content-manager.explorer.delete','{}','api::song.song','{}','[]','2024-01-11 16:14:04.369000','2024-01-11 16:14:04.369000',NULL,NULL),
(134,'plugin::content-manager.explorer.publish','{}','api::album.album','{}','[]','2024-01-11 16:14:04.381000','2024-01-11 16:14:04.381000',NULL,NULL),
(135,'plugin::content-manager.explorer.publish','{}','api::artist.artist','{}','[]','2024-01-11 16:14:04.393000','2024-01-11 16:14:04.393000',NULL,NULL),
(136,'plugin::content-manager.explorer.publish','{}','api::category.category','{}','[]','2024-01-11 16:14:04.434000','2024-01-11 16:14:04.434000',NULL,NULL),
(137,'plugin::content-manager.explorer.publish','{}','api::genre.genre','{}','[]','2024-01-11 16:14:04.458000','2024-01-11 16:14:04.458000',NULL,NULL),
(138,'plugin::content-manager.explorer.publish','{}','api::like.like','{}','[]','2024-01-11 16:14:04.477000','2024-01-11 16:14:04.477000',NULL,NULL),
(139,'plugin::content-manager.explorer.publish','{}','api::playlist.playlist','{}','[]','2024-01-11 16:14:04.487000','2024-01-11 16:14:04.487000',NULL,NULL),
(140,'plugin::content-manager.explorer.publish','{}','api::playlist-song.playlist-song','{}','[]','2024-01-11 16:14:04.494000','2024-01-11 16:14:04.494000',NULL,NULL),
(141,'plugin::content-manager.explorer.publish','{}','api::revenu.revenu','{}','[]','2024-01-11 16:14:04.501000','2024-01-11 16:14:04.501000',NULL,NULL),
(142,'plugin::content-manager.explorer.publish','{}','api::song.song','{}','[]','2024-01-11 16:14:04.511000','2024-01-11 16:14:04.511000',NULL,NULL),
(143,'plugin::content-manager.single-types.configure-view','{}',NULL,'{}','[]','2024-01-11 16:14:04.518000','2024-01-11 16:14:04.518000',NULL,NULL),
(144,'plugin::content-manager.collection-types.configure-view','{}',NULL,'{}','[]','2024-01-11 16:14:04.529000','2024-01-11 16:14:04.529000',NULL,NULL),
(145,'plugin::content-manager.components.configure-layout','{}',NULL,'{}','[]','2024-01-11 16:14:04.537000','2024-01-11 16:14:04.537000',NULL,NULL),
(146,'plugin::content-type-builder.read','{}',NULL,'{}','[]','2024-01-11 16:14:04.550000','2024-01-11 16:14:04.550000',NULL,NULL),
(147,'plugin::email.settings.read','{}',NULL,'{}','[]','2024-01-11 16:14:04.556000','2024-01-11 16:14:04.556000',NULL,NULL),
(148,'plugin::upload.read','{}',NULL,'{}','[]','2024-01-11 16:14:04.563000','2024-01-11 16:14:04.563000',NULL,NULL),
(149,'plugin::upload.assets.create','{}',NULL,'{}','[]','2024-01-11 16:14:04.574000','2024-01-11 16:14:04.574000',NULL,NULL),
(150,'plugin::upload.assets.update','{}',NULL,'{}','[]','2024-01-11 16:14:04.583000','2024-01-11 16:14:04.583000',NULL,NULL),
(151,'plugin::upload.assets.download','{}',NULL,'{}','[]','2024-01-11 16:14:04.591000','2024-01-11 16:14:04.591000',NULL,NULL),
(152,'plugin::upload.assets.copy-link','{}',NULL,'{}','[]','2024-01-11 16:14:04.600000','2024-01-11 16:14:04.600000',NULL,NULL),
(153,'plugin::upload.configure-view','{}',NULL,'{}','[]','2024-01-11 16:14:04.609000','2024-01-11 16:14:04.609000',NULL,NULL),
(154,'plugin::upload.settings.read','{}',NULL,'{}','[]','2024-01-11 16:14:04.619000','2024-01-11 16:14:04.619000',NULL,NULL),
(155,'plugin::i18n.locale.create','{}',NULL,'{}','[]','2024-01-11 16:14:04.627000','2024-01-11 16:14:04.627000',NULL,NULL),
(156,'plugin::i18n.locale.read','{}',NULL,'{}','[]','2024-01-11 16:14:04.634000','2024-01-11 16:14:04.634000',NULL,NULL),
(157,'plugin::i18n.locale.update','{}',NULL,'{}','[]','2024-01-11 16:14:04.642000','2024-01-11 16:14:04.642000',NULL,NULL),
(158,'plugin::i18n.locale.delete','{}',NULL,'{}','[]','2024-01-11 16:14:04.661000','2024-01-11 16:14:04.661000',NULL,NULL),
(159,'plugin::users-permissions.roles.create','{}',NULL,'{}','[]','2024-01-11 16:14:04.674000','2024-01-11 16:14:04.674000',NULL,NULL),
(160,'plugin::users-permissions.roles.read','{}',NULL,'{}','[]','2024-01-11 16:14:04.694000','2024-01-11 16:14:04.694000',NULL,NULL),
(161,'plugin::users-permissions.roles.update','{}',NULL,'{}','[]','2024-01-11 16:14:04.707000','2024-01-11 16:14:04.707000',NULL,NULL),
(162,'plugin::users-permissions.roles.delete','{}',NULL,'{}','[]','2024-01-11 16:14:04.726000','2024-01-11 16:14:04.726000',NULL,NULL),
(163,'plugin::users-permissions.providers.read','{}',NULL,'{}','[]','2024-01-11 16:14:04.737000','2024-01-11 16:14:04.737000',NULL,NULL),
(164,'plugin::users-permissions.providers.update','{}',NULL,'{}','[]','2024-01-11 16:14:04.762000','2024-01-11 16:14:04.762000',NULL,NULL),
(165,'plugin::users-permissions.email-templates.read','{}',NULL,'{}','[]','2024-01-11 16:14:04.773000','2024-01-11 16:14:04.773000',NULL,NULL),
(166,'plugin::users-permissions.email-templates.update','{}',NULL,'{}','[]','2024-01-11 16:14:04.786000','2024-01-11 16:14:04.786000',NULL,NULL),
(167,'plugin::users-permissions.advanced-settings.read','{}',NULL,'{}','[]','2024-01-11 16:14:04.797000','2024-01-11 16:14:04.797000',NULL,NULL),
(168,'plugin::users-permissions.advanced-settings.update','{}',NULL,'{}','[]','2024-01-11 16:14:04.809000','2024-01-11 16:14:04.809000',NULL,NULL),
(169,'admin::marketplace.read','{}',NULL,'{}','[]','2024-01-11 16:14:04.833000','2024-01-11 16:14:04.833000',NULL,NULL),
(170,'admin::webhooks.create','{}',NULL,'{}','[]','2024-01-11 16:14:04.855000','2024-01-11 16:14:04.855000',NULL,NULL),
(171,'admin::webhooks.read','{}',NULL,'{}','[]','2024-01-11 16:14:04.871000','2024-01-11 16:14:04.871000',NULL,NULL),
(172,'admin::webhooks.update','{}',NULL,'{}','[]','2024-01-11 16:14:04.891000','2024-01-11 16:14:04.891000',NULL,NULL),
(173,'admin::webhooks.delete','{}',NULL,'{}','[]','2024-01-11 16:14:04.908000','2024-01-11 16:14:04.908000',NULL,NULL),
(174,'admin::users.create','{}',NULL,'{}','[]','2024-01-11 16:14:04.915000','2024-01-11 16:14:04.915000',NULL,NULL),
(175,'admin::users.read','{}',NULL,'{}','[]','2024-01-11 16:14:04.924000','2024-01-11 16:14:04.924000',NULL,NULL),
(176,'admin::users.update','{}',NULL,'{}','[]','2024-01-11 16:14:04.930000','2024-01-11 16:14:04.930000',NULL,NULL),
(177,'admin::users.delete','{}',NULL,'{}','[]','2024-01-11 16:14:04.938000','2024-01-11 16:14:04.938000',NULL,NULL),
(178,'admin::roles.create','{}',NULL,'{}','[]','2024-01-11 16:14:04.944000','2024-01-11 16:14:04.944000',NULL,NULL),
(179,'admin::roles.read','{}',NULL,'{}','[]','2024-01-11 16:14:04.966000','2024-01-11 16:14:04.966000',NULL,NULL),
(180,'admin::roles.update','{}',NULL,'{}','[]','2024-01-11 16:14:04.980000','2024-01-11 16:14:04.980000',NULL,NULL),
(181,'admin::roles.delete','{}',NULL,'{}','[]','2024-01-11 16:14:04.988000','2024-01-11 16:14:04.988000',NULL,NULL),
(182,'admin::api-tokens.access','{}',NULL,'{}','[]','2024-01-11 16:14:04.994000','2024-01-11 16:14:04.994000',NULL,NULL),
(183,'admin::api-tokens.create','{}',NULL,'{}','[]','2024-01-11 16:14:05.002000','2024-01-11 16:14:05.002000',NULL,NULL),
(184,'admin::api-tokens.read','{}',NULL,'{}','[]','2024-01-11 16:14:05.009000','2024-01-11 16:14:05.009000',NULL,NULL),
(185,'admin::api-tokens.update','{}',NULL,'{}','[]','2024-01-11 16:14:05.018000','2024-01-11 16:14:05.018000',NULL,NULL),
(186,'admin::api-tokens.regenerate','{}',NULL,'{}','[]','2024-01-11 16:14:05.025000','2024-01-11 16:14:05.025000',NULL,NULL),
(187,'admin::api-tokens.delete','{}',NULL,'{}','[]','2024-01-11 16:14:05.032000','2024-01-11 16:14:05.032000',NULL,NULL),
(188,'admin::project-settings.update','{}',NULL,'{}','[]','2024-01-11 16:14:05.048000','2024-01-11 16:14:05.048000',NULL,NULL),
(189,'admin::project-settings.read','{}',NULL,'{}','[]','2024-01-11 16:14:05.058000','2024-01-11 16:14:05.058000',NULL,NULL),
(190,'admin::transfer.tokens.access','{}',NULL,'{}','[]','2024-01-11 16:14:05.067000','2024-01-11 16:14:05.067000',NULL,NULL),
(191,'admin::transfer.tokens.create','{}',NULL,'{}','[]','2024-01-11 16:14:05.092000','2024-01-11 16:14:05.092000',NULL,NULL),
(192,'admin::transfer.tokens.read','{}',NULL,'{}','[]','2024-01-11 16:14:05.118000','2024-01-11 16:14:05.118000',NULL,NULL),
(193,'admin::transfer.tokens.update','{}',NULL,'{}','[]','2024-01-11 16:14:05.131000','2024-01-11 16:14:05.131000',NULL,NULL),
(194,'admin::transfer.tokens.regenerate','{}',NULL,'{}','[]','2024-01-11 16:14:05.163000','2024-01-11 16:14:05.163000',NULL,NULL),
(195,'admin::transfer.tokens.delete','{}',NULL,'{}','[]','2024-01-11 16:14:05.178000','2024-01-11 16:14:05.178000',NULL,NULL),
(196,'plugin::content-manager.explorer.create','{}','api::artist.artist','{\"fields\":[\"name\",\"image\",\"date_naissance\",\"adresse\",\"Pays\",\"ville\",\"email\",\"Biographie\",\"genres\"]}','[]','2024-01-12 09:38:14.724000','2024-01-12 09:38:14.724000',NULL,NULL),
(197,'plugin::content-manager.explorer.create','{}','api::genre.genre','{\"fields\":[\"name\",\"artist\"]}','[]','2024-01-12 09:38:14.740000','2024-01-12 09:38:14.740000',NULL,NULL),
(198,'plugin::content-manager.explorer.read','{}','api::artist.artist','{\"fields\":[\"name\",\"image\",\"date_naissance\",\"adresse\",\"Pays\",\"ville\",\"email\",\"Biographie\",\"genres\"]}','[]','2024-01-12 09:38:14.749000','2024-01-12 09:38:14.749000',NULL,NULL),
(199,'plugin::content-manager.explorer.read','{}','api::genre.genre','{\"fields\":[\"name\",\"artist\"]}','[]','2024-01-12 09:38:14.759000','2024-01-12 09:38:14.759000',NULL,NULL),
(200,'plugin::content-manager.explorer.update','{}','api::artist.artist','{\"fields\":[\"name\",\"image\",\"date_naissance\",\"adresse\",\"Pays\",\"ville\",\"email\",\"Biographie\",\"genres\"]}','[]','2024-01-12 09:38:14.769000','2024-01-12 09:38:14.769000',NULL,NULL),
(201,'plugin::content-manager.explorer.update','{}','api::genre.genre','{\"fields\":[\"name\",\"artist\"]}','[]','2024-01-12 09:38:14.775000','2024-01-12 09:38:14.775000',NULL,NULL),
(205,'plugin::content-manager.explorer.delete','{}','api::stream.stream','{}','[]','2024-03-14 10:25:09.453000','2024-03-14 10:25:09.453000',NULL,NULL),
(206,'plugin::content-manager.explorer.publish','{}','api::stream.stream','{}','[]','2024-03-14 10:25:09.461000','2024-03-14 10:25:09.461000',NULL,NULL),
(207,'plugin::content-manager.explorer.create','{}','api::stream.stream','{\"fields\":[\"user\",\"song\",\"start\",\"end\",\"uuid\"]}','[]','2024-04-12 11:33:03.144000','2024-04-12 11:33:03.144000',NULL,NULL),
(208,'plugin::content-manager.explorer.read','{}','api::stream.stream','{\"fields\":[\"user\",\"song\",\"start\",\"end\",\"uuid\"]}','[]','2024-04-12 11:33:03.173000','2024-04-12 11:33:03.173000',NULL,NULL),
(209,'plugin::content-manager.explorer.update','{}','api::stream.stream','{\"fields\":[\"user\",\"song\",\"start\",\"end\",\"uuid\"]}','[]','2024-04-12 11:33:03.182000','2024-04-12 11:33:03.182000',NULL,NULL),
(210,'plugin::content-manager.explorer.create','{}','api::download.download','{\"fields\":[\"user\",\"song\",\"download_date\",\"device_type\",\"ip_address\",\"location\"]}','[]','2024-06-19 09:55:51.949000','2024-06-19 09:55:51.949000',NULL,NULL),
(211,'plugin::content-manager.explorer.read','{}','api::download.download','{\"fields\":[\"user\",\"song\",\"download_date\",\"device_type\",\"ip_address\",\"location\"]}','[]','2024-06-19 09:55:52.032000','2024-06-19 09:55:52.032000',NULL,NULL),
(212,'plugin::content-manager.explorer.update','{}','api::download.download','{\"fields\":[\"user\",\"song\",\"download_date\",\"device_type\",\"ip_address\",\"location\"]}','[]','2024-06-19 09:55:52.087000','2024-06-19 09:55:52.087000',NULL,NULL),
(213,'plugin::content-manager.explorer.delete','{}','api::download.download','{}','[]','2024-06-19 09:55:52.151000','2024-06-19 09:55:52.151000',NULL,NULL),
(214,'plugin::content-manager.explorer.publish','{}','api::download.download','{}','[]','2024-06-19 09:55:52.243000','2024-06-19 09:55:52.243000',NULL,NULL),
(215,'plugin::content-manager.explorer.create','{}','api::payment.payment','{\"fields\":[\"user\",\"amount\",\"currency\",\"method\",\"date\",\"status\",\"description\"]}','[]','2024-07-22 15:21:01.043000','2024-07-22 15:21:01.043000',NULL,NULL),
(216,'plugin::content-manager.explorer.read','{}','api::payment.payment','{\"fields\":[\"user\",\"amount\",\"currency\",\"method\",\"date\",\"status\",\"description\"]}','[]','2024-07-22 15:21:01.156000','2024-07-22 15:21:01.156000',NULL,NULL),
(217,'plugin::content-manager.explorer.update','{}','api::payment.payment','{\"fields\":[\"user\",\"amount\",\"currency\",\"method\",\"date\",\"status\",\"description\"]}','[]','2024-07-22 15:21:01.221000','2024-07-22 15:21:01.221000',NULL,NULL),
(218,'plugin::content-manager.explorer.delete','{}','api::payment.payment','{}','[]','2024-07-22 15:21:01.287000','2024-07-22 15:21:01.287000',NULL,NULL),
(219,'plugin::content-manager.explorer.publish','{}','api::payment.payment','{}','[]','2024-07-22 15:21:01.386000','2024-07-22 15:21:01.386000',NULL,NULL),
(220,'plugin::content-manager.explorer.create','{}','api::subscription.subscription','{\"fields\":[\"user\",\"plan\",\"amount\",\"currency\",\"start_date\",\"end_date\"]}','[]','2024-07-22 15:22:42.446000','2024-07-22 15:22:42.446000',NULL,NULL),
(221,'plugin::content-manager.explorer.read','{}','api::subscription.subscription','{\"fields\":[\"user\",\"plan\",\"amount\",\"currency\",\"start_date\",\"end_date\"]}','[]','2024-07-22 15:22:42.461000','2024-07-22 15:22:42.461000',NULL,NULL),
(222,'plugin::content-manager.explorer.update','{}','api::subscription.subscription','{\"fields\":[\"user\",\"plan\",\"amount\",\"currency\",\"start_date\",\"end_date\"]}','[]','2024-07-22 15:22:42.472000','2024-07-22 15:22:42.472000',NULL,NULL),
(223,'plugin::content-manager.explorer.delete','{}','api::subscription.subscription','{}','[]','2024-07-22 15:22:42.481000','2024-07-22 15:22:42.481000',NULL,NULL),
(224,'plugin::content-manager.explorer.publish','{}','api::subscription.subscription','{}','[]','2024-07-22 15:22:42.494000','2024-07-22 15:22:42.494000',NULL,NULL),
(225,'plugin::content-manager.explorer.create','{}','api::advertisement.advertisement','{\"fields\":[\"ad_provider\",\"campain_name\",\"amount\",\"currency\",\"revenue_date\"]}','[]','2024-07-22 15:27:11.798000','2024-07-22 15:27:11.798000',NULL,NULL),
(226,'plugin::content-manager.explorer.read','{}','api::advertisement.advertisement','{\"fields\":[\"ad_provider\",\"campain_name\",\"amount\",\"currency\",\"revenue_date\"]}','[]','2024-07-22 15:27:11.812000','2024-07-22 15:27:11.812000',NULL,NULL),
(227,'plugin::content-manager.explorer.update','{}','api::advertisement.advertisement','{\"fields\":[\"ad_provider\",\"campain_name\",\"amount\",\"currency\",\"revenue_date\"]}','[]','2024-07-22 15:27:11.822000','2024-07-22 15:27:11.822000',NULL,NULL),
(228,'plugin::content-manager.explorer.delete','{}','api::advertisement.advertisement','{}','[]','2024-07-22 15:27:11.837000','2024-07-22 15:27:11.837000',NULL,NULL),
(229,'plugin::content-manager.explorer.publish','{}','api::advertisement.advertisement','{}','[]','2024-07-22 15:27:11.848000','2024-07-22 15:27:11.848000',NULL,NULL),
(230,'plugin::content-manager.explorer.create','{}','api::on-demand-sale.on-demand-sale','{\"fields\":[\"user\",\"amount\",\"currency\",\"purchase_date\"]}','[]','2024-07-22 15:30:17.708000','2024-07-22 15:30:17.708000',NULL,NULL),
(231,'plugin::content-manager.explorer.read','{}','api::on-demand-sale.on-demand-sale','{\"fields\":[\"user\",\"amount\",\"currency\",\"purchase_date\"]}','[]','2024-07-22 15:30:17.722000','2024-07-22 15:30:17.722000',NULL,NULL),
(232,'plugin::content-manager.explorer.update','{}','api::on-demand-sale.on-demand-sale','{\"fields\":[\"user\",\"amount\",\"currency\",\"purchase_date\"]}','[]','2024-07-22 15:30:17.743000','2024-07-22 15:30:17.743000',NULL,NULL),
(233,'plugin::content-manager.explorer.delete','{}','api::on-demand-sale.on-demand-sale','{}','[]','2024-07-22 15:30:17.753000','2024-07-22 15:30:17.753000',NULL,NULL),
(234,'plugin::content-manager.explorer.publish','{}','api::on-demand-sale.on-demand-sale','{}','[]','2024-07-22 15:30:17.761000','2024-07-22 15:30:17.761000',NULL,NULL);
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions_role_links`
--

DROP TABLE IF EXISTS `admin_permissions_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_permissions_role_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_role_links_unique` (`permission_id`,`role_id`),
  KEY `admin_permissions_role_links_fk` (`permission_id`),
  KEY `admin_permissions_role_links_inv_fk` (`role_id`),
  KEY `admin_permissions_role_links_order_inv_fk` (`permission_order`),
  CONSTRAINT `admin_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions_role_links`
--

LOCK TABLES `admin_permissions_role_links` WRITE;
/*!40000 ALTER TABLE `admin_permissions_role_links` DISABLE KEYS */;
INSERT INTO `admin_permissions_role_links` VALUES
(1,1,2,1),
(2,2,2,2),
(3,3,2,3),
(4,4,2,4),
(5,5,2,5),
(6,6,2,6),
(7,7,2,7),
(8,8,2,8),
(9,9,2,9),
(10,10,2,10),
(11,11,2,11),
(12,12,2,12),
(13,13,2,13),
(14,14,2,14),
(15,15,2,15),
(16,16,2,16),
(17,17,2,17),
(18,18,2,18),
(19,19,2,19),
(20,20,2,20),
(21,21,2,21),
(22,22,2,22),
(23,23,2,23),
(24,24,2,24),
(25,25,2,25),
(26,26,2,26),
(27,27,2,27),
(28,28,2,28),
(29,29,2,29),
(30,30,2,30),
(31,31,2,31),
(32,32,2,32),
(33,33,2,33),
(34,34,2,34),
(35,35,2,35),
(36,36,2,36),
(37,37,2,37),
(38,38,2,38),
(39,39,2,39),
(40,40,2,40),
(41,41,2,41),
(42,42,2,42),
(43,43,2,43),
(44,44,2,44),
(45,45,2,45),
(46,46,2,46),
(47,47,2,47),
(48,48,2,48),
(49,49,2,49),
(50,50,2,50),
(51,51,2,51),
(52,52,3,1),
(53,53,3,2),
(54,54,3,3),
(55,55,3,4),
(56,56,3,5),
(57,57,3,6),
(58,58,3,7),
(59,59,3,8),
(60,60,3,9),
(61,61,3,10),
(62,62,3,11),
(63,63,3,12),
(64,64,3,13),
(65,65,3,14),
(66,66,3,15),
(67,67,3,16),
(68,68,3,17),
(69,69,3,18),
(70,70,3,19),
(71,71,3,20),
(72,72,3,21),
(73,73,3,22),
(74,74,3,23),
(75,75,3,24),
(76,76,3,25),
(77,77,3,26),
(78,78,3,27),
(79,79,3,28),
(80,80,3,29),
(81,81,3,30),
(82,82,3,31),
(83,83,3,32),
(84,84,3,33),
(85,85,3,34),
(86,86,3,35),
(87,87,3,36),
(88,88,3,37),
(89,89,3,38),
(90,90,3,39),
(91,91,3,40),
(92,92,3,41),
(93,93,3,42),
(94,94,1,1),
(95,95,1,2),
(97,97,1,4),
(99,99,1,6),
(100,100,1,7),
(101,101,1,8),
(102,102,1,9),
(103,103,1,10),
(104,104,1,11),
(105,105,1,12),
(107,107,1,14),
(109,109,1,16),
(110,110,1,17),
(111,111,1,18),
(112,112,1,19),
(113,113,1,20),
(114,114,1,21),
(115,115,1,22),
(117,117,1,24),
(119,119,1,26),
(120,120,1,27),
(121,121,1,28),
(122,122,1,29),
(123,123,1,30),
(124,124,1,31),
(125,125,1,32),
(126,126,1,33),
(127,127,1,34),
(128,128,1,35),
(129,129,1,36),
(130,130,1,37),
(131,131,1,38),
(132,132,1,39),
(133,133,1,40),
(134,134,1,41),
(135,135,1,42),
(136,136,1,43),
(137,137,1,44),
(138,138,1,45),
(139,139,1,46),
(140,140,1,47),
(141,141,1,48),
(142,142,1,49),
(143,143,1,50),
(144,144,1,51),
(145,145,1,52),
(146,146,1,53),
(147,147,1,54),
(148,148,1,55),
(149,149,1,56),
(150,150,1,57),
(151,151,1,58),
(152,152,1,59),
(153,153,1,60),
(154,154,1,61),
(155,155,1,62),
(156,156,1,63),
(157,157,1,64),
(158,158,1,65),
(159,159,1,66),
(160,160,1,67),
(161,161,1,68),
(162,162,1,69),
(163,163,1,70),
(164,164,1,71),
(165,165,1,72),
(166,166,1,73),
(167,167,1,74),
(168,168,1,75),
(169,169,1,76),
(170,170,1,77),
(171,171,1,78),
(172,172,1,79),
(173,173,1,80),
(174,174,1,81),
(175,175,1,82),
(176,176,1,83),
(177,177,1,84),
(178,178,1,85),
(179,179,1,86),
(180,180,1,87),
(181,181,1,88),
(182,182,1,89),
(183,183,1,90),
(184,184,1,91),
(185,185,1,92),
(186,186,1,93),
(187,187,1,94),
(188,188,1,95),
(189,189,1,96),
(190,190,1,97),
(191,191,1,98),
(192,192,1,99),
(193,193,1,100),
(194,194,1,101),
(195,195,1,102),
(196,196,1,103),
(197,197,1,104),
(198,198,1,105),
(199,199,1,106),
(200,200,1,107),
(201,201,1,108),
(205,205,1,112),
(206,206,1,113),
(207,207,1,114),
(208,208,1,115),
(209,209,1,116),
(210,210,1,117),
(211,211,1,118),
(212,212,1,119),
(213,213,1,120),
(214,214,1,121),
(215,215,1,122),
(216,216,1,123),
(217,217,1,124),
(218,218,1,125),
(219,219,1,126),
(220,220,1,127),
(221,221,1,128),
(222,222,1,129),
(223,223,1,130),
(224,224,1,131),
(225,225,1,132),
(226,226,1,133),
(227,227,1,134),
(228,228,1,135),
(229,229,1,136),
(230,230,1,137),
(231,231,1,138),
(232,232,1,139),
(233,233,1,140),
(234,234,1,141);
/*!40000 ALTER TABLE `admin_permissions_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_roles_created_by_id_fk` (`created_by_id`),
  KEY `admin_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES
(1,'Super Admin','strapi-super-admin','Super Admins can access and manage all features and settings.','2024-01-11 16:14:01.656000','2024-01-11 16:14:01.656000',NULL,NULL),
(2,'Editor','strapi-editor','Editors can manage and publish contents including those of other users.','2024-01-11 16:14:01.713000','2024-01-11 16:14:01.713000',NULL,NULL),
(3,'Author','strapi-author','Authors can manage the content they have created.','2024-01-11 16:14:01.726000','2024-01-11 16:14:01.726000',NULL,NULL);
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `registration_token` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `prefered_language` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_users_created_by_id_fk` (`created_by_id`),
  KEY `admin_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES
(1,'Mohamed','Tandjigora',NULL,'mtandjo@gmail.com','$2a$10$9LD6OJNuT5X0HodZ7vZGteto7atPvYNT6d17NYUf3NW9iJVhV82aK',NULL,NULL,1,0,NULL,'2024-01-11 19:34:48.704000','2024-01-11 19:34:48.704000',NULL,NULL),
(2,'Hadiza','Sidibe',NULL,'ks4600137@gmail.com','$2a$10$ccXAUOKB6t78nNRdVpMsM.NAIm1.2vcnTfxw7QMCpGLeGwXZagDpi',NULL,NULL,1,0,NULL,'2024-06-26 12:12:19.275000','2024-06-26 12:15:43.360000',NULL,NULL);
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users_roles_links`
--

DROP TABLE IF EXISTS `admin_users_roles_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users_roles_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `role_order` double unsigned DEFAULT NULL,
  `user_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_roles_links_unique` (`user_id`,`role_id`),
  KEY `admin_users_roles_links_fk` (`user_id`),
  KEY `admin_users_roles_links_inv_fk` (`role_id`),
  KEY `admin_users_roles_links_order_fk` (`role_order`),
  KEY `admin_users_roles_links_order_inv_fk` (`user_order`),
  CONSTRAINT `admin_users_roles_links_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_users_roles_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users_roles_links`
--

LOCK TABLES `admin_users_roles_links` WRITE;
/*!40000 ALTER TABLE `admin_users_roles_links` DISABLE KEYS */;
INSERT INTO `admin_users_roles_links` VALUES
(1,1,1,1,1),
(2,2,2,1,1),
(3,2,3,2,1);
/*!40000 ALTER TABLE `admin_users_roles_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisements`
--

DROP TABLE IF EXISTS `advertisements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ad_provider` varchar(255) DEFAULT NULL,
  `campain_name` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `revenue_date` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advertisements_created_by_id_fk` (`created_by_id`),
  KEY `advertisements_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `advertisements_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `advertisements_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisements`
--

LOCK TABLES `advertisements` WRITE;
/*!40000 ALTER TABLE `advertisements` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertisements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `albums_created_by_id_fk` (`created_by_id`),
  KEY `albums_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `albums_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `albums_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES
(1,'223%','2023',NULL,'2024-01-23 09:11:10.200000','2024-01-23 09:13:53.034000','2024-01-23 09:13:53.028000',1,1),
(2,'GC',NULL,NULL,'2024-01-23 22:03:51.378000','2024-01-23 22:03:54.061000','2024-01-23 22:03:54.055000',1,1),
(3,'OCB 1','2015','Première Mixtape du groupe Nigga Fama qui enflamme la cité de Bamako','2024-09-05 16:29:50.899000','2024-09-05 16:29:56.332000','2024-09-05 16:29:56.292000',1,1);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums_artist_links`
--

DROP TABLE IF EXISTS `albums_artist_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums_artist_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(10) unsigned DEFAULT NULL,
  `artist_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `albums_artist_links_unique` (`album_id`,`artist_id`),
  KEY `albums_artist_links_fk` (`album_id`),
  KEY `albums_artist_links_inv_fk` (`artist_id`),
  CONSTRAINT `albums_artist_links_fk` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE CASCADE,
  CONSTRAINT `albums_artist_links_inv_fk` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_artist_links`
--

LOCK TABLES `albums_artist_links` WRITE;
/*!40000 ALTER TABLE `albums_artist_links` DISABLE KEYS */;
INSERT INTO `albums_artist_links` VALUES
(1,1,5),
(2,2,6),
(3,3,19);
/*!40000 ALTER TABLE `albums_artist_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `date_naissance` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `pays` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `biographie` longtext DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `artists_created_by_id_fk` (`created_by_id`),
  KEY `artists_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `artists_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `artists_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES
(1,'Sidiki Diabaté','08-2-1992','Hamdallaye','Mali','Bamako',NULL,NULL,'2024-01-12 09:25:53.597000','2024-01-12 10:22:05.216000','2024-01-12 09:37:40.449000',1,1),
(2,'Young Bg',NULL,'Faladie','Mali','Bamako',NULL,NULL,'2024-01-12 09:37:33.953000','2024-01-12 09:39:42.391000','2024-01-12 09:37:35.828000',1,1),
(3,'Casha',NULL,NULL,'Mali','Bamako',NULL,'Originaire du Togo, ASSIMBRA ZEKERI Ridouane Thierry Alias CVSHA avait un rêve qui était de percer dans le monde musical. Il fait partie de l’un des rappeurs les plus aimés et écoutés de la nouvelle génération du rap malien.\n\n\nBercé par la musique depuis son bas âge, il écoutait différents styles de musique mais il a été surtout accroché par le rap des l’Âge de 13ans.\nInspiré par plusieurs pères de la musiques africaine telle que la chanteuse béninoise Angélique Kidjo, en qui il voit en elle une femme battante et qui a une vision optique de l’Afrique, CASHA débarque sur la scène musicale malienne avec son premier titre « N’abandonne jamais » de « BLACK IS THE FUTURE » en Avril 2016. Casha produit un rap aux tons chaleureux pour ses auditeurs.\nC’est depuis à l’Age de 14ans qu’il a commencé à chanter avec sa bande d’amis du collège. Après quelques collaborations avec des artistes entre autres : 2Bto King, Weei Soldat ,BALEME, NIGGA FAMA, SIDI CVSHA, GP FAMILY dont il est membre, et surtout son Son avec l’apparition WEEI SOLDAT dont le titre « TIGNE FO » qui fait un buzz il y a de cela deux ans.\nAvec trois MIXTAPES dont : DIRTY OXYGGEN sortit le 23 décembre 2016, DIRTY OXYGEN2 sortit le 24 décembre 2017 et enfin BANANA SEASON sortit le 8janvier 2019 « FOSHO annonce les couleurs d’un nouveau MINI MIXTAPE en préparation qui s’intitulera « BAD MAN KILA »\nSelon le jeune artiste « Littéralement « BAD MAN KILA » ça veut dire ‘LE BAD MAN TUEUR’ l’atmosphère que je veux ramener c’est juste remettre les pendules à l’heure et en même temps faire bouger mes fans. Ce titre « BAD MAN KILA » quand ça va sortir y aura plein de blessés et de sang versé »,\nCASHA vous souhaite une bonne dégustation de son MINI MIXTAPE « BAD MAN KILA » sortit depuis le 13 septembre sur sa Chaine YouTube et déjà disponible sur les différentes plateformes de vente légales habituelles et sur l’Appli Zikmali(payement Orange money)','2024-01-12 09:44:20.997000','2024-01-12 10:18:12.734000','2024-01-12 09:44:29.512000',1,1),
(4,'Waly Seck',NULL,NULL,'Sénégal','Dakar',NULL,NULL,'2024-01-12 09:46:35.112000','2024-01-12 09:46:36.703000','2024-01-12 09:46:36.694000',1,1),
(5,'Oude Mill',NULL,'Bamako Koura','Mali','Bamako',NULL,'Âge de 19 ans, Oudé Mill est un rappeur malien résidant à Bamako.\n\nOudé Mill débute mais a du succès déjà au Mali, son rêve est de conquérir l\'Afrique et le monde avec sa musique.','2024-01-23 09:05:27.775000','2024-01-23 09:05:29.429000','2024-01-23 09:05:29.416000',1,1),
(6,'Calibre 27',NULL,'Lafiabougou','Mali','Bamako',NULL,NULL,'2024-01-23 21:59:17.170000','2024-01-23 21:59:19.246000','2024-01-23 21:59:19.236000',1,1),
(7,'TomPro',NULL,'Faladie Sema','Mali','Bamako',NULL,NULL,'2024-04-12 10:14:43.351000','2024-04-12 10:16:01.672000','2024-04-12 10:16:01.663000',1,1),
(8,'Bronzer',NULL,'Niamakoro ','Mali','Bamako',NULL,NULL,'2024-04-12 10:15:48.513000','2024-04-12 10:15:49.890000','2024-04-12 10:15:49.878000',1,1),
(9,'Py le gangster',NULL,'Niamakoro ','Mali','Bamako',NULL,NULL,'2024-04-12 10:25:01.413000','2024-04-12 10:25:03.212000','2024-04-12 10:25:03.202000',1,1),
(10,'Gaspi',NULL,'Lafiabougou','Mali','Bamako',NULL,NULL,'2024-04-12 11:12:56.840000','2024-04-12 11:12:59.278000','2024-04-12 11:12:59.264000',1,1),
(11,'lil zed',NULL,'Commune IV','Mali','Bamako',NULL,NULL,'2024-05-01 11:33:29.449000','2024-05-01 11:33:32.698000','2024-05-01 11:33:32.679000',1,1),
(12,'supreme abidox',NULL,'Lafiabougou','Mali','Bamako',NULL,NULL,'2024-05-01 11:56:52.347000','2024-05-01 11:56:54.589000','2024-05-01 11:56:54.569000',1,1),
(13,'davidson',NULL,'Faladie Sema','Mali','Bamako',NULL,NULL,'2024-05-02 17:18:09.483000','2024-05-02 17:18:12.034000','2024-05-02 17:18:12.014000',1,1),
(14,'salif keita','1949-08-25','Djatalan','Mali','Bamako','skeita@yahoo.fr','Début de vie\n\nSalif Keita est né prince traditionnel dans le village de Djoliba. Il est né dans la famille royale Keita, qui remonte à Sundiata Keita, fondateur de l\'Empire du Mali. Il a été rejeté par sa famille et ostracisé par la communauté en raison de son albinisme, considéré comme un signe de malchance dans la culture mandingue. Il a décidé de se tourner vers la musique à l\'adolescence, s\'éloignant encore davantage de sa famille car cela allait à l\'encontre des interdits professionnels de son statut noble.\n\nEn 1967, il quitte Djoliba pour Bamako, où il rejoint le Super Rail Band de Bamako, parrainé par le gouvernement. En 1973, Keita rejoint le groupe Les Ambassadeurs (du Motel de Bamako). Keita et Les Ambassadeurs fuient les troubles politiques au Mali au milieu des années 1970 et changent ensuite le nom du groupe en Les Ambassadeurs Internationaux. La réputation de ce groupe grandit à l\'international à la fin des années 1970, ce qui conduit Keita à poursuivre une carrière solo dans les années suivantes.\n\nIl est le père de l\'athlète paralympique Nantenin Keita.\n\n### Carrière\n\nEn raison des troubles politiques, Keita et ses coéquipiers fuient le Mali au milieu des années 1970. Ils s\'installent à Abidjan, en Côte d\'Ivoire, où ils rencontrent des difficultés financières et doivent souvent louer du matériel pour se produire. Le groupe (désormais nommé Les Ambassadeurs Internationaux) gagne progressivement en popularité au fil des années. Leur album de 1978, *Mandjou*, devient un succès instantané en Afrique de l\'Ouest.\n\nEn 1976, Sékou Touré, le président de la Guinée, nomme Keita officier de l\'Ordre national du mérite de Guinée. Le président était un fan de Keita et du groupe depuis leur rencontre lors d\'une visite officielle en 1974. Touré était resté un fan et un soutien même après leur fuite du Mali. Pour honorer cette reconnaissance, Keita compose le morceau \"Mandjou\" (présent sur l\'album éponyme de 1978) comme une chanson de louange pour Touré. Cependant, au moment de la sortie de la chanson, Touré avait complètement basculé vers un régime autoritaire et plongé son pays dans le chaos et le sang. Keita interprète toujours des versions réarrangées de \"Mandjou\".\n\nKeita déménage à Paris en 1984 pour atteindre un public plus large et poursuivre une carrière solo. Sa musique combine les styles traditionnels de la musique ouest-africaine avec des influences européennes et américaines.\n\nÀ cette époque, Keita était célèbre en Afrique et avait une base de fans solide parmi les connaisseurs du monde entier. *Soro* devient son album de percée internationale en 1987. Le projet est produit par Ibrahima Sylla, un visionnaire qui avait déjà découvert des dizaines de stars africaines (et qui deviendrait plus tard la force motrice derrière Africando). Les arrangements comportent des rythmes tourbillonnants, des chœurs féminins légèrement nasillards, et des percussions traditionnelles typiques de la musique malienne.\n\nLes instruments de musique couramment utilisés dans le travail de Keita incluent les balafons, les djembés, les guitares, les koras, les orgues, les saxophones et les synthétiseurs. Il se produit au concert pour le 70e anniversaire de Nelson Mandela en 1988 pour appeler à la libération de Nelson Mandela. En 1990, Keita contribue avec \"Begin the Beguine\" à l\'album hommage à Cole Porter/collecte de fonds pour le SIDA *Red Hot + Blue*, produit par la Red Hot Organization.\n\nKeita connaît le succès en Europe en tant que l\'une des stars africaines de la world music, mais son travail est parfois critiqué pour la brillance de sa production et pour la qualité parfois aléatoire. Cependant, peu après le début du millénaire, il retourne à Bamako au Mali pour vivre et enregistrer. Son premier travail après son retour, *Moffou* de 2002, est salué comme son meilleur album depuis de nombreuses années, et Keita est inspiré pour construire un studio d\'enregistrement à Bamako, qu\'il utilise pour son album *M\'Bemba*, sorti en octobre 2005.\n\nLes artistes invités sur ses albums incluent les fondateurs de Weather Report Joe Zawinul et Wayne Shorter, le batteur Paco Sery, le guitariste Carlos Santana et le percussionniste Bill Summers.\n\nL\'album de Keita *La Différence* est produit vers la fin de 2009. Ce travail est dédié à la lutte de la communauté albinos mondiale (victimes de sacrifices humains), pour laquelle Keita a milité toute sa vie. Dans l\'une des chansons de l\'album, le chanteur appelle les autres à comprendre que \"différence\" ne signifie pas \"mal\" et à montrer de l\'amour et de la compassion envers les albinos comme tout le monde : \"Je suis noir / ma peau est blanche / donc je suis blanc et mon sang est noir [albinos] / ...J\'aime ça parce que c\'est une différence qui est belle\", \"certains d\'entre nous sont beaux, d\'autres non / certains sont noirs, d\'autres sont blancs / toutes ces différences étaient intentionnelles... pour nous compléter les uns les autres / que chacun reçoive son amour et sa dignité / le monde sera beau.\"\n\n*La Différence* a été enregistré entre Bamako, Beyrouth, Paris et Los Angeles. Cette ambiance musicale unique est renforcée par les intonations soul dans la chanson \"Samigna\" émanant de la trompette du grand jazzman libanais Ibrahim Maalouf.\n\nEn 2001, la chanson de Keita \"Tomorrow\" figure dans le film de Will Smith, *Ali*.\n\n*La Différence* vaut à Keita l\'un des plus grands prix musicaux de sa carrière : le Best World Music 2010 aux Victoires de la musique.\n\nEn 2013, après ce qu\'il décrit comme des \"menaces\" de la campagne de Boycott, Désinvestissement et Sanctions (BDS), il annule une performance en Israël. Il publie ensuite une lettre sur sa page Facebook, déclarant qu\'il a décidé d\'annuler l\'événement parce qu\'il avait peur d\'être \"atteint personnellement ou professionnellement\", mais précise qu\'il aime toujours Israël, critiquant le BDS comme un \"groupe extrémiste\" utilisant des \"tactiques de peur et d\'intimidation\".\n\nEn novembre 2018, il annonce sa retraite de l\'enregistrement lors d\'un concert à Fana, au Mali. L\'album *Un Autre Blanc*, sorti lors du concert, serait son dernier. Pour cet enregistrement d\'adieu, il invite une riche distribution de chanteurs africains pour l\'aider sur une de ses chansons intitulée \"Gnamale\". À la fin de l\'album, il remercie Dieu de l\'avoir béni et avertit les personnes qui utiliseraient son nom de manière abusive.\n\nIl utilise des instruments africains traditionnels tels que le djembé, la kora et le balafon qui sont très présents dans son son. Il a également pu chanter avec des instrumentations non traditionnelles. Il compte plus de 15 albums et considère *Un Autre Blanc* comme son chant du cygne.\n\nIl devait agir en tant que membre du corps législatif de 2020 jusqu\'à sa démission le 31 juillet 2023.\n\nEn août 2023, Salif Keïta a été nommé conseiller du chef de la junte par le colonel Assimi Goïta.\n\n### Albinisme\n\nEn tant que descendant des ancêtres de l\'Empire du Mali, il est né albinos. Il se distingue immédiatement des autres car sa condition est considérée comme une maladie dans son pays natal, le Mali, et chez les Mandingues. Keïta a toujours lutté avec cela parce que, bien qu\'il fasse partie d\'une lignée de musiciens et d\'une princesse guerrière, il n\'était pas autorisé à jouer de la musique et a été renié par son père et expulsé de l\'école. Il déménage donc en Côte d\'Ivoire en tant que jeune homme, espérant être apprécié. Quelle que soit sa couleur de peau, il s\'est concentré sur la musique partout où il allait, ce qui l\'a conduit à devenir une icône culturelle. En 1997, il retourne au Mali après que sa renommée l\'ait aidé.\n\n### Discographie sélectionnée\n\n#### En tant qu\'artiste principal\n- *Seydou Bathili* (1982)\n- *Soro* (Mango, 1987)\n- *Ko-Yan* (Mango, 1989)\n- *Amen* (Mango, 1991)\n- *Destiny of a Noble Outcast* (PolyGram, 1991)\n- *69–80* (Sonodisc, 1994)\n- *Folon* (Mango, 1995)\n- *Seydou Bathili* (Sonodisc, 1997)\n- *Papa* (Metro Blue, 1999)\n- *Mama* (Capitol, 2000)\n- *Sosie* (Mellemfolkeligt, 2001)\n- *Moffou* (Universal Jazz France,','2024-06-11 10:08:47.522000','2024-06-23 13:47:02.039000','2024-06-11 10:08:49.774000',1,1),
(15,'Oumou Sangaré','1962-05-20','Wassolo','Mali','Sikasso','oumou.sang@yahoo.fr',NULL,'2024-06-11 10:13:58.996000','2024-06-27 10:11:29.910000','2024-06-11 10:14:01.845000',1,1),
(16,'Bako dagnon','1948',NULL,'Mali','Bamako',NULL,'Jeunesse\nBako Dagnon est née dans le petit village de Golobladji (à une vingtaine de kilomètres de Kita) dans une famille de griots et de joueurs de n\'goni6. Les origines des sa famille remontent au temps de Soundiata Keïta. Dans son village de naissance, elle apprend les chansons de Ségou de sa grand-mère, celle des champs de bataille de son grand-père qui avait lutté avec Samory Touré, et les chants de Guinée de sa mère.\n\nLorsque sa mère décède quand elle avait sept ans, son père la laissa dans les soins d\'une femme de griot à Kita qui n\'avait pas d\'enfant. Elle est maltraitée par sa famille d’accueil et la quitte plus tard pour apprendre les histoires de l\'Empire mandingue avant la colonisation (les \"tariku\") avec le grand griot mandingue Kele Monson Diabate.\n\nL’aventure Syllart démarre à l’initiative d’un jeune producteur sénégalais Ibrahima Sylla passionné de musiques cubaines qui s’installe à Paris en 1974 en tant que jeune étudiant. Sa passion pour la musique prend rapidement le dessus sur ses études de droit à Tolbiac et en 1978, Ibrahima Sylla ouvre Kubaney Music, un petit magasin de disque, à rue de Rocroy, lieu de rencontres de la jeune diaspora africaine qui devient très vite le laboratoire de ses futures productions4. De retour à Dakar, en 1978, il monte son premier label sous le nom de « Jambaar » (guerriers en wolof) qui deviendra en 1981 Syllart Records, puis Syllart Productions. Il produit l’Orchestra Baobab dans lequel joue Thione Seck et l’Étoile de Dakar, où brille déjà un certain Youssou N\'Dour. En 1987, le label obtient son premier succès international avec l’album Soro de Salif Keita, prototype d’un genre afro pop en gestation.','2024-06-25 16:33:50.839000','2024-06-25 16:33:52.821000','2024-06-25 16:33:52.813000',1,1),
(17,'malakey',NULL,NULL,'mali','bamako',NULL,NULL,'2024-06-26 12:19:33.329000','2024-06-26 12:19:38.820000','2024-06-26 12:19:38.797000',2,2),
(18,'bifenix',NULL,NULL,'mali','bamako',NULL,NULL,'2024-06-26 13:30:08.529000','2024-06-26 13:30:15.309000','2024-06-26 13:30:15.295000',2,2),
(19,'NF Mama','01-01-2015','Bamako','Mali','Bamako',NULL,'Depuis plus de cinq ans, NF Mama illumine la scène musicale malienne, avec ses quatre jeunes talents qui dépeignent avec brio les réalités du quotidien. Ce groupe, l\'un des plus influents au Mali, poursuit son ascension avec des hits qui résonnent profondément auprès de leur public. Comme on le dit souvent en Afrique de l\'Ouest, \"l\'arbre qui cache la forêt n\'empêchera pas la forêt de grandir\", et NF Mama, malgré les obstacles, continue de croître et de se faire une place dans le paysage musical.\n\nC\'est en 2015 que le groupe Nigga Fama voit le jour, un nom inspiré des fermiers noirs, un hommage à leurs racines. Cependant, en 2019, le groupe opte pour le changement, devenant NF Mama, évitant ainsi toute connotation esclavagiste liée à leur ancien nom. Ce sont des jeunes comme Abdoulaye Barry Doumbia (alias Young Pap), Abdoul Rahmane Kaba Diakité (Mezto), Mohamed Lagdaf Dicko (Didi Contana) et Mohamed Idrissa Coulibaly (Ganja Morie), cousins et amis d’enfance, qui ont grandi ensemble dans les rues de Bamako. Dès leurs débuts, ils ont su capter l’attention grâce à leur manière unique de raconter les déboires de la société malienne, mais toujours avec une touche de fraîcheur. Comme dit l’adage bambara : \"Celui qui sait parler peut convaincre, mais celui qui sait chanter touche le cœur\".\n\nLeur premier grand succès arrive avec Ghana en 2016, un hit alliant trap et hip hop électrique. Sur un rythme dansant, les rappeurs dépeignent une génération malienne qui s’abandonne à la consommation de stupéfiants, un phénomène devenu tristement commun. Ils pointent aussi du doigt la passivité des agents de la douane et de la police, qui ferment les yeux contre quelques billets. Ce morceau sera suivi de titres comme Adi na Badi, Bichouina et Hairai, confirmant leur place sur la scène musicale. Comme le souligne Ismaël Diabaté, alias Gucci, leur manager : « Ce dernier clip brise les codes de la musique classique malienne, trop souvent enfermée dans les considérations traditionnelles et religieuses ». Avec une liberté d\'expression propre aux jeunes générations, ils déclarent leur amour pour le ganja, symbole de leur rébellion musicale et sociale.\n\nEn six ans d’existence, NF Mama a produit une discographie variée et marquante. Leur série de mixtapes Old City Boys (OCB) est devenue emblématique. Avec OCB1 (2016), OCB2 (2017), Dabanani (2018), OCB3 et OCB4 (2019), ainsi que leur album Memwre sorti en décembre 2020, NF Mama n\'a cessé de conquérir de nouveaux fans. Des collaborations avec des artistes de renom comme Sidiki Diabaté, Mylmo, Soul Bang’s de Guinée et Nour de la Côte d\'Ivoire ont également contribué à leur notoriété.\n\nComme on dit au Mali, \"un enfant ne grandit pas seul, il grandit avec l\'appui de la communauté\", et c\'est sans doute grâce à cet esprit de fraternité que NF Mama continue de briller. Ce n’est pas seulement un groupe de rap, mais une famille, unie par la musique et par des voix complémentaires. Mezto et Young Pap apportent leur gravité, Ganja Morie une voix standard, tandis que Didi touche les aigus, créant ainsi une harmonie qui fait la force du groupe. \"Quand plusieurs voix chantent ensemble, elles construisent une seule mélodie, puissante et inoubliable\".','2024-09-05 16:20:47.338000','2024-09-05 18:00:59.657000','2024-09-05 16:21:25.203000',1,1);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_created_by_id_fk` (`created_by_id`),
  KEY `categories_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `categories_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloads`
--

DROP TABLE IF EXISTS `downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `download_date` datetime(6) DEFAULT NULL,
  `device_type` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `downloads_created_by_id_fk` (`created_by_id`),
  KEY `downloads_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `downloads_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `downloads_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloads`
--

LOCK TABLES `downloads` WRITE;
/*!40000 ALTER TABLE `downloads` DISABLE KEYS */;
INSERT INTO `downloads` VALUES
(1,'2024-06-19 10:36:11.994000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-19 10:36:11.491000','2024-06-19 10:36:11.491000','2024-06-19 10:36:11.468000',NULL,NULL),
(2,'2024-06-19 10:39:13.903000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-19 10:39:13.404000','2024-06-19 10:39:13.404000','2024-06-19 10:39:13.392000',NULL,NULL),
(3,'2024-06-19 10:43:31.651000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-19 10:43:31.244000','2024-06-19 10:43:31.244000','2024-06-19 10:43:31.231000',NULL,NULL),
(4,'2024-06-19 10:43:33.372000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-19 10:43:32.840000','2024-06-19 10:43:32.840000','2024-06-19 10:43:32.829000',NULL,NULL),
(5,'2024-06-19 10:44:57.640000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-19 10:44:57.084000','2024-06-19 10:44:57.084000','2024-06-19 10:44:57.074000',NULL,NULL),
(6,'2024-06-19 10:45:08.438000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-19 10:45:07.882000','2024-06-19 10:45:07.882000','2024-06-19 10:45:07.871000',NULL,NULL),
(7,'2024-06-19 10:46:08.217000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-19 10:46:07.651000','2024-06-19 10:46:07.651000','2024-06-19 10:46:07.643000',NULL,NULL),
(8,'2024-06-19 10:46:10.058000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-19 10:46:09.554000','2024-06-19 10:46:09.554000','2024-06-19 10:46:09.537000',NULL,NULL),
(9,'2024-06-19 10:46:25.242000','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','127.0.0.1','Bamako','2024-06-19 10:46:24.743000','2024-06-19 10:46:24.743000','2024-06-19 10:46:24.728000',NULL,NULL),
(10,'2024-06-19 10:48:46.014000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-19 10:48:45.874000','2024-06-19 10:48:45.874000','2024-06-19 10:48:45.773000',NULL,NULL),
(11,'2024-06-19 10:48:48.203000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-19 10:48:47.689000','2024-06-19 10:48:47.689000','2024-06-19 10:48:47.679000',NULL,NULL),
(12,'2024-06-19 10:48:48.975000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-19 10:48:48.464000','2024-06-19 10:48:48.464000','2024-06-19 10:48:48.453000',NULL,NULL),
(13,'2024-06-19 10:49:15.944000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-19 10:49:15.389000','2024-06-19 10:49:15.389000','2024-06-19 10:49:15.376000',NULL,NULL),
(14,'2024-06-19 10:49:16.269000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-19 10:49:15.708000','2024-06-19 10:49:15.708000','2024-06-19 10:49:15.700000',NULL,NULL),
(15,'2024-06-19 10:49:16.633000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-19 10:49:16.062000','2024-06-19 10:49:16.062000','2024-06-19 10:49:16.052000',NULL,NULL),
(16,'2024-06-20 12:51:36.472000','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-20 12:51:35.339000','2024-06-20 12:51:35.339000','2024-06-20 12:51:35.328000',NULL,NULL),
(17,'2024-06-26 11:48:15.434000','Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0','127.0.0.1','Bamako','2024-06-26 11:48:15.855000','2024-06-26 11:48:15.855000','2024-06-26 11:48:15.847000',NULL,NULL),
(18,'2024-06-26 11:49:23.551000','Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0','127.0.0.1','Bamako','2024-06-26 11:49:23.674000','2024-06-26 11:49:23.674000','2024-06-26 11:49:23.661000',NULL,NULL),
(19,'2024-06-26 14:08:35.119000','Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-26 14:08:35.375000','2024-06-26 14:08:35.375000','2024-06-26 14:08:35.365000',NULL,NULL),
(20,'2024-06-26 14:08:49.375000','Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-26 14:08:49.524000','2024-06-26 14:08:49.524000','2024-06-26 14:08:49.510000',NULL,NULL),
(21,'2024-06-26 14:09:28.351000','Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-26 14:09:28.576000','2024-06-26 14:09:28.576000','2024-06-26 14:09:28.567000',NULL,NULL),
(22,'2024-06-26 14:25:06.823000','Mozilla/5.0 (iPhone; CPU iPhone OS 17_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/126.0.6478.153 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-26 14:25:07.110000','2024-06-26 14:25:07.110000','2024-06-26 14:25:07.095000',NULL,NULL),
(23,'2024-06-26 14:26:04.695000','Mozilla/5.0 (iPhone; CPU iPhone OS 17_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/126.0.6478.153 Mobile/15E148 Safari/604.1','127.0.0.1','Bamako','2024-06-26 14:26:04.810000','2024-06-26 14:26:04.810000','2024-06-26 14:26:04.799000',NULL,NULL),
(24,'2024-07-10 12:13:15.122000','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36','127.0.0.1','Bamako','2024-07-10 12:13:15.067000','2024-07-10 12:13:15.067000','2024-07-10 12:13:15.056000',NULL,NULL),
(25,'2024-08-01 19:46:51.408000','Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36','127.0.0.1','Bamako','2024-08-01 19:46:53.499000','2024-08-01 19:46:53.499000','2024-08-01 19:46:53.475000',NULL,NULL),
(26,'2024-08-25 19:09:54.890000','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36','127.0.0.1','Bamako','2024-08-25 19:09:55.213000','2024-08-25 19:09:55.213000','2024-08-25 19:09:55.200000',NULL,NULL);
/*!40000 ALTER TABLE `downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloads_song_links`
--

DROP TABLE IF EXISTS `downloads_song_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloads_song_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `download_id` int(10) unsigned DEFAULT NULL,
  `song_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `downloads_song_links_unique` (`download_id`,`song_id`),
  KEY `downloads_song_links_fk` (`download_id`),
  KEY `downloads_song_links_inv_fk` (`song_id`),
  CONSTRAINT `downloads_song_links_fk` FOREIGN KEY (`download_id`) REFERENCES `downloads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloads_song_links_inv_fk` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloads_song_links`
--

LOCK TABLES `downloads_song_links` WRITE;
/*!40000 ALTER TABLE `downloads_song_links` DISABLE KEYS */;
INSERT INTO `downloads_song_links` VALUES
(1,1,17),
(2,2,16),
(3,3,13),
(4,4,13),
(5,5,14),
(6,6,11),
(7,7,10),
(8,8,10),
(9,9,12),
(10,10,2),
(11,11,2),
(12,12,2),
(13,13,15),
(14,14,15),
(15,15,15),
(16,16,4),
(17,17,18),
(18,18,19),
(19,19,20),
(20,20,24),
(21,21,24),
(22,22,25),
(23,23,26),
(24,24,27),
(25,25,23),
(26,26,22);
/*!40000 ALTER TABLE `downloads_song_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloads_user_links`
--

DROP TABLE IF EXISTS `downloads_user_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `downloads_user_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `download_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `downloads_user_links_unique` (`download_id`,`user_id`),
  KEY `downloads_user_links_fk` (`download_id`),
  KEY `downloads_user_links_inv_fk` (`user_id`),
  CONSTRAINT `downloads_user_links_fk` FOREIGN KEY (`download_id`) REFERENCES `downloads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloads_user_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloads_user_links`
--

LOCK TABLES `downloads_user_links` WRITE;
/*!40000 ALTER TABLE `downloads_user_links` DISABLE KEYS */;
INSERT INTO `downloads_user_links` VALUES
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1),
(5,5,1),
(6,6,1),
(7,7,1),
(8,8,1),
(9,9,1),
(10,10,1),
(11,11,1),
(12,12,1),
(13,13,1),
(14,14,1),
(15,15,1),
(16,16,1),
(17,17,1),
(18,18,1),
(19,19,1),
(20,20,1),
(21,21,1),
(22,22,1),
(23,23,1),
(24,24,1),
(25,25,1),
(26,26,1);
/*!40000 ALTER TABLE `downloads_user_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alternative_text` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`formats`)),
  `hash` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `preview_url` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`provider_metadata`)),
  `folder_path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_files_folder_path_index` (`folder_path`),
  KEY `upload_files_created_at_index` (`created_at`),
  KEY `upload_files_updated_at_index` (`updated_at`),
  KEY `upload_files_name_index` (`name`),
  KEY `upload_files_size_index` (`size`),
  KEY `upload_files_ext_index` (`ext`),
  KEY `files_created_by_id_fk` (`created_by_id`),
  KEY `files_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `files_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `files_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES
(1,'bluffeur n1.jpg',NULL,NULL,640,360,'{\"thumbnail\":{\"name\":\"thumbnail_bluffeur n1.jpg\",\"hash\":\"thumbnail_bluffeur_n1_fb6eb14b3a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":245,\"height\":138,\"size\":9.5,\"url\":\"/uploads/thumbnail_bluffeur_n1_fb6eb14b3a.jpg\"},\"small\":{\"name\":\"small_bluffeur n1.jpg\",\"hash\":\"small_bluffeur_n1_fb6eb14b3a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":281,\"size\":31.26,\"url\":\"/uploads/small_bluffeur_n1_fb6eb14b3a.jpg\"}}','bluffeur_n1_fb6eb14b3a','.jpg','image/jpeg',45.58,'/uploads/bluffeur_n1_fb6eb14b3a.jpg',NULL,'local',NULL,'/','2024-01-11 20:27:23.739000','2024-01-11 20:27:23.739000',1,1),
(2,'sidiki-transformed (1).png',NULL,NULL,2100,2100,'{\"thumbnail\":{\"name\":\"thumbnail_sidiki-transformed (1).png\",\"hash\":\"thumbnail_sidiki_transformed_1_2c83f21436\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":43,\"url\":\"/uploads/thumbnail_sidiki_transformed_1_2c83f21436.png\"},\"small\":{\"name\":\"small_sidiki-transformed (1).png\",\"hash\":\"small_sidiki_transformed_1_2c83f21436\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":365.59,\"url\":\"/uploads/small_sidiki_transformed_1_2c83f21436.png\"},\"medium\":{\"name\":\"medium_sidiki-transformed (1).png\",\"hash\":\"medium_sidiki_transformed_1_2c83f21436\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":762.05,\"url\":\"/uploads/medium_sidiki_transformed_1_2c83f21436.png\"},\"large\":{\"name\":\"large_sidiki-transformed (1).png\",\"hash\":\"large_sidiki_transformed_1_2c83f21436\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1327.2,\"url\":\"/uploads/large_sidiki_transformed_1_2c83f21436.png\"}}','sidiki_transformed_1_2c83f21436','.png','image/png',776.82,'/uploads/sidiki_transformed_1_2c83f21436.png',NULL,'local',NULL,'/','2024-01-12 09:04:26.591000','2024-01-12 09:22:06.878000',1,1),
(3,'Sidiki Diabaté - Terminus ft. @GAZO (Clip Officiel) (1).mp3',NULL,NULL,NULL,NULL,NULL,'Sidiki_Diabate_Terminus_ft_GAZO_Clip_Officiel_1_0a4e08fc2c','.mp3','audio/mpeg',3812.01,'/uploads/Sidiki_Diabate_Terminus_ft_GAZO_Clip_Officiel_1_0a4e08fc2c.mp3',NULL,'local',NULL,'/','2024-01-12 09:22:25.777000','2024-01-12 09:22:25.777000',1,1),
(5,'sidiki diabaté 2.jpg',NULL,NULL,900,900,'{\"thumbnail\":{\"name\":\"thumbnail_sidiki diabaté 2.jpg\",\"hash\":\"thumbnail_sidiki_diabate_2_ba261c46db\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":7.34,\"url\":\"/uploads/thumbnail_sidiki_diabate_2_ba261c46db.jpg\"},\"small\":{\"name\":\"small_sidiki diabaté 2.jpg\",\"hash\":\"small_sidiki_diabate_2_ba261c46db\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":58.06,\"url\":\"/uploads/small_sidiki_diabate_2_ba261c46db.jpg\"},\"medium\":{\"name\":\"medium_sidiki diabaté 2.jpg\",\"hash\":\"medium_sidiki_diabate_2_ba261c46db\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":120.1,\"url\":\"/uploads/medium_sidiki_diabate_2_ba261c46db.jpg\"}}','sidiki_diabate_2_ba261c46db','.jpg','image/jpeg',172.56,'/uploads/sidiki_diabate_2_ba261c46db.jpg',NULL,'local',NULL,'/','2024-01-12 09:24:29.846000','2024-01-12 09:24:29.846000',1,1),
(6,'s3.webp',NULL,NULL,720,598,'{\"thumbnail\":{\"name\":\"thumbnail_s3.webp\",\"hash\":\"thumbnail_s3_2a9983441f\",\"ext\":\".webp\",\"mime\":\"image/webp\",\"path\":null,\"width\":188,\"height\":156,\"size\":4.93,\"url\":\"/uploads/thumbnail_s3_2a9983441f.webp\"},\"small\":{\"name\":\"small_s3.webp\",\"hash\":\"small_s3_2a9983441f\",\"ext\":\".webp\",\"mime\":\"image/webp\",\"path\":null,\"width\":500,\"height\":415,\"size\":18.58,\"url\":\"/uploads/small_s3_2a9983441f.webp\"}}','s3_2a9983441f','.webp','image/webp',34.74,'/uploads/s3_2a9983441f.webp',NULL,'local',NULL,'/','2024-01-12 09:24:29.948000','2024-01-12 09:24:29.948000',1,1),
(7,'sidiki.png',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_sidiki.png\",\"hash\":\"thumbnail_sidiki_4b77cc4139\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":44.68,\"url\":\"/uploads/thumbnail_sidiki_4b77cc4139.png\"},\"small\":{\"name\":\"small_sidiki.png\",\"hash\":\"small_sidiki_4b77cc4139\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":391.77,\"url\":\"/uploads/small_sidiki_4b77cc4139.png\"},\"medium\":{\"name\":\"medium_sidiki.png\",\"hash\":\"medium_sidiki_4b77cc4139\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":832.15,\"url\":\"/uploads/medium_sidiki_4b77cc4139.png\"},\"large\":{\"name\":\"large_sidiki.png\",\"hash\":\"large_sidiki_4b77cc4139\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1413.54,\"url\":\"/uploads/large_sidiki_4b77cc4139.png\"}}','sidiki_4b77cc4139','.png','image/png',2121.80,'/uploads/sidiki_4b77cc4139.png',NULL,'local',NULL,'/','2024-01-12 09:24:53.166000','2024-01-12 09:24:53.166000',1,1),
(8,'young bg 2.jfif',NULL,NULL,284,177,'{\"thumbnail\":{\"name\":\"thumbnail_young bg 2.jfif\",\"hash\":\"thumbnail_young_bg_2_7a34de086b\",\"ext\":\".jfif\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":245,\"height\":153,\"size\":6.37,\"url\":\"/uploads/thumbnail_young_bg_2_7a34de086b.jfif\"}}','young_bg_2_7a34de086b','.jfif','image/jpeg',5.98,'/uploads/young_bg_2_7a34de086b.jfif',NULL,'local',NULL,'/','2024-01-12 09:35:17.306000','2024-01-12 09:35:17.306000',1,1),
(9,'young bg 1.png',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_young bg 1.png\",\"hash\":\"thumbnail_young_bg_1_66b8aed7f5\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":61.06,\"url\":\"/uploads/thumbnail_young_bg_1_66b8aed7f5.png\"},\"small\":{\"name\":\"small_young bg 1.png\",\"hash\":\"small_young_bg_1_66b8aed7f5\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":500.97,\"url\":\"/uploads/small_young_bg_1_66b8aed7f5.png\"},\"medium\":{\"name\":\"medium_young bg 1.png\",\"hash\":\"medium_young_bg_1_66b8aed7f5\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":1036.27,\"url\":\"/uploads/medium_young_bg_1_66b8aed7f5.png\"},\"large\":{\"name\":\"large_young bg 1.png\",\"hash\":\"large_young_bg_1_66b8aed7f5\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1687.68,\"url\":\"/uploads/large_young_bg_1_66b8aed7f5.png\"}}','young_bg_1_66b8aed7f5','.png','image/png',2393.46,'/uploads/young_bg_1_66b8aed7f5.png',NULL,'local',NULL,'/','2024-01-12 09:35:42.436000','2024-01-12 09:35:42.436000',1,1),
(10,'young bg 3.png',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_young bg 3.png\",\"hash\":\"thumbnail_young_bg_3_4c60d73f3b\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":46.06,\"url\":\"/uploads/thumbnail_young_bg_3_4c60d73f3b.png\"},\"small\":{\"name\":\"small_young bg 3.png\",\"hash\":\"small_young_bg_3_4c60d73f3b\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":413.64,\"url\":\"/uploads/small_young_bg_3_4c60d73f3b.png\"},\"medium\":{\"name\":\"medium_young bg 3.png\",\"hash\":\"medium_young_bg_3_4c60d73f3b\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":871.23,\"url\":\"/uploads/medium_young_bg_3_4c60d73f3b.png\"},\"large\":{\"name\":\"large_young bg 3.png\",\"hash\":\"large_young_bg_3_4c60d73f3b\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1445.94,\"url\":\"/uploads/large_young_bg_3_4c60d73f3b.png\"}}','young_bg_3_4c60d73f3b','.png','image/png',1837.71,'/uploads/young_bg_3_4c60d73f3b.png',NULL,'local',NULL,'/','2024-01-12 09:36:29.822000','2024-01-12 09:36:29.822000',1,1),
(11,'young bg 2.png',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_young bg 2.png\",\"hash\":\"thumbnail_young_bg_2_c22cef5140\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":49.4,\"url\":\"/uploads/thumbnail_young_bg_2_c22cef5140.png\"},\"small\":{\"name\":\"small_young bg 2.png\",\"hash\":\"small_young_bg_2_c22cef5140\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":414.45,\"url\":\"/uploads/small_young_bg_2_c22cef5140.png\"},\"medium\":{\"name\":\"medium_young bg 2.png\",\"hash\":\"medium_young_bg_2_c22cef5140\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":847.47,\"url\":\"/uploads/medium_young_bg_2_c22cef5140.png\"},\"large\":{\"name\":\"large_young bg 2.png\",\"hash\":\"large_young_bg_2_c22cef5140\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1383.85,\"url\":\"/uploads/large_young_bg_2_c22cef5140.png\"}}','young_bg_2_c22cef5140','.png','image/png',2411.94,'/uploads/young_bg_2_c22cef5140.png',NULL,'local',NULL,'/','2024-01-12 09:36:32.395000','2024-01-12 09:36:32.395000',1,1),
(12,'young bg 4.png',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_young bg 4.png\",\"hash\":\"thumbnail_young_bg_4_acfe9aac2c\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":65.91,\"url\":\"/uploads/thumbnail_young_bg_4_acfe9aac2c.png\"},\"small\":{\"name\":\"small_young bg 4.png\",\"hash\":\"small_young_bg_4_acfe9aac2c\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":585.63,\"url\":\"/uploads/small_young_bg_4_acfe9aac2c.png\"},\"medium\":{\"name\":\"medium_young bg 4.png\",\"hash\":\"medium_young_bg_4_acfe9aac2c\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":1240.73,\"url\":\"/uploads/medium_young_bg_4_acfe9aac2c.png\"},\"large\":{\"name\":\"large_young bg 4.png\",\"hash\":\"large_young_bg_4_acfe9aac2c\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":2057.69,\"url\":\"/uploads/large_young_bg_4_acfe9aac2c.png\"}}','young_bg_4_acfe9aac2c','.png','image/png',2847.08,'/uploads/young_bg_4_acfe9aac2c.png',NULL,'local',NULL,'/','2024-01-12 09:36:39.332000','2024-01-12 09:36:39.332000',1,1),
(13,'cvsha.png',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_cvsha.png\",\"hash\":\"thumbnail_cvsha_6c65098f53\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":52.42,\"url\":\"/uploads/thumbnail_cvsha_6c65098f53.png\"},\"small\":{\"name\":\"small_cvsha.png\",\"hash\":\"small_cvsha_6c65098f53\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":442.74,\"url\":\"/uploads/small_cvsha_6c65098f53.png\"},\"medium\":{\"name\":\"medium_cvsha.png\",\"hash\":\"medium_cvsha_6c65098f53\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":926.95,\"url\":\"/uploads/medium_cvsha_6c65098f53.png\"},\"large\":{\"name\":\"large_cvsha.png\",\"hash\":\"large_cvsha_6c65098f53\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1561.71,\"url\":\"/uploads/large_cvsha_6c65098f53.png\"}}','cvsha_6c65098f53','.png','image/png',2368.07,'/uploads/cvsha_6c65098f53.png',NULL,'local',NULL,'/','2024-01-12 09:41:05.892000','2024-01-12 09:41:05.892000',1,1),
(14,'walyseck.png',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_walyseck.png\",\"hash\":\"thumbnail_walyseck_863393a80f\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":49.89,\"url\":\"/uploads/thumbnail_walyseck_863393a80f.png\"},\"small\":{\"name\":\"small_walyseck.png\",\"hash\":\"small_walyseck_863393a80f\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":425.83,\"url\":\"/uploads/small_walyseck_863393a80f.png\"},\"medium\":{\"name\":\"medium_walyseck.png\",\"hash\":\"medium_walyseck_863393a80f\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":888.01,\"url\":\"/uploads/medium_walyseck_863393a80f.png\"},\"large\":{\"name\":\"large_walyseck.png\",\"hash\":\"large_walyseck_863393a80f\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1489.23,\"url\":\"/uploads/large_walyseck_863393a80f.png\"}}','walyseck_863393a80f','.png','image/png',2163.84,'/uploads/walyseck_863393a80f.png',NULL,'local',NULL,'/','2024-01-12 09:46:05.419000','2024-01-12 09:46:05.419000',1,1),
(15,'casha - Angati.m4a',NULL,NULL,NULL,NULL,NULL,'casha_Angati_3864bdd97b','.m4a','audio/x-m4a',2268.29,'/uploads/casha_Angati_3864bdd97b.m4a',NULL,'local',NULL,'/1','2024-01-12 09:48:24.718000','2024-01-12 09:48:24.718000',1,1),
(16,'Young-Bg Sabou (official clip).mp3',NULL,NULL,NULL,NULL,NULL,'Young_Bg_Sabou_official_clip_82dd038ebe','.mp3','audio/mpeg',4641.36,'/uploads/Young_Bg_Sabou_official_clip_82dd038ebe.mp3',NULL,'local',NULL,'/1','2024-01-12 09:48:26.052000','2024-01-24 09:19:13.327000',1,1),
(17,'CVSHA -Temps (Official Video) 2023.mp3',NULL,NULL,NULL,NULL,NULL,'CVSHA_Temps_Official_Video_2023_49a3039b2a','.mp3','audio/mpeg',3368.49,'/uploads/CVSHA_Temps_Official_Video_2023_49a3039b2a.mp3',NULL,'local',NULL,'/1','2024-01-12 09:48:27.374000','2024-01-12 09:54:47.792000',1,1),
(18,'CVSHA - Making Money (Official Video) 2021.mp3',NULL,NULL,NULL,NULL,NULL,'CVSHA_Making_Money_Official_Video_2021_2f32060623','.mp3','audio/mpeg',4193.73,'/uploads/CVSHA_Making_Money_Official_Video_2021_2f32060623.mp3',NULL,'local',NULL,'/1','2024-01-12 09:48:29.814000','2024-01-12 09:48:29.814000',1,1),
(19,'Wally B. Seck - Studio Session  Let them grow up.mp3',NULL,NULL,NULL,NULL,NULL,'Wally_B_Seck_Studio_Session_Let_them_grow_up_5fa5974598','.mp3','audio/mpeg',5164.23,'/uploads/Wally_B_Seck_Studio_Session_Let_them_grow_up_5fa5974598.mp3',NULL,'local',NULL,'/1','2024-01-12 09:48:32.724000','2024-01-12 09:48:32.724000',1,1),
(20,'cvsha 2.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_cvsha 2.jpg\",\"hash\":\"thumbnail_cvsha_2_542a9e1184\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":6.38,\"url\":\"/uploads/thumbnail_cvsha_2_542a9e1184.jpg\"},\"medium\":{\"name\":\"medium_cvsha 2.jpg\",\"hash\":\"medium_cvsha_2_542a9e1184\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":51.47,\"url\":\"/uploads/medium_cvsha_2_542a9e1184.jpg\"},\"small\":{\"name\":\"small_cvsha 2.jpg\",\"hash\":\"small_cvsha_2_542a9e1184\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":30.31,\"url\":\"/uploads/small_cvsha_2_542a9e1184.jpg\"},\"large\":{\"name\":\"large_cvsha 2.jpg\",\"hash\":\"large_cvsha_2_542a9e1184\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":75.79,\"url\":\"/uploads/large_cvsha_2_542a9e1184.jpg\"}}','cvsha_2_542a9e1184','.jpg','image/jpeg',366.05,'/uploads/cvsha_2_542a9e1184.jpg',NULL,'local',NULL,'/','2024-01-12 09:54:20.742000','2024-01-12 09:54:20.742000',1,1),
(21,'oude 3.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_oude 3.jpg\",\"hash\":\"thumbnail_oude_3_e3ed292ab5\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":4.86,\"url\":\"/uploads/thumbnail_oude_3_e3ed292ab5.jpg\"},\"large\":{\"name\":\"large_oude 3.jpg\",\"hash\":\"large_oude_3_e3ed292ab5\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":56.99,\"url\":\"/uploads/large_oude_3_e3ed292ab5.jpg\"},\"medium\":{\"name\":\"medium_oude 3.jpg\",\"hash\":\"medium_oude_3_e3ed292ab5\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":38.42,\"url\":\"/uploads/medium_oude_3_e3ed292ab5.jpg\"},\"small\":{\"name\":\"small_oude 3.jpg\",\"hash\":\"small_oude_3_e3ed292ab5\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":22.73,\"url\":\"/uploads/small_oude_3_e3ed292ab5.jpg\"}}','oude_3_e3ed292ab5','.jpg','image/jpeg',279.23,'/uploads/oude_3_e3ed292ab5.jpg',NULL,'local',NULL,'/','2024-01-23 09:04:24.236000','2024-01-23 09:04:24.236000',1,1),
(22,'oude 1.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_oude 1.jpg\",\"hash\":\"thumbnail_oude_1_fb982ea25b\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":4.7,\"url\":\"/uploads/thumbnail_oude_1_fb982ea25b.jpg\"},\"medium\":{\"name\":\"medium_oude 1.jpg\",\"hash\":\"medium_oude_1_fb982ea25b\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":54.69,\"url\":\"/uploads/medium_oude_1_fb982ea25b.jpg\"},\"small\":{\"name\":\"small_oude 1.jpg\",\"hash\":\"small_oude_1_fb982ea25b\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":29.43,\"url\":\"/uploads/small_oude_1_fb982ea25b.jpg\"},\"large\":{\"name\":\"large_oude 1.jpg\",\"hash\":\"large_oude_1_fb982ea25b\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":82.62,\"url\":\"/uploads/large_oude_1_fb982ea25b.jpg\"}}','oude_1_fb982ea25b','.jpg','image/jpeg',394.24,'/uploads/oude_1_fb982ea25b.jpg',NULL,'local',NULL,'/','2024-01-23 09:04:27.168000','2024-01-23 09:04:27.168000',1,1),
(23,'oude 2.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_oude 2.jpg\",\"hash\":\"thumbnail_oude_2_1c789fd6ec\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":6.45,\"url\":\"/uploads/thumbnail_oude_2_1c789fd6ec.jpg\"},\"small\":{\"name\":\"small_oude 2.jpg\",\"hash\":\"small_oude_2_1c789fd6ec\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":41.82,\"url\":\"/uploads/small_oude_2_1c789fd6ec.jpg\"},\"large\":{\"name\":\"large_oude 2.jpg\",\"hash\":\"large_oude_2_1c789fd6ec\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":111.68,\"url\":\"/uploads/large_oude_2_1c789fd6ec.jpg\"},\"medium\":{\"name\":\"medium_oude 2.jpg\",\"hash\":\"medium_oude_2_1c789fd6ec\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":75.45,\"url\":\"/uploads/medium_oude_2_1c789fd6ec.jpg\"}}','oude_2_1c789fd6ec','.jpg','image/jpeg',539.91,'/uploads/oude_2_1c789fd6ec.jpg',NULL,'local',NULL,'/','2024-01-23 09:04:27.505000','2024-01-23 09:04:27.505000',1,1),
(24,'223%.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_223%.jpg\",\"hash\":\"thumbnail_223_a945312082\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":3.47,\"url\":\"/uploads/thumbnail_223_a945312082.jpg\"},\"large\":{\"name\":\"large_223%.jpg\",\"hash\":\"large_223_a945312082\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":31.13,\"url\":\"/uploads/large_223_a945312082.jpg\"},\"medium\":{\"name\":\"medium_223%.jpg\",\"hash\":\"medium_223_a945312082\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":22.14,\"url\":\"/uploads/medium_223_a945312082.jpg\"},\"small\":{\"name\":\"small_223%.jpg\",\"hash\":\"small_223_a945312082\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":13.77,\"url\":\"/uploads/small_223_a945312082.jpg\"}}','223_a945312082','.jpg','image/jpeg',144.83,'/uploads/223_a945312082.jpg',NULL,'local',NULL,'/','2024-01-23 09:10:36.205000','2024-01-23 09:11:39.116000',1,1),
(25,'OUDE MILL - KAYES KA DEN RAP (feat ADJI ONE).mp3',NULL,NULL,NULL,NULL,NULL,'OUDE_MILL_KAYES_KA_DEN_RAP_feat_ADJI_ONE_76a4c73c45','.mp3','audio/mpeg',4969.77,'/uploads/OUDE_MILL_KAYES_KA_DEN_RAP_feat_ADJI_ONE_76a4c73c45.mp3',NULL,'local',NULL,'/1','2024-01-23 09:12:14.821000','2024-01-23 09:12:14.821000',1,1),
(26,'OUDE MILL - DOLLARS GANG (HAMED DOLLARS).mp3',NULL,NULL,NULL,NULL,NULL,'OUDE_MILL_DOLLARS_GANG_HAMED_DOLLARS_672fa4ab18','.mp3','audio/mpeg',4962.98,'/uploads/OUDE_MILL_DOLLARS_GANG_HAMED_DOLLARS_672fa4ab18.mp3',NULL,'local',NULL,'/1','2024-01-23 09:14:22.155000','2024-01-23 09:14:22.155000',1,1),
(27,'c27.png',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_c27.png\",\"hash\":\"thumbnail_c27_564c1a722d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":33.58,\"url\":\"/uploads/thumbnail_c27_564c1a722d.png\"},\"small\":{\"name\":\"small_c27.png\",\"hash\":\"small_c27_564c1a722d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":290.42,\"url\":\"/uploads/small_c27_564c1a722d.png\"},\"medium\":{\"name\":\"medium_c27.png\",\"hash\":\"medium_c27_564c1a722d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":615.88,\"url\":\"/uploads/medium_c27_564c1a722d.png\"},\"large\":{\"name\":\"large_c27.png\",\"hash\":\"large_c27_564c1a722d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1053.01,\"url\":\"/uploads/large_c27_564c1a722d.png\"}}','c27_564c1a722d','.png','image/png',1540.19,'/uploads/c27_564c1a722d.png',NULL,'local',NULL,'/','2024-01-23 21:58:45.601000','2024-01-23 21:58:45.601000',1,1),
(28,'GC.png',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_GC.png\",\"hash\":\"thumbnail_GC_760c424781\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":56.25,\"url\":\"/uploads/thumbnail_GC_760c424781.png\"},\"small\":{\"name\":\"small_GC.png\",\"hash\":\"small_GC_760c424781\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":499.79,\"url\":\"/uploads/small_GC_760c424781.png\"},\"medium\":{\"name\":\"medium_GC.png\",\"hash\":\"medium_GC_760c424781\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":1039.31,\"url\":\"/uploads/medium_GC_760c424781.png\"},\"large\":{\"name\":\"large_GC.png\",\"hash\":\"large_GC_760c424781\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1710.28,\"url\":\"/uploads/large_GC_760c424781.png\"}}','GC_760c424781','.png','image/png',2367.75,'/uploads/GC_760c424781.png',NULL,'local',NULL,'/','2024-01-23 22:03:42.967000','2024-01-23 22:03:42.967000',1,1),
(29,'GC.png',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_GC.png\",\"hash\":\"thumbnail_GC_54c6dbb88a\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":56.25,\"url\":\"/uploads/thumbnail_GC_54c6dbb88a.png\"},\"small\":{\"name\":\"small_GC.png\",\"hash\":\"small_GC_54c6dbb88a\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":499.79,\"url\":\"/uploads/small_GC_54c6dbb88a.png\"},\"medium\":{\"name\":\"medium_GC.png\",\"hash\":\"medium_GC_54c6dbb88a\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":1039.31,\"url\":\"/uploads/medium_GC_54c6dbb88a.png\"},\"large\":{\"name\":\"large_GC.png\",\"hash\":\"large_GC_54c6dbb88a\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1710.28,\"url\":\"/uploads/large_GC_54c6dbb88a.png\"}}','GC_54c6dbb88a','.png','image/png',2367.75,'/uploads/GC_54c6dbb88a.png',NULL,'local',NULL,'/1','2024-01-23 22:07:17.870000','2024-01-23 22:07:17.870000',1,1),
(30,'young bg 1.png',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_young bg 1.png\",\"hash\":\"thumbnail_young_bg_1_7794f7188e\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":60.23,\"url\":\"/uploads/thumbnail_young_bg_1_7794f7188e.png\"},\"small\":{\"name\":\"small_young bg 1.png\",\"hash\":\"small_young_bg_1_7794f7188e\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":514.3,\"url\":\"/uploads/small_young_bg_1_7794f7188e.png\"},\"medium\":{\"name\":\"medium_young bg 1.png\",\"hash\":\"medium_young_bg_1_7794f7188e\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":1075.34,\"url\":\"/uploads/medium_young_bg_1_7794f7188e.png\"},\"large\":{\"name\":\"large_young bg 1.png\",\"hash\":\"large_young_bg_1_7794f7188e\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":1788.2,\"url\":\"/uploads/large_young_bg_1_7794f7188e.png\"}}','young_bg_1_7794f7188e','.png','image/png',2702.64,'/uploads/young_bg_1_7794f7188e.png',NULL,'local',NULL,'/','2024-01-24 09:20:01.787000','2024-01-24 09:20:01.787000',1,1),
(31,'CALIBRE 27 - BAS QUARTIER (CLIP).mp3',NULL,NULL,NULL,NULL,NULL,'CALIBRE_27_BAS_QUARTIER_CLIP_0eb01dc80d','.mp3','audio/mpeg',6552.90,'/uploads/CALIBRE_27_BAS_QUARTIER_CLIP_0eb01dc80d.mp3',NULL,'local',NULL,'/1','2024-01-24 10:29:52.660000','2024-01-24 10:29:52.660000',1,1),
(32,'bron - tom pro.png',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_bron - tom pro.png\",\"hash\":\"thumbnail_bron_tom_pro_43ff521a2d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":156,\"height\":156,\"size\":32.87,\"url\":\"/uploads/thumbnail_bron_tom_pro_43ff521a2d.png\"},\"small\":{\"name\":\"small_bron - tom pro.png\",\"hash\":\"small_bron_tom_pro_43ff521a2d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":500,\"size\":193.96,\"url\":\"/uploads/small_bron_tom_pro_43ff521a2d.png\"},\"medium\":{\"name\":\"medium_bron - tom pro.png\",\"hash\":\"medium_bron_tom_pro_43ff521a2d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":750,\"height\":750,\"size\":372.64,\"url\":\"/uploads/medium_bron_tom_pro_43ff521a2d.png\"},\"large\":{\"name\":\"large_bron - tom pro.png\",\"hash\":\"large_bron_tom_pro_43ff521a2d\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":640.8,\"url\":\"/uploads/large_bron_tom_pro_43ff521a2d.png\"}}','bron_tom_pro_43ff521a2d','.png','image/png',1704.99,'/uploads/bron_tom_pro_43ff521a2d.png',NULL,'local',NULL,'/','2024-04-12 10:11:31.744000','2024-04-12 10:15:44.463000',1,1),
(33,'Tom Pro feat Bronzer - BadMan !!!.mp3',NULL,NULL,NULL,NULL,NULL,'Tom_Pro_feat_Bronzer_Bad_Man_1efc39101b','.mp3','audio/mpeg',3277.15,'/uploads/Tom_Pro_feat_Bronzer_Bad_Man_1efc39101b.mp3',NULL,'local',NULL,'/','2024-04-12 10:12:38.473000','2024-04-12 10:12:38.473000',1,1),
(34,'Screenshot 2024-04-12 102242.png',NULL,NULL,572,517,'{\"thumbnail\":{\"name\":\"thumbnail_Screenshot 2024-04-12 102242.png\",\"hash\":\"thumbnail_Screenshot_2024_04_12_102242_d94782a709\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":173,\"height\":156,\"size\":41.07,\"url\":\"/uploads/thumbnail_Screenshot_2024_04_12_102242_d94782a709.png\"},\"small\":{\"name\":\"small_Screenshot 2024-04-12 102242.png\",\"hash\":\"small_Screenshot_2024_04_12_102242_d94782a709\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":500,\"height\":452,\"size\":268.21,\"url\":\"/uploads/small_Screenshot_2024_04_12_102242_d94782a709.png\"}}','Screenshot_2024_04_12_102242_d94782a709','.png','image/png',86.47,'/uploads/Screenshot_2024_04_12_102242_d94782a709.png',NULL,'local',NULL,'/','2024-04-12 10:23:11.819000','2024-04-12 10:23:11.819000',1,1),
(35,'Py le gangster - An golokoun magne.mp3',NULL,NULL,NULL,NULL,NULL,'Py_le_gangster_An_golokoun_magne_8cf4c60494','.mp3','audio/mpeg',4394.35,'/uploads/Py_le_gangster_An_golokoun_magne_8cf4c60494.mp3',NULL,'local',NULL,'/','2024-04-12 10:23:50.417000','2024-04-12 10:25:43.164000',1,1),
(36,'Gaspi.jfif',NULL,NULL,225,225,'{\"thumbnail\":{\"name\":\"thumbnail_Gaspi.jfif\",\"hash\":\"thumbnail_Gaspi_3b23bb26de\",\"ext\":\".jfif\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":6.18,\"url\":\"/uploads/thumbnail_Gaspi_3b23bb26de.jfif\"}}','Gaspi_3b23bb26de','.jfif','image/jpeg',7.50,'/uploads/Gaspi_3b23bb26de.jfif',NULL,'local',NULL,'/','2024-04-12 10:29:12.971000','2024-04-12 10:29:12.971000',1,1),
(37,'Gaspi egotryp.mp3',NULL,NULL,NULL,NULL,NULL,'Gaspi_egotryp_24e193491d','.mp3','audio/mpeg',6319.68,'/uploads/Gaspi_egotryp_24e193491d.mp3',NULL,'local',NULL,'/','2024-04-12 10:29:29.081000','2024-04-12 10:29:29.081000',1,1),
(38,'CALIBRE 27 - BAS QUARTIER (CLIP).mp3',NULL,NULL,NULL,NULL,NULL,'CALIBRE_27_BAS_QUARTIER_CLIP_d59a4a041e','.mp3','audio/mpeg',6552.90,'/uploads/CALIBRE_27_BAS_QUARTIER_CLIP_d59a4a041e.mp3',NULL,'local',NULL,'/','2024-04-30 13:17:03.866000','2024-04-30 13:17:03.866000',1,1),
(39,'zed1.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_zed1.jpg\",\"hash\":\"thumbnail_zed1_ad965996b5\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":6.15,\"url\":\"/uploads/thumbnail_zed1_ad965996b5.jpg\"},\"small\":{\"name\":\"small_zed1.jpg\",\"hash\":\"small_zed1_ad965996b5\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":41.96,\"url\":\"/uploads/small_zed1_ad965996b5.jpg\"},\"large\":{\"name\":\"large_zed1.jpg\",\"hash\":\"large_zed1_ad965996b5\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":116.26,\"url\":\"/uploads/large_zed1_ad965996b5.jpg\"},\"medium\":{\"name\":\"medium_zed1.jpg\",\"hash\":\"medium_zed1_ad965996b5\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":77.65,\"url\":\"/uploads/medium_zed1_ad965996b5.jpg\"}}','zed1_ad965996b5','.jpg','image/jpeg',560.07,'/uploads/zed1_ad965996b5.jpg',NULL,'local',NULL,'/','2024-05-01 11:28:20.116000','2024-05-01 11:28:20.116000',1,1),
(40,'zed.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_zed.jpg\",\"hash\":\"thumbnail_zed_58f3926be6\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":4.87,\"url\":\"/uploads/thumbnail_zed_58f3926be6.jpg\"},\"large\":{\"name\":\"large_zed.jpg\",\"hash\":\"large_zed_58f3926be6\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":55.08,\"url\":\"/uploads/large_zed_58f3926be6.jpg\"},\"medium\":{\"name\":\"medium_zed.jpg\",\"hash\":\"medium_zed_58f3926be6\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":38.28,\"url\":\"/uploads/medium_zed_58f3926be6.jpg\"},\"small\":{\"name\":\"small_zed.jpg\",\"hash\":\"small_zed_58f3926be6\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":22.99,\"url\":\"/uploads/small_zed_58f3926be6.jpg\"}}','zed_58f3926be6','.jpg','image/jpeg',254.41,'/uploads/zed_58f3926be6.jpg',NULL,'local',NULL,'/','2024-05-01 11:34:04.190000','2024-05-01 11:34:04.190000',1,1),
(41,'LIL ZED _COUPLET KELEN( Clip officiel).mp3',NULL,NULL,NULL,NULL,NULL,'LIL_ZED_COUPLET_KELEN_Clip_officiel_8adae710b1','.mp3','audio/mpeg',4282.13,'/uploads/LIL_ZED_COUPLET_KELEN_Clip_officiel_8adae710b1.mp3',NULL,'local',NULL,'/','2024-05-01 11:35:35.097000','2024-05-01 11:35:35.097000',1,1),
(42,'Abidox.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_Abidox.jpg\",\"hash\":\"thumbnail_Abidox_2acc9251d9\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":7.19,\"url\":\"/uploads/thumbnail_Abidox_2acc9251d9.jpg\"},\"medium\":{\"name\":\"medium_Abidox.jpg\",\"hash\":\"medium_Abidox_2acc9251d9\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":61.17,\"url\":\"/uploads/medium_Abidox_2acc9251d9.jpg\"},\"small\":{\"name\":\"small_Abidox.jpg\",\"hash\":\"small_Abidox_2acc9251d9\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":36.14,\"url\":\"/uploads/small_Abidox_2acc9251d9.jpg\"},\"large\":{\"name\":\"large_Abidox.jpg\",\"hash\":\"large_Abidox_2acc9251d9\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":89.95,\"url\":\"/uploads/large_Abidox_2acc9251d9.jpg\"}}','Abidox_2acc9251d9','.jpg','image/jpeg',433.45,'/uploads/Abidox_2acc9251d9.jpg',NULL,'local',NULL,'/','2024-05-01 11:56:26.859000','2024-05-01 11:56:26.859000',1,1),
(44,'Supreme abidox - Sisan Kow.mp3',NULL,NULL,NULL,NULL,NULL,'Supreme_abidox_Sisan_Kow_4ae6e36130','.mp3','audio/mpeg',3484.04,'/uploads/Supreme_abidox_Sisan_Kow_4ae6e36130.mp3',NULL,'local',NULL,'/','2024-05-01 11:57:30.361000','2024-05-01 11:57:30.361000',1,1),
(45,'Supreme Abidox - ALPHA ( Official video ).mp3',NULL,NULL,NULL,NULL,NULL,'Supreme_Abidox_ALPHA_Official_video_0e5ec354fc','.mp3','audio/mpeg',5443.82,'/uploads/Supreme_Abidox_ALPHA_Official_video_0e5ec354fc.mp3',NULL,'local',NULL,'/','2024-05-01 12:01:40.069000','2024-05-01 12:01:40.069000',1,1),
(46,'davidson.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_davidson.jpg\",\"hash\":\"thumbnail_davidson_0659bbafe5\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":6.48,\"url\":\"/uploads/thumbnail_davidson_0659bbafe5.jpg\"},\"medium\":{\"name\":\"medium_davidson.jpg\",\"hash\":\"medium_davidson_0659bbafe5\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":55.71,\"url\":\"/uploads/medium_davidson_0659bbafe5.jpg\"},\"small\":{\"name\":\"small_davidson.jpg\",\"hash\":\"small_davidson_0659bbafe5\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":32.92,\"url\":\"/uploads/small_davidson_0659bbafe5.jpg\"},\"large\":{\"name\":\"large_davidson.jpg\",\"hash\":\"large_davidson_0659bbafe5\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":81.61,\"url\":\"/uploads/large_davidson_0659bbafe5.jpg\"}}','davidson_0659bbafe5','.jpg','image/jpeg',385.08,'/uploads/davidson_0659bbafe5.jpg',NULL,'local',NULL,'/','2024-05-02 17:17:35.868000','2024-05-02 17:17:35.868000',1,1),
(47,'davidson tesla.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_davidson tesla.jpg\",\"hash\":\"thumbnail_davidson_tesla_f2bce9c01a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":4.09,\"url\":\"/uploads/thumbnail_davidson_tesla_f2bce9c01a.jpg\"},\"large\":{\"name\":\"large_davidson tesla.jpg\",\"hash\":\"large_davidson_tesla_f2bce9c01a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":52.43,\"url\":\"/uploads/large_davidson_tesla_f2bce9c01a.jpg\"},\"medium\":{\"name\":\"medium_davidson tesla.jpg\",\"hash\":\"medium_davidson_tesla_f2bce9c01a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":35.21,\"url\":\"/uploads/medium_davidson_tesla_f2bce9c01a.jpg\"},\"small\":{\"name\":\"small_davidson tesla.jpg\",\"hash\":\"small_davidson_tesla_f2bce9c01a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":20.05,\"url\":\"/uploads/small_davidson_tesla_f2bce9c01a.jpg\"}}','davidson_tesla_f2bce9c01a','.jpg','image/jpeg',247.47,'/uploads/davidson_tesla_f2bce9c01a.jpg',NULL,'local',NULL,'/','2024-05-02 17:20:19.362000','2024-05-02 17:20:19.362000',1,1),
(48,'DAVIDSON TESLA  Black & White Freestyle.mp3',NULL,NULL,NULL,NULL,NULL,'DAVIDSON_TESLA_Black_and_White_Freestyle_c350abac34','.mp3','audio/mpeg',3763.02,'/uploads/DAVIDSON_TESLA_Black_and_White_Freestyle_c350abac34.mp3',NULL,'local',NULL,'/','2024-05-02 17:22:36.263000','2024-05-02 17:22:36.263000',1,1),
(51,'Salif Keita - Tonton (Creacom Afrique Prod).mp3',NULL,NULL,NULL,NULL,NULL,'Salif_Keita_Tonton_Creacom_Afrique_Prod_ca71a91245','.mp3','audio/mpeg',5356.27,'/uploads/Salif_Keita_Tonton_Creacom_Afrique_Prod_ca71a91245.mp3',NULL,'local',NULL,'/','2024-06-11 10:12:19.691000','2024-06-11 10:12:19.691000',1,1),
(52,'oumou.webp',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_oumou.webp\",\"hash\":\"thumbnail_oumou_f4dade4d8e\",\"ext\":\".webp\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":5.5,\"url\":\"/uploads/thumbnail_oumou_f4dade4d8e.webp\"},\"medium\":{\"name\":\"medium_oumou.webp\",\"hash\":\"medium_oumou_f4dade4d8e\",\"ext\":\".webp\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":58.83,\"url\":\"/uploads/medium_oumou_f4dade4d8e.webp\"},\"small\":{\"name\":\"small_oumou.webp\",\"hash\":\"small_oumou_f4dade4d8e\",\"ext\":\".webp\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":33.61,\"url\":\"/uploads/small_oumou_f4dade4d8e.webp\"},\"large\":{\"name\":\"large_oumou.webp\",\"hash\":\"large_oumou_f4dade4d8e\",\"ext\":\".webp\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":85.45,\"url\":\"/uploads/large_oumou_f4dade4d8e.webp\"}}','oumou_f4dade4d8e','.webp','image/jpeg',399.98,'/uploads/oumou_f4dade4d8e.webp',NULL,'local',NULL,'/','2024-06-11 10:13:08.256000','2024-06-27 10:11:27.561000',1,1),
(53,'oumou sangg.png',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_oumou sangg.png\",\"hash\":\"thumbnail_oumou_sangg_d485914124\",\"ext\":\".png\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":5.59,\"url\":\"/uploads/thumbnail_oumou_sangg_d485914124.png\"},\"medium\":{\"name\":\"medium_oumou sangg.png\",\"hash\":\"medium_oumou_sangg_d485914124\",\"ext\":\".png\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":52.05,\"url\":\"/uploads/medium_oumou_sangg_d485914124.png\"},\"small\":{\"name\":\"small_oumou sangg.png\",\"hash\":\"small_oumou_sangg_d485914124\",\"ext\":\".png\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":30.42,\"url\":\"/uploads/small_oumou_sangg_d485914124.png\"},\"large\":{\"name\":\"large_oumou sangg.png\",\"hash\":\"large_oumou_sangg_d485914124\",\"ext\":\".png\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":75.63,\"url\":\"/uploads/large_oumou_sangg_d485914124.png\"}}','oumou_sangg_d485914124','.png','image/jpeg',357.01,'/uploads/oumou_sangg_d485914124.png',NULL,'local',NULL,'/','2024-06-11 10:14:47.195000','2024-06-23 13:52:06.537000',1,1),
(54,'Oumou Sangaré Been (clip officiel).mp3',NULL,NULL,NULL,NULL,NULL,'Oumou_Sangare_Been_clip_officiel_83cb0be8c7','.mp3','audio/mpeg',7405.54,'/uploads/Oumou_Sangare_Been_clip_officiel_83cb0be8c7.mp3',NULL,'local',NULL,'/','2024-06-11 10:17:16.024000','2024-06-11 10:17:16.024000',1,1),
(55,'salif keita.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_salif keita.jpg\",\"hash\":\"thumbnail_salif_keita_3f90441caa\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":3.51,\"url\":\"/uploads/thumbnail_salif_keita_3f90441caa.jpg\"},\"large\":{\"name\":\"large_salif keita.jpg\",\"hash\":\"large_salif_keita_3f90441caa\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":49.69,\"url\":\"/uploads/large_salif_keita_3f90441caa.jpg\"},\"medium\":{\"name\":\"medium_salif keita.jpg\",\"hash\":\"medium_salif_keita_3f90441caa\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":33.81,\"url\":\"/uploads/medium_salif_keita_3f90441caa.jpg\"},\"small\":{\"name\":\"small_salif keita.jpg\",\"hash\":\"small_salif_keita_3f90441caa\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":19.24,\"url\":\"/uploads/small_salif_keita_3f90441caa.jpg\"}}','salif_keita_3f90441caa','.jpg','image/jpeg',234.36,'/uploads/salif_keita_3f90441caa.jpg',NULL,'local',NULL,'/','2024-06-23 13:46:53.638000','2024-06-23 13:46:53.638000',1,1),
(56,'S keita.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_S keita.jpg\",\"hash\":\"thumbnail_S_keita_74ae2523ac\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":5.55,\"url\":\"/uploads/thumbnail_S_keita_74ae2523ac.jpg\"},\"medium\":{\"name\":\"medium_S keita.jpg\",\"hash\":\"medium_S_keita_74ae2523ac\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":45.87,\"url\":\"/uploads/medium_S_keita_74ae2523ac.jpg\"},\"small\":{\"name\":\"small_S keita.jpg\",\"hash\":\"small_S_keita_74ae2523ac\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":27.48,\"url\":\"/uploads/small_S_keita_74ae2523ac.jpg\"},\"large\":{\"name\":\"large_S keita.jpg\",\"hash\":\"large_S_keita_74ae2523ac\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":66.32,\"url\":\"/uploads/large_S_keita_74ae2523ac.jpg\"}}','S_keita_74ae2523ac','.jpg','image/jpeg',315.20,'/uploads/S_keita_74ae2523ac.jpg',NULL,'local',NULL,'/','2024-06-23 13:50:25.374000','2024-06-23 13:50:25.374000',1,1),
(57,'Davidson - DRILL ML(official music vidéo).mp3',NULL,NULL,NULL,NULL,NULL,'Davidson_DRILL_ML_official_music_video_08f9a7b578','.mp3','audio/mpeg',3666.48,'/uploads/Davidson_DRILL_ML_official_music_video_08f9a7b578.mp3',NULL,'local',NULL,'/','2024-06-25 16:21:26.560000','2024-06-25 16:21:26.560000',1,1),
(58,'drill.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_drill.jpg\",\"hash\":\"thumbnail_drill_43661f33e3\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":5.9,\"url\":\"/uploads/thumbnail_drill_43661f33e3.jpg\"},\"medium\":{\"name\":\"medium_drill.jpg\",\"hash\":\"medium_drill_43661f33e3\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":56.32,\"url\":\"/uploads/medium_drill_43661f33e3.jpg\"},\"small\":{\"name\":\"small_drill.jpg\",\"hash\":\"small_drill_43661f33e3\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":32.31,\"url\":\"/uploads/small_drill_43661f33e3.jpg\"},\"large\":{\"name\":\"large_drill.jpg\",\"hash\":\"large_drill_43661f33e3\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":85.05,\"url\":\"/uploads/large_drill_43661f33e3.jpg\"}}','drill_43661f33e3','.jpg','image/jpeg',109.23,'/uploads/drill_43661f33e3.jpg',NULL,'local',NULL,'/','2024-06-25 16:25:13.987000','2024-06-25 16:25:13.987000',1,1),
(59,'bako dagnon.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_bako dagnon.jpg\",\"hash\":\"thumbnail_bako_dagnon_f8baa01815\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":6.07,\"url\":\"/uploads/thumbnail_bako_dagnon_f8baa01815.jpg\"},\"small\":{\"name\":\"small_bako dagnon.jpg\",\"hash\":\"small_bako_dagnon_f8baa01815\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":40,\"url\":\"/uploads/small_bako_dagnon_f8baa01815.jpg\"},\"large\":{\"name\":\"large_bako dagnon.jpg\",\"hash\":\"large_bako_dagnon_f8baa01815\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":114.49,\"url\":\"/uploads/large_bako_dagnon_f8baa01815.jpg\"},\"medium\":{\"name\":\"medium_bako dagnon.jpg\",\"hash\":\"medium_bako_dagnon_f8baa01815\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":75.03,\"url\":\"/uploads/medium_bako_dagnon_f8baa01815.jpg\"}}','bako_dagnon_f8baa01815','.jpg','image/jpeg',140.79,'/uploads/bako_dagnon_f8baa01815.jpg',NULL,'local',NULL,'/','2024-06-25 16:30:45.284000','2024-06-25 16:30:45.284000',1,1),
(60,'titati.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_titati.jpg\",\"hash\":\"thumbnail_titati_68fb4afeb3\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":5.71,\"url\":\"/uploads/thumbnail_titati_68fb4afeb3.jpg\"},\"medium\":{\"name\":\"medium_titati.jpg\",\"hash\":\"medium_titati_68fb4afeb3\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":50.71,\"url\":\"/uploads/medium_titati_68fb4afeb3.jpg\"},\"small\":{\"name\":\"small_titati.jpg\",\"hash\":\"small_titati_68fb4afeb3\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":28.58,\"url\":\"/uploads/small_titati_68fb4afeb3.jpg\"},\"large\":{\"name\":\"large_titati.jpg\",\"hash\":\"large_titati_68fb4afeb3\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":76.03,\"url\":\"/uploads/large_titati_68fb4afeb3.jpg\"}}','titati_68fb4afeb3','.jpg','image/jpeg',92.12,'/uploads/titati_68fb4afeb3.jpg',NULL,'local',NULL,'/','2024-06-25 16:34:27.612000','2024-06-25 16:34:27.612000',1,1),
(61,'Bako Dagnon - Titati (audio).mp3',NULL,NULL,NULL,NULL,NULL,'Bako_Dagnon_Titati_audio_ae95df823d','.mp3','audio/mpeg',8473.58,'/uploads/Bako_Dagnon_Titati_audio_ae95df823d.mp3',NULL,'local',NULL,'/','2024-06-25 16:40:45.515000','2024-06-25 16:40:45.515000',1,1),
(62,'Mala.jpg',NULL,NULL,320,320,'{\"thumbnail\":{\"name\":\"thumbnail_Mala.jpg\",\"hash\":\"thumbnail_Mala_b682690d29\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":5.4,\"url\":\"/uploads/thumbnail_Mala_b682690d29.jpg\"}}','Mala_b682690d29','.jpg','image/jpeg',14.95,'/uploads/Mala_b682690d29.jpg',NULL,'local',NULL,'/','2024-06-26 12:18:40.847000','2024-06-26 12:18:40.847000',2,2),
(63,'nta.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_nta.jpg\",\"hash\":\"thumbnail_nta_c55232774a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":4.2,\"url\":\"/uploads/thumbnail_nta_c55232774a.jpg\"},\"medium\":{\"name\":\"medium_nta.jpg\",\"hash\":\"medium_nta_c55232774a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":44.5,\"url\":\"/uploads/medium_nta_c55232774a.jpg\"},\"small\":{\"name\":\"small_nta.jpg\",\"hash\":\"small_nta_c55232774a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":24.63,\"url\":\"/uploads/small_nta_c55232774a.jpg\"},\"large\":{\"name\":\"large_nta.jpg\",\"hash\":\"large_nta_c55232774a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":66.73,\"url\":\"/uploads/large_nta_c55232774a.jpg\"}}','nta_c55232774a','.jpg','image/jpeg',328.19,'/uploads/nta_c55232774a.jpg',NULL,'local',NULL,'/','2024-06-26 12:25:10.351000','2024-06-26 12:37:20.365000',2,2),
(64,'Malakey - NTA (Son Officiel).mp3',NULL,NULL,NULL,NULL,NULL,'Malakey_NTA_Son_Officiel_ef0b9437ca','.mp3','audio/mpeg',5546.35,'/uploads/Malakey_NTA_Son_Officiel_ef0b9437ca.mp3',NULL,'local',NULL,'/','2024-06-26 12:28:20.711000','2024-06-26 12:28:48.567000',2,2),
(65,'gnoud.jpeg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_gnoud.jpeg\",\"hash\":\"thumbnail_gnoud_ef2632f6bb\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":5.05,\"url\":\"/uploads/thumbnail_gnoud_ef2632f6bb.jpeg\"},\"large\":{\"name\":\"large_gnoud.jpeg\",\"hash\":\"large_gnoud_ef2632f6bb\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":64.93,\"url\":\"/uploads/large_gnoud_ef2632f6bb.jpeg\"},\"medium\":{\"name\":\"medium_gnoud.jpeg\",\"hash\":\"medium_gnoud_ef2632f6bb\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":42.62,\"url\":\"/uploads/medium_gnoud_ef2632f6bb.jpeg\"},\"small\":{\"name\":\"small_gnoud.jpeg\",\"hash\":\"small_gnoud_ef2632f6bb\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":24.38,\"url\":\"/uploads/small_gnoud_ef2632f6bb.jpeg\"}}','gnoud_ef2632f6bb','.jpeg','image/jpeg',137.45,'/uploads/gnoud_ef2632f6bb.jpeg',NULL,'local',NULL,'/','2024-06-26 12:45:59.269000','2024-06-27 10:20:33.526000',2,1),
(66,'Malakey - Gnoudsy (Clip Officiel).mp3',NULL,NULL,NULL,NULL,NULL,'Malakey_Gnoudsy_Clip_Officiel_283e25dd86','.mp3','audio/mpeg',3729.65,'/uploads/Malakey_Gnoudsy_Clip_Officiel_283e25dd86.mp3',NULL,'local',NULL,'/','2024-06-26 12:47:04.011000','2024-06-26 12:47:04.011000',2,2),
(67,'forever.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_forever.jpg\",\"hash\":\"thumbnail_forever_e946be6e87\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":4.7,\"url\":\"/uploads/thumbnail_forever_e946be6e87.jpg\"},\"medium\":{\"name\":\"medium_forever.jpg\",\"hash\":\"medium_forever_e946be6e87\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":44.89,\"url\":\"/uploads/medium_forever_e946be6e87.jpg\"},\"small\":{\"name\":\"small_forever.jpg\",\"hash\":\"small_forever_e946be6e87\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":25.08,\"url\":\"/uploads/small_forever_e946be6e87.jpg\"},\"large\":{\"name\":\"large_forever.jpg\",\"hash\":\"large_forever_e946be6e87\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":67.99,\"url\":\"/uploads/large_forever_e946be6e87.jpg\"}}','forever_e946be6e87','.jpg','image/jpeg',329.25,'/uploads/forever_e946be6e87.jpg',NULL,'local',NULL,'/','2024-06-26 12:59:20.319000','2024-06-26 12:59:54.062000',2,2),
(68,'Malakey - Forever (Clip Officiel).mp3',NULL,NULL,NULL,NULL,NULL,'Malakey_Forever_Clip_Officiel_e648c10054','.mp3','audio/mpeg',5030.25,'/uploads/Malakey_Forever_Clip_Officiel_e648c10054.mp3',NULL,'local',NULL,'/1','2024-06-26 13:02:20.607000','2024-06-26 13:02:20.607000',2,2),
(69,'mor.jpeg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_mor.jpeg\",\"hash\":\"thumbnail_mor_1447d84716\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":6.08,\"url\":\"/uploads/thumbnail_mor_1447d84716.jpeg\"},\"medium\":{\"name\":\"medium_mor.jpeg\",\"hash\":\"medium_mor_1447d84716\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":49.72,\"url\":\"/uploads/medium_mor_1447d84716.jpeg\"},\"small\":{\"name\":\"small_mor.jpeg\",\"hash\":\"small_mor_1447d84716\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":29.23,\"url\":\"/uploads/small_mor_1447d84716.jpeg\"},\"large\":{\"name\":\"large_mor.jpeg\",\"hash\":\"large_mor_1447d84716\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":73.09,\"url\":\"/uploads/large_mor_1447d84716.jpeg\"}}','mor_1447d84716','.jpeg','image/jpeg',349.16,'/uploads/mor_1447d84716.jpeg',NULL,'local',NULL,'/','2024-06-26 13:15:48.352000','2024-06-26 13:15:48.352000',2,2),
(70,'Malakey - Morphine (Clip Officiel).mp3',NULL,NULL,NULL,NULL,NULL,'Malakey_Morphine_Clip_Officiel_e225a4227d','.mp3','audio/mpeg',5674.22,'/uploads/Malakey_Morphine_Clip_Officiel_e225a4227d.mp3',NULL,'local',NULL,'/','2024-06-26 13:16:44.280000','2024-06-26 13:16:44.280000',2,2),
(71,'bifenix.jpeg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_bifenix.jpeg\",\"hash\":\"thumbnail_bifenix_fe12f3e499\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":5.47,\"url\":\"/uploads/thumbnail_bifenix_fe12f3e499.jpeg\"},\"medium\":{\"name\":\"medium_bifenix.jpeg\",\"hash\":\"medium_bifenix_fe12f3e499\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":45.19,\"url\":\"/uploads/medium_bifenix_fe12f3e499.jpeg\"},\"small\":{\"name\":\"small_bifenix.jpeg\",\"hash\":\"small_bifenix_fe12f3e499\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":26.92,\"url\":\"/uploads/small_bifenix_fe12f3e499.jpeg\"},\"large\":{\"name\":\"large_bifenix.jpeg\",\"hash\":\"large_bifenix_fe12f3e499\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":65.61,\"url\":\"/uploads/large_bifenix_fe12f3e499.jpeg\"}}','bifenix_fe12f3e499','.jpeg','image/jpeg',317.85,'/uploads/bifenix_fe12f3e499.jpeg',NULL,'local',NULL,'/','2024-06-26 13:29:25.473000','2024-06-26 13:29:25.473000',2,2),
(72,'wari.jpg',NULL,NULL,1280,720,'{\"thumbnail\":{\"name\":\"thumbnail_wari.jpg\",\"hash\":\"thumbnail_wari_0aa8561a5e\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":245,\"height\":138,\"size\":6.41,\"url\":\"/uploads/thumbnail_wari_0aa8561a5e.jpg\"},\"large\":{\"name\":\"large_wari.jpg\",\"hash\":\"large_wari_0aa8561a5e\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":563,\"size\":61.46,\"url\":\"/uploads/large_wari_0aa8561a5e.jpg\"},\"medium\":{\"name\":\"medium_wari.jpg\",\"hash\":\"medium_wari_0aa8561a5e\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":422,\"size\":38.19,\"url\":\"/uploads/medium_wari_0aa8561a5e.jpg\"},\"small\":{\"name\":\"small_wari.jpg\",\"hash\":\"small_wari_0aa8561a5e\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":281,\"size\":19.98,\"url\":\"/uploads/small_wari_0aa8561a5e.jpg\"}}','wari_0aa8561a5e','.jpg','image/jpeg',74.01,'/uploads/wari_0aa8561a5e.jpg',NULL,'local',NULL,'/','2024-06-26 13:37:09.746000','2024-06-26 13:37:09.746000',2,2),
(73,'wari.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_wari.jpg\",\"hash\":\"thumbnail_wari_a7fd4bf030\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":5.19,\"url\":\"/uploads/thumbnail_wari_a7fd4bf030.jpg\"},\"medium\":{\"name\":\"medium_wari.jpg\",\"hash\":\"medium_wari_a7fd4bf030\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":59.29,\"url\":\"/uploads/medium_wari_a7fd4bf030.jpg\"},\"small\":{\"name\":\"small_wari.jpg\",\"hash\":\"small_wari_a7fd4bf030\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":31.91,\"url\":\"/uploads/small_wari_a7fd4bf030.jpg\"},\"large\":{\"name\":\"large_wari.jpg\",\"hash\":\"large_wari_a7fd4bf030\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":90.41,\"url\":\"/uploads/large_wari_a7fd4bf030.jpg\"}}','wari_a7fd4bf030','.jpg','image/jpeg',178.17,'/uploads/wari_a7fd4bf030.jpg',NULL,'local',NULL,'/','2024-06-26 13:37:43.818000','2024-06-27 10:18:57.502000',2,1),
(74,'BIFENIX - WARI feat LIL ZED ( Clip Officiel ) 2024.mp3',NULL,NULL,NULL,NULL,NULL,'BIFENIX_WARI_feat_LIL_ZED_Clip_Officiel_2024_4ca4ce2ca7','.mp3','audio/mpeg',5240.72,'/uploads/BIFENIX_WARI_feat_LIL_ZED_Clip_Officiel_2024_4ca4ce2ca7.mp3',NULL,'local',NULL,'/','2024-06-26 13:39:37.405000','2024-06-26 13:39:37.405000',2,2),
(75,'walifin.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_walifin.jpg\",\"hash\":\"thumbnail_walifin_77028334bc\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":5.97,\"url\":\"/uploads/thumbnail_walifin_77028334bc.jpg\"},\"medium\":{\"name\":\"medium_walifin.jpg\",\"hash\":\"medium_walifin_77028334bc\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":55.61,\"url\":\"/uploads/medium_walifin_77028334bc.jpg\"},\"small\":{\"name\":\"small_walifin.jpg\",\"hash\":\"small_walifin_77028334bc\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":31.3,\"url\":\"/uploads/small_walifin_77028334bc.jpg\"},\"large\":{\"name\":\"large_walifin.jpg\",\"hash\":\"large_walifin_77028334bc\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":84.36,\"url\":\"/uploads/large_walifin_77028334bc.jpg\"}}','walifin_77028334bc','.jpg','image/jpeg',174.20,'/uploads/walifin_77028334bc.jpg',NULL,'local',NULL,'/','2024-06-26 13:44:09.939000','2024-06-27 10:17:29.873000',2,1),
(76,'BIFENIX - WALIFIN ( Clip Officiel ) 2024.mp3',NULL,NULL,NULL,NULL,NULL,'BIFENIX_WALIFIN_Clip_Officiel_2024_9b8d9e3a07','.mp3','audio/mpeg',4917.84,'/uploads/BIFENIX_WALIFIN_Clip_Officiel_2024_9b8d9e3a07.mp3',NULL,'local',NULL,'/','2024-06-26 13:44:45.680000','2024-06-26 13:44:45.680000',2,2),
(77,'e.png',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_e.png\",\"hash\":\"thumbnail_e_46dce4de37\",\"ext\":\".png\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":6.38,\"url\":\"/uploads/thumbnail_e_46dce4de37.png\"},\"medium\":{\"name\":\"medium_e.png\",\"hash\":\"medium_e_46dce4de37\",\"ext\":\".png\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":49.01,\"url\":\"/uploads/medium_e_46dce4de37.png\"},\"small\":{\"name\":\"small_e.png\",\"hash\":\"small_e_46dce4de37\",\"ext\":\".png\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":29.15,\"url\":\"/uploads/small_e_46dce4de37.png\"},\"large\":{\"name\":\"large_e.png\",\"hash\":\"large_e_46dce4de37\",\"ext\":\".png\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":72.26,\"url\":\"/uploads/large_e_46dce4de37.png\"}}','e_46dce4de37','.png','image/jpeg',449.95,'/uploads/e_46dce4de37.png',NULL,'local',NULL,'/','2024-06-26 13:55:40.288000','2024-06-27 10:14:46.509000',2,1),
(78,'BIFENIX - NE DJANAI MOGO.mp3',NULL,NULL,NULL,NULL,NULL,'BIFENIX_NE_DJANAI_MOGO_4745ed25d9','.mp3','audio/mpeg',6300.87,'/uploads/BIFENIX_NE_DJANAI_MOGO_4745ed25d9.mp3',NULL,'local',NULL,'/','2024-06-26 13:56:46.807000','2024-06-26 13:56:46.807000',2,2),
(79,'sena watti.jpg',NULL,NULL,3000,3000,'{\"thumbnail\":{\"name\":\"thumbnail_sena watti.jpg\",\"hash\":\"thumbnail_sena_watti_9c63629975\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":7.27,\"url\":\"/uploads/thumbnail_sena_watti_9c63629975.jpg\"},\"small\":{\"name\":\"small_sena watti.jpg\",\"hash\":\"small_sena_watti_9c63629975\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":45.6,\"url\":\"/uploads/small_sena_watti_9c63629975.jpg\"},\"large\":{\"name\":\"large_sena watti.jpg\",\"hash\":\"large_sena_watti_9c63629975\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":130.9,\"url\":\"/uploads/large_sena_watti_9c63629975.jpg\"},\"medium\":{\"name\":\"medium_sena watti.jpg\",\"hash\":\"medium_sena_watti_9c63629975\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":85.44,\"url\":\"/uploads/medium_sena_watti_9c63629975.jpg\"}}','sena_watti_9c63629975','.jpg','image/jpeg',649.75,'/uploads/sena_watti_9c63629975.jpg',NULL,'local',NULL,'/','2024-07-05 14:09:12.689000','2024-07-05 14:09:12.689000',2,2),
(80,'BIFENIX - Sena Watibb Banks ( Clip Officiel ) 2023.mp3',NULL,NULL,NULL,NULL,NULL,'BIFENIX_Sena_Watibb_Banks_Clip_Officiel_2023_0391634708','.mp3','audio/mpeg',3343.60,'/uploads/BIFENIX_Sena_Watibb_Banks_Clip_Officiel_2023_0391634708.mp3',NULL,'local',NULL,'/','2024-07-05 14:10:06.385000','2024-07-05 14:10:06.385000',2,2),
(81,'NiggaFama.jpg',NULL,NULL,1080,1080,'{\"thumbnail\":{\"name\":\"thumbnail_NiggaFama.jpg\",\"hash\":\"thumbnail_Nigga_Fama_68305fdd8a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":8.18,\"url\":\"/uploads/thumbnail_Nigga_Fama_68305fdd8a.jpg\"},\"small\":{\"name\":\"small_NiggaFama.jpg\",\"hash\":\"small_Nigga_Fama_68305fdd8a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":57.27,\"url\":\"/uploads/small_Nigga_Fama_68305fdd8a.jpg\"},\"medium\":{\"name\":\"medium_NiggaFama.jpg\",\"hash\":\"medium_Nigga_Fama_68305fdd8a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":107.31,\"url\":\"/uploads/medium_Nigga_Fama_68305fdd8a.jpg\"},\"large\":{\"name\":\"large_NiggaFama.jpg\",\"hash\":\"large_Nigga_Fama_68305fdd8a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":165.66,\"url\":\"/uploads/large_Nigga_Fama_68305fdd8a.jpg\"}}','Nigga_Fama_68305fdd8a','.jpg','image/jpeg',183.94,'/uploads/Nigga_Fama_68305fdd8a.jpg',NULL,'local',NULL,'/','2024-09-05 16:18:18.733000','2024-09-05 16:18:18.733000',1,1),
(83,'1900x1900-000000-80-0-0.jpg',NULL,NULL,1200,1200,'{\"thumbnail\":{\"name\":\"thumbnail_1900x1900-000000-80-0-0.jpg\",\"hash\":\"thumbnail_1900x1900_000000_80_0_0_28a3e6ddbd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":156,\"height\":156,\"size\":9.93,\"url\":\"/uploads/thumbnail_1900x1900_000000_80_0_0_28a3e6ddbd.jpg\"},\"small\":{\"name\":\"small_1900x1900-000000-80-0-0.jpg\",\"hash\":\"small_1900x1900_000000_80_0_0_28a3e6ddbd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":500,\"size\":64.88,\"url\":\"/uploads/small_1900x1900_000000_80_0_0_28a3e6ddbd.jpg\"},\"medium\":{\"name\":\"medium_1900x1900-000000-80-0-0.jpg\",\"hash\":\"medium_1900x1900_000000_80_0_0_28a3e6ddbd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":750,\"size\":114.31,\"url\":\"/uploads/medium_1900x1900_000000_80_0_0_28a3e6ddbd.jpg\"},\"large\":{\"name\":\"large_1900x1900-000000-80-0-0.jpg\",\"hash\":\"large_1900x1900_000000_80_0_0_28a3e6ddbd\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":1000,\"size\":171.43,\"url\":\"/uploads/large_1900x1900_000000_80_0_0_28a3e6ddbd.jpg\"}}','1900x1900_000000_80_0_0_28a3e6ddbd','.jpg','image/jpeg',213.94,'/uploads/1900x1900_000000_80_0_0_28a3e6ddbd.jpg',NULL,'local',NULL,'/','2024-09-05 16:25:54.861000','2024-09-05 16:25:54.861000',1,1),
(84,'NF Mama- Intro O.C.B.mp3',NULL,NULL,NULL,NULL,NULL,'NF_Mama_Intro_O_C_B_fb49da0f27','.mp3','audio/mpeg',2919.79,'/uploads/NF_Mama_Intro_O_C_B_fb49da0f27.mp3',NULL,'local',NULL,'/','2024-09-05 16:27:54.124000','2024-09-05 16:27:54.124000',1,1),
(85,'NF Mama- Goshi O.C.B.mp3',NULL,NULL,NULL,NULL,NULL,'NF_Mama_Goshi_O_C_B_d4ce42e8f2','.mp3','audio/mpeg',6209.34,'/uploads/NF_Mama_Goshi_O_C_B_d4ce42e8f2.mp3',NULL,'local',NULL,'/','2024-09-05 16:33:53.423000','2024-09-05 16:33:53.423000',1,1),
(86,'NF Mama- Thugga O.C.B.mp3',NULL,NULL,NULL,NULL,NULL,'NF_Mama_Thugga_O_C_B_3d5d5b3e1b','.mp3','audio/mpeg',5307.80,'/uploads/NF_Mama_Thugga_O_C_B_3d5d5b3e1b.mp3',NULL,'local',NULL,'/','2024-09-05 16:41:29.107000','2024-09-05 16:41:29.107000',1,1),
(87,'NF Mama- Bobby Shmurda O.C.B.mp3',NULL,NULL,NULL,NULL,NULL,'NF_Mama_Bobby_Shmurda_O_C_B_a4c534744f','.mp3','audio/mpeg',6164.97,'/uploads/NF_Mama_Bobby_Shmurda_O_C_B_a4c534744f.mp3',NULL,'local',NULL,'/','2024-09-05 16:47:16.344000','2024-09-05 16:47:16.344000',1,1),
(88,'NF Mama- Saladi O.C.B.mp3',NULL,NULL,NULL,NULL,NULL,'NF_Mama_Saladi_O_C_B_5159c04db0','.mp3','audio/mpeg',7052.01,'/uploads/NF_Mama_Saladi_O_C_B_5159c04db0.mp3',NULL,'local',NULL,'/','2024-09-05 17:45:26.148000','2024-09-05 17:47:12.145000',1,1);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_folder_links`
--

DROP TABLE IF EXISTS `files_folder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files_folder_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned DEFAULT NULL,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `file_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_folder_links_unique` (`file_id`,`folder_id`),
  KEY `files_folder_links_fk` (`file_id`),
  KEY `files_folder_links_inv_fk` (`folder_id`),
  KEY `files_folder_links_order_inv_fk` (`file_order`),
  CONSTRAINT `files_folder_links_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_folder_links_inv_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_folder_links`
--

LOCK TABLES `files_folder_links` WRITE;
/*!40000 ALTER TABLE `files_folder_links` DISABLE KEYS */;
INSERT INTO `files_folder_links` VALUES
(1,15,1,1),
(2,16,1,2),
(3,17,1,3),
(4,18,1,4),
(5,19,1,5),
(7,25,1,6),
(8,26,1,7),
(9,29,1,8),
(11,31,1,9),
(12,68,1,10);
/*!40000 ALTER TABLE `files_folder_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_related_morphs`
--

DROP TABLE IF EXISTS `files_related_morphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files_related_morphs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned DEFAULT NULL,
  `related_id` int(10) unsigned DEFAULT NULL,
  `related_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_related_morphs_fk` (`file_id`),
  KEY `files_related_morphs_order_index` (`order`),
  KEY `files_related_morphs_id_column_index` (`related_id`),
  CONSTRAINT `files_related_morphs_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_related_morphs`
--

LOCK TABLES `files_related_morphs` WRITE;
/*!40000 ALTER TABLE `files_related_morphs` DISABLE KEYS */;
INSERT INTO `files_related_morphs` VALUES
(12,9,2,'api::artist.artist','image',1),
(14,14,4,'api::artist.artist','image',1),
(15,2,1,'api::song.song','cover',1),
(16,3,1,'api::song.song','audio',1),
(17,13,2,'api::song.song','cover',1),
(18,15,2,'api::song.song','audio',1),
(19,20,3,'api::song.song','cover',1),
(20,17,3,'api::song.song','audio',1),
(21,13,3,'api::artist.artist','image',1),
(22,5,1,'api::artist.artist','image',1),
(23,6,1,'api::artist.artist','image',2),
(24,7,1,'api::artist.artist','image',3),
(25,21,5,'api::artist.artist','image',1),
(26,22,5,'api::artist.artist','image',2),
(27,23,5,'api::artist.artist','image',3),
(28,24,1,'api::album.album','image',1),
(29,24,4,'api::song.song','cover',1),
(30,25,4,'api::song.song','audio',1),
(31,24,5,'api::song.song','cover',1),
(32,26,5,'api::song.song','audio',1),
(33,27,6,'api::artist.artist','image',1),
(34,28,2,'api::album.album','image',1),
(35,28,6,'api::song.song','cover',1),
(36,29,6,'api::song.song','audio',1),
(37,30,7,'api::song.song','cover',1),
(38,16,7,'api::song.song','audio',1),
(42,32,7,'api::artist.artist','image',1),
(43,32,8,'api::artist.artist','image',1),
(48,32,9,'api::song.song','cover',1),
(49,33,9,'api::song.song','audio',1),
(50,34,9,'api::artist.artist','image',1),
(51,34,10,'api::song.song','cover',1),
(52,35,10,'api::song.song','audio',1),
(53,36,10,'api::artist.artist','image',1),
(54,36,11,'api::song.song','cover',1),
(55,37,11,'api::song.song','audio',1),
(56,28,8,'api::song.song','cover',1),
(57,38,8,'api::song.song','audio',1),
(58,39,11,'api::artist.artist','image',1),
(59,40,12,'api::song.song','cover',1),
(60,41,12,'api::song.song','audio',1),
(61,42,12,'api::artist.artist','image',1),
(69,42,13,'api::song.song','cover',1),
(70,44,13,'api::song.song','audio',1),
(71,42,14,'api::song.song','cover',1),
(72,45,14,'api::song.song','audio',1),
(73,46,13,'api::artist.artist','image',1),
(74,47,15,'api::song.song','cover',1),
(75,48,15,'api::song.song','audio',1),
(84,55,14,'api::artist.artist','image',1),
(85,56,16,'api::song.song','cover',1),
(86,51,16,'api::song.song','audio',1),
(87,53,17,'api::song.song','cover',1),
(88,54,17,'api::song.song','audio',1),
(90,58,18,'api::song.song','cover',1),
(91,57,18,'api::song.song','audio',1),
(92,59,16,'api::artist.artist','image',1),
(93,60,19,'api::song.song','cover',1),
(94,61,19,'api::song.song','audio',1),
(95,62,17,'api::artist.artist','image',1),
(99,63,20,'api::song.song','cover',1),
(100,64,20,'api::song.song','audio',1),
(104,67,22,'api::song.song','cover',1),
(105,68,22,'api::song.song','audio',1),
(108,69,23,'api::song.song','cover',1),
(109,70,23,'api::song.song','audio',1),
(110,71,18,'api::artist.artist','image',1),
(119,52,15,'api::artist.artist','image',1),
(120,77,26,'api::song.song','cover',1),
(121,78,26,'api::song.song','audio',1),
(122,75,25,'api::song.song','cover',1),
(123,76,25,'api::song.song','audio',1),
(124,73,24,'api::song.song','cover',1),
(125,74,24,'api::song.song','audio',1),
(126,65,21,'api::song.song','cover',1),
(127,66,21,'api::song.song','audio',1),
(130,79,27,'api::song.song','cover',1),
(131,80,27,'api::song.song','audio',1),
(133,83,28,'api::song.song','cover',1),
(134,84,28,'api::song.song','audio',1),
(135,83,3,'api::album.album','image',1),
(136,83,29,'api::song.song','cover',1),
(137,85,29,'api::song.song','audio',1),
(138,83,30,'api::song.song','cover',1),
(139,86,30,'api::song.song','audio',1),
(140,83,31,'api::song.song','cover',1),
(141,87,31,'api::song.song','audio',1),
(142,83,32,'api::song.song','cover',1),
(143,88,32,'api::song.song','audio',1),
(144,81,19,'api::artist.artist','image',1);
/*!40000 ALTER TABLE `files_related_morphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genres_created_by_id_fk` (`created_by_id`),
  KEY `genres_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `genres_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `genres_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES
(1,'Rap Mandingue','2024-01-12 09:26:04.238000','2024-01-12 09:26:09.021000','2024-01-12 09:26:05.499000',1,1),
(2,'rap','2024-01-12 09:26:17.897000','2024-01-12 09:26:19.530000','2024-01-12 09:26:19.526000',1,1),
(3,'Mandingue','2024-01-12 09:26:35.484000','2024-01-12 09:26:36.945000','2024-01-12 09:26:36.937000',1,1),
(4,'pop','2024-01-12 09:26:42.933000','2024-01-12 09:26:44.211000','2024-01-12 09:26:44.205000',1,1),
(5,'Pop Mandingue','2024-01-12 09:26:52.734000','2024-01-12 09:26:53.942000','2024-01-12 09:26:53.937000',1,1),
(6,'Afro','2024-04-12 10:16:55.978000','2024-04-12 10:16:57.498000','2024-04-12 10:16:57.494000',1,1);
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres_artist_links`
--

DROP TABLE IF EXISTS `genres_artist_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres_artist_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `genre_id` int(10) unsigned DEFAULT NULL,
  `artist_id` int(10) unsigned DEFAULT NULL,
  `genre_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `genres_artist_links_unique` (`genre_id`,`artist_id`),
  KEY `genres_artist_links_fk` (`genre_id`),
  KEY `genres_artist_links_inv_fk` (`artist_id`),
  KEY `genres_artist_links_order_inv_fk` (`genre_order`),
  CONSTRAINT `genres_artist_links_fk` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE,
  CONSTRAINT `genres_artist_links_inv_fk` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres_artist_links`
--

LOCK TABLES `genres_artist_links` WRITE;
/*!40000 ALTER TABLE `genres_artist_links` DISABLE KEYS */;
INSERT INTO `genres_artist_links` VALUES
(8,5,5,1),
(21,6,11,0),
(22,4,12,0),
(26,3,14,1),
(27,2,19,1),
(28,1,19,0);
/*!40000 ALTER TABLE `genres_artist_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i18n_locale`
--

DROP TABLE IF EXISTS `i18n_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i18n_locale` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i18n_locale_created_by_id_fk` (`created_by_id`),
  KEY `i18n_locale_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `i18n_locale_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `i18n_locale_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i18n_locale`
--

LOCK TABLES `i18n_locale` WRITE;
/*!40000 ALTER TABLE `i18n_locale` DISABLE KEYS */;
INSERT INTO `i18n_locale` VALUES
(1,'English (en)','en','2024-01-11 16:14:01.266000','2024-01-11 16:14:01.266000',NULL,NULL);
/*!40000 ALTER TABLE `i18n_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_created_by_id_fk` (`created_by_id`),
  KEY `likes_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `likes_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `likes_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES
(40,'2024-03-12 15:06:11.805000','2024-03-12 15:06:11.805000','2024-03-12 15:06:11.802000',NULL,NULL),
(41,'2024-03-12 15:06:15.292000','2024-03-12 15:06:15.292000','2024-03-12 15:06:15.281000',NULL,NULL),
(43,'2024-03-12 15:06:21.824000','2024-03-12 15:06:21.824000','2024-03-12 15:06:21.774000',NULL,NULL),
(45,'2024-03-12 15:06:31.081000','2024-03-12 15:06:31.081000','2024-03-12 15:06:31.076000',NULL,NULL),
(47,'2024-04-30 13:07:48.237000','2024-04-30 13:07:48.237000','2024-04-30 13:07:48.221000',NULL,NULL),
(48,'2024-06-19 11:14:17.827000','2024-06-19 11:14:17.827000','2024-06-19 11:14:17.814000',NULL,NULL),
(49,'2024-06-19 11:14:24.492000','2024-06-19 11:14:24.492000','2024-06-19 11:14:24.482000',NULL,NULL),
(50,'2024-06-19 11:14:31.609000','2024-06-19 11:14:31.609000','2024-06-19 11:14:31.599000',NULL,NULL),
(51,'2024-06-19 11:14:37.556000','2024-06-19 11:14:37.556000','2024-06-19 11:14:37.548000',NULL,NULL),
(52,'2024-06-19 11:14:51.769000','2024-06-19 11:14:51.769000','2024-06-19 11:14:51.761000',NULL,NULL),
(53,'2024-06-19 11:15:03.112000','2024-06-19 11:15:03.112000','2024-06-19 11:15:03.102000',NULL,NULL),
(54,'2024-06-20 11:46:55.090000','2024-06-20 11:46:55.090000','2024-06-20 11:46:55.071000',NULL,NULL),
(55,'2024-06-20 11:46:57.149000','2024-06-20 11:46:57.149000','2024-06-20 11:46:57.139000',NULL,NULL),
(56,'2024-06-20 11:47:03.585000','2024-06-20 11:47:03.585000','2024-06-20 11:47:03.574000',NULL,NULL),
(57,'2024-06-20 14:56:10.872000','2024-06-20 14:56:10.872000','2024-06-20 14:56:10.825000',NULL,NULL),
(58,'2024-06-20 15:01:44.471000','2024-06-20 15:01:44.471000','2024-06-20 15:01:44.462000',NULL,NULL),
(59,'2024-06-20 15:01:47.830000','2024-06-20 15:01:47.830000','2024-06-20 15:01:47.822000',NULL,NULL),
(60,'2024-06-20 15:01:50.294000','2024-06-20 15:01:50.294000','2024-06-20 15:01:50.288000',NULL,NULL),
(61,'2024-06-26 11:48:20.055000','2024-06-26 11:48:20.055000','2024-06-26 11:48:20.050000',NULL,NULL),
(62,'2024-06-26 11:48:20.550000','2024-06-26 11:48:20.550000','2024-06-26 11:48:20.540000',NULL,NULL),
(63,'2024-07-10 12:13:53.055000','2024-07-10 12:13:53.055000','2024-07-10 12:13:53.046000',NULL,NULL),
(64,'2024-08-03 00:08:50.722000','2024-08-03 00:08:50.722000','2024-08-03 00:08:50.706000',NULL,NULL),
(65,'2024-08-03 00:16:26.288000','2024-08-03 00:16:26.288000','2024-08-03 00:16:26.264000',NULL,NULL),
(66,'2024-08-07 14:52:12.447000','2024-08-07 14:52:12.447000','2024-08-07 14:52:12.435000',NULL,NULL),
(67,'2024-08-07 14:53:27.859000','2024-08-07 14:53:27.859000','2024-08-07 14:53:27.840000',NULL,NULL);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_song_links`
--

DROP TABLE IF EXISTS `likes_song_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes_song_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `like_id` int(10) unsigned DEFAULT NULL,
  `song_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `likes_song_links_unique` (`like_id`,`song_id`),
  KEY `likes_song_links_fk` (`like_id`),
  KEY `likes_song_links_inv_fk` (`song_id`),
  CONSTRAINT `likes_song_links_fk` FOREIGN KEY (`like_id`) REFERENCES `likes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_song_links_inv_fk` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_song_links`
--

LOCK TABLES `likes_song_links` WRITE;
/*!40000 ALTER TABLE `likes_song_links` DISABLE KEYS */;
INSERT INTO `likes_song_links` VALUES
(40,40,4),
(41,41,5),
(43,43,6),
(45,45,7),
(47,47,10),
(48,48,16),
(49,49,17),
(50,50,17),
(51,51,1),
(52,52,17),
(53,53,16),
(54,54,16),
(55,55,17),
(56,56,12),
(57,57,14),
(58,58,14),
(59,59,14),
(60,60,14),
(61,61,18),
(62,62,18),
(63,63,24),
(64,64,19),
(65,65,27),
(66,66,26),
(67,67,24);
/*!40000 ALTER TABLE `likes_song_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_user_links`
--

DROP TABLE IF EXISTS `likes_user_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes_user_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `like_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `likes_user_links_unique` (`like_id`,`user_id`),
  KEY `likes_user_links_fk` (`like_id`),
  KEY `likes_user_links_inv_fk` (`user_id`),
  CONSTRAINT `likes_user_links_fk` FOREIGN KEY (`like_id`) REFERENCES `likes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_user_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_user_links`
--

LOCK TABLES `likes_user_links` WRITE;
/*!40000 ALTER TABLE `likes_user_links` DISABLE KEYS */;
INSERT INTO `likes_user_links` VALUES
(37,40,1),
(38,41,1),
(40,43,1),
(42,45,1),
(44,47,1),
(45,48,3),
(46,49,3),
(47,50,3),
(48,51,3),
(49,52,3),
(50,53,3),
(51,54,1),
(52,55,1),
(53,56,1),
(54,57,3),
(55,58,3),
(56,59,3),
(57,60,3),
(58,61,5),
(59,62,5),
(60,63,3),
(61,64,3),
(62,65,3),
(63,66,1),
(64,67,1);
/*!40000 ALTER TABLE `likes_user_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `on_demand_sales`
--

DROP TABLE IF EXISTS `on_demand_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `on_demand_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `purchase_date` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `on_demand_sales_created_by_id_fk` (`created_by_id`),
  KEY `on_demand_sales_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `on_demand_sales_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `on_demand_sales_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `on_demand_sales`
--

LOCK TABLES `on_demand_sales` WRITE;
/*!40000 ALTER TABLE `on_demand_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `on_demand_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `on_demand_sales_user_links`
--

DROP TABLE IF EXISTS `on_demand_sales_user_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `on_demand_sales_user_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `on_demand_sale_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `on_demand_sales_user_links_unique` (`on_demand_sale_id`,`user_id`),
  KEY `on_demand_sales_user_links_fk` (`on_demand_sale_id`),
  KEY `on_demand_sales_user_links_inv_fk` (`user_id`),
  CONSTRAINT `on_demand_sales_user_links_fk` FOREIGN KEY (`on_demand_sale_id`) REFERENCES `on_demand_sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `on_demand_sales_user_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `on_demand_sales_user_links`
--

LOCK TABLES `on_demand_sales_user_links` WRITE;
/*!40000 ALTER TABLE `on_demand_sales_user_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `on_demand_sales_user_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_created_by_id_fk` (`created_by_id`),
  KEY `payments_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `payments_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `payments_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_user_links`
--

DROP TABLE IF EXISTS `payments_user_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments_user_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_user_links_unique` (`payment_id`,`user_id`),
  KEY `payments_user_links_fk` (`payment_id`),
  KEY `payments_user_links_inv_fk` (`user_id`),
  CONSTRAINT `payments_user_links_fk` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_user_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_user_links`
--

LOCK TABLES `payments_user_links` WRITE;
/*!40000 ALTER TABLE `payments_user_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_user_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_songs`
--

DROP TABLE IF EXISTS `playlist_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_songs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `playlist_songs_created_by_id_fk` (`created_by_id`),
  KEY `playlist_songs_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `playlist_songs_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `playlist_songs_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_songs`
--

LOCK TABLES `playlist_songs` WRITE;
/*!40000 ALTER TABLE `playlist_songs` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_songs_playlist_links`
--

DROP TABLE IF EXISTS `playlist_songs_playlist_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_songs_playlist_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playlist_song_id` int(10) unsigned DEFAULT NULL,
  `playlist_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `playlist_songs_playlist_links_unique` (`playlist_song_id`,`playlist_id`),
  KEY `playlist_songs_playlist_links_fk` (`playlist_song_id`),
  KEY `playlist_songs_playlist_links_inv_fk` (`playlist_id`),
  CONSTRAINT `playlist_songs_playlist_links_fk` FOREIGN KEY (`playlist_song_id`) REFERENCES `playlist_songs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `playlist_songs_playlist_links_inv_fk` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_songs_playlist_links`
--

LOCK TABLES `playlist_songs_playlist_links` WRITE;
/*!40000 ALTER TABLE `playlist_songs_playlist_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_songs_playlist_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_songs_song_links`
--

DROP TABLE IF EXISTS `playlist_songs_song_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_songs_song_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playlist_song_id` int(10) unsigned DEFAULT NULL,
  `song_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `playlist_songs_song_links_unique` (`playlist_song_id`,`song_id`),
  KEY `playlist_songs_song_links_fk` (`playlist_song_id`),
  KEY `playlist_songs_song_links_inv_fk` (`song_id`),
  CONSTRAINT `playlist_songs_song_links_fk` FOREIGN KEY (`playlist_song_id`) REFERENCES `playlist_songs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `playlist_songs_song_links_inv_fk` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_songs_song_links`
--

LOCK TABLES `playlist_songs_song_links` WRITE;
/*!40000 ALTER TABLE `playlist_songs_song_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_songs_song_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `playlists_created_by_id_fk` (`created_by_id`),
  KEY `playlists_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `playlists_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `playlists_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES
(1,'aaaa','2024-04-07 21:59:55.943000','2024-04-07 21:59:55.943000','2024-04-07 21:59:55.932000',NULL,NULL),
(2,'My playlist','2024-04-07 22:01:29.463000','2024-04-07 22:01:29.463000','2024-04-07 22:01:29.460000',NULL,NULL),
(3,'premier','2024-04-07 22:05:20.353000','2024-04-07 22:05:20.353000','2024-04-07 22:05:20.348000',NULL,NULL);
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists_user_links`
--

DROP TABLE IF EXISTS `playlists_user_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlists_user_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playlist_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `playlists_user_links_unique` (`playlist_id`,`user_id`),
  KEY `playlists_user_links_fk` (`playlist_id`),
  KEY `playlists_user_links_inv_fk` (`user_id`),
  CONSTRAINT `playlists_user_links_fk` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `playlists_user_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists_user_links`
--

LOCK TABLES `playlists_user_links` WRITE;
/*!40000 ALTER TABLE `playlists_user_links` DISABLE KEYS */;
INSERT INTO `playlists_user_links` VALUES
(1,3,1);
/*!40000 ALTER TABLE `playlists_user_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revenus`
--

DROP TABLE IF EXISTS `revenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revenus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `montant` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revenus_created_by_id_fk` (`created_by_id`),
  KEY `revenus_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `revenus_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `revenus_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revenus`
--

LOCK TABLES `revenus` WRITE;
/*!40000 ALTER TABLE `revenus` DISABLE KEYS */;
/*!40000 ALTER TABLE `revenus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revenus_artist_links`
--

DROP TABLE IF EXISTS `revenus_artist_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revenus_artist_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `revenu_id` int(10) unsigned DEFAULT NULL,
  `artist_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `revenus_artist_links_unique` (`revenu_id`,`artist_id`),
  KEY `revenus_artist_links_fk` (`revenu_id`),
  KEY `revenus_artist_links_inv_fk` (`artist_id`),
  CONSTRAINT `revenus_artist_links_fk` FOREIGN KEY (`revenu_id`) REFERENCES `revenus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `revenus_artist_links_inv_fk` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revenus_artist_links`
--

LOCK TABLES `revenus_artist_links` WRITE;
/*!40000 ALTER TABLE `revenus_artist_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `revenus_artist_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `date_de_sortie` datetime(6) DEFAULT NULL,
  `streams` varchar(255) DEFAULT NULL,
  `pays` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `songs_created_by_id_fk` (`created_by_id`),
  KEY `songs_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `songs_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `songs_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES
(1,'Terminus feat Gazo','2023-11-12 00:00:00.000000',NULL,'Mali','Bamako','2024-01-12 09:23:56.097000','2024-01-12 09:47:00.069000','2024-01-12 09:47:00.058000',1,1),
(2,'Angati',NULL,NULL,'Mali','Bamako','2024-01-12 09:48:50.243000','2024-01-12 09:48:52.871000','2024-01-12 09:48:52.863000',1,1),
(3,'Temps',NULL,NULL,'Mali','Bamako','2024-01-12 09:54:57.932000','2024-01-12 09:55:00.200000','2024-01-12 09:55:00.186000',1,1),
(4,'Kayes Ka dein Rap',NULL,NULL,'Mali','Bamako','2024-01-23 09:13:37.063000','2024-01-23 09:13:45.985000','2024-01-23 09:13:45.976000',1,1),
(5,'Dollars Gang',NULL,NULL,'Mali','Bamako','2024-01-23 09:15:00.226000','2024-01-23 09:15:02.323000','2024-01-23 09:15:02.313000',1,1),
(6,'Kouma Do Be Se Ka Kai',NULL,NULL,'Mali','Bamako','2024-01-23 22:07:39.207000','2024-01-23 22:07:42.348000','2024-01-23 22:07:42.340000',1,1),
(7,'Sabou',NULL,NULL,'Mali','Bamako','2024-01-24 09:27:36.090000','2024-01-24 09:27:38.841000','2024-01-24 09:27:38.834000',1,1),
(8,'Bas Quartier',NULL,NULL,'Mali','Bamako','2024-01-24 10:28:51.583000','2024-05-01 11:26:45.264000','2024-01-24 10:28:54.757000',1,1),
(9,'Badman Feat Bronzer','2024-03-20 00:00:00.000000',NULL,'Mali','Bamako','2024-04-12 10:13:34.373000','2024-04-12 10:18:38.082000','2024-04-12 10:16:28.805000',1,1),
(10,'An golokoun Magne','2023-05-10 00:00:00.000000',NULL,'Mali','Bamako','2024-04-12 10:25:55.868000','2024-04-12 10:25:57.639000','2024-04-12 10:25:57.624000',1,1),
(11,'Egotrip','2009-04-01 00:00:00.000000',NULL,'Mali','Bamako','2024-04-12 11:13:45.191000','2024-04-12 11:13:47.051000','2024-04-12 11:13:47.040000',1,1),
(12,'Couplet kelen','2024-03-03 00:00:00.000000',NULL,'Mali','Bamako','2024-05-01 11:36:04.477000','2024-05-01 11:36:12.708000','2024-05-01 11:36:12.689000',1,1),
(13,'Sisan Kow','2024-04-28 00:00:00.000000',NULL,'Mali','Bamako','2024-05-01 11:58:17.393000','2024-05-02 11:14:40.756000','2024-05-01 11:58:20.141000',1,1),
(14,'Alpha','2024-03-03 00:00:00.000000',NULL,'Mali','Bamako','2024-05-01 12:01:18.123000','2024-05-02 11:26:31.630000','2024-05-01 12:02:11.647000',1,1),
(15,'Tesla','2023-02-08 00:00:00.000000',NULL,'Mali','Bamako','2024-05-02 17:22:59.303000','2024-05-02 17:23:02.414000','2024-05-02 17:23:02.361000',1,1),
(16,'Tonton','2020-06-02 00:00:00.000000',NULL,'Mali','Bamako','2024-06-11 10:12:34.886000','2024-06-23 13:50:43.183000','2024-06-11 10:14:27.951000',1,1),
(17,'Been ','2020-06-02 00:00:00.000000',NULL,'Mali','Bamako','2024-06-11 10:19:57.630000','2024-06-23 13:52:16.489000','2024-06-11 10:20:01.520000',1,1),
(18,'Drill ML','2024-05-26 00:00:00.000000',NULL,'Mali','Bamako','2024-06-25 16:21:41.932000','2024-06-25 16:25:18.077000','2024-06-25 16:21:48.431000',1,1),
(19,'Titati ',NULL,NULL,'Mali','Bamako','2024-06-25 16:41:41.633000','2024-06-25 16:41:44.219000','2024-06-25 16:41:44.208000',1,1),
(20,'nta',NULL,NULL,'mali','bamako','2024-06-26 12:26:39.797000','2024-06-26 12:37:23.297000','2024-06-26 12:26:44.465000',2,2),
(21,'gnoud sy',NULL,NULL,'mali','bamako','2024-06-26 12:47:52.631000','2024-06-27 10:20:36.434000','2024-06-26 12:48:02.630000',2,1),
(22,'forever',NULL,NULL,'mali','bamako','2024-06-26 13:00:00.605000','2024-06-26 13:04:15.827000','2024-06-26 13:04:15.790000',2,2),
(23,'morphine',NULL,NULL,'mali','bamako','2024-06-26 13:17:35.663000','2024-06-26 13:18:58.734000','2024-06-26 13:17:43.651000',2,2),
(24,'wari feat lil zed',NULL,NULL,'mali','bamako','2024-06-26 13:35:33.120000','2024-06-27 10:18:59.441000','2024-06-26 13:38:30.774000',2,1),
(25,'wali fin',NULL,NULL,'mali','bamako','2024-06-26 13:45:33.336000','2024-06-27 10:17:32.410000','2024-06-26 13:45:38.048000',2,1),
(26,'ne djanai mogo',NULL,NULL,'mali','bamako','2024-06-26 13:56:58.069000','2024-06-27 10:14:48.804000','2024-06-26 13:57:03.108000',2,1),
(27,'Sena watibb banks',NULL,NULL,'mali','bamako','2024-07-05 14:08:33.846000','2024-07-05 14:47:42.839000','2024-07-05 14:47:42.828000',2,2),
(28,'INTRO - OCB 1',NULL,NULL,'Mali','Bamako','2024-09-05 16:28:14.953000','2024-09-05 16:28:19.092000','2024-09-05 16:28:19.086000',1,1),
(29,'Gôshi ','2015-09-01 00:00:00.000000',NULL,'Mali','Bamako','2024-09-05 16:34:35.939000','2024-09-05 16:34:42.633000','2024-09-05 16:34:42.627000',1,1),
(30,'Thugga',NULL,NULL,'Mali','Bamako','2024-09-05 16:42:40.934000','2024-09-05 16:42:52.146000','2024-09-05 16:42:52.140000',1,1),
(31,'Bobby Shmurday','2015-09-01 00:00:00.000000',NULL,'Mali','Bamako','2024-09-05 16:48:03.237000','2024-09-05 16:48:08.675000','2024-09-05 16:48:08.669000',1,1),
(32,'Saladi','2015-09-01 00:00:00.000000',NULL,'Mali','Bamako','2024-09-05 17:48:02.117000','2024-09-05 17:48:08.391000','2024-09-05 17:48:08.385000',1,1);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs_album_links`
--

DROP TABLE IF EXISTS `songs_album_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs_album_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `song_id` int(10) unsigned DEFAULT NULL,
  `album_id` int(10) unsigned DEFAULT NULL,
  `song_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `songs_album_links_unique` (`song_id`,`album_id`),
  KEY `songs_album_links_fk` (`song_id`),
  KEY `songs_album_links_inv_fk` (`album_id`),
  KEY `songs_album_links_order_inv_fk` (`song_order`),
  CONSTRAINT `songs_album_links_fk` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `songs_album_links_inv_fk` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs_album_links`
--

LOCK TABLES `songs_album_links` WRITE;
/*!40000 ALTER TABLE `songs_album_links` DISABLE KEYS */;
INSERT INTO `songs_album_links` VALUES
(1,4,1,1),
(2,5,1,2),
(3,6,2,1),
(4,8,2,2),
(5,28,3,0),
(6,29,3,1),
(7,30,3,2),
(8,31,3,3),
(9,32,3,4);
/*!40000 ALTER TABLE `songs_album_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs_artist_links`
--

DROP TABLE IF EXISTS `songs_artist_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs_artist_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `song_id` int(10) unsigned DEFAULT NULL,
  `artist_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `songs_artist_links_unique` (`song_id`,`artist_id`),
  KEY `songs_artist_links_fk` (`song_id`),
  KEY `songs_artist_links_inv_fk` (`artist_id`),
  CONSTRAINT `songs_artist_links_fk` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `songs_artist_links_inv_fk` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs_artist_links`
--

LOCK TABLES `songs_artist_links` WRITE;
/*!40000 ALTER TABLE `songs_artist_links` DISABLE KEYS */;
INSERT INTO `songs_artist_links` VALUES
(1,1,1),
(2,2,3),
(3,3,3),
(4,4,5),
(5,5,5),
(6,6,6),
(7,7,2),
(8,8,6),
(9,9,7),
(10,10,9),
(11,11,10),
(12,12,11),
(14,13,12),
(15,14,12),
(16,15,13),
(17,16,14),
(18,17,15),
(19,18,13),
(20,19,16),
(21,20,17),
(22,21,17),
(23,22,17),
(24,23,17),
(25,24,18),
(26,25,18),
(27,26,18),
(28,27,18),
(29,28,19),
(30,29,19),
(31,30,19),
(32,31,19),
(33,32,19);
/*!40000 ALTER TABLE `songs_artist_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs_genre_links`
--

DROP TABLE IF EXISTS `songs_genre_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs_genre_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `song_id` int(10) unsigned DEFAULT NULL,
  `genre_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `songs_genre_links_unique` (`song_id`,`genre_id`),
  KEY `songs_genre_links_fk` (`song_id`),
  KEY `songs_genre_links_inv_fk` (`genre_id`),
  CONSTRAINT `songs_genre_links_fk` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `songs_genre_links_inv_fk` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs_genre_links`
--

LOCK TABLES `songs_genre_links` WRITE;
/*!40000 ALTER TABLE `songs_genre_links` DISABLE KEYS */;
INSERT INTO `songs_genre_links` VALUES
(1,1,4),
(2,2,2),
(3,3,2),
(4,4,2),
(5,5,2),
(6,6,2),
(7,7,1),
(8,8,2),
(9,9,6),
(10,10,2),
(11,11,2),
(12,12,2),
(13,13,2),
(14,14,2),
(15,15,2),
(16,16,3),
(17,17,3),
(18,18,2),
(19,19,3),
(20,20,5),
(21,21,5),
(22,22,5),
(23,23,5),
(24,24,2),
(25,25,2),
(26,26,2),
(27,27,2),
(28,28,2),
(29,29,2),
(30,30,2),
(31,31,2),
(32,32,2);
/*!40000 ALTER TABLE `songs_genre_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_token_permissions`
--

DROP TABLE IF EXISTS `strapi_api_token_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_api_token_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_token_permissions`
--

LOCK TABLES `strapi_api_token_permissions` WRITE;
/*!40000 ALTER TABLE `strapi_api_token_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_api_token_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_token_permissions_token_links`
--

DROP TABLE IF EXISTS `strapi_api_token_permissions_token_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_api_token_permissions_token_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `api_token_permission_id` int(10) unsigned DEFAULT NULL,
  `api_token_id` int(10) unsigned DEFAULT NULL,
  `api_token_permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_api_token_permissions_token_links_unique` (`api_token_permission_id`,`api_token_id`),
  KEY `strapi_api_token_permissions_token_links_fk` (`api_token_permission_id`),
  KEY `strapi_api_token_permissions_token_links_inv_fk` (`api_token_id`),
  KEY `strapi_api_token_permissions_token_links_order_inv_fk` (`api_token_permission_order`),
  CONSTRAINT `strapi_api_token_permissions_token_links_fk` FOREIGN KEY (`api_token_permission_id`) REFERENCES `strapi_api_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_api_token_permissions_token_links_inv_fk` FOREIGN KEY (`api_token_id`) REFERENCES `strapi_api_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_token_permissions_token_links`
--

LOCK TABLES `strapi_api_token_permissions_token_links` WRITE;
/*!40000 ALTER TABLE `strapi_api_token_permissions_token_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_api_token_permissions_token_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_tokens`
--

DROP TABLE IF EXISTS `strapi_api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_api_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_tokens`
--

LOCK TABLES `strapi_api_tokens` WRITE;
/*!40000 ALTER TABLE `strapi_api_tokens` DISABLE KEYS */;
INSERT INTO `strapi_api_tokens` VALUES
(1,'web app','','read-only','b17d96d27d5e165582ccdbc8f242d18f29f605fbce0fa0271c222bb2a7c3305efd290b0c04cdac6b944b82c8a16d4f50e1e0e4c661ca24f1306016b9b73c6eeb',NULL,NULL,NULL,'2024-01-12 08:50:38.953000','2024-01-12 08:54:14.143000',NULL,NULL);
/*!40000 ALTER TABLE `strapi_api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_core_store_settings`
--

DROP TABLE IF EXISTS `strapi_core_store_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_core_store_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_core_store_settings`
--

LOCK TABLES `strapi_core_store_settings` WRITE;
/*!40000 ALTER TABLE `strapi_core_store_settings` DISABLE KEYS */;
INSERT INTO `strapi_core_store_settings` VALUES
(1,'strapi_content_types_schema','{\"admin::permission\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"actionParameters\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"actionParameters\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"admin::permission\",\"plugin\":\"admin\",\"globalId\":\"AdminPermission\"},\"admin::user\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"registrationToken\":{\"hidden\":true}}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"admin::user\",\"plugin\":\"admin\",\"globalId\":\"AdminUser\"},\"admin::role\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"admin::role\",\"plugin\":\"admin\",\"globalId\":\"AdminRole\"},\"admin::api-token\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"searchable\":false},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"searchable\":false},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token\",\"connection\":\"default\",\"uid\":\"admin::api-token\",\"plugin\":\"admin\",\"globalId\":\"AdminApiToken\"},\"admin::api-token-permission\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token-permission\",\"connection\":\"default\",\"uid\":\"admin::api-token-permission\",\"plugin\":\"admin\",\"globalId\":\"AdminApiTokenPermission\"},\"admin::transfer-token\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"transfer-token\",\"connection\":\"default\",\"uid\":\"admin::transfer-token\",\"plugin\":\"admin\",\"globalId\":\"AdminTransferToken\"},\"admin::transfer-token-permission\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"transfer-token-permission\",\"connection\":\"default\",\"uid\":\"admin::transfer-token-permission\",\"plugin\":\"admin\",\"globalId\":\"AdminTransferTokenPermission\"},\"plugin::upload.file\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"min\":1,\"required\":true,\"private\":true,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null}],\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"min\":1,\"required\":true,\"private\":true,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"file\",\"connection\":\"default\",\"uid\":\"plugin::upload.file\",\"plugin\":\"upload\",\"globalId\":\"UploadFile\"},\"plugin::upload.folder\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"min\":1,\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"}],\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"min\":1,\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"folder\",\"connection\":\"default\",\"uid\":\"plugin::upload.folder\",\"plugin\":\"upload\",\"globalId\":\"UploadFolder\"},\"plugin::i18n.locale\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"locale\",\"connection\":\"default\",\"uid\":\"plugin::i18n.locale\",\"plugin\":\"i18n\",\"collectionName\":\"i18n_locale\",\"globalId\":\"I18NLocale\"},\"plugin::users-permissions.permission\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.permission\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsPermission\"},\"plugin::users-permissions.role\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.role\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsRole\"},\"plugin::users-permissions.user\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"confirmationToken\":{\"hidden\":true},\"provider\":{\"hidden\":true}}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.user\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsUser\"},\"api::advertisement.advertisement\":{\"kind\":\"collectionType\",\"collectionName\":\"advertisements\",\"info\":{\"singularName\":\"advertisement\",\"pluralName\":\"advertisements\",\"displayName\":\"advertisement\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"ad_provider\":{\"type\":\"string\"},\"campain_name\":{\"type\":\"string\"},\"amount\":{\"type\":\"string\"},\"currency\":{\"type\":\"string\"},\"revenue_date\":{\"type\":\"datetime\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"advertisements\",\"info\":{\"singularName\":\"advertisement\",\"pluralName\":\"advertisements\",\"displayName\":\"advertisement\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"ad_provider\":{\"type\":\"string\"},\"campain_name\":{\"type\":\"string\"},\"amount\":{\"type\":\"string\"},\"currency\":{\"type\":\"string\"},\"revenue_date\":{\"type\":\"datetime\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"advertisement\",\"connection\":\"default\",\"uid\":\"api::advertisement.advertisement\",\"apiName\":\"advertisement\",\"globalId\":\"Advertisement\",\"actions\":{},\"lifecycles\":{}},\"api::album.album\":{\"kind\":\"collectionType\",\"collectionName\":\"albums\",\"info\":{\"singularName\":\"album\",\"pluralName\":\"albums\",\"displayName\":\"album\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"artist\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::artist.artist\"},\"songs\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::song.song\",\"mappedBy\":\"album\"},\"year\":{\"type\":\"string\"},\"Description\":{\"type\":\"string\"},\"image\":{\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"],\"type\":\"media\",\"multiple\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"albums\",\"info\":{\"singularName\":\"album\",\"pluralName\":\"albums\",\"displayName\":\"album\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"artist\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::artist.artist\"},\"songs\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::song.song\",\"mappedBy\":\"album\"},\"year\":{\"type\":\"string\"},\"Description\":{\"type\":\"string\"},\"image\":{\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"],\"type\":\"media\",\"multiple\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"album\",\"connection\":\"default\",\"uid\":\"api::album.album\",\"apiName\":\"album\",\"globalId\":\"Album\",\"actions\":{},\"lifecycles\":{}},\"api::artist.artist\":{\"kind\":\"collectionType\",\"collectionName\":\"artists\",\"info\":{\"singularName\":\"artist\",\"pluralName\":\"artists\",\"displayName\":\"artist\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"image\":{\"type\":\"media\",\"multiple\":true,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"date_naissance\":{\"type\":\"string\"},\"adresse\":{\"type\":\"string\"},\"Pays\":{\"type\":\"string\"},\"ville\":{\"type\":\"string\"},\"email\":{\"type\":\"email\"},\"Biographie\":{\"type\":\"text\"},\"genres\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::genre.genre\",\"mappedBy\":\"artist\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"artists\",\"info\":{\"singularName\":\"artist\",\"pluralName\":\"artists\",\"displayName\":\"artist\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"image\":{\"type\":\"media\",\"multiple\":true,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"date_naissance\":{\"type\":\"string\"},\"adresse\":{\"type\":\"string\"},\"Pays\":{\"type\":\"string\"},\"ville\":{\"type\":\"string\"},\"email\":{\"type\":\"email\"},\"Biographie\":{\"type\":\"text\"},\"genres\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::genre.genre\",\"mappedBy\":\"artist\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"artist\",\"connection\":\"default\",\"uid\":\"api::artist.artist\",\"apiName\":\"artist\",\"globalId\":\"Artist\",\"actions\":{},\"lifecycles\":{}},\"api::category.category\":{\"kind\":\"collectionType\",\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"category\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"category\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"category\",\"connection\":\"default\",\"uid\":\"api::category.category\",\"apiName\":\"category\",\"globalId\":\"Category\",\"actions\":{},\"lifecycles\":{}},\"api::download.download\":{\"kind\":\"collectionType\",\"collectionName\":\"downloads\",\"info\":{\"singularName\":\"download\",\"pluralName\":\"downloads\",\"displayName\":\"download\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"song\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::song.song\"},\"download_date\":{\"type\":\"datetime\"},\"device_type\":{\"type\":\"string\"},\"ip_address\":{\"type\":\"string\"},\"location\":{\"type\":\"string\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"downloads\",\"info\":{\"singularName\":\"download\",\"pluralName\":\"downloads\",\"displayName\":\"download\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"song\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::song.song\"},\"download_date\":{\"type\":\"datetime\"},\"device_type\":{\"type\":\"string\"},\"ip_address\":{\"type\":\"string\"},\"location\":{\"type\":\"string\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"download\",\"connection\":\"default\",\"uid\":\"api::download.download\",\"apiName\":\"download\",\"globalId\":\"Download\",\"actions\":{},\"lifecycles\":{}},\"api::genre.genre\":{\"kind\":\"collectionType\",\"collectionName\":\"genres\",\"info\":{\"singularName\":\"genre\",\"pluralName\":\"genres\",\"displayName\":\"genre\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"artist\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::artist.artist\",\"inversedBy\":\"genres\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"genres\",\"info\":{\"singularName\":\"genre\",\"pluralName\":\"genres\",\"displayName\":\"genre\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"artist\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::artist.artist\",\"inversedBy\":\"genres\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"genre\",\"connection\":\"default\",\"uid\":\"api::genre.genre\",\"apiName\":\"genre\",\"globalId\":\"Genre\",\"actions\":{},\"lifecycles\":{}},\"api::like.like\":{\"kind\":\"collectionType\",\"collectionName\":\"likes\",\"info\":{\"singularName\":\"like\",\"pluralName\":\"likes\",\"displayName\":\"like\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"song\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::song.song\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"likes\",\"info\":{\"singularName\":\"like\",\"pluralName\":\"likes\",\"displayName\":\"like\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"song\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::song.song\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"like\",\"connection\":\"default\",\"uid\":\"api::like.like\",\"apiName\":\"like\",\"globalId\":\"Like\",\"actions\":{},\"lifecycles\":{}},\"api::on-demand-sale.on-demand-sale\":{\"kind\":\"collectionType\",\"collectionName\":\"on_demand_sales\",\"info\":{\"singularName\":\"on-demand-sale\",\"pluralName\":\"on-demand-sales\",\"displayName\":\"on_demand_sale\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"amount\":{\"type\":\"string\"},\"currency\":{\"type\":\"string\"},\"purchase_date\":{\"type\":\"datetime\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"on_demand_sales\",\"info\":{\"singularName\":\"on-demand-sale\",\"pluralName\":\"on-demand-sales\",\"displayName\":\"on_demand_sale\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"amount\":{\"type\":\"string\"},\"currency\":{\"type\":\"string\"},\"purchase_date\":{\"type\":\"datetime\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"on-demand-sale\",\"connection\":\"default\",\"uid\":\"api::on-demand-sale.on-demand-sale\",\"apiName\":\"on-demand-sale\",\"globalId\":\"OnDemandSale\",\"actions\":{},\"lifecycles\":{}},\"api::payment.payment\":{\"kind\":\"collectionType\",\"collectionName\":\"payments\",\"info\":{\"singularName\":\"payment\",\"pluralName\":\"payments\",\"displayName\":\"payment\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"amount\":{\"type\":\"string\"},\"currency\":{\"type\":\"string\"},\"method\":{\"type\":\"string\"},\"date\":{\"type\":\"string\"},\"status\":{\"type\":\"string\"},\"description\":{\"type\":\"string\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"payments\",\"info\":{\"singularName\":\"payment\",\"pluralName\":\"payments\",\"displayName\":\"payment\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"amount\":{\"type\":\"string\"},\"currency\":{\"type\":\"string\"},\"method\":{\"type\":\"string\"},\"date\":{\"type\":\"string\"},\"status\":{\"type\":\"string\"},\"description\":{\"type\":\"string\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"payment\",\"connection\":\"default\",\"uid\":\"api::payment.payment\",\"apiName\":\"payment\",\"globalId\":\"Payment\",\"actions\":{},\"lifecycles\":{}},\"api::playlist.playlist\":{\"kind\":\"collectionType\",\"collectionName\":\"playlists\",\"info\":{\"singularName\":\"playlist\",\"pluralName\":\"playlists\",\"displayName\":\"playlist\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"playlists\",\"info\":{\"singularName\":\"playlist\",\"pluralName\":\"playlists\",\"displayName\":\"playlist\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"playlist\",\"connection\":\"default\",\"uid\":\"api::playlist.playlist\",\"apiName\":\"playlist\",\"globalId\":\"Playlist\",\"actions\":{},\"lifecycles\":{}},\"api::playlist-song.playlist-song\":{\"kind\":\"collectionType\",\"collectionName\":\"playlist_songs\",\"info\":{\"singularName\":\"playlist-song\",\"pluralName\":\"playlist-songs\",\"displayName\":\"playlist_song\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"playlist\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::playlist.playlist\"},\"song\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::song.song\"},\"position\":{\"type\":\"string\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"playlist_songs\",\"info\":{\"singularName\":\"playlist-song\",\"pluralName\":\"playlist-songs\",\"displayName\":\"playlist_song\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"playlist\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::playlist.playlist\"},\"song\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::song.song\"},\"position\":{\"type\":\"string\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"playlist-song\",\"connection\":\"default\",\"uid\":\"api::playlist-song.playlist-song\",\"apiName\":\"playlist-song\",\"globalId\":\"PlaylistSong\",\"actions\":{},\"lifecycles\":{}},\"api::revenu.revenu\":{\"kind\":\"collectionType\",\"collectionName\":\"revenus\",\"info\":{\"singularName\":\"revenu\",\"pluralName\":\"revenus\",\"displayName\":\"revenu\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"artist\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::artist.artist\"},\"montant\":{\"type\":\"string\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"revenus\",\"info\":{\"singularName\":\"revenu\",\"pluralName\":\"revenus\",\"displayName\":\"revenu\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"artist\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::artist.artist\"},\"montant\":{\"type\":\"string\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"revenu\",\"connection\":\"default\",\"uid\":\"api::revenu.revenu\",\"apiName\":\"revenu\",\"globalId\":\"Revenu\",\"actions\":{},\"lifecycles\":{}},\"api::song.song\":{\"kind\":\"collectionType\",\"collectionName\":\"songs\",\"info\":{\"singularName\":\"song\",\"pluralName\":\"songs\",\"displayName\":\"song\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"cover\":{\"type\":\"media\",\"multiple\":true,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"artist\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::artist.artist\"},\"date_de_sortie\":{\"type\":\"datetime\"},\"streams\":{\"type\":\"string\"},\"audio\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"genre\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::genre.genre\"},\"pays\":{\"type\":\"string\"},\"ville\":{\"type\":\"string\"},\"album\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::album.album\",\"inversedBy\":\"songs\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"songs\",\"info\":{\"singularName\":\"song\",\"pluralName\":\"songs\",\"displayName\":\"song\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"cover\":{\"type\":\"media\",\"multiple\":true,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"artist\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::artist.artist\"},\"date_de_sortie\":{\"type\":\"datetime\"},\"streams\":{\"type\":\"string\"},\"audio\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"genre\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::genre.genre\"},\"pays\":{\"type\":\"string\"},\"ville\":{\"type\":\"string\"},\"album\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::album.album\",\"inversedBy\":\"songs\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"song\",\"connection\":\"default\",\"uid\":\"api::song.song\",\"apiName\":\"song\",\"globalId\":\"Song\",\"actions\":{},\"lifecycles\":{}},\"api::stream.stream\":{\"kind\":\"collectionType\",\"collectionName\":\"streams\",\"info\":{\"singularName\":\"stream\",\"pluralName\":\"streams\",\"displayName\":\"stream\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"song\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::song.song\"},\"start\":{\"type\":\"datetime\"},\"end\":{\"type\":\"datetime\"},\"uuid\":{\"type\":\"string\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"streams\",\"info\":{\"singularName\":\"stream\",\"pluralName\":\"streams\",\"displayName\":\"stream\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"song\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::song.song\"},\"start\":{\"type\":\"datetime\"},\"end\":{\"type\":\"datetime\"},\"uuid\":{\"type\":\"string\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"stream\",\"connection\":\"default\",\"uid\":\"api::stream.stream\",\"apiName\":\"stream\",\"globalId\":\"Stream\",\"actions\":{},\"lifecycles\":{}},\"api::subscription.subscription\":{\"kind\":\"collectionType\",\"collectionName\":\"subscriptions\",\"info\":{\"singularName\":\"subscription\",\"pluralName\":\"subscriptions\",\"displayName\":\"subscription\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"plan\":{\"type\":\"string\"},\"amount\":{\"type\":\"string\"},\"currency\":{\"type\":\"string\"},\"start_date\":{\"type\":\"datetime\"},\"end_date\":{\"type\":\"datetime\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"subscriptions\",\"info\":{\"singularName\":\"subscription\",\"pluralName\":\"subscriptions\",\"displayName\":\"subscription\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"plan\":{\"type\":\"string\"},\"amount\":{\"type\":\"string\"},\"currency\":{\"type\":\"string\"},\"start_date\":{\"type\":\"datetime\"},\"end_date\":{\"type\":\"datetime\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"subscription\",\"connection\":\"default\",\"uid\":\"api::subscription.subscription\",\"apiName\":\"subscription\",\"globalId\":\"Subscription\",\"actions\":{},\"lifecycles\":{}}}','object',NULL,NULL),
(2,'plugin_content_manager_configuration_content_types::admin::permission','{\"uid\":\"admin::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"actionParameters\":{\"edit\":{\"label\":\"actionParameters\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"actionParameters\",\"searchable\":false,\"sortable\":false}},\"subject\":{\"edit\":{\"label\":\"subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6}],[{\"name\":\"actionParameters\",\"size\":12}],[{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}],[{\"name\":\"role\",\"size\":6}]]}}','object',NULL,NULL),
(3,'plugin_content_manager_configuration_content_types::admin::user','{\"uid\":\"admin::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"registrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"registrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"isActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"preferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"preferedLanguage\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"roles\",\"size\":6},{\"name\":\"blocked\",\"size\":4}],[{\"name\":\"preferedLanguage\",\"size\":6}]]}}','object',NULL,NULL),
(4,'plugin_content_manager_configuration_content_types::admin::role','{\"uid\":\"admin::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6},{\"name\":\"users\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6}]]}}','object',NULL,NULL),
(5,'plugin_content_manager_configuration_content_types::admin::api-token','{\"uid\":\"admin::api-token\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"accessKey\",\"size\":6}],[{\"name\":\"lastUsedAt\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"expiresAt\",\"size\":6},{\"name\":\"lifespan\",\"size\":4}]]}}','object',NULL,NULL),
(6,'plugin_content_manager_configuration_content_types::admin::api-token-permission','{\"uid\":\"admin::api-token-permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]}}','object',NULL,NULL),
(7,'plugin_content_manager_configuration_content_types::admin::transfer-token','{\"uid\":\"admin::transfer-token\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"accessKey\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"accessKey\",\"size\":6},{\"name\":\"lastUsedAt\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6},{\"name\":\"expiresAt\",\"size\":6}],[{\"name\":\"lifespan\",\"size\":4}]]}}','object',NULL,NULL),
(8,'plugin_content_manager_configuration_content_types::admin::transfer-token-permission','{\"uid\":\"admin::transfer-token-permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]}}','object',NULL,NULL),
(9,'plugin_content_manager_configuration_content_types::plugin::upload.file','{\"uid\":\"plugin::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"alternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"alternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"previewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"previewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider_metadata\",\"searchable\":false,\"sortable\":false}},\"folder\":{\"edit\":{\"label\":\"folder\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"folder\",\"searchable\":true,\"sortable\":true}},\"folderPath\":{\"edit\":{\"label\":\"folderPath\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"folderPath\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}],[{\"name\":\"folder\",\"size\":6},{\"name\":\"folderPath\",\"size\":6}]]}}','object',NULL,NULL),
(10,'plugin_content_manager_configuration_content_types::plugin::upload.folder','{\"uid\":\"plugin::upload.folder\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"pathId\":{\"edit\":{\"label\":\"pathId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"pathId\",\"searchable\":true,\"sortable\":true}},\"parent\":{\"edit\":{\"label\":\"parent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"parent\",\"searchable\":true,\"sortable\":true}},\"children\":{\"edit\":{\"label\":\"children\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"children\",\"searchable\":false,\"sortable\":false}},\"files\":{\"edit\":{\"label\":\"files\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"files\",\"searchable\":false,\"sortable\":false}},\"path\":{\"edit\":{\"label\":\"path\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"path\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"pathId\",\"parent\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"pathId\",\"size\":4}],[{\"name\":\"parent\",\"size\":6},{\"name\":\"children\",\"size\":6}],[{\"name\":\"files\",\"size\":6},{\"name\":\"path\",\"size\":6}]]}}','object',NULL,NULL),
(11,'plugin_content_manager_configuration_content_types::plugin::i18n.locale','{\"uid\":\"plugin::i18n.locale\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"createdAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]}}','object',NULL,NULL),
(12,'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission','{\"uid\":\"plugin::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"role\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"role\",\"size\":6}]]}}','object',NULL,NULL),
(13,'plugin_content_manager_configuration_content_types::plugin::users-permissions.role','{\"uid\":\"plugin::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"users\",\"size\":6}]]}}','object',NULL,NULL),
(14,'plugin_content_manager_configuration_content_types::plugin::users-permissions.user','{\"uid\":\"plugin::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"confirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"confirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"role\",\"size\":6}]]}}','object',NULL,NULL),
(15,'plugin_content_manager_configuration_content_types::api::album.album','{\"uid\":\"api::album.album\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"artist\":{\"edit\":{\"label\":\"artist\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"artist\",\"searchable\":true,\"sortable\":true}},\"songs\":{\"edit\":{\"label\":\"songs\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"songs\",\"searchable\":false,\"sortable\":false}},\"year\":{\"edit\":{\"label\":\"year\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"year\",\"searchable\":true,\"sortable\":true}},\"Description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"image\":{\"edit\":{\"label\":\"image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"image\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"artist\",\"songs\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"artist\",\"size\":6}],[{\"name\":\"songs\",\"size\":6},{\"name\":\"year\",\"size\":6}],[{\"name\":\"Description\",\"size\":6},{\"name\":\"image\",\"size\":6}]]}}','object',NULL,NULL),
(16,'plugin_content_manager_configuration_content_types::api::artist.artist','{\"uid\":\"api::artist.artist\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"image\":{\"edit\":{\"label\":\"image\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"image\",\"searchable\":false,\"sortable\":false}},\"date_naissance\":{\"edit\":{\"label\":\"date_naissance\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"date_naissance\",\"searchable\":true,\"sortable\":true}},\"adresse\":{\"edit\":{\"label\":\"adresse\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"adresse\",\"searchable\":true,\"sortable\":true}},\"Pays\":{\"edit\":{\"label\":\"Pays\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Pays\",\"searchable\":true,\"sortable\":true}},\"ville\":{\"edit\":{\"label\":\"ville\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ville\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"Biographie\":{\"edit\":{\"label\":\"Biographie\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Biographie\",\"searchable\":true,\"sortable\":true}},\"genres\":{\"edit\":{\"label\":\"genres\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"genres\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"image\",\"date_naissance\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"image\",\"size\":6}],[{\"name\":\"date_naissance\",\"size\":6},{\"name\":\"adresse\",\"size\":6}],[{\"name\":\"Pays\",\"size\":6},{\"name\":\"ville\",\"size\":6}],[{\"name\":\"email\",\"size\":6},{\"name\":\"Biographie\",\"size\":6}],[{\"name\":\"genres\",\"size\":6}]]}}','object',NULL,NULL),
(17,'plugin_content_manager_configuration_content_types::api::category.category','{\"uid\":\"api::category.category\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"createdAt\",\"updatedAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6}]]}}','object',NULL,NULL),
(18,'plugin_content_manager_configuration_content_types::api::genre.genre','{\"uid\":\"api::genre.genre\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"artist\":{\"edit\":{\"label\":\"artist\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"artist\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"createdAt\",\"updatedAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"artist\",\"size\":6}]]}}','object',NULL,NULL),
(19,'plugin_content_manager_configuration_content_types::api::like.like','{\"uid\":\"api::like.like\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"user\":{\"edit\":{\"label\":\"user\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"user\",\"searchable\":true,\"sortable\":true}},\"song\":{\"edit\":{\"label\":\"song\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"song\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"user\",\"song\",\"createdAt\"],\"edit\":[[{\"name\":\"user\",\"size\":6},{\"name\":\"song\",\"size\":6}]]}}','object',NULL,NULL),
(20,'plugin_content_manager_configuration_content_types::api::playlist.playlist','{\"uid\":\"api::playlist.playlist\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"user\":{\"edit\":{\"label\":\"user\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"user\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"user\",\"createdAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"user\",\"size\":6}]]}}','object',NULL,NULL),
(21,'plugin_content_manager_configuration_content_types::api::playlist-song.playlist-song','{\"uid\":\"api::playlist-song.playlist-song\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"position\",\"defaultSortBy\":\"position\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"playlist\":{\"edit\":{\"label\":\"playlist\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"playlist\",\"searchable\":true,\"sortable\":true}},\"song\":{\"edit\":{\"label\":\"song\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"song\",\"searchable\":true,\"sortable\":true}},\"position\":{\"edit\":{\"label\":\"position\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"position\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"playlist\",\"song\",\"position\"],\"edit\":[[{\"name\":\"playlist\",\"size\":6},{\"name\":\"song\",\"size\":6}],[{\"name\":\"position\",\"size\":6}]]}}','object',NULL,NULL),
(22,'plugin_content_manager_configuration_content_types::api::revenu.revenu','{\"uid\":\"api::revenu.revenu\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"montant\",\"defaultSortBy\":\"montant\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"artist\":{\"edit\":{\"label\":\"artist\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"artist\",\"searchable\":true,\"sortable\":true}},\"montant\":{\"edit\":{\"label\":\"montant\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"montant\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"artist\",\"montant\",\"createdAt\"],\"edit\":[[{\"name\":\"artist\",\"size\":6},{\"name\":\"montant\",\"size\":6}]]}}','object',NULL,NULL),
(23,'plugin_content_manager_configuration_content_types::api::song.song','{\"uid\":\"api::song.song\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"cover\":{\"edit\":{\"label\":\"cover\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"cover\",\"searchable\":false,\"sortable\":false}},\"artist\":{\"edit\":{\"label\":\"artist\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"artist\",\"searchable\":true,\"sortable\":true}},\"date_de_sortie\":{\"edit\":{\"label\":\"date_de_sortie\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"date_de_sortie\",\"searchable\":true,\"sortable\":true}},\"streams\":{\"edit\":{\"label\":\"streams\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"streams\",\"searchable\":true,\"sortable\":true}},\"audio\":{\"edit\":{\"label\":\"audio\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"audio\",\"searchable\":false,\"sortable\":false}},\"genre\":{\"edit\":{\"label\":\"genre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"genre\",\"searchable\":true,\"sortable\":true}},\"pays\":{\"edit\":{\"label\":\"pays\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"pays\",\"searchable\":true,\"sortable\":true}},\"ville\":{\"edit\":{\"label\":\"ville\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ville\",\"searchable\":true,\"sortable\":true}},\"album\":{\"edit\":{\"label\":\"album\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"album\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"cover\",\"artist\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"cover\",\"size\":6}],[{\"name\":\"artist\",\"size\":6},{\"name\":\"date_de_sortie\",\"size\":6}],[{\"name\":\"streams\",\"size\":6},{\"name\":\"audio\",\"size\":6}],[{\"name\":\"genre\",\"size\":6},{\"name\":\"pays\",\"size\":6}],[{\"name\":\"ville\",\"size\":6},{\"name\":\"album\",\"size\":6}]]}}','object',NULL,NULL),
(24,'plugin_upload_settings','{\"sizeOptimization\":true,\"responsiveDimensions\":true,\"autoOrientation\":false}','object',NULL,NULL),
(25,'plugin_upload_view_configuration','{\"pageSize\":10,\"sort\":\"createdAt:DESC\"}','object',NULL,NULL),
(26,'plugin_upload_metrics','{\"weeklySchedule\":\"23 33 11 * * 2\",\"lastWeeklyUpdate\":1725968003052}','object',NULL,NULL),
(27,'plugin_i18n_default_locale','\"en\"','string',NULL,NULL),
(28,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"api/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"api/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"api/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"enabled\":false,\"icon\":\"book\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"},\"patreon\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/patreon/callback\",\"scope\":[\"identity\",\"identity[email]\"]}}','object',NULL,NULL),
(29,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}','object',NULL,NULL),
(30,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}','object',NULL,NULL),
(31,'core_admin_auth','{\"providers\":{\"autoRegister\":false,\"defaultRole\":null,\"ssoLockedRoles\":null}}','object',NULL,NULL),
(32,'plugin_content_manager_configuration_content_types::api::stream.stream','{\"uid\":\"api::stream.stream\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"user\":{\"edit\":{\"label\":\"user\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"user\",\"searchable\":true,\"sortable\":true}},\"song\":{\"edit\":{\"label\":\"song\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"song\",\"searchable\":true,\"sortable\":true}},\"start\":{\"edit\":{\"label\":\"start\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"start\",\"searchable\":true,\"sortable\":true}},\"end\":{\"edit\":{\"label\":\"end\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"end\",\"searchable\":true,\"sortable\":true}},\"uuid\":{\"edit\":{\"label\":\"uuid\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"uuid\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"user\",\"song\",\"start\"],\"edit\":[[{\"name\":\"user\",\"size\":6},{\"name\":\"song\",\"size\":6}],[{\"name\":\"start\",\"size\":6},{\"name\":\"end\",\"size\":6}],[{\"name\":\"uuid\",\"size\":6}]]}}','object',NULL,NULL),
(33,'plugin_content_manager_configuration_content_types::api::download.download','{\"uid\":\"api::download.download\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"device_type\",\"defaultSortBy\":\"device_type\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"user\":{\"edit\":{\"label\":\"user\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"user\",\"searchable\":true,\"sortable\":true}},\"song\":{\"edit\":{\"label\":\"song\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"song\",\"searchable\":true,\"sortable\":true}},\"download_date\":{\"edit\":{\"label\":\"download_date\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"download_date\",\"searchable\":true,\"sortable\":true}},\"device_type\":{\"edit\":{\"label\":\"device_type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"device_type\",\"searchable\":true,\"sortable\":true}},\"ip_address\":{\"edit\":{\"label\":\"ip_address\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ip_address\",\"searchable\":true,\"sortable\":true}},\"location\":{\"edit\":{\"label\":\"location\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"location\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"user\",\"song\",\"download_date\"],\"edit\":[[{\"name\":\"user\",\"size\":6},{\"name\":\"song\",\"size\":6}],[{\"name\":\"download_date\",\"size\":6},{\"name\":\"device_type\",\"size\":6}],[{\"name\":\"ip_address\",\"size\":6},{\"name\":\"location\",\"size\":6}]]}}','object',NULL,NULL),
(34,'plugin_content_manager_configuration_content_types::api::payment.payment','{\"uid\":\"api::payment.payment\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"amount\",\"defaultSortBy\":\"amount\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"user\":{\"edit\":{\"label\":\"user\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"user\",\"searchable\":true,\"sortable\":true}},\"amount\":{\"edit\":{\"label\":\"amount\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"amount\",\"searchable\":true,\"sortable\":true}},\"currency\":{\"edit\":{\"label\":\"currency\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"currency\",\"searchable\":true,\"sortable\":true}},\"method\":{\"edit\":{\"label\":\"method\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"method\",\"searchable\":true,\"sortable\":true}},\"date\":{\"edit\":{\"label\":\"date\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"date\",\"searchable\":true,\"sortable\":true}},\"status\":{\"edit\":{\"label\":\"status\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"status\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"user\",\"amount\",\"currency\"],\"edit\":[[{\"name\":\"user\",\"size\":6},{\"name\":\"amount\",\"size\":6}],[{\"name\":\"currency\",\"size\":6},{\"name\":\"method\",\"size\":6}],[{\"name\":\"date\",\"size\":6},{\"name\":\"status\",\"size\":6}],[{\"name\":\"description\",\"size\":6}]]}}','object',NULL,NULL),
(35,'plugin_content_manager_configuration_content_types::api::subscription.subscription','{\"uid\":\"api::subscription.subscription\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"plan\",\"defaultSortBy\":\"plan\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"user\":{\"edit\":{\"label\":\"user\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"user\",\"searchable\":true,\"sortable\":true}},\"plan\":{\"edit\":{\"label\":\"plan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"plan\",\"searchable\":true,\"sortable\":true}},\"amount\":{\"edit\":{\"label\":\"amount\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"amount\",\"searchable\":true,\"sortable\":true}},\"currency\":{\"edit\":{\"label\":\"currency\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"currency\",\"searchable\":true,\"sortable\":true}},\"start_date\":{\"edit\":{\"label\":\"start_date\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"start_date\",\"searchable\":true,\"sortable\":true}},\"end_date\":{\"edit\":{\"label\":\"end_date\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"end_date\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"user\",\"plan\",\"amount\"],\"edit\":[[{\"name\":\"user\",\"size\":6},{\"name\":\"plan\",\"size\":6}],[{\"name\":\"amount\",\"size\":6},{\"name\":\"currency\",\"size\":6}],[{\"name\":\"start_date\",\"size\":6},{\"name\":\"end_date\",\"size\":6}]]}}','object',NULL,NULL),
(36,'plugin_content_manager_configuration_content_types::api::advertisement.advertisement','{\"uid\":\"api::advertisement.advertisement\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"ad_provider\",\"defaultSortBy\":\"ad_provider\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"ad_provider\":{\"edit\":{\"label\":\"ad_provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ad_provider\",\"searchable\":true,\"sortable\":true}},\"campain_name\":{\"edit\":{\"label\":\"campain_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"campain_name\",\"searchable\":true,\"sortable\":true}},\"amount\":{\"edit\":{\"label\":\"amount\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"amount\",\"searchable\":true,\"sortable\":true}},\"currency\":{\"edit\":{\"label\":\"currency\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"currency\",\"searchable\":true,\"sortable\":true}},\"revenue_date\":{\"edit\":{\"label\":\"revenue_date\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"revenue_date\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"ad_provider\",\"campain_name\",\"amount\"],\"edit\":[[{\"name\":\"ad_provider\",\"size\":6},{\"name\":\"campain_name\",\"size\":6}],[{\"name\":\"amount\",\"size\":6},{\"name\":\"currency\",\"size\":6}],[{\"name\":\"revenue_date\",\"size\":6}]]}}','object',NULL,NULL),
(37,'plugin_content_manager_configuration_content_types::api::on-demand-sale.on-demand-sale','{\"uid\":\"api::on-demand-sale.on-demand-sale\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"amount\",\"defaultSortBy\":\"amount\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"user\":{\"edit\":{\"label\":\"user\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"user\",\"searchable\":true,\"sortable\":true}},\"amount\":{\"edit\":{\"label\":\"amount\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"amount\",\"searchable\":true,\"sortable\":true}},\"currency\":{\"edit\":{\"label\":\"currency\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"currency\",\"searchable\":true,\"sortable\":true}},\"purchase_date\":{\"edit\":{\"label\":\"purchase_date\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"purchase_date\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"user\",\"amount\",\"currency\"],\"edit\":[[{\"name\":\"user\",\"size\":6},{\"name\":\"amount\",\"size\":6}],[{\"name\":\"currency\",\"size\":6},{\"name\":\"purchase_date\",\"size\":6}]]}}','object',NULL,NULL),
(38,'core_admin_project-settings','{\"menuLogo\":{\"name\":\"logo short.png\",\"hash\":\"logo_short_dab278d992\",\"url\":\"/uploads/logo_short_dab278d992.png\",\"width\":150,\"height\":150,\"ext\":\".png\",\"size\":7.95,\"provider\":\"local\"},\"authLogo\":{\"name\":\"logo short.png\",\"hash\":\"logo_short_051f0a997d\",\"url\":\"/uploads/logo_short_051f0a997d.png\",\"width\":150,\"height\":150,\"ext\":\".png\",\"size\":7.95,\"provider\":\"local\"}}','object',NULL,NULL);
/*!40000 ALTER TABLE `strapi_core_store_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_database_schema`
--

DROP TABLE IF EXISTS `strapi_database_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_database_schema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`schema`)),
  `time` datetime DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_database_schema`
--

LOCK TABLES `strapi_database_schema` WRITE;
/*!40000 ALTER TABLE `strapi_database_schema` DISABLE KEYS */;
INSERT INTO `strapi_database_schema` VALUES
(9,'{\"tables\":[{\"name\":\"strapi_core_store_settings\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"value\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"environment\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"tag\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_webhooks\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"url\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"headers\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"events\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"enabled\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"admin_permissions\",\"indexes\":[{\"name\":\"admin_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"action_parameters\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"subject\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"properties\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"conditions\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_users\",\"indexes\":[{\"name\":\"admin_users_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_users_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"firstname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lastname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"username\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"password\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"reset_password_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"registration_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"is_active\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"blocked\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"prefered_language\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_roles\",\"indexes\":[{\"name\":\"admin_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"code\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_api_tokens\",\"indexes\":[{\"name\":\"strapi_api_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_api_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_api_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"access_key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"last_used_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"expires_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lifespan\",\"type\":\"bigInteger\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_api_token_permissions\",\"indexes\":[{\"name\":\"strapi_api_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_api_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_api_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_transfer_tokens\",\"indexes\":[{\"name\":\"strapi_transfer_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_transfer_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_transfer_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_transfer_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"access_key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"last_used_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"expires_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lifespan\",\"type\":\"bigInteger\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_transfer_token_permissions\",\"indexes\":[{\"name\":\"strapi_transfer_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_transfer_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_transfer_token_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_transfer_token_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"files\",\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null},{\"name\":\"files_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"files_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"files_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"files_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"alternative_text\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"caption\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"width\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"height\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"formats\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"hash\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"ext\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"mime\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"size\",\"type\":\"decimal\",\"args\":[10,2],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"url\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"preview_url\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider_metadata\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"folder_path\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"upload_folders\",\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"},{\"name\":\"upload_folders_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"upload_folders_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"upload_folders_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"upload_folders_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"path_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"path\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"i18n_locale\",\"indexes\":[{\"name\":\"i18n_locale_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"i18n_locale_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"i18n_locale_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"i18n_locale_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"code\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_permissions\",\"indexes\":[{\"name\":\"up_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_roles\",\"indexes\":[{\"name\":\"up_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_users\",\"indexes\":[{\"name\":\"up_users_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_users_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"username\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"password\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"reset_password_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"confirmation_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"confirmed\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"blocked\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"advertisements\",\"indexes\":[{\"name\":\"advertisements_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"advertisements_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"advertisements_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"advertisements_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"ad_provider\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"campain_name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"amount\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"currency\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"revenue_date\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"albums\",\"indexes\":[{\"name\":\"albums_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"albums_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"albums_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"albums_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"year\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"artists\",\"indexes\":[{\"name\":\"artists_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"artists_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"artists_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"artists_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"date_naissance\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"adresse\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"pays\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"ville\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"biographie\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"categories\",\"indexes\":[{\"name\":\"categories_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"categories_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"categories_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"categories_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"downloads\",\"indexes\":[{\"name\":\"downloads_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"downloads_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"downloads_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"downloads_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"download_date\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"device_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"ip_address\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"location\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"genres\",\"indexes\":[{\"name\":\"genres_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"genres_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"genres_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"genres_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"likes\",\"indexes\":[{\"name\":\"likes_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"likes_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"likes_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"likes_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"on_demand_sales\",\"indexes\":[{\"name\":\"on_demand_sales_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"on_demand_sales_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"on_demand_sales_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"on_demand_sales_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"amount\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"currency\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"purchase_date\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"payments\",\"indexes\":[{\"name\":\"payments_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"payments_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"payments_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"payments_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"amount\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"currency\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"method\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"date\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"status\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"playlists\",\"indexes\":[{\"name\":\"playlists_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"playlists_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"playlists_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"playlists_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"playlist_songs\",\"indexes\":[{\"name\":\"playlist_songs_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"playlist_songs_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"playlist_songs_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"playlist_songs_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"position\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"revenus\",\"indexes\":[{\"name\":\"revenus_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"revenus_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"revenus_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"revenus_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"montant\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"songs\",\"indexes\":[{\"name\":\"songs_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"songs_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"songs_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"songs_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"date_de_sortie\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"streams\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"pays\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"ville\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"streams\",\"indexes\":[{\"name\":\"streams_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"streams_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"streams_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"streams_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"start\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"end\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"uuid\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"subscriptions\",\"indexes\":[{\"name\":\"subscriptions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"subscriptions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"subscriptions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"subscriptions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"plan\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"amount\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"currency\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"start_date\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"end_date\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_permissions_role_links\",\"indexes\":[{\"name\":\"admin_permissions_role_links_fk\",\"columns\":[\"permission_id\"]},{\"name\":\"admin_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"admin_permissions_role_links_unique\",\"columns\":[\"permission_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"admin_permissions_role_links_order_inv_fk\",\"columns\":[\"permission_order\"]}],\"foreignKeys\":[{\"name\":\"admin_permissions_role_links_fk\",\"columns\":[\"permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"admin_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_users_roles_links\",\"indexes\":[{\"name\":\"admin_users_roles_links_fk\",\"columns\":[\"user_id\"]},{\"name\":\"admin_users_roles_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"admin_users_roles_links_unique\",\"columns\":[\"user_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"admin_users_roles_links_order_fk\",\"columns\":[\"role_order\"]},{\"name\":\"admin_users_roles_links_order_inv_fk\",\"columns\":[\"user_order\"]}],\"foreignKeys\":[{\"name\":\"admin_users_roles_links_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_users\",\"onDelete\":\"CASCADE\"},{\"name\":\"admin_users_roles_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_api_token_permissions_token_links\",\"indexes\":[{\"name\":\"strapi_api_token_permissions_token_links_fk\",\"columns\":[\"api_token_permission_id\"]},{\"name\":\"strapi_api_token_permissions_token_links_inv_fk\",\"columns\":[\"api_token_id\"]},{\"name\":\"strapi_api_token_permissions_token_links_unique\",\"columns\":[\"api_token_permission_id\",\"api_token_id\"],\"type\":\"unique\"},{\"name\":\"strapi_api_token_permissions_token_links_order_inv_fk\",\"columns\":[\"api_token_permission_order\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_token_permissions_token_links_fk\",\"columns\":[\"api_token_permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_api_token_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"strapi_api_token_permissions_token_links_inv_fk\",\"columns\":[\"api_token_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_api_tokens\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"api_token_permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"api_token_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"api_token_permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_transfer_token_permissions_token_links\",\"indexes\":[{\"name\":\"strapi_transfer_token_permissions_token_links_fk\",\"columns\":[\"transfer_token_permission_id\"]},{\"name\":\"strapi_transfer_token_permissions_token_links_inv_fk\",\"columns\":[\"transfer_token_id\"]},{\"name\":\"strapi_transfer_token_permissions_token_links_unique\",\"columns\":[\"transfer_token_permission_id\",\"transfer_token_id\"],\"type\":\"unique\"},{\"name\":\"strapi_transfer_token_permissions_token_links_order_inv_fk\",\"columns\":[\"transfer_token_permission_order\"]}],\"foreignKeys\":[{\"name\":\"strapi_transfer_token_permissions_token_links_fk\",\"columns\":[\"transfer_token_permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_transfer_token_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"strapi_transfer_token_permissions_token_links_inv_fk\",\"columns\":[\"transfer_token_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"strapi_transfer_tokens\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"transfer_token_permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"transfer_token_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"transfer_token_permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"files_related_morphs\",\"indexes\":[{\"name\":\"files_related_morphs_fk\",\"columns\":[\"file_id\"]},{\"name\":\"files_related_morphs_order_index\",\"columns\":[\"order\"]},{\"name\":\"files_related_morphs_id_column_index\",\"columns\":[\"related_id\"]}],\"foreignKeys\":[{\"name\":\"files_related_morphs_fk\",\"columns\":[\"file_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"files\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"file_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"related_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"related_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"files_folder_links\",\"indexes\":[{\"name\":\"files_folder_links_fk\",\"columns\":[\"file_id\"]},{\"name\":\"files_folder_links_inv_fk\",\"columns\":[\"folder_id\"]},{\"name\":\"files_folder_links_unique\",\"columns\":[\"file_id\",\"folder_id\"],\"type\":\"unique\"},{\"name\":\"files_folder_links_order_inv_fk\",\"columns\":[\"file_order\"]}],\"foreignKeys\":[{\"name\":\"files_folder_links_fk\",\"columns\":[\"file_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"files\",\"onDelete\":\"CASCADE\"},{\"name\":\"files_folder_links_inv_fk\",\"columns\":[\"folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"file_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"file_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"upload_folders_parent_links\",\"indexes\":[{\"name\":\"upload_folders_parent_links_fk\",\"columns\":[\"folder_id\"]},{\"name\":\"upload_folders_parent_links_inv_fk\",\"columns\":[\"inv_folder_id\"]},{\"name\":\"upload_folders_parent_links_unique\",\"columns\":[\"folder_id\",\"inv_folder_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_parent_links_order_inv_fk\",\"columns\":[\"folder_order\"]}],\"foreignKeys\":[{\"name\":\"upload_folders_parent_links_fk\",\"columns\":[\"folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"},{\"name\":\"upload_folders_parent_links_inv_fk\",\"columns\":[\"inv_folder_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"upload_folders\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"inv_folder_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"folder_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_permissions_role_links\",\"indexes\":[{\"name\":\"up_permissions_role_links_fk\",\"columns\":[\"permission_id\"]},{\"name\":\"up_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"up_permissions_role_links_unique\",\"columns\":[\"permission_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"up_permissions_role_links_order_inv_fk\",\"columns\":[\"permission_order\"]}],\"foreignKeys\":[{\"name\":\"up_permissions_role_links_fk\",\"columns\":[\"permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"up_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"permission_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_users_role_links\",\"indexes\":[{\"name\":\"up_users_role_links_fk\",\"columns\":[\"user_id\"]},{\"name\":\"up_users_role_links_inv_fk\",\"columns\":[\"role_id\"]},{\"name\":\"up_users_role_links_unique\",\"columns\":[\"user_id\",\"role_id\"],\"type\":\"unique\"},{\"name\":\"up_users_role_links_order_inv_fk\",\"columns\":[\"user_order\"]}],\"foreignKeys\":[{\"name\":\"up_users_role_links_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"},{\"name\":\"up_users_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"albums_artist_links\",\"indexes\":[{\"name\":\"albums_artist_links_fk\",\"columns\":[\"album_id\"]},{\"name\":\"albums_artist_links_inv_fk\",\"columns\":[\"artist_id\"]},{\"name\":\"albums_artist_links_unique\",\"columns\":[\"album_id\",\"artist_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"albums_artist_links_fk\",\"columns\":[\"album_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"albums\",\"onDelete\":\"CASCADE\"},{\"name\":\"albums_artist_links_inv_fk\",\"columns\":[\"artist_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"artists\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"album_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"artist_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"downloads_user_links\",\"indexes\":[{\"name\":\"downloads_user_links_fk\",\"columns\":[\"download_id\"]},{\"name\":\"downloads_user_links_inv_fk\",\"columns\":[\"user_id\"]},{\"name\":\"downloads_user_links_unique\",\"columns\":[\"download_id\",\"user_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"downloads_user_links_fk\",\"columns\":[\"download_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"downloads\",\"onDelete\":\"CASCADE\"},{\"name\":\"downloads_user_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"download_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"downloads_song_links\",\"indexes\":[{\"name\":\"downloads_song_links_fk\",\"columns\":[\"download_id\"]},{\"name\":\"downloads_song_links_inv_fk\",\"columns\":[\"song_id\"]},{\"name\":\"downloads_song_links_unique\",\"columns\":[\"download_id\",\"song_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"downloads_song_links_fk\",\"columns\":[\"download_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"downloads\",\"onDelete\":\"CASCADE\"},{\"name\":\"downloads_song_links_inv_fk\",\"columns\":[\"song_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"songs\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"download_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"song_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"genres_artist_links\",\"indexes\":[{\"name\":\"genres_artist_links_fk\",\"columns\":[\"genre_id\"]},{\"name\":\"genres_artist_links_inv_fk\",\"columns\":[\"artist_id\"]},{\"name\":\"genres_artist_links_unique\",\"columns\":[\"genre_id\",\"artist_id\"],\"type\":\"unique\"},{\"name\":\"genres_artist_links_order_inv_fk\",\"columns\":[\"genre_order\"]}],\"foreignKeys\":[{\"name\":\"genres_artist_links_fk\",\"columns\":[\"genre_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"genres\",\"onDelete\":\"CASCADE\"},{\"name\":\"genres_artist_links_inv_fk\",\"columns\":[\"artist_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"artists\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"genre_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"artist_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"genre_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"likes_user_links\",\"indexes\":[{\"name\":\"likes_user_links_fk\",\"columns\":[\"like_id\"]},{\"name\":\"likes_user_links_inv_fk\",\"columns\":[\"user_id\"]},{\"name\":\"likes_user_links_unique\",\"columns\":[\"like_id\",\"user_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"likes_user_links_fk\",\"columns\":[\"like_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"likes\",\"onDelete\":\"CASCADE\"},{\"name\":\"likes_user_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"like_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"likes_song_links\",\"indexes\":[{\"name\":\"likes_song_links_fk\",\"columns\":[\"like_id\"]},{\"name\":\"likes_song_links_inv_fk\",\"columns\":[\"song_id\"]},{\"name\":\"likes_song_links_unique\",\"columns\":[\"like_id\",\"song_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"likes_song_links_fk\",\"columns\":[\"like_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"likes\",\"onDelete\":\"CASCADE\"},{\"name\":\"likes_song_links_inv_fk\",\"columns\":[\"song_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"songs\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"like_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"song_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"on_demand_sales_user_links\",\"indexes\":[{\"name\":\"on_demand_sales_user_links_fk\",\"columns\":[\"on_demand_sale_id\"]},{\"name\":\"on_demand_sales_user_links_inv_fk\",\"columns\":[\"user_id\"]},{\"name\":\"on_demand_sales_user_links_unique\",\"columns\":[\"on_demand_sale_id\",\"user_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"on_demand_sales_user_links_fk\",\"columns\":[\"on_demand_sale_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"on_demand_sales\",\"onDelete\":\"CASCADE\"},{\"name\":\"on_demand_sales_user_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"on_demand_sale_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"payments_user_links\",\"indexes\":[{\"name\":\"payments_user_links_fk\",\"columns\":[\"payment_id\"]},{\"name\":\"payments_user_links_inv_fk\",\"columns\":[\"user_id\"]},{\"name\":\"payments_user_links_unique\",\"columns\":[\"payment_id\",\"user_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"payments_user_links_fk\",\"columns\":[\"payment_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"payments\",\"onDelete\":\"CASCADE\"},{\"name\":\"payments_user_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"payment_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"playlists_user_links\",\"indexes\":[{\"name\":\"playlists_user_links_fk\",\"columns\":[\"playlist_id\"]},{\"name\":\"playlists_user_links_inv_fk\",\"columns\":[\"user_id\"]},{\"name\":\"playlists_user_links_unique\",\"columns\":[\"playlist_id\",\"user_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"playlists_user_links_fk\",\"columns\":[\"playlist_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"playlists\",\"onDelete\":\"CASCADE\"},{\"name\":\"playlists_user_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"playlist_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"playlist_songs_playlist_links\",\"indexes\":[{\"name\":\"playlist_songs_playlist_links_fk\",\"columns\":[\"playlist_song_id\"]},{\"name\":\"playlist_songs_playlist_links_inv_fk\",\"columns\":[\"playlist_id\"]},{\"name\":\"playlist_songs_playlist_links_unique\",\"columns\":[\"playlist_song_id\",\"playlist_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"playlist_songs_playlist_links_fk\",\"columns\":[\"playlist_song_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"playlist_songs\",\"onDelete\":\"CASCADE\"},{\"name\":\"playlist_songs_playlist_links_inv_fk\",\"columns\":[\"playlist_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"playlists\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"playlist_song_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"playlist_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"playlist_songs_song_links\",\"indexes\":[{\"name\":\"playlist_songs_song_links_fk\",\"columns\":[\"playlist_song_id\"]},{\"name\":\"playlist_songs_song_links_inv_fk\",\"columns\":[\"song_id\"]},{\"name\":\"playlist_songs_song_links_unique\",\"columns\":[\"playlist_song_id\",\"song_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"playlist_songs_song_links_fk\",\"columns\":[\"playlist_song_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"playlist_songs\",\"onDelete\":\"CASCADE\"},{\"name\":\"playlist_songs_song_links_inv_fk\",\"columns\":[\"song_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"songs\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"playlist_song_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"song_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"revenus_artist_links\",\"indexes\":[{\"name\":\"revenus_artist_links_fk\",\"columns\":[\"revenu_id\"]},{\"name\":\"revenus_artist_links_inv_fk\",\"columns\":[\"artist_id\"]},{\"name\":\"revenus_artist_links_unique\",\"columns\":[\"revenu_id\",\"artist_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"revenus_artist_links_fk\",\"columns\":[\"revenu_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"revenus\",\"onDelete\":\"CASCADE\"},{\"name\":\"revenus_artist_links_inv_fk\",\"columns\":[\"artist_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"artists\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"revenu_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"artist_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"songs_artist_links\",\"indexes\":[{\"name\":\"songs_artist_links_fk\",\"columns\":[\"song_id\"]},{\"name\":\"songs_artist_links_inv_fk\",\"columns\":[\"artist_id\"]},{\"name\":\"songs_artist_links_unique\",\"columns\":[\"song_id\",\"artist_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"songs_artist_links_fk\",\"columns\":[\"song_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"songs\",\"onDelete\":\"CASCADE\"},{\"name\":\"songs_artist_links_inv_fk\",\"columns\":[\"artist_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"artists\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"song_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"artist_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"songs_genre_links\",\"indexes\":[{\"name\":\"songs_genre_links_fk\",\"columns\":[\"song_id\"]},{\"name\":\"songs_genre_links_inv_fk\",\"columns\":[\"genre_id\"]},{\"name\":\"songs_genre_links_unique\",\"columns\":[\"song_id\",\"genre_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"songs_genre_links_fk\",\"columns\":[\"song_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"songs\",\"onDelete\":\"CASCADE\"},{\"name\":\"songs_genre_links_inv_fk\",\"columns\":[\"genre_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"genres\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"song_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"genre_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"songs_album_links\",\"indexes\":[{\"name\":\"songs_album_links_fk\",\"columns\":[\"song_id\"]},{\"name\":\"songs_album_links_inv_fk\",\"columns\":[\"album_id\"]},{\"name\":\"songs_album_links_unique\",\"columns\":[\"song_id\",\"album_id\"],\"type\":\"unique\"},{\"name\":\"songs_album_links_order_inv_fk\",\"columns\":[\"song_order\"]}],\"foreignKeys\":[{\"name\":\"songs_album_links_fk\",\"columns\":[\"song_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"songs\",\"onDelete\":\"CASCADE\"},{\"name\":\"songs_album_links_inv_fk\",\"columns\":[\"album_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"albums\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"song_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"album_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"song_order\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"streams_user_links\",\"indexes\":[{\"name\":\"streams_user_links_fk\",\"columns\":[\"stream_id\"]},{\"name\":\"streams_user_links_inv_fk\",\"columns\":[\"user_id\"]},{\"name\":\"streams_user_links_unique\",\"columns\":[\"stream_id\",\"user_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"streams_user_links_fk\",\"columns\":[\"stream_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"streams\",\"onDelete\":\"CASCADE\"},{\"name\":\"streams_user_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"stream_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"streams_song_links\",\"indexes\":[{\"name\":\"streams_song_links_fk\",\"columns\":[\"stream_id\"]},{\"name\":\"streams_song_links_inv_fk\",\"columns\":[\"song_id\"]},{\"name\":\"streams_song_links_unique\",\"columns\":[\"stream_id\",\"song_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"streams_song_links_fk\",\"columns\":[\"stream_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"streams\",\"onDelete\":\"CASCADE\"},{\"name\":\"streams_song_links_inv_fk\",\"columns\":[\"song_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"songs\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"stream_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"song_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"subscriptions_user_links\",\"indexes\":[{\"name\":\"subscriptions_user_links_fk\",\"columns\":[\"subscription_id\"]},{\"name\":\"subscriptions_user_links_inv_fk\",\"columns\":[\"user_id\"]},{\"name\":\"subscriptions_user_links_unique\",\"columns\":[\"subscription_id\",\"user_id\"],\"type\":\"unique\"}],\"foreignKeys\":[{\"name\":\"subscriptions_user_links_fk\",\"columns\":[\"subscription_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"subscriptions\",\"onDelete\":\"CASCADE\"},{\"name\":\"subscriptions_user_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"subscription_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]}]}','2024-07-22 15:30:15','581cf8bdfc0878de464a0e34468c9f5c');
/*!40000 ALTER TABLE `strapi_database_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_migrations`
--

DROP TABLE IF EXISTS `strapi_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_migrations`
--

LOCK TABLES `strapi_migrations` WRITE;
/*!40000 ALTER TABLE `strapi_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_token_permissions`
--

DROP TABLE IF EXISTS `strapi_transfer_token_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_transfer_token_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_transfer_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_transfer_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_transfer_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_transfer_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_token_permissions`
--

LOCK TABLES `strapi_transfer_token_permissions` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_token_permissions_token_links`
--

DROP TABLE IF EXISTS `strapi_transfer_token_permissions_token_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_transfer_token_permissions_token_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transfer_token_permission_id` int(10) unsigned DEFAULT NULL,
  `transfer_token_id` int(10) unsigned DEFAULT NULL,
  `transfer_token_permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_transfer_token_permissions_token_links_unique` (`transfer_token_permission_id`,`transfer_token_id`),
  KEY `strapi_transfer_token_permissions_token_links_fk` (`transfer_token_permission_id`),
  KEY `strapi_transfer_token_permissions_token_links_inv_fk` (`transfer_token_id`),
  KEY `strapi_transfer_token_permissions_token_links_order_inv_fk` (`transfer_token_permission_order`),
  CONSTRAINT `strapi_transfer_token_permissions_token_links_fk` FOREIGN KEY (`transfer_token_permission_id`) REFERENCES `strapi_transfer_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_transfer_token_permissions_token_links_inv_fk` FOREIGN KEY (`transfer_token_id`) REFERENCES `strapi_transfer_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_token_permissions_token_links`
--

LOCK TABLES `strapi_transfer_token_permissions_token_links` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions_token_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions_token_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_tokens`
--

DROP TABLE IF EXISTS `strapi_transfer_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_transfer_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_transfer_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_transfer_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_transfer_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_transfer_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_tokens`
--

LOCK TABLES `strapi_transfer_tokens` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_webhooks`
--

DROP TABLE IF EXISTS `strapi_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`)),
  `events` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`events`)),
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_webhooks`
--

LOCK TABLES `strapi_webhooks` WRITE;
/*!40000 ALTER TABLE `strapi_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streams`
--

DROP TABLE IF EXISTS `streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start` datetime(6) DEFAULT NULL,
  `end` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `streams_created_by_id_fk` (`created_by_id`),
  KEY `streams_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `streams_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `streams_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streams`
--

LOCK TABLES `streams` WRITE;
/*!40000 ALTER TABLE `streams` DISABLE KEYS */;
INSERT INTO `streams` VALUES
(3254,'2024-04-15 08:47:08.201000','2024-04-15 08:47:08.240000','2024-04-15 08:47:12.101000','2024-04-15 08:47:12.101000','2024-04-15 08:47:12.090000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3255,'2024-04-15 08:47:08.240000','2024-04-15 08:47:08.283000','2024-04-15 08:47:12.168000','2024-04-15 08:47:12.168000','2024-04-15 08:47:12.135000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3256,'2024-04-15 08:47:08.283000','2024-04-15 08:47:08.326000','2024-04-15 08:47:12.172000','2024-04-15 08:47:12.172000','2024-04-15 08:47:12.155000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3257,'2024-04-15 08:47:08.326000','2024-04-15 08:47:08.369000','2024-04-15 08:47:12.248000','2024-04-15 08:47:12.248000','2024-04-15 08:47:12.202000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3258,'2024-04-15 08:47:08.368000','2024-04-15 08:47:08.413000','2024-04-15 08:47:12.260000','2024-04-15 08:47:12.260000','2024-04-15 08:47:12.227000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3259,'2024-04-15 08:47:08.413000','2024-04-15 08:47:08.456000','2024-04-15 08:47:12.320000','2024-04-15 08:47:12.320000','2024-04-15 08:47:12.290000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3260,'2024-04-15 08:47:08.456000','2024-04-15 08:47:08.497000','2024-04-15 08:47:12.384000','2024-04-15 08:47:12.384000','2024-04-15 08:47:12.374000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3261,'2024-04-15 08:47:08.497000','2024-04-15 08:47:08.541000','2024-04-15 08:47:12.436000','2024-04-15 08:47:12.436000','2024-04-15 08:47:12.427000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3262,'2024-04-15 08:47:08.541000','2024-04-15 08:47:08.584000','2024-04-15 08:47:12.478000','2024-04-15 08:47:12.478000','2024-04-15 08:47:12.450000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3263,'2024-04-15 08:47:08.582000','2024-04-15 08:47:08.629000','2024-04-15 08:47:12.588000','2024-04-15 08:47:12.588000','2024-04-15 08:47:12.539000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3264,'2024-04-15 08:47:08.629000','2024-04-15 08:47:08.671000','2024-04-15 08:47:12.590000','2024-04-15 08:47:12.590000','2024-04-15 08:47:12.551000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3265,'2024-04-15 08:47:08.671000','2024-04-15 08:47:08.727000','2024-04-15 08:47:12.595000','2024-04-15 08:47:12.595000','2024-04-15 08:47:12.566000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3266,'2024-04-15 08:47:08.726000','2024-04-15 08:47:08.787000','2024-04-15 08:47:12.637000','2024-04-15 08:47:12.637000','2024-04-15 08:47:12.613000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3267,'2024-04-15 08:47:08.786000','2024-04-15 08:47:08.842000','2024-04-15 08:47:12.725000','2024-04-15 08:47:12.725000','2024-04-15 08:47:12.714000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3268,'2024-04-15 08:47:08.841000','2024-04-15 08:47:08.884000','2024-04-15 08:47:12.772000','2024-04-15 08:47:12.772000','2024-04-15 08:47:12.766000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3269,'2024-04-15 08:47:08.921000','2024-04-15 08:47:08.972000','2024-04-15 08:47:12.860000','2024-04-15 08:47:12.860000','2024-04-15 08:47:12.842000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3270,'2024-04-15 08:47:08.972000','2024-04-15 08:47:09.013000','2024-04-15 08:47:12.946000','2024-04-15 08:47:12.946000','2024-04-15 08:47:12.881000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3271,'2024-04-15 08:47:08.884000','2024-04-15 08:47:08.922000','2024-04-15 08:47:12.952000','2024-04-15 08:47:12.952000','2024-04-15 08:47:12.899000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3272,'2024-04-15 08:47:09.013000','2024-04-15 08:47:09.052000','2024-04-15 08:47:12.954000','2024-04-15 08:47:12.954000','2024-04-15 08:47:12.908000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3273,'2024-04-15 08:47:09.052000','2024-04-15 08:47:09.095000','2024-04-15 08:47:12.975000','2024-04-15 08:47:12.975000','2024-04-15 08:47:12.958000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3274,'2024-04-15 08:47:09.094000','2024-04-15 08:47:09.137000','2024-04-15 08:47:13.020000','2024-04-15 08:47:13.020000','2024-04-15 08:47:12.995000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3275,'2024-04-15 08:47:09.137000','2024-04-15 08:47:09.180000','2024-04-15 08:47:13.151000','2024-04-15 08:47:13.151000','2024-04-15 08:47:13.139000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3276,'2024-04-15 08:47:09.641000','2024-04-15 08:47:10.138000','2024-04-15 08:47:13.243000','2024-04-15 08:47:13.243000','2024-04-15 08:47:13.202000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3277,'2024-04-15 08:47:09.179000','2024-04-15 08:47:09.263000','2024-04-15 08:47:13.246000','2024-04-15 08:47:13.246000','2024-04-15 08:47:13.212000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3278,'2024-04-15 08:47:09.262000','2024-04-15 08:47:09.642000','2024-04-15 08:47:13.252000','2024-04-15 08:47:13.252000','2024-04-15 08:47:13.228000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3279,'2024-04-15 08:47:10.137000','2024-04-15 08:47:10.235000','2024-04-15 08:47:13.349000','2024-04-15 08:47:13.349000','2024-04-15 08:47:13.295000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3280,'2024-04-15 08:47:10.234000','2024-04-15 08:47:10.596000','2024-04-15 08:47:16.326000','2024-04-15 08:47:16.326000','2024-04-15 08:47:16.314000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3281,'2024-04-15 08:47:10.971000','2024-04-15 08:47:11.186000','2024-04-15 08:47:16.490000','2024-04-15 08:47:16.490000','2024-04-15 08:47:16.465000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3282,'2024-04-15 08:47:10.595000','2024-04-15 08:47:10.972000','2024-04-15 08:47:16.579000','2024-04-15 08:47:16.579000','2024-04-15 08:47:16.530000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3283,'2024-04-15 08:47:11.185000','2024-04-15 08:47:11.427000','2024-04-15 08:47:16.588000','2024-04-15 08:47:16.588000','2024-04-15 08:47:16.541000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3284,'2024-04-15 08:47:11.427000','2024-04-15 08:47:11.526000','2024-04-15 08:47:16.591000','2024-04-15 08:47:16.591000','2024-04-15 08:47:16.549000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3285,'2024-04-15 08:47:11.526000','2024-04-15 08:47:11.964000','2024-04-15 08:47:16.592000','2024-04-15 08:47:16.592000','2024-04-15 08:47:16.570000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3286,'2024-04-15 08:47:11.963000','2024-04-15 08:47:12.335000','2024-04-15 08:47:16.773000','2024-04-15 08:47:16.773000','2024-04-15 08:47:16.765000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3287,'2024-04-15 08:47:12.975000','2024-04-15 08:47:13.643000','2024-04-15 08:47:16.893000','2024-04-15 08:47:16.893000','2024-04-15 08:47:16.819000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3288,'2024-04-15 08:47:12.335000','2024-04-15 08:47:12.976000','2024-04-15 08:47:16.900000','2024-04-15 08:47:16.900000','2024-04-15 08:47:16.839000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3289,'2024-04-15 08:47:14.103000','2024-04-15 08:47:14.819000','2024-04-15 08:47:16.908000','2024-04-15 08:47:16.908000','2024-04-15 08:47:16.859000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3290,'2024-04-15 08:47:13.642000','2024-04-15 08:47:14.104000','2024-04-15 08:47:16.911000','2024-04-15 08:47:16.911000','2024-04-15 08:47:16.878000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3291,'2024-04-15 08:47:14.818000','2024-04-15 08:47:14.871000','2024-04-15 08:47:17.008000','2024-04-15 08:47:17.008000','2024-04-15 08:47:16.998000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3292,'2024-04-15 08:47:14.871000','2024-04-15 08:47:14.914000','2024-04-15 08:47:17.057000','2024-04-15 08:47:17.057000','2024-04-15 08:47:17.049000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3293,'2024-04-15 08:47:14.913000','2024-04-15 08:47:14.957000','2024-04-15 08:47:17.093000','2024-04-15 08:47:17.093000','2024-04-15 08:47:17.081000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3294,'2024-04-15 08:47:15.010000','2024-04-15 08:47:15.048000','2024-04-15 08:47:17.157000','2024-04-15 08:47:17.157000','2024-04-15 08:47:17.122000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3295,'2024-04-15 08:47:14.957000','2024-04-15 08:47:15.011000','2024-04-15 08:47:17.160000','2024-04-15 08:47:17.160000','2024-04-15 08:47:17.137000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3296,'2024-04-15 08:47:15.047000','2024-04-15 08:47:15.094000','2024-04-15 08:47:17.167000','2024-04-15 08:47:17.167000','2024-04-15 08:47:17.142000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3297,'2024-04-15 08:47:15.093000','2024-04-15 08:47:15.144000','2024-04-15 08:47:17.210000','2024-04-15 08:47:17.210000','2024-04-15 08:47:17.192000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3298,'2024-04-15 08:47:15.144000','2024-04-15 08:47:15.188000','2024-04-15 08:47:17.265000','2024-04-15 08:47:17.265000','2024-04-15 08:47:17.242000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3299,'2024-04-15 08:47:15.188000','2024-04-15 08:47:15.232000','2024-04-15 08:47:17.326000','2024-04-15 08:47:17.326000','2024-04-15 08:47:17.317000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3300,'2024-04-15 08:47:15.232000','2024-04-15 08:47:15.270000','2024-04-15 08:47:17.360000','2024-04-15 08:47:17.360000','2024-04-15 08:47:17.347000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3301,'2024-04-15 08:47:15.269000','2024-04-15 08:47:15.322000','2024-04-15 08:47:17.390000','2024-04-15 08:47:17.390000','2024-04-15 08:47:17.379000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3302,'2024-04-15 08:47:15.322000','2024-04-15 08:47:15.382000','2024-04-15 08:47:17.421000','2024-04-15 08:47:17.421000','2024-04-15 08:47:17.408000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3303,'2024-04-15 08:47:15.382000','2024-04-15 08:47:15.490000','2024-04-15 08:47:17.469000','2024-04-15 08:47:17.469000','2024-04-15 08:47:17.461000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3304,'2024-04-15 08:47:15.490000','2024-04-15 08:47:15.541000','2024-04-15 08:47:17.495000','2024-04-15 08:47:17.495000','2024-04-15 08:47:17.486000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3305,'2024-04-15 08:47:15.540000','2024-04-15 08:47:15.582000','2024-04-15 08:47:17.524000','2024-04-15 08:47:17.524000','2024-04-15 08:47:17.512000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3306,'2024-04-15 08:47:15.582000','2024-04-15 08:47:15.622000','2024-04-15 08:47:17.563000','2024-04-15 08:47:17.563000','2024-04-15 08:47:17.554000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3307,'2024-04-15 08:47:15.621000','2024-04-15 08:47:15.668000','2024-04-15 08:47:17.621000','2024-04-15 08:47:17.621000','2024-04-15 08:47:17.607000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3308,'2024-04-15 08:47:15.667000','2024-04-15 08:47:15.710000','2024-04-15 08:47:17.670000','2024-04-15 08:47:17.670000','2024-04-15 08:47:17.654000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3309,'2024-04-15 08:47:15.710000','2024-04-15 08:47:15.775000','2024-04-15 08:47:17.709000','2024-04-15 08:47:17.709000','2024-04-15 08:47:17.698000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3310,'2024-04-15 08:47:15.774000','2024-04-15 08:47:15.828000','2024-04-15 08:47:17.740000','2024-04-15 08:47:17.740000','2024-04-15 08:47:17.733000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3311,'2024-04-15 08:47:15.827000','2024-04-15 08:47:15.877000','2024-04-15 08:47:17.818000','2024-04-15 08:47:17.818000','2024-04-15 08:47:17.798000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3312,'2024-04-15 08:47:15.877000','2024-04-15 08:47:15.924000','2024-04-15 08:47:17.861000','2024-04-15 08:47:17.861000','2024-04-15 08:47:17.843000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3313,'2024-04-15 08:47:15.923000','2024-04-15 08:47:15.971000','2024-04-15 08:47:17.876000','2024-04-15 08:47:17.876000','2024-04-15 08:47:17.866000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3314,'2024-04-15 08:47:15.971000','2024-04-15 08:47:16.017000','2024-04-15 08:47:17.945000','2024-04-15 08:47:17.945000','2024-04-15 08:47:17.910000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3315,'2024-04-15 08:47:16.016000','2024-04-15 08:47:16.066000','2024-04-15 08:47:17.948000','2024-04-15 08:47:17.948000','2024-04-15 08:47:17.924000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3316,'2024-04-15 08:47:16.066000','2024-04-15 08:47:16.120000','2024-04-15 08:47:17.952000','2024-04-15 08:47:17.952000','2024-04-15 08:47:17.929000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3317,'2024-04-15 08:47:16.120000','2024-04-15 08:47:16.177000','2024-04-15 08:47:18.068000','2024-04-15 08:47:18.068000','2024-04-15 08:47:18.058000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3318,'2024-04-15 08:47:16.176000','2024-04-15 08:47:16.227000','2024-04-15 08:47:18.100000','2024-04-15 08:47:18.100000','2024-04-15 08:47:18.083000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3319,'2024-04-15 08:47:16.226000','2024-04-15 08:47:16.284000','2024-04-15 08:47:18.166000','2024-04-15 08:47:18.166000','2024-04-15 08:47:18.134000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3320,'2024-04-15 08:47:16.283000','2024-04-15 08:47:16.337000','2024-04-15 08:47:18.172000','2024-04-15 08:47:18.172000','2024-04-15 08:47:18.150000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3321,'2024-04-15 08:47:16.336000','2024-04-15 08:47:16.388000','2024-04-15 08:47:18.215000','2024-04-15 08:47:18.215000','2024-04-15 08:47:18.190000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3322,'2024-04-15 08:47:16.387000','2024-04-15 08:47:16.439000','2024-04-15 08:47:18.229000','2024-04-15 08:47:18.229000','2024-04-15 08:47:18.212000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3323,'2024-04-15 08:47:16.439000','2024-04-15 08:47:16.491000','2024-04-15 08:47:18.286000','2024-04-15 08:47:18.286000','2024-04-15 08:47:18.278000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3324,'2024-04-15 08:47:16.490000','2024-04-15 08:47:16.538000','2024-04-15 08:47:18.349000','2024-04-15 08:47:18.349000','2024-04-15 08:47:18.338000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3325,'2024-04-15 08:47:16.580000','2024-04-15 08:47:16.623000','2024-04-15 08:47:18.404000','2024-04-15 08:47:18.404000','2024-04-15 08:47:18.384000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3326,'2024-04-15 08:47:16.538000','2024-04-15 08:47:16.581000','2024-04-15 08:47:18.412000','2024-04-15 08:47:18.412000','2024-04-15 08:47:18.393000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3327,'2024-04-15 08:47:16.665000','2024-04-15 08:47:16.717000','2024-04-15 08:47:18.473000','2024-04-15 08:47:18.473000','2024-04-15 08:47:18.442000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3328,'2024-04-15 08:47:16.622000','2024-04-15 08:47:16.666000','2024-04-15 08:47:18.475000','2024-04-15 08:47:18.475000','2024-04-15 08:47:18.450000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3329,'2024-04-15 08:47:16.716000','2024-04-15 08:47:16.762000','2024-04-15 08:47:18.481000','2024-04-15 08:47:18.481000','2024-04-15 08:47:18.463000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3330,'2024-04-15 08:47:16.762000','2024-04-15 08:47:16.808000','2024-04-15 08:47:18.552000','2024-04-15 08:47:18.552000','2024-04-15 08:47:18.538000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3331,'2024-04-15 08:47:16.808000','2024-04-15 08:47:16.871000','2024-04-15 08:47:18.621000','2024-04-15 08:47:18.621000','2024-04-15 08:47:18.605000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3332,'2024-04-15 08:47:16.870000','2024-04-15 08:47:16.940000','2024-04-15 08:47:18.650000','2024-04-15 08:47:18.650000','2024-04-15 08:47:18.638000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3333,'2024-04-15 08:47:16.939000','2024-04-15 08:47:16.997000','2024-04-15 08:47:18.684000','2024-04-15 08:47:18.684000','2024-04-15 08:47:18.663000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3334,'2024-04-15 08:47:16.996000','2024-04-15 08:47:17.285000','2024-04-15 08:47:18.721000','2024-04-15 08:47:18.721000','2024-04-15 08:47:18.690000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3335,'2024-04-15 08:47:17.284000','2024-04-15 08:47:17.578000','2024-04-15 08:47:18.779000','2024-04-15 08:47:18.779000','2024-04-15 08:47:18.737000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3336,'2024-04-15 08:47:17.577000','2024-04-15 08:47:17.656000','2024-04-15 08:47:18.785000','2024-04-15 08:47:18.785000','2024-04-15 08:47:18.754000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3337,'2024-04-15 08:47:17.655000','2024-04-15 08:47:17.949000','2024-04-15 08:47:18.848000','2024-04-15 08:47:18.848000','2024-04-15 08:47:18.842000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3338,'2024-04-15 08:47:17.948000','2024-04-15 08:47:18.240000','2024-04-15 08:47:22.107000','2024-04-15 08:47:22.107000','2024-04-15 08:47:19.296000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3339,'2024-04-15 08:47:18.239000','2024-04-15 08:47:18.713000','2024-04-15 08:47:22.109000','2024-04-15 08:47:22.109000','2024-04-15 08:47:19.307000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3340,'2024-04-15 08:47:18.712000','2024-04-15 08:47:19.255000','2024-04-15 08:47:22.111000','2024-04-15 08:47:22.111000','2024-04-15 08:47:19.320000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3341,'2024-04-15 08:47:19.254000','2024-04-15 08:47:20.330000','2024-04-15 08:47:22.419000','2024-04-15 08:47:22.419000','2024-04-15 08:47:22.317000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3342,'2024-04-15 08:47:20.329000','2024-04-15 08:47:20.707000','2024-04-15 08:47:22.422000','2024-04-15 08:47:22.422000','2024-04-15 08:47:22.386000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3343,'2024-04-15 08:47:20.707000','2024-04-15 08:47:20.774000','2024-04-15 08:47:22.568000','2024-04-15 08:47:22.568000','2024-04-15 08:47:22.554000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3344,'2024-04-15 08:47:20.774000','2024-04-15 08:47:20.875000','2024-04-15 08:47:22.610000','2024-04-15 08:47:22.610000','2024-04-15 08:47:22.587000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3345,'2024-04-15 08:47:20.875000','2024-04-15 08:47:20.912000','2024-04-15 08:47:22.628000','2024-04-15 08:47:22.628000','2024-04-15 08:47:22.597000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3346,'2024-04-15 08:47:20.951000','2024-04-15 08:47:20.992000','2024-04-15 08:47:22.721000','2024-04-15 08:47:22.721000','2024-04-15 08:47:22.687000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3347,'2024-04-15 08:47:20.912000','2024-04-15 08:47:20.952000','2024-04-15 08:47:22.728000','2024-04-15 08:47:22.728000','2024-04-15 08:47:22.709000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3348,'2024-04-15 08:47:20.991000','2024-04-15 08:47:21.036000','2024-04-15 08:47:22.796000','2024-04-15 08:47:22.796000','2024-04-15 08:47:22.767000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3349,'2024-04-15 08:47:21.035000','2024-04-15 08:47:21.077000','2024-04-15 08:47:22.848000','2024-04-15 08:47:22.848000','2024-04-15 08:47:22.834000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3350,'2024-04-15 08:47:21.076000','2024-04-15 08:47:21.119000','2024-04-15 08:47:22.912000','2024-04-15 08:47:22.912000','2024-04-15 08:47:22.886000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3351,'2024-04-15 08:47:21.119000','2024-04-15 08:47:21.161000','2024-04-15 08:47:22.916000','2024-04-15 08:47:22.916000','2024-04-15 08:47:22.902000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3352,'2024-04-15 08:47:21.161000','2024-04-15 08:47:21.207000','2024-04-15 08:47:22.958000','2024-04-15 08:47:22.958000','2024-04-15 08:47:22.945000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3353,'2024-04-15 08:47:21.205000','2024-04-15 08:47:21.250000','2024-04-15 08:47:22.999000','2024-04-15 08:47:22.999000','2024-04-15 08:47:22.984000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3354,'2024-04-15 08:47:21.249000','2024-04-15 08:47:21.290000','2024-04-15 08:47:23.053000','2024-04-15 08:47:23.053000','2024-04-15 08:47:23.026000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3355,'2024-04-15 08:47:21.289000','2024-04-15 08:47:21.336000','2024-04-15 08:47:23.055000','2024-04-15 08:47:23.055000','2024-04-15 08:47:23.031000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3356,'2024-04-15 08:47:21.336000','2024-04-15 08:47:21.375000','2024-04-15 08:47:23.161000','2024-04-15 08:47:23.161000','2024-04-15 08:47:23.113000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3357,'2024-04-15 08:47:21.375000','2024-04-15 08:47:21.434000','2024-04-15 08:47:23.176000','2024-04-15 08:47:23.176000','2024-04-15 08:47:23.118000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3358,'2024-04-15 08:47:21.434000','2024-04-15 08:47:21.490000','2024-04-15 08:47:23.256000','2024-04-15 08:47:23.256000','2024-04-15 08:47:23.233000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3359,'2024-04-15 08:47:21.489000','2024-04-15 08:47:21.534000','2024-04-15 08:47:23.344000','2024-04-15 08:47:23.344000','2024-04-15 08:47:23.307000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3360,'2024-04-15 08:47:21.534000','2024-04-15 08:47:21.572000','2024-04-15 08:47:23.346000','2024-04-15 08:47:23.346000','2024-04-15 08:47:23.322000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3361,'2024-04-15 08:47:21.571000','2024-04-15 08:47:21.638000','2024-04-15 08:47:23.401000','2024-04-15 08:47:23.401000','2024-04-15 08:47:23.374000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3362,'2024-04-15 08:47:21.637000','2024-04-15 08:47:21.701000','2024-04-15 08:47:23.513000','2024-04-15 08:47:23.513000','2024-04-15 08:47:23.483000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3363,'2024-04-15 08:47:21.701000','2024-04-15 08:47:21.768000','2024-04-15 08:47:23.515000','2024-04-15 08:47:23.515000','2024-04-15 08:47:23.502000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3364,'2024-04-15 08:47:21.768000','2024-04-15 08:47:21.829000','2024-04-15 08:47:23.574000','2024-04-15 08:47:23.574000','2024-04-15 08:47:23.551000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3365,'2024-04-15 08:47:21.828000','2024-04-15 08:47:21.892000','2024-04-15 08:47:23.691000','2024-04-15 08:47:23.691000','2024-04-15 08:47:23.650000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3366,'2024-04-15 08:47:21.891000','2024-04-15 08:47:21.949000','2024-04-15 08:47:23.696000','2024-04-15 08:47:23.696000','2024-04-15 08:47:23.678000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3367,'2024-04-15 08:47:21.948000','2024-04-15 08:47:22.005000','2024-04-15 08:47:23.773000','2024-04-15 08:47:23.773000','2024-04-15 08:47:23.738000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3368,'2024-04-15 08:47:22.004000','2024-04-15 08:47:22.064000','2024-04-15 08:47:23.782000','2024-04-15 08:47:23.782000','2024-04-15 08:47:23.756000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3369,'2024-04-15 08:47:22.063000','2024-04-15 08:47:22.117000','2024-04-15 08:47:23.783000','2024-04-15 08:47:23.783000','2024-04-15 08:47:23.770000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3370,'2024-04-15 08:47:22.117000','2024-04-15 08:47:22.175000','2024-04-15 08:47:23.864000','2024-04-15 08:47:23.864000','2024-04-15 08:47:23.851000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3371,'2024-04-15 08:47:22.174000','2024-04-15 08:47:22.230000','2024-04-15 08:47:23.952000','2024-04-15 08:47:23.952000','2024-04-15 08:47:23.922000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3372,'2024-04-15 08:47:22.230000','2024-04-15 08:47:22.288000','2024-04-15 08:47:24.105000','2024-04-15 08:47:24.105000','2024-04-15 08:47:24.027000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3373,'2024-04-15 08:47:22.288000','2024-04-15 08:47:22.348000','2024-04-15 08:47:24.112000','2024-04-15 08:47:24.112000','2024-04-15 08:47:24.055000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3374,'2024-04-15 08:47:22.347000','2024-04-15 08:47:22.408000','2024-04-15 08:47:24.114000','2024-04-15 08:47:24.114000','2024-04-15 08:47:24.066000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3375,'2024-04-15 08:47:22.408000','2024-04-15 08:47:22.468000','2024-04-15 08:47:24.116000','2024-04-15 08:47:24.116000','2024-04-15 08:47:24.081000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3376,'2024-04-15 08:47:22.467000','2024-04-15 08:47:22.533000','2024-04-15 08:47:24.161000','2024-04-15 08:47:24.161000','2024-04-15 08:47:24.138000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3377,'2024-04-15 08:47:22.532000','2024-04-15 08:47:22.616000','2024-04-15 08:47:24.418000','2024-04-15 08:47:24.418000','2024-04-15 08:47:24.407000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3378,'2024-04-15 08:47:22.615000','2024-04-15 08:47:22.689000','2024-04-15 08:47:24.554000','2024-04-15 08:47:24.554000','2024-04-15 08:47:24.483000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3379,'2024-04-15 08:47:22.688000','2024-04-15 08:47:22.751000','2024-04-15 08:47:24.560000','2024-04-15 08:47:24.560000','2024-04-15 08:47:24.493000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3380,'2024-04-15 08:47:22.751000','2024-04-15 08:47:22.831000','2024-04-15 08:47:24.576000','2024-04-15 08:47:24.576000','2024-04-15 08:47:24.525000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3381,'2024-04-15 08:47:22.830000','2024-04-15 08:47:22.900000','2024-04-15 08:47:24.582000','2024-04-15 08:47:24.582000','2024-04-15 08:47:24.530000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3382,'2024-04-15 08:47:22.898000','2024-04-15 08:47:22.969000','2024-04-15 08:47:24.588000','2024-04-15 08:47:24.588000','2024-04-15 08:47:24.546000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3383,'2024-04-15 08:47:22.969000','2024-04-15 08:47:23.061000','2024-04-15 08:47:25.144000','2024-04-15 08:47:25.144000','2024-04-15 08:47:25.130000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3384,'2024-04-15 08:47:23.060000','2024-04-15 08:47:23.407000','2024-04-15 08:47:25.288000','2024-04-15 08:47:25.288000','2024-04-15 08:47:25.202000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3385,'2024-04-15 08:47:23.407000','2024-04-15 08:47:23.830000','2024-04-15 08:47:25.296000','2024-04-15 08:47:25.296000','2024-04-15 08:47:25.217000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3386,'2024-04-15 08:47:23.829000','2024-04-15 08:47:24.454000','2024-04-15 08:47:25.304000','2024-04-15 08:47:25.304000','2024-04-15 08:47:25.230000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3387,'2024-04-15 08:47:24.453000','2024-04-15 08:47:25.253000','2024-04-15 08:47:25.309000','2024-04-15 08:47:25.309000','2024-04-15 08:47:25.235000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3388,'2024-04-15 08:47:25.253000','2024-04-15 08:47:26.348000','2024-04-15 08:47:28.593000','2024-04-15 08:47:28.593000','2024-04-15 08:47:28.582000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3389,'2024-04-15 08:47:26.347000','2024-04-15 08:47:26.661000','2024-04-15 08:47:28.707000','2024-04-15 08:47:28.707000','2024-04-15 08:47:28.696000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3390,'2024-04-15 08:47:26.660000','2024-04-15 08:47:26.760000','2024-04-15 08:47:28.764000','2024-04-15 08:47:28.764000','2024-04-15 08:47:28.731000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3391,'2024-04-15 08:47:26.759000','2024-04-15 08:47:26.830000','2024-04-15 08:47:28.766000','2024-04-15 08:47:28.766000','2024-04-15 08:47:28.741000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3392,'2024-04-15 08:47:26.829000','2024-04-15 08:47:26.880000','2024-04-15 08:47:28.776000','2024-04-15 08:47:28.776000','2024-04-15 08:47:28.746000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3393,'2024-04-15 08:47:26.879000','2024-04-15 08:47:26.927000','2024-04-15 08:47:28.811000','2024-04-15 08:47:28.811000','2024-04-15 08:47:28.800000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3394,'2024-04-15 08:47:26.926000','2024-04-15 08:47:26.996000','2024-04-15 08:47:28.950000','2024-04-15 08:47:28.950000','2024-04-15 08:47:28.938000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3395,'2024-04-15 08:47:26.995000','2024-04-15 08:47:27.067000','2024-04-15 08:47:28.993000','2024-04-15 08:47:28.993000','2024-04-15 08:47:28.984000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3396,'2024-04-15 08:47:27.067000','2024-04-15 08:47:27.138000','2024-04-15 08:47:29.048000','2024-04-15 08:47:29.048000','2024-04-15 08:47:29.018000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3397,'2024-04-15 08:47:27.138000','2024-04-15 08:47:27.213000','2024-04-15 08:47:29.052000','2024-04-15 08:47:29.052000','2024-04-15 08:47:29.030000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3398,'2024-04-15 08:47:27.212000','2024-04-15 08:47:27.302000','2024-04-15 08:47:29.074000','2024-04-15 08:47:29.074000','2024-04-15 08:47:29.061000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3399,'2024-04-15 08:47:27.301000','2024-04-15 08:47:27.389000','2024-04-15 08:47:29.161000','2024-04-15 08:47:29.161000','2024-04-15 08:47:29.140000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3400,'2024-04-15 08:47:27.388000','2024-04-15 08:47:27.465000','2024-04-15 08:47:29.240000','2024-04-15 08:47:29.240000','2024-04-15 08:47:29.222000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3401,'2024-04-15 08:47:27.464000','2024-04-15 08:47:27.534000','2024-04-15 08:47:29.307000','2024-04-15 08:47:29.307000','2024-04-15 08:47:29.285000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3402,'2024-04-15 08:47:27.533000','2024-04-15 08:47:27.603000','2024-04-15 08:47:29.316000','2024-04-15 08:47:29.316000','2024-04-15 08:47:29.297000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3403,'2024-04-15 08:47:27.603000','2024-04-15 08:47:27.683000','2024-04-15 08:47:29.392000','2024-04-15 08:47:29.392000','2024-04-15 08:47:29.344000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3404,'2024-04-15 08:47:27.682000','2024-04-15 08:47:27.763000','2024-04-15 08:47:29.405000','2024-04-15 08:47:29.405000','2024-04-15 08:47:29.357000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3405,'2024-04-15 08:47:27.762000','2024-04-15 08:47:27.842000','2024-04-15 08:47:29.428000','2024-04-15 08:47:29.428000','2024-04-15 08:47:29.413000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3406,'2024-04-15 08:47:27.841000','2024-04-15 08:47:27.910000','2024-04-15 08:47:29.508000','2024-04-15 08:47:29.508000','2024-04-15 08:47:29.500000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3407,'2024-04-15 08:47:27.975000','2024-04-15 08:47:28.053000','2024-04-15 08:47:29.620000','2024-04-15 08:47:29.620000','2024-04-15 08:47:29.589000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3408,'2024-04-15 08:47:27.910000','2024-04-15 08:47:27.976000','2024-04-15 08:47:29.628000','2024-04-15 08:47:29.628000','2024-04-15 08:47:29.611000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3409,'2024-04-15 08:47:28.186000','2024-04-15 08:47:28.262000','2024-04-15 08:47:29.698000','2024-04-15 08:47:29.698000','2024-04-15 08:47:29.662000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3410,'2024-04-15 08:47:28.051000','2024-04-15 08:47:28.122000','2024-04-15 08:47:29.701000','2024-04-15 08:47:29.701000','2024-04-15 08:47:29.674000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3411,'2024-04-15 08:47:28.121000','2024-04-15 08:47:28.186000','2024-04-15 08:47:29.708000','2024-04-15 08:47:29.708000','2024-04-15 08:47:29.686000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3412,'2024-04-15 08:47:28.261000','2024-04-15 08:47:28.340000','2024-04-15 08:47:29.750000','2024-04-15 08:47:29.750000','2024-04-15 08:47:29.726000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3413,'2024-04-15 08:47:28.339000','2024-04-15 08:47:28.405000','2024-04-15 08:47:29.872000','2024-04-15 08:47:29.872000','2024-04-15 08:47:29.860000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3414,'2024-04-15 08:47:28.405000','2024-04-15 08:47:28.492000','2024-04-15 08:47:29.904000','2024-04-15 08:47:29.904000','2024-04-15 08:47:29.895000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3415,'2024-04-15 08:47:28.491000','2024-04-15 08:47:28.574000','2024-04-15 08:47:29.944000','2024-04-15 08:47:29.944000','2024-04-15 08:47:29.921000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3416,'2024-04-15 08:47:28.573000','2024-04-15 08:47:28.648000','2024-04-15 08:47:29.985000','2024-04-15 08:47:29.985000','2024-04-15 08:47:29.953000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3417,'2024-04-15 08:47:28.648000','2024-04-15 08:47:28.719000','2024-04-15 08:47:29.988000','2024-04-15 08:47:29.988000','2024-04-15 08:47:29.963000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3418,'2024-04-15 08:47:28.719000','2024-04-15 08:47:28.788000','2024-04-15 08:47:30.018000','2024-04-15 08:47:30.018000','2024-04-15 08:47:29.994000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3419,'2024-04-15 08:47:28.787000','2024-04-15 08:47:28.854000','2024-04-15 08:47:30.101000','2024-04-15 08:47:30.101000','2024-04-15 08:47:30.094000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3420,'2024-04-15 08:47:28.854000','2024-04-15 08:47:28.899000','2024-04-15 08:47:30.145000','2024-04-15 08:47:30.145000','2024-04-15 08:47:30.138000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3421,'2024-04-15 08:47:28.899000','2024-04-15 08:47:28.940000','2024-04-15 08:47:30.191000','2024-04-15 08:47:30.191000','2024-04-15 08:47:30.174000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3422,'2024-04-15 08:47:28.939000','2024-04-15 08:47:28.984000','2024-04-15 08:47:30.281000','2024-04-15 08:47:30.281000','2024-04-15 08:47:30.225000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3423,'2024-04-15 08:47:29.027000','2024-04-15 08:47:29.092000','2024-04-15 08:47:30.287000','2024-04-15 08:47:30.287000','2024-04-15 08:47:30.241000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3424,'2024-04-15 08:47:28.984000','2024-04-15 08:47:29.027000','2024-04-15 08:47:30.291000','2024-04-15 08:47:30.291000','2024-04-15 08:47:30.261000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3425,'2024-04-15 08:47:29.091000','2024-04-15 08:47:29.185000','2024-04-15 08:47:30.356000','2024-04-15 08:47:30.356000','2024-04-15 08:47:30.331000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3426,'2024-04-15 08:47:29.184000','2024-04-15 08:47:29.551000','2024-04-15 08:47:30.417000','2024-04-15 08:47:30.417000','2024-04-15 08:47:30.406000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3427,'2024-04-15 08:47:30.287000','2024-04-15 08:47:30.339000','2024-04-15 08:47:30.495000','2024-04-15 08:47:30.495000','2024-04-15 08:47:30.482000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3428,'2024-04-15 08:47:29.867000','2024-04-15 08:47:30.288000','2024-04-15 08:47:30.560000','2024-04-15 08:47:30.560000','2024-04-15 08:47:30.522000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3429,'2024-04-15 08:47:29.550000','2024-04-15 08:47:29.867000','2024-04-15 08:47:30.562000','2024-04-15 08:47:30.562000','2024-04-15 08:47:30.535000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3430,'2024-04-15 08:47:30.338000','2024-04-15 08:47:30.769000','2024-04-15 08:47:30.677000','2024-04-15 08:47:30.677000','2024-04-15 08:47:30.602000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3431,'2024-04-15 08:47:30.769000','2024-04-15 08:47:32.227000','2024-04-15 08:47:33.573000','2024-04-15 08:47:33.573000','2024-04-15 08:47:33.526000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3432,'2024-04-15 08:47:32.226000','2024-04-15 08:47:32.774000','2024-04-15 08:47:33.580000','2024-04-15 08:47:33.580000','2024-04-15 08:47:33.538000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3433,'2024-04-15 08:47:32.774000','2024-04-15 08:47:32.833000','2024-04-15 08:47:33.582000','2024-04-15 08:47:33.582000','2024-04-15 08:47:33.550000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3434,'2024-04-15 08:47:32.832000','2024-04-15 08:47:32.883000','2024-04-15 08:47:33.584000','2024-04-15 08:47:33.584000','2024-04-15 08:47:33.562000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3435,'2024-04-15 08:47:32.883000','2024-04-15 08:47:32.957000','2024-04-15 08:47:33.727000','2024-04-15 08:47:33.727000','2024-04-15 08:47:33.714000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3436,'2024-04-15 08:47:32.956000','2024-04-15 08:47:33.029000','2024-04-15 08:47:33.752000','2024-04-15 08:47:33.752000','2024-04-15 08:47:33.741000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3437,'2024-04-15 08:47:33.029000','2024-04-15 08:47:33.096000','2024-04-15 08:47:33.813000','2024-04-15 08:47:33.813000','2024-04-15 08:47:33.779000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3438,'2024-04-15 08:47:33.095000','2024-04-15 08:47:33.163000','2024-04-15 08:47:33.820000','2024-04-15 08:47:33.820000','2024-04-15 08:47:33.789000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3439,'2024-04-15 08:47:33.162000','2024-04-15 08:47:33.251000','2024-04-15 08:47:33.824000','2024-04-15 08:47:33.824000','2024-04-15 08:47:33.798000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3440,'2024-04-15 08:47:33.250000','2024-04-15 08:47:33.346000','2024-04-15 08:47:33.921000','2024-04-15 08:47:33.921000','2024-04-15 08:47:33.913000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3441,'2024-04-15 08:47:33.345000','2024-04-15 08:47:33.416000','2024-04-15 08:47:33.996000','2024-04-15 08:47:33.996000','2024-04-15 08:47:33.986000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3442,'2024-04-15 08:47:33.416000','2024-04-15 08:47:33.480000','2024-04-15 08:47:34.046000','2024-04-15 08:47:34.046000','2024-04-15 08:47:34.023000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3443,'2024-04-15 08:47:33.479000','2024-04-15 08:47:33.552000','2024-04-15 08:47:34.048000','2024-04-15 08:47:34.048000','2024-04-15 08:47:34.037000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3444,'2024-04-15 08:47:33.551000','2024-04-15 08:47:33.618000','2024-04-15 08:47:34.090000','2024-04-15 08:47:34.090000','2024-04-15 08:47:34.066000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3445,'2024-04-15 08:47:33.618000','2024-04-15 08:47:33.686000','2024-04-15 08:47:34.115000','2024-04-15 08:47:34.115000','2024-04-15 08:47:34.098000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3446,'2024-04-15 08:47:33.686000','2024-04-15 08:47:33.754000','2024-04-15 08:47:34.214000','2024-04-15 08:47:34.214000','2024-04-15 08:47:34.207000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3447,'2024-04-15 08:47:33.753000','2024-04-15 08:47:33.825000','2024-04-15 08:47:34.253000','2024-04-15 08:47:34.253000','2024-04-15 08:47:34.246000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3448,'2024-04-15 08:47:33.824000','2024-04-15 08:47:33.890000','2024-04-15 08:47:34.278000','2024-04-15 08:47:34.278000','2024-04-15 08:47:34.263000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3449,'2024-04-15 08:47:33.889000','2024-04-15 08:47:33.956000','2024-04-15 08:47:34.336000','2024-04-15 08:47:34.336000','2024-04-15 08:47:34.310000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3450,'2024-04-15 08:47:33.955000','2024-04-15 08:47:34.019000','2024-04-15 08:47:34.339000','2024-04-15 08:47:34.339000','2024-04-15 08:47:34.319000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3451,'2024-04-15 08:47:34.019000','2024-04-15 08:47:34.087000','2024-04-15 08:47:34.361000','2024-04-15 08:47:34.361000','2024-04-15 08:47:34.349000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3452,'2024-04-15 08:47:34.087000','2024-04-15 08:47:34.197000','2024-04-15 08:47:34.401000','2024-04-15 08:47:34.401000','2024-04-15 08:47:34.386000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3453,'2024-04-15 08:47:34.197000','2024-04-15 08:47:34.333000','2024-04-15 08:47:34.449000','2024-04-15 08:47:34.449000','2024-04-15 08:47:34.442000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3454,'2024-04-15 08:47:34.332000','2024-04-15 08:47:34.381000','2024-04-15 08:47:34.493000','2024-04-15 08:47:34.493000','2024-04-15 08:47:34.485000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3455,'2024-04-15 08:47:34.381000','2024-04-15 08:47:34.746000','2024-04-15 08:47:34.556000','2024-04-15 08:47:34.556000','2024-04-15 08:47:34.548000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3456,'2024-04-15 08:47:34.746000','2024-04-15 08:47:35.338000','2024-04-15 08:47:34.948000','2024-04-15 08:47:34.948000','2024-04-15 08:47:34.939000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3457,'2024-04-15 08:47:35.338000','2024-04-15 08:47:35.743000','2024-04-15 08:47:38.319000','2024-04-15 08:47:38.319000','2024-04-15 08:47:38.174000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3458,'2024-04-15 08:47:35.743000','2024-04-15 08:47:36.395000','2024-04-15 08:47:38.328000','2024-04-15 08:47:38.328000','2024-04-15 08:47:38.255000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3459,'2024-04-15 08:47:36.394000','2024-04-15 08:47:36.529000','2024-04-15 08:47:38.335000','2024-04-15 08:47:38.335000','2024-04-15 08:47:38.282000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3460,'2024-04-15 08:47:36.529000','2024-04-15 08:47:36.599000','2024-04-15 08:47:38.336000','2024-04-15 08:47:38.336000','2024-04-15 08:47:38.288000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3461,'2024-04-15 08:47:36.598000','2024-04-15 08:47:36.666000','2024-04-15 08:47:38.338000','2024-04-15 08:47:38.338000','2024-04-15 08:47:38.311000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3462,'2024-04-15 08:47:36.665000','2024-04-15 08:47:36.759000','2024-04-15 08:47:38.495000','2024-04-15 08:47:38.495000','2024-04-15 08:47:38.478000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3463,'2024-04-15 08:47:36.758000','2024-04-15 08:47:36.854000','2024-04-15 08:47:38.602000','2024-04-15 08:47:38.602000','2024-04-15 08:47:38.550000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3464,'2024-04-15 08:47:36.853000','2024-04-15 08:47:36.903000','2024-04-15 08:47:38.604000','2024-04-15 08:47:38.604000','2024-04-15 08:47:38.571000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3465,'2024-04-15 08:47:36.903000','2024-04-15 08:47:36.943000','2024-04-15 08:47:38.612000','2024-04-15 08:47:38.612000','2024-04-15 08:47:38.576000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3466,'2024-04-15 08:47:36.943000','2024-04-15 08:47:37.006000','2024-04-15 08:47:38.614000','2024-04-15 08:47:38.614000','2024-04-15 08:47:38.585000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3467,'2024-04-15 08:47:37.005000','2024-04-15 08:47:37.082000','2024-04-15 08:47:38.776000','2024-04-15 08:47:38.776000','2024-04-15 08:47:38.767000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3468,'2024-04-15 08:47:37.081000','2024-04-15 08:47:37.152000','2024-04-15 08:47:38.808000','2024-04-15 08:47:38.808000','2024-04-15 08:47:38.789000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3469,'2024-04-15 08:47:37.283000','2024-04-15 08:47:37.357000','2024-04-15 08:47:38.935000','2024-04-15 08:47:38.935000','2024-04-15 08:47:38.902000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3470,'2024-04-15 08:47:37.152000','2024-04-15 08:47:37.220000','2024-04-15 08:47:38.938000','2024-04-15 08:47:38.938000','2024-04-15 08:47:38.911000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3471,'2024-04-15 08:47:37.219000','2024-04-15 08:47:37.284000','2024-04-15 08:47:38.948000','2024-04-15 08:47:38.948000','2024-04-15 08:47:38.926000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3472,'2024-04-15 08:47:37.356000','2024-04-15 08:47:37.428000','2024-04-15 08:47:39.003000','2024-04-15 08:47:39.003000','2024-04-15 08:47:38.994000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3473,'2024-04-15 08:47:37.427000','2024-04-15 08:47:37.492000','2024-04-15 08:47:39.038000','2024-04-15 08:47:39.038000','2024-04-15 08:47:39.030000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3474,'2024-04-15 08:47:37.491000','2024-04-15 08:47:37.570000','2024-04-15 08:47:39.092000','2024-04-15 08:47:39.092000','2024-04-15 08:47:39.073000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3475,'2024-04-15 08:47:37.636000','2024-04-15 08:47:37.709000','2024-04-15 08:47:39.196000','2024-04-15 08:47:39.196000','2024-04-15 08:47:39.175000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3476,'2024-04-15 08:47:37.569000','2024-04-15 08:47:37.637000','2024-04-15 08:47:39.317000','2024-04-15 08:47:39.317000','2024-04-15 08:47:39.264000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3477,'2024-04-15 08:47:37.777000','2024-04-15 08:47:37.848000','2024-04-15 08:47:39.320000','2024-04-15 08:47:39.320000','2024-04-15 08:47:39.282000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3478,'2024-04-15 08:47:37.847000','2024-04-15 08:47:37.947000','2024-04-15 08:47:39.324000','2024-04-15 08:47:39.324000','2024-04-15 08:47:39.302000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3479,'2024-04-15 08:47:37.709000','2024-04-15 08:47:37.777000','2024-04-15 08:47:39.326000','2024-04-15 08:47:39.326000','2024-04-15 08:47:39.309000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3480,'2024-04-15 08:47:37.946000','2024-04-15 08:47:38.013000','2024-04-15 08:47:39.376000','2024-04-15 08:47:39.376000','2024-04-15 08:47:39.352000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3481,'2024-04-15 08:47:38.012000','2024-04-15 08:47:38.058000','2024-04-15 08:47:39.485000','2024-04-15 08:47:39.485000','2024-04-15 08:47:39.478000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3482,'2024-04-15 08:47:38.058000','2024-04-15 08:47:38.097000','2024-04-15 08:47:39.540000','2024-04-15 08:47:39.540000','2024-04-15 08:47:39.527000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3483,'2024-04-15 08:47:38.097000','2024-04-15 08:47:38.140000','2024-04-15 08:47:39.592000','2024-04-15 08:47:39.592000','2024-04-15 08:47:39.559000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3484,'2024-04-15 08:47:38.140000','2024-04-15 08:47:38.193000','2024-04-15 08:47:39.595000','2024-04-15 08:47:39.595000','2024-04-15 08:47:39.580000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3485,'2024-04-15 08:47:38.192000','2024-04-15 08:47:38.242000','2024-04-15 08:47:39.666000','2024-04-15 08:47:39.666000','2024-04-15 08:47:39.634000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3486,'2024-04-15 08:47:38.241000','2024-04-15 08:47:38.293000','2024-04-15 08:47:39.668000','2024-04-15 08:47:39.668000','2024-04-15 08:47:39.648000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3487,'2024-04-15 08:47:38.293000','2024-04-15 08:47:38.342000','2024-04-15 08:47:39.704000','2024-04-15 08:47:39.704000','2024-04-15 08:47:39.687000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3488,'2024-04-15 08:47:38.342000','2024-04-15 08:47:38.407000','2024-04-15 08:47:39.812000','2024-04-15 08:47:39.812000','2024-04-15 08:47:39.797000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3489,'2024-04-15 08:47:38.406000','2024-04-15 08:47:38.468000','2024-04-15 08:47:39.856000','2024-04-15 08:47:39.856000','2024-04-15 08:47:39.837000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3490,'2024-04-15 08:47:38.468000','2024-04-15 08:47:38.536000','2024-04-15 08:47:39.897000','2024-04-15 08:47:39.897000','2024-04-15 08:47:39.884000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3491,'2024-04-15 08:47:38.535000','2024-04-15 08:47:38.606000','2024-04-15 08:47:39.984000','2024-04-15 08:47:39.984000','2024-04-15 08:47:39.930000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3492,'2024-04-15 08:47:38.605000','2024-04-15 08:47:38.670000','2024-04-15 08:47:39.996000','2024-04-15 08:47:39.996000','2024-04-15 08:47:39.939000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3493,'2024-04-15 08:47:38.669000','2024-04-15 08:47:38.741000','2024-04-15 08:47:39.998000','2024-04-15 08:47:39.998000','2024-04-15 08:47:39.947000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3494,'2024-04-15 08:47:38.740000','2024-04-15 08:47:38.809000','2024-04-15 08:47:40.116000','2024-04-15 08:47:40.116000','2024-04-15 08:47:40.081000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3495,'2024-04-15 08:47:38.808000','2024-04-15 08:47:38.878000','2024-04-15 08:47:40.226000','2024-04-15 08:47:40.226000','2024-04-15 08:47:40.198000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3496,'2024-04-15 08:47:38.877000','2024-04-15 08:47:38.959000','2024-04-15 08:47:40.294000','2024-04-15 08:47:40.294000','2024-04-15 08:47:40.245000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3497,'2024-04-15 08:47:38.959000','2024-04-15 08:47:39.213000','2024-04-15 08:47:40.370000','2024-04-15 08:47:40.370000','2024-04-15 08:47:40.327000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3498,'2024-04-15 08:47:39.213000','2024-04-15 08:47:39.462000','2024-04-15 08:47:40.376000','2024-04-15 08:47:40.376000','2024-04-15 08:47:40.345000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3499,'2024-04-15 08:47:39.461000','2024-04-15 08:47:39.673000','2024-04-15 08:47:40.378000','2024-04-15 08:47:40.378000','2024-04-15 08:47:40.353000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3500,'2024-04-15 08:47:39.672000','2024-04-15 08:47:40.022000','2024-04-15 08:47:40.846000','2024-04-15 08:47:40.846000','2024-04-15 08:47:40.520000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3501,'2024-04-15 08:47:40.021000','2024-04-15 08:47:40.563000','2024-04-15 08:47:43.659000','2024-04-15 08:47:43.659000','2024-04-15 08:47:43.593000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3502,'2024-04-15 08:47:40.562000','2024-04-15 08:47:40.874000','2024-04-15 08:47:43.660000','2024-04-15 08:47:43.660000','2024-04-15 08:47:43.614000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3503,'2024-04-15 08:47:40.873000','2024-04-15 08:47:41.146000','2024-04-15 08:47:43.664000','2024-04-15 08:47:43.664000','2024-04-15 08:47:43.634000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3504,'2024-04-15 08:47:41.145000','2024-04-15 08:47:41.473000','2024-04-15 08:47:43.667000','2024-04-15 08:47:43.667000','2024-04-15 08:47:43.650000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3505,'2024-04-15 08:47:41.473000','2024-04-15 08:47:41.729000','2024-04-15 08:47:43.810000','2024-04-15 08:47:43.810000','2024-04-15 08:47:43.798000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3506,'2024-04-15 08:47:41.728000','2024-04-15 08:47:41.800000','2024-04-15 08:47:43.897000','2024-04-15 08:47:43.897000','2024-04-15 08:47:43.861000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3507,'2024-04-15 08:47:41.799000','2024-04-15 08:47:41.895000','2024-04-15 08:47:43.908000','2024-04-15 08:47:43.908000','2024-04-15 08:47:43.878000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3508,'2024-04-15 08:47:41.895000','2024-04-15 08:47:41.979000','2024-04-15 08:47:43.971000','2024-04-15 08:47:43.971000','2024-04-15 08:47:43.929000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3509,'2024-04-15 08:47:41.978000','2024-04-15 08:47:42.039000','2024-04-15 08:47:43.990000','2024-04-15 08:47:43.990000','2024-04-15 08:47:43.955000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3510,'2024-04-15 08:47:42.039000','2024-04-15 08:47:42.092000','2024-04-15 08:47:44.045000','2024-04-15 08:47:44.045000','2024-04-15 08:47:44.032000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3511,'2024-04-15 08:47:42.091000','2024-04-15 08:47:42.143000','2024-04-15 08:47:44.136000','2024-04-15 08:47:44.136000','2024-04-15 08:47:44.129000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3512,'2024-04-15 08:47:42.143000','2024-04-15 08:47:42.200000','2024-04-15 08:47:44.165000','2024-04-15 08:47:44.165000','2024-04-15 08:47:44.150000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3513,'2024-04-15 08:47:42.199000','2024-04-15 08:47:42.256000','2024-04-15 08:47:44.205000','2024-04-15 08:47:44.205000','2024-04-15 08:47:44.192000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3514,'2024-04-15 08:47:42.312000','2024-04-15 08:47:42.368000','2024-04-15 08:47:44.260000','2024-04-15 08:47:44.260000','2024-04-15 08:47:44.237000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3515,'2024-04-15 08:47:42.255000','2024-04-15 08:47:42.312000','2024-04-15 08:47:44.270000','2024-04-15 08:47:44.270000','2024-04-15 08:47:44.251000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3516,'2024-04-15 08:47:42.368000','2024-04-15 08:47:42.423000','2024-04-15 08:47:44.312000','2024-04-15 08:47:44.312000','2024-04-15 08:47:44.304000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3517,'2024-04-15 08:47:42.423000','2024-04-15 08:47:42.481000','2024-04-15 08:47:44.341000','2024-04-15 08:47:44.341000','2024-04-15 08:47:44.334000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3518,'2024-04-15 08:47:42.546000','2024-04-15 08:47:42.606000','2024-04-15 08:47:44.421000','2024-04-15 08:47:44.421000','2024-04-15 08:47:44.402000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3519,'2024-04-15 08:47:42.481000','2024-04-15 08:47:42.546000','2024-04-15 08:47:44.433000','2024-04-15 08:47:44.433000','2024-04-15 08:47:44.413000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3520,'2024-04-15 08:47:42.606000','2024-04-15 08:47:42.651000','2024-04-15 08:47:44.514000','2024-04-15 08:47:44.514000','2024-04-15 08:47:44.489000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3521,'2024-04-15 08:47:42.650000','2024-04-15 08:47:42.695000','2024-04-15 08:47:44.516000','2024-04-15 08:47:44.516000','2024-04-15 08:47:44.499000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3522,'2024-04-15 08:47:42.737000','2024-04-15 08:47:42.778000','2024-04-15 08:47:44.564000','2024-04-15 08:47:44.564000','2024-04-15 08:47:44.539000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3523,'2024-04-15 08:47:42.694000','2024-04-15 08:47:42.737000','2024-04-15 08:47:44.568000','2024-04-15 08:47:44.568000','2024-04-15 08:47:44.550000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3524,'2024-04-15 08:47:42.778000','2024-04-15 08:47:42.843000','2024-04-15 08:47:44.642000','2024-04-15 08:47:44.642000','2024-04-15 08:47:44.630000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3525,'2024-04-15 08:47:42.842000','2024-04-15 08:47:42.909000','2024-04-15 08:47:44.662000','2024-04-15 08:47:44.662000','2024-04-15 08:47:44.654000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3526,'2024-04-15 08:47:42.909000','2024-04-15 08:47:42.974000','2024-04-15 08:47:44.720000','2024-04-15 08:47:44.720000','2024-04-15 08:47:44.711000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3527,'2024-04-15 08:47:42.974000','2024-04-15 08:47:43.041000','2024-04-15 08:47:44.756000','2024-04-15 08:47:44.756000','2024-04-15 08:47:44.735000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3528,'2024-04-15 08:47:43.041000','2024-04-15 08:47:43.106000','2024-04-15 08:47:44.800000','2024-04-15 08:47:44.800000','2024-04-15 08:47:44.778000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3529,'2024-04-15 08:47:43.106000','2024-04-15 08:47:43.174000','2024-04-15 08:47:44.821000','2024-04-15 08:47:44.821000','2024-04-15 08:47:44.806000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3530,'2024-04-15 08:47:43.173000','2024-04-15 08:47:43.237000','2024-04-15 08:47:44.872000','2024-04-15 08:47:44.872000','2024-04-15 08:47:44.848000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3531,'2024-04-15 08:47:43.236000','2024-04-15 08:47:43.309000','2024-04-15 08:47:44.883000','2024-04-15 08:47:44.883000','2024-04-15 08:47:44.863000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3532,'2024-04-15 08:47:43.308000','2024-04-15 08:47:43.377000','2024-04-15 08:47:44.942000','2024-04-15 08:47:44.942000','2024-04-15 08:47:44.934000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3533,'2024-04-15 08:47:43.376000','2024-04-15 08:47:43.444000','2024-04-15 08:47:45.008000','2024-04-15 08:47:45.008000','2024-04-15 08:47:44.991000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3534,'2024-04-15 08:47:43.444000','2024-04-15 08:47:43.510000','2024-04-15 08:47:45.087000','2024-04-15 08:47:45.087000','2024-04-15 08:47:45.063000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3535,'2024-04-15 08:47:43.509000','2024-04-15 08:47:43.572000','2024-04-15 08:47:45.093000','2024-04-15 08:47:45.093000','2024-04-15 08:47:45.079000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3536,'2024-04-15 08:47:43.572000','2024-04-15 08:47:43.649000','2024-04-15 08:47:45.161000','2024-04-15 08:47:45.161000','2024-04-15 08:47:45.128000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3537,'2024-04-15 08:47:43.648000','2024-04-15 08:47:43.744000','2024-04-15 08:47:45.164000','2024-04-15 08:47:45.164000','2024-04-15 08:47:45.142000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3538,'2024-04-15 08:47:43.743000','2024-04-15 08:47:43.810000','2024-04-15 08:47:45.188000','2024-04-15 08:47:45.188000','2024-04-15 08:47:45.170000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3539,'2024-04-15 08:47:43.809000','2024-04-15 08:47:43.850000','2024-04-15 08:47:45.258000','2024-04-15 08:47:45.258000','2024-04-15 08:47:45.234000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3540,'2024-04-15 08:47:43.849000','2024-04-15 08:47:43.892000','2024-04-15 08:47:45.352000','2024-04-15 08:47:45.352000','2024-04-15 08:47:45.334000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3541,'2024-04-15 08:47:43.891000','2024-04-15 08:47:43.994000','2024-04-15 08:47:45.396000','2024-04-15 08:47:45.396000','2024-04-15 08:47:45.374000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3542,'2024-04-15 08:47:43.994000','2024-04-15 08:47:44.046000','2024-04-15 08:47:45.471000','2024-04-15 08:47:45.471000','2024-04-15 08:47:45.443000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3543,'2024-04-15 08:47:44.045000','2024-04-15 08:47:44.090000','2024-04-15 08:47:45.473000','2024-04-15 08:47:45.473000','2024-04-15 08:47:45.455000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3544,'2024-04-15 08:47:44.089000','2024-04-15 08:47:44.156000','2024-04-15 08:47:45.518000','2024-04-15 08:47:45.518000','2024-04-15 08:47:45.508000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3545,'2024-04-15 08:47:44.155000','2024-04-15 08:47:44.220000','2024-04-15 08:47:45.569000','2024-04-15 08:47:45.569000','2024-04-15 08:47:45.551000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3546,'2024-04-15 08:47:44.220000','2024-04-15 08:47:44.313000','2024-04-15 08:47:45.625000','2024-04-15 08:47:45.625000','2024-04-15 08:47:45.616000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3547,'2024-04-15 08:47:44.312000','2024-04-15 08:47:44.600000','2024-04-15 08:47:45.669000','2024-04-15 08:47:45.669000','2024-04-15 08:47:45.658000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3548,'2024-04-15 08:47:44.600000','2024-04-15 08:47:44.765000','2024-04-15 08:47:45.728000','2024-04-15 08:47:45.728000','2024-04-15 08:47:45.704000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3549,'2024-04-15 08:47:44.764000','2024-04-15 08:47:45.605000','2024-04-15 08:47:46.060000','2024-04-15 08:47:46.060000','2024-04-15 08:47:45.798000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3550,'2024-04-15 08:47:45.604000','2024-04-15 08:47:46.682000','2024-04-15 08:47:48.453000','2024-04-15 08:47:48.453000','2024-04-15 08:47:48.416000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3551,'2024-04-15 08:47:46.682000','2024-04-15 08:47:46.772000','2024-04-15 08:47:48.462000','2024-04-15 08:47:48.462000','2024-04-15 08:47:48.431000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3552,'2024-04-15 08:47:46.772000','2024-04-15 08:47:47.260000','2024-04-15 08:47:48.464000','2024-04-15 08:47:48.464000','2024-04-15 08:47:48.442000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3553,'2024-04-15 08:47:47.259000','2024-04-15 08:47:47.307000','2024-04-15 08:47:48.561000','2024-04-15 08:47:48.561000','2024-04-15 08:47:48.554000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3554,'2024-04-15 08:47:47.306000','2024-04-15 08:47:47.352000','2024-04-15 08:47:48.597000','2024-04-15 08:47:48.597000','2024-04-15 08:47:48.590000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3555,'2024-04-15 08:47:47.351000','2024-04-15 08:47:47.394000','2024-04-15 08:47:48.668000','2024-04-15 08:47:48.668000','2024-04-15 08:47:48.646000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3556,'2024-04-15 08:47:47.394000','2024-04-15 08:47:47.437000','2024-04-15 08:47:48.670000','2024-04-15 08:47:48.670000','2024-04-15 08:47:48.661000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3557,'2024-04-15 08:47:47.437000','2024-04-15 08:47:47.480000','2024-04-15 08:47:48.698000','2024-04-15 08:47:48.698000','2024-04-15 08:47:48.686000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3558,'2024-04-15 08:47:47.479000','2024-04-15 08:47:47.523000','2024-04-15 08:47:48.738000','2024-04-15 08:47:48.738000','2024-04-15 08:47:48.718000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3559,'2024-04-15 08:47:47.523000','2024-04-15 08:47:47.565000','2024-04-15 08:47:48.769000','2024-04-15 08:47:48.769000','2024-04-15 08:47:48.761000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3560,'2024-04-15 08:47:47.565000','2024-04-15 08:47:47.607000','2024-04-15 08:47:48.860000','2024-04-15 08:47:48.860000','2024-04-15 08:47:48.847000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3561,'2024-04-15 08:47:47.606000','2024-04-15 08:47:47.650000','2024-04-15 08:47:48.898000','2024-04-15 08:47:48.898000','2024-04-15 08:47:48.886000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3562,'2024-04-15 08:47:47.650000','2024-04-15 08:47:47.695000','2024-04-15 08:47:48.940000','2024-04-15 08:47:48.940000','2024-04-15 08:47:48.913000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3563,'2024-04-15 08:47:47.694000','2024-04-15 08:47:47.735000','2024-04-15 08:47:48.966000','2024-04-15 08:47:48.966000','2024-04-15 08:47:48.948000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3564,'2024-04-15 08:47:47.735000','2024-04-15 08:47:47.773000','2024-04-15 08:47:48.968000','2024-04-15 08:47:48.968000','2024-04-15 08:47:48.958000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3565,'2024-04-15 08:47:47.773000','2024-04-15 08:47:47.813000','2024-04-15 08:47:49.057000','2024-04-15 08:47:49.057000','2024-04-15 08:47:49.049000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3566,'2024-04-15 08:47:47.813000','2024-04-15 08:47:47.853000','2024-04-15 08:47:49.096000','2024-04-15 08:47:49.096000','2024-04-15 08:47:49.089000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3567,'2024-04-15 08:47:47.853000','2024-04-15 08:47:47.892000','2024-04-15 08:47:49.120000','2024-04-15 08:47:49.120000','2024-04-15 08:47:49.111000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3568,'2024-04-15 08:47:47.892000','2024-04-15 08:47:47.931000','2024-04-15 08:47:49.158000','2024-04-15 08:47:49.158000','2024-04-15 08:47:49.135000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3569,'2024-04-15 08:47:47.972000','2024-04-15 08:47:48.012000','2024-04-15 08:47:49.184000','2024-04-15 08:47:49.184000','2024-04-15 08:47:49.162000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3570,'2024-04-15 08:47:47.931000','2024-04-15 08:47:47.973000','2024-04-15 08:47:49.186000','2024-04-15 08:47:49.186000','2024-04-15 08:47:49.173000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3571,'2024-04-15 08:47:48.011000','2024-04-15 08:47:48.051000','2024-04-15 08:47:49.232000','2024-04-15 08:47:49.232000','2024-04-15 08:47:49.219000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3572,'2024-04-15 08:47:48.051000','2024-04-15 08:47:48.090000','2024-04-15 08:47:49.292000','2024-04-15 08:47:49.292000','2024-04-15 08:47:49.278000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3573,'2024-04-15 08:47:48.090000','2024-04-15 08:47:48.128000','2024-04-15 08:47:49.354000','2024-04-15 08:47:49.354000','2024-04-15 08:47:49.338000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3574,'2024-04-15 08:47:48.127000','2024-04-15 08:47:48.164000','2024-04-15 08:47:49.392000','2024-04-15 08:47:49.392000','2024-04-15 08:47:49.388000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3575,'2024-04-15 08:47:48.163000','2024-04-15 08:47:48.203000','2024-04-15 08:47:49.468000','2024-04-15 08:47:49.468000','2024-04-15 08:47:49.425000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3576,'2024-04-15 08:47:48.258000','2024-04-15 08:47:48.379000','2024-04-15 08:47:49.472000','2024-04-15 08:47:49.472000','2024-04-15 08:47:49.446000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3577,'2024-04-15 08:47:48.203000','2024-04-15 08:47:48.258000','2024-04-15 08:47:49.476000','2024-04-15 08:47:49.476000','2024-04-15 08:47:49.455000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3578,'2024-04-15 08:47:48.378000','2024-04-15 08:47:48.421000','2024-04-15 08:47:49.516000','2024-04-15 08:47:49.516000','2024-04-15 08:47:49.498000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3579,'2024-04-15 08:47:48.421000','2024-04-15 08:47:48.460000','2024-04-15 08:47:49.593000','2024-04-15 08:47:49.593000','2024-04-15 08:47:49.585000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3580,'2024-04-15 08:47:48.460000','2024-04-15 08:47:48.501000','2024-04-15 08:47:49.677000','2024-04-15 08:47:49.677000','2024-04-15 08:47:49.638000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3581,'2024-04-15 08:47:48.500000','2024-04-15 08:47:48.541000','2024-04-15 08:47:49.886000','2024-04-15 08:47:49.886000','2024-04-15 08:47:49.787000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3582,'2024-04-15 08:47:48.541000','2024-04-15 08:47:48.599000','2024-04-15 08:47:49.892000','2024-04-15 08:47:49.892000','2024-04-15 08:47:49.827000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3583,'2024-04-15 08:47:48.599000','2024-04-15 08:47:48.666000','2024-04-15 08:47:49.896000','2024-04-15 08:47:49.896000','2024-04-15 08:47:49.842000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3584,'2024-04-15 08:47:48.666000','2024-04-15 08:47:48.736000','2024-04-15 08:47:49.904000','2024-04-15 08:47:49.904000','2024-04-15 08:47:49.862000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3585,'2024-04-15 08:47:48.736000','2024-04-15 08:47:48.809000','2024-04-15 08:47:49.940000','2024-04-15 08:47:49.940000','2024-04-15 08:47:49.925000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3586,'2024-04-15 08:47:48.808000','2024-04-15 08:47:48.880000','2024-04-15 08:47:50.109000','2024-04-15 08:47:50.109000','2024-04-15 08:47:50.099000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3587,'2024-04-15 08:47:48.950000','2024-04-15 08:47:49.024000','2024-04-15 08:47:50.184000','2024-04-15 08:47:50.184000','2024-04-15 08:47:50.129000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3588,'2024-04-15 08:47:48.879000','2024-04-15 08:47:48.951000','2024-04-15 08:47:50.190000','2024-04-15 08:47:50.190000','2024-04-15 08:47:50.139000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3589,'2024-04-15 08:47:49.023000','2024-04-15 08:47:49.161000','2024-04-15 08:47:50.252000','2024-04-15 08:47:50.252000','2024-04-15 08:47:50.206000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3590,'2024-04-15 08:47:49.160000','2024-04-15 08:47:49.567000','2024-04-15 08:47:50.256000','2024-04-15 08:47:50.256000','2024-04-15 08:47:50.223000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3591,'2024-04-15 08:47:49.566000','2024-04-15 08:47:49.651000','2024-04-15 08:47:50.298000','2024-04-15 08:47:50.298000','2024-04-15 08:47:50.262000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3592,'2024-04-15 08:47:49.651000','2024-04-15 08:47:50.353000','2024-04-15 08:47:54.000000','2024-04-15 08:47:54.000000','2024-04-15 08:47:50.870000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3593,'2024-04-15 08:47:50.353000','2024-04-15 08:47:50.775000','2024-04-15 08:47:54.004000','2024-04-15 08:47:54.004000','2024-04-15 08:47:50.886000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3594,'2024-04-15 08:47:50.774000','2024-04-15 08:47:51.754000','2024-04-15 08:47:54.388000','2024-04-15 08:47:54.388000','2024-04-15 08:47:54.223000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3595,'2024-04-15 08:47:51.753000','2024-04-15 08:47:52.064000','2024-04-15 08:47:54.396000','2024-04-15 08:47:54.396000','2024-04-15 08:47:54.334000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3596,'2024-04-15 08:47:52.063000','2024-04-15 08:47:52.120000','2024-04-15 08:47:54.399000','2024-04-15 08:47:54.399000','2024-04-15 08:47:54.370000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3597,'2024-04-15 08:47:52.119000','2024-04-15 08:47:52.174000','2024-04-15 08:47:54.544000','2024-04-15 08:47:54.544000','2024-04-15 08:47:54.537000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3598,'2024-04-15 08:47:52.173000','2024-04-15 08:47:52.227000','2024-04-15 08:47:54.624000','2024-04-15 08:47:54.624000','2024-04-15 08:47:54.585000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3599,'2024-04-15 08:47:52.226000','2024-04-15 08:47:52.292000','2024-04-15 08:47:54.784000','2024-04-15 08:47:54.784000','2024-04-15 08:47:54.682000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3600,'2024-04-15 08:47:52.291000','2024-04-15 08:47:52.360000','2024-04-15 08:47:54.788000','2024-04-15 08:47:54.788000','2024-04-15 08:47:54.698000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3601,'2024-04-15 08:47:52.359000','2024-04-15 08:47:52.427000','2024-04-15 08:47:54.804000','2024-04-15 08:47:54.804000','2024-04-15 08:47:54.719000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3602,'2024-04-15 08:47:52.427000','2024-04-15 08:47:52.497000','2024-04-15 08:47:54.955000','2024-04-15 08:47:54.955000','2024-04-15 08:47:54.945000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3603,'2024-04-15 08:47:52.496000','2024-04-15 08:47:52.563000','2024-04-15 08:47:55.075000','2024-04-15 08:47:55.075000','2024-04-15 08:47:55.039000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3604,'2024-04-15 08:47:52.562000','2024-04-15 08:47:52.639000','2024-04-15 08:47:55.117000','2024-04-15 08:47:55.117000','2024-04-15 08:47:55.082000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3605,'2024-04-15 08:47:52.638000','2024-04-15 08:47:52.724000','2024-04-15 08:47:55.124000','2024-04-15 08:47:55.124000','2024-04-15 08:47:55.102000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3606,'2024-04-15 08:47:52.723000','2024-04-15 08:47:52.771000','2024-04-15 08:47:55.172000','2024-04-15 08:47:55.172000','2024-04-15 08:47:55.158000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3607,'2024-04-15 08:47:52.770000','2024-04-15 08:47:52.808000','2024-04-15 08:47:55.248000','2024-04-15 08:47:55.248000','2024-04-15 08:47:55.209000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3608,'2024-04-15 08:47:52.808000','2024-04-15 08:47:52.843000','2024-04-15 08:47:55.251000','2024-04-15 08:47:55.251000','2024-04-15 08:47:55.220000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3609,'2024-04-15 08:47:52.843000','2024-04-15 08:47:52.889000','2024-04-15 08:47:55.368000','2024-04-15 08:47:55.368000','2024-04-15 08:47:55.359000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3610,'2024-04-15 08:47:52.889000','2024-04-15 08:47:52.968000','2024-04-15 08:47:55.449000','2024-04-15 08:47:55.449000','2024-04-15 08:47:55.427000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3611,'2024-04-15 08:47:53.054000','2024-04-15 08:47:53.111000','2024-04-15 08:47:55.456000','2024-04-15 08:47:55.456000','2024-04-15 08:47:55.439000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3612,'2024-04-15 08:47:53.110000','2024-04-15 08:47:53.166000','2024-04-15 08:47:55.520000','2024-04-15 08:47:55.520000','2024-04-15 08:47:55.487000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3613,'2024-04-15 08:47:52.968000','2024-04-15 08:47:53.054000','2024-04-15 08:47:55.526000','2024-04-15 08:47:55.526000','2024-04-15 08:47:55.499000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3614,'2024-04-15 08:47:53.165000','2024-04-15 08:47:53.221000','2024-04-15 08:47:55.577000','2024-04-15 08:47:55.577000','2024-04-15 08:47:55.550000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3615,'2024-04-15 08:47:53.220000','2024-04-15 08:47:53.278000','2024-04-15 08:47:55.705000','2024-04-15 08:47:55.705000','2024-04-15 08:47:55.692000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3616,'2024-04-15 08:47:53.278000','2024-04-15 08:47:53.336000','2024-04-15 08:47:55.813000','2024-04-15 08:47:55.813000','2024-04-15 08:47:55.767000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3617,'2024-04-15 08:47:53.335000','2024-04-15 08:47:53.390000','2024-04-15 08:47:55.815000','2024-04-15 08:47:55.815000','2024-04-15 08:47:55.782000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3618,'2024-04-15 08:47:53.390000','2024-04-15 08:47:53.443000','2024-04-15 08:47:55.817000','2024-04-15 08:47:55.817000','2024-04-15 08:47:55.795000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3619,'2024-04-15 08:47:53.443000','2024-04-15 08:47:53.500000','2024-04-15 08:47:55.870000','2024-04-15 08:47:55.870000','2024-04-15 08:47:55.843000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3620,'2024-04-15 08:47:53.499000','2024-04-15 08:47:53.555000','2024-04-15 08:47:55.872000','2024-04-15 08:47:55.872000','2024-04-15 08:47:55.847000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3621,'2024-04-15 08:47:53.554000','2024-04-15 08:47:53.599000','2024-04-15 08:47:56.042000','2024-04-15 08:47:56.042000','2024-04-15 08:47:56.030000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3622,'2024-04-15 08:47:53.599000','2024-04-15 08:47:53.650000','2024-04-15 08:47:56.090000','2024-04-15 08:47:56.090000','2024-04-15 08:47:56.065000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3623,'2024-04-15 08:47:53.650000','2024-04-15 08:47:53.712000','2024-04-15 08:47:56.096000','2024-04-15 08:47:56.096000','2024-04-15 08:47:56.075000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3624,'2024-04-15 08:47:53.711000','2024-04-15 08:47:53.791000','2024-04-15 08:47:56.178000','2024-04-15 08:47:56.178000','2024-04-15 08:47:56.127000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3625,'2024-04-15 08:47:53.791000','2024-04-15 08:47:53.859000','2024-04-15 08:47:56.182000','2024-04-15 08:47:56.182000','2024-04-15 08:47:56.155000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3626,'2024-04-15 08:47:53.859000','2024-04-15 08:47:53.917000','2024-04-15 08:47:56.252000','2024-04-15 08:47:56.252000','2024-04-15 08:47:56.222000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3627,'2024-04-15 08:47:53.917000','2024-04-15 08:47:54.019000','2024-04-15 08:47:56.368000','2024-04-15 08:47:56.368000','2024-04-15 08:47:56.352000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3628,'2024-04-15 08:47:54.019000','2024-04-15 08:47:54.180000','2024-04-15 08:47:56.476000','2024-04-15 08:47:56.476000','2024-04-15 08:47:56.412000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3629,'2024-04-15 08:47:54.179000','2024-04-15 08:47:54.250000','2024-04-15 08:47:56.480000','2024-04-15 08:47:56.480000','2024-04-15 08:47:56.447000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3630,'2024-04-15 08:47:54.249000','2024-04-15 08:47:54.299000','2024-04-15 08:47:56.650000','2024-04-15 08:47:56.650000','2024-04-15 08:47:56.538000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3631,'2024-04-15 08:47:54.299000','2024-04-15 08:47:54.339000','2024-04-15 08:47:56.659000','2024-04-15 08:47:56.659000','2024-04-15 08:47:56.585000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3632,'2024-04-15 08:47:54.338000','2024-04-15 08:47:54.401000','2024-04-15 08:47:56.667000','2024-04-15 08:47:56.667000','2024-04-15 08:47:56.615000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3633,'2024-04-15 08:47:54.400000','2024-04-15 08:47:54.464000','2024-04-15 08:47:56.731000','2024-04-15 08:47:56.731000','2024-04-15 08:47:56.713000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3634,'2024-04-15 08:47:54.463000','2024-04-15 08:47:54.528000','2024-04-15 08:47:56.826000','2024-04-15 08:47:56.826000','2024-04-15 08:47:56.811000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3635,'2024-04-15 08:47:54.528000','2024-04-15 08:47:54.598000','2024-04-15 08:47:56.869000','2024-04-15 08:47:56.869000','2024-04-15 08:47:56.846000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3636,'2024-04-15 08:47:54.597000','2024-04-15 08:47:54.665000','2024-04-15 08:47:56.934000','2024-04-15 08:47:56.934000','2024-04-15 08:47:56.911000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3637,'2024-04-15 08:47:54.664000','2024-04-15 08:47:54.730000','2024-04-15 08:47:56.936000','2024-04-15 08:47:56.936000','2024-04-15 08:47:56.921000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3638,'2024-04-15 08:47:54.729000','2024-04-15 08:47:54.804000','2024-04-15 08:47:57.004000','2024-04-15 08:47:57.004000','2024-04-15 08:47:56.965000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3639,'2024-04-15 08:47:54.804000','2024-04-15 08:47:54.878000','2024-04-15 08:47:57.008000','2024-04-15 08:47:57.008000','2024-04-15 08:47:56.974000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3640,'2024-04-15 08:47:54.877000','2024-04-15 08:47:54.944000','2024-04-15 08:47:57.086000','2024-04-15 08:47:57.086000','2024-04-15 08:47:57.062000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3641,'2024-04-15 08:47:54.944000','2024-04-15 08:47:55.031000','2024-04-15 08:47:57.145000','2024-04-15 08:47:57.145000','2024-04-15 08:47:57.129000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3642,'2024-04-15 08:47:55.202000','2024-04-15 08:47:55.508000','2024-04-15 08:47:57.195000','2024-04-15 08:47:57.195000','2024-04-15 08:47:57.185000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3643,'2024-04-15 08:47:55.030000','2024-04-15 08:47:55.203000','2024-04-15 08:47:57.227000','2024-04-15 08:47:57.227000','2024-04-15 08:47:57.214000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3644,'2024-04-15 08:47:55.507000','2024-04-15 08:47:55.787000','2024-04-15 08:47:57.265000','2024-04-15 08:47:57.265000','2024-04-15 08:47:57.249000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3645,'2024-04-15 08:47:55.786000','2024-04-15 08:47:56.202000','2024-04-15 08:47:57.329000','2024-04-15 08:47:57.329000','2024-04-15 08:47:57.295000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3646,'2024-04-15 08:47:56.201000','2024-04-15 08:47:56.753000','2024-04-15 08:48:00.924000','2024-04-15 08:48:00.924000','2024-04-15 08:47:57.775000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3647,'2024-04-15 08:47:56.753000','2024-04-15 08:47:57.041000','2024-04-15 08:48:00.928000','2024-04-15 08:48:00.928000','2024-04-15 08:47:57.801000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3648,'2024-04-15 08:47:57.040000','2024-04-15 08:47:57.815000','2024-04-15 08:48:00.995000','2024-04-15 08:48:00.995000','2024-04-15 08:48:00.971000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3649,'2024-04-15 08:47:57.814000','2024-04-15 08:47:58.233000','2024-04-15 08:48:01.000000','2024-04-15 08:48:01.000000','2024-04-15 08:48:00.983000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3650,'2024-04-15 08:47:58.232000','2024-04-15 08:47:58.697000','2024-04-15 08:48:01.164000','2024-04-15 08:48:01.164000','2024-04-15 08:48:01.145000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3651,'2024-04-15 08:47:58.696000','2024-04-15 08:47:58.781000','2024-04-15 08:48:01.205000','2024-04-15 08:48:01.205000','2024-04-15 08:48:01.200000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3652,'2024-04-15 08:47:58.781000','2024-04-15 08:47:58.832000','2024-04-15 08:48:01.248000','2024-04-15 08:48:01.248000','2024-04-15 08:48:01.234000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3653,'2024-04-15 08:47:58.831000','2024-04-15 08:47:58.901000','2024-04-15 08:48:01.313000','2024-04-15 08:48:01.313000','2024-04-15 08:48:01.293000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3654,'2024-04-15 08:47:58.901000','2024-04-15 08:47:58.962000','2024-04-15 08:48:01.316000','2024-04-15 08:48:01.316000','2024-04-15 08:48:01.303000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3655,'2024-04-15 08:47:58.961000','2024-04-15 08:47:59.009000','2024-04-15 08:48:01.368000','2024-04-15 08:48:01.368000','2024-04-15 08:48:01.359000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3656,'2024-04-15 08:47:59.007000','2024-04-15 08:47:59.054000','2024-04-15 08:48:01.410000','2024-04-15 08:48:01.410000','2024-04-15 08:48:01.395000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3657,'2024-04-15 08:47:59.054000','2024-04-15 08:47:59.096000','2024-04-15 08:48:01.438000','2024-04-15 08:48:01.438000','2024-04-15 08:48:01.429000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3658,'2024-04-15 08:47:59.143000','2024-04-15 08:47:59.191000','2024-04-15 08:48:01.894000','2024-04-15 08:48:01.894000','2024-04-15 08:48:01.876000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3659,'2024-04-15 08:47:59.096000','2024-04-15 08:47:59.143000','2024-04-15 08:48:01.896000','2024-04-15 08:48:01.896000','2024-04-15 08:48:01.886000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3660,'2024-04-15 08:47:59.190000','2024-04-15 08:47:59.236000','2024-04-15 08:48:01.938000','2024-04-15 08:48:01.938000','2024-04-15 08:48:01.919000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3661,'2024-04-15 08:47:59.235000','2024-04-15 08:47:59.281000','2024-04-15 08:48:02.003000','2024-04-15 08:48:02.003000','2024-04-15 08:48:01.994000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3662,'2024-04-15 08:47:59.281000','2024-04-15 08:47:59.326000','2024-04-15 08:48:02.054000','2024-04-15 08:48:02.054000','2024-04-15 08:48:02.046000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3663,'2024-04-15 08:47:59.325000','2024-04-15 08:47:59.375000','2024-04-15 08:48:02.120000','2024-04-15 08:48:02.120000','2024-04-15 08:48:02.102000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3664,'2024-04-15 08:47:59.375000','2024-04-15 08:47:59.428000','2024-04-15 08:48:02.128000','2024-04-15 08:48:02.128000','2024-04-15 08:48:02.112000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3665,'2024-04-15 08:47:59.427000','2024-04-15 08:47:59.490000','2024-04-15 08:48:02.164000','2024-04-15 08:48:02.164000','2024-04-15 08:48:02.144000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3666,'2024-04-15 08:47:59.490000','2024-04-15 08:47:59.563000','2024-04-15 08:48:02.206000','2024-04-15 08:48:02.206000','2024-04-15 08:48:02.185000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3667,'2024-04-15 08:47:59.562000','2024-04-15 08:47:59.748000','2024-04-15 08:48:02.268000','2024-04-15 08:48:02.268000','2024-04-15 08:48:02.254000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3668,'2024-04-15 08:47:59.747000','2024-04-15 08:47:59.821000','2024-04-15 08:48:02.290000','2024-04-15 08:48:02.290000','2024-04-15 08:48:02.277000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3669,'2024-04-15 08:47:59.889000','2024-04-15 08:47:59.980000','2024-04-15 08:48:02.344000','2024-04-15 08:48:02.344000','2024-04-15 08:48:02.331000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3670,'2024-04-15 08:47:59.821000','2024-04-15 08:47:59.891000','2024-04-15 08:48:02.417000','2024-04-15 08:48:02.417000','2024-04-15 08:48:02.376000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3671,'2024-04-15 08:47:59.979000','2024-04-15 08:48:00.109000','2024-04-15 08:48:02.419000','2024-04-15 08:48:02.419000','2024-04-15 08:48:02.393000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3672,'2024-04-15 08:48:00.109000','2024-04-15 08:48:00.174000','2024-04-15 08:48:02.452000','2024-04-15 08:48:02.452000','2024-04-15 08:48:02.406000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3673,'2024-04-15 08:48:00.174000','2024-04-15 08:48:00.224000','2024-04-15 08:48:02.530000','2024-04-15 08:48:02.530000','2024-04-15 08:48:02.508000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3674,'2024-04-15 08:48:00.223000','2024-04-15 08:48:00.264000','2024-04-15 08:48:02.533000','2024-04-15 08:48:02.533000','2024-04-15 08:48:02.519000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3675,'2024-04-15 08:48:00.264000','2024-04-15 08:48:00.304000','2024-04-15 08:48:02.652000','2024-04-15 08:48:02.652000','2024-04-15 08:48:02.638000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3676,'2024-04-15 08:48:00.304000','2024-04-15 08:48:00.348000','2024-04-15 08:48:02.692000','2024-04-15 08:48:02.692000','2024-04-15 08:48:02.680000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3677,'2024-04-15 08:48:00.347000','2024-04-15 08:48:00.398000','2024-04-15 08:48:02.741000','2024-04-15 08:48:02.741000','2024-04-15 08:48:02.716000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3678,'2024-04-15 08:48:00.398000','2024-04-15 08:48:00.458000','2024-04-15 08:48:02.743000','2024-04-15 08:48:02.743000','2024-04-15 08:48:02.727000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3679,'2024-04-15 08:48:00.458000','2024-04-15 08:48:00.528000','2024-04-15 08:48:02.803000','2024-04-15 08:48:02.803000','2024-04-15 08:48:02.782000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3680,'2024-04-15 08:48:00.527000','2024-04-15 08:48:00.594000','2024-04-15 08:48:02.808000','2024-04-15 08:48:02.808000','2024-04-15 08:48:02.792000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3681,'2024-04-15 08:48:00.594000','2024-04-15 08:48:00.695000','2024-04-15 08:48:02.852000','2024-04-15 08:48:02.852000','2024-04-15 08:48:02.843000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3682,'2024-04-15 08:48:00.694000','2024-04-15 08:48:00.800000','2024-04-15 08:48:02.910000','2024-04-15 08:48:02.910000','2024-04-15 08:48:02.902000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3683,'2024-04-15 08:48:00.800000','2024-04-15 08:48:00.859000','2024-04-15 08:48:02.964000','2024-04-15 08:48:02.964000','2024-04-15 08:48:02.956000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3684,'2024-04-15 08:48:00.858000','2024-04-15 08:48:00.935000','2024-04-15 08:48:02.994000','2024-04-15 08:48:02.994000','2024-04-15 08:48:02.979000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3685,'2024-04-15 08:48:00.934000','2024-04-15 08:48:00.984000','2024-04-15 08:48:03.021000','2024-04-15 08:48:03.021000','2024-04-15 08:48:03.011000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3686,'2024-04-15 08:48:00.983000','2024-04-15 08:48:01.039000','2024-04-15 08:48:03.070000','2024-04-15 08:48:03.070000','2024-04-15 08:48:03.049000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3687,'2024-04-15 08:48:01.038000','2024-04-15 08:48:01.099000','2024-04-15 08:48:03.076000','2024-04-15 08:48:03.076000','2024-04-15 08:48:03.058000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3688,'2024-04-15 08:48:01.098000','2024-04-15 08:48:01.165000','2024-04-15 08:48:03.114000','2024-04-15 08:48:03.114000','2024-04-15 08:48:03.106000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3689,'2024-04-15 08:48:01.165000','2024-04-15 08:48:01.248000','2024-04-15 08:48:03.156000','2024-04-15 08:48:03.156000','2024-04-15 08:48:03.148000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3690,'2024-04-15 08:48:01.247000','2024-04-15 08:48:01.340000','2024-04-15 08:48:03.202000','2024-04-15 08:48:03.202000','2024-04-15 08:48:03.191000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3691,'2024-04-15 08:48:01.339000','2024-04-15 08:48:01.424000','2024-04-15 08:48:03.236000','2024-04-15 08:48:03.236000','2024-04-15 08:48:03.228000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3692,'2024-04-15 08:48:01.423000','2024-04-15 08:48:01.517000','2024-04-15 08:48:03.264000','2024-04-15 08:48:03.264000','2024-04-15 08:48:03.251000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3693,'2024-04-15 08:48:01.516000','2024-04-15 08:48:01.606000','2024-04-15 08:48:03.296000','2024-04-15 08:48:03.296000','2024-04-15 08:48:03.285000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3694,'2024-04-15 08:48:01.604000','2024-04-15 08:48:01.774000','2024-04-15 08:48:03.352000','2024-04-15 08:48:03.352000','2024-04-15 08:48:03.322000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3695,'2024-04-15 08:48:01.772000','2024-04-15 08:48:02.055000','2024-04-15 08:48:03.355000','2024-04-15 08:48:03.355000','2024-04-15 08:48:03.334000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3696,'2024-04-15 08:48:02.055000','2024-04-15 08:48:02.332000','2024-04-15 08:48:03.397000','2024-04-15 08:48:03.397000','2024-04-15 08:48:03.378000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3697,'2024-04-15 08:48:02.331000','2024-04-15 08:48:02.452000','2024-04-15 08:48:03.448000','2024-04-15 08:48:03.448000','2024-04-15 08:48:03.431000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3698,'2024-04-15 08:48:02.451000','2024-04-15 08:48:02.758000','2024-04-15 08:48:03.479000','2024-04-15 08:48:03.479000','2024-04-15 08:48:03.470000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3699,'2024-04-15 08:48:02.758000','2024-04-15 08:48:03.891000','2024-04-15 08:48:06.555000','2024-04-15 08:48:06.555000','2024-04-15 08:48:06.544000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3700,'2024-04-15 08:48:03.890000','2024-04-15 08:48:04.954000','2024-04-15 08:48:06.630000','2024-04-15 08:48:06.630000','2024-04-15 08:48:06.591000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3701,'2024-04-15 08:48:04.954000','2024-04-15 08:48:06.064000','2024-04-15 08:48:06.636000','2024-04-15 08:48:06.636000','2024-04-15 08:48:06.598000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3702,'2024-04-15 08:48:06.064000','2024-04-15 08:48:06.140000','2024-04-15 08:48:06.638000','2024-04-15 08:48:06.638000','2024-04-15 08:48:06.610000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3703,'2024-04-15 08:48:06.139000','2024-04-15 08:48:06.211000','2024-04-15 08:48:06.640000','2024-04-15 08:48:06.640000','2024-04-15 08:48:06.617000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3704,'2024-04-15 08:48:06.272000','2024-04-15 08:48:06.332000','2024-04-15 08:48:06.944000','2024-04-15 08:48:06.944000','2024-04-15 08:48:06.921000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3705,'2024-04-15 08:48:06.331000','2024-04-15 08:48:06.460000','2024-04-15 08:48:06.947000','2024-04-15 08:48:06.947000','2024-04-15 08:48:06.926000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3706,'2024-04-15 08:48:06.460000','2024-04-15 08:48:06.529000','2024-04-15 08:48:06.953000','2024-04-15 08:48:06.953000','2024-04-15 08:48:06.937000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3707,'2024-04-15 08:48:06.528000','2024-04-15 08:48:06.601000','2024-04-15 08:48:07.008000','2024-04-15 08:48:07.008000','2024-04-15 08:48:06.974000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3708,'2024-04-15 08:48:06.211000','2024-04-15 08:48:06.273000','2024-04-15 08:48:07.017000','2024-04-15 08:48:07.017000','2024-04-15 08:48:06.984000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3709,'2024-04-15 08:48:06.601000','2024-04-15 08:48:06.669000','2024-04-15 08:48:07.173000','2024-04-15 08:48:07.173000','2024-04-15 08:48:07.160000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3710,'2024-04-15 08:48:06.668000','2024-04-15 08:48:06.752000','2024-04-15 08:48:07.205000','2024-04-15 08:48:07.205000','2024-04-15 08:48:07.186000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3711,'2024-04-15 08:48:06.751000','2024-04-15 08:48:06.825000','2024-04-15 08:48:07.226000','2024-04-15 08:48:07.226000','2024-04-15 08:48:07.208000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3712,'2024-04-15 08:48:06.825000','2024-04-15 08:48:07.537000','2024-04-15 08:48:07.257000','2024-04-15 08:48:07.257000','2024-04-15 08:48:07.231000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3713,'2024-04-15 08:48:07.537000','2024-04-15 08:48:07.628000','2024-04-15 08:48:07.312000','2024-04-15 08:48:07.312000','2024-04-15 08:48:07.283000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3714,'2024-04-15 08:48:07.627000','2024-04-15 08:48:07.870000','2024-04-15 08:48:07.486000','2024-04-15 08:48:07.486000','2024-04-15 08:48:07.478000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3715,'2024-04-15 08:48:07.870000','2024-04-15 08:48:08.012000','2024-04-15 08:48:07.652000','2024-04-15 08:48:07.652000','2024-04-15 08:48:07.638000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3716,'2024-04-15 08:48:08.012000','2024-04-15 08:48:08.388000','2024-04-15 08:48:08.042000','2024-04-15 08:48:08.042000','2024-04-15 08:48:08.034000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3717,'2024-04-15 08:48:08.387000','2024-04-15 08:48:08.777000','2024-04-15 08:48:08.406000','2024-04-15 08:48:08.406000','2024-04-15 08:48:08.398000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3718,'2024-04-15 08:48:08.776000','2024-04-15 08:48:08.881000','2024-04-15 08:48:08.516000','2024-04-15 08:48:08.516000','2024-04-15 08:48:08.498000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3719,'2024-04-15 08:48:08.881000','2024-04-15 08:48:09.016000','2024-04-15 08:48:08.848000','2024-04-15 08:48:08.848000','2024-04-15 08:48:08.842000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3720,'2024-04-15 08:48:08.881000','2024-04-15 08:48:09.221000','2024-04-15 08:48:08.891000','2024-04-15 08:48:08.891000','2024-04-15 08:48:08.879000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3721,'2024-04-15 08:48:09.221000','2024-04-15 08:48:09.312000','2024-04-15 08:48:08.934000','2024-04-15 08:48:08.934000','2024-04-15 08:48:08.918000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3722,'2024-04-15 08:48:09.311000','2024-04-15 08:48:09.385000','2024-04-15 08:48:08.988000','2024-04-15 08:48:08.988000','2024-04-15 08:48:08.975000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-685hehjc4j76g57200dia6bg'),
(3723,'2024-04-18 21:49:38.782000','2024-04-18 21:49:38.787000','2024-04-18 21:49:39.566000','2024-04-18 21:49:39.566000','2024-04-18 21:49:39.556000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-b187b99ai31gaa21eegf38fi'),
(3724,'2024-04-18 21:54:33.879000','2024-04-18 21:54:33.885000','2024-04-18 21:54:34.551000','2024-04-18 21:54:34.551000','2024-04-18 21:54:34.538000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-5i0a63fbg923j016hbfc787j'),
(3725,'2024-04-18 22:01:09.606000','2024-04-18 22:01:09.613000','2024-04-18 22:01:10.287000','2024-04-18 22:01:10.287000','2024-04-18 22:01:10.273000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-33b76je6g13bbe18ggb85ic7'),
(3726,'2024-04-18 22:02:51.388000','2024-04-18 22:02:51.393000','2024-04-18 22:02:52.077000','2024-04-18 22:02:52.077000','2024-04-18 22:02:52.061000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-a24bhdagid6b89h4c6ae337d'),
(3727,'2024-04-18 22:35:01.518000','2024-04-18 22:35:01.524000','2024-04-18 22:35:02.700000','2024-04-18 22:35:02.700000','2024-04-18 22:35:02.690000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-d27j8372hfa7i4d0g9f234f5'),
(3728,'2024-04-18 23:05:48.222000','2024-04-18 23:05:48.224000','2024-04-18 23:05:48.989000','2024-04-18 23:05:48.989000','2024-04-18 23:05:48.976000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-7ia0fc6140c3a90676fc0411'),
(3729,'2024-04-18 23:11:01.903000','2024-04-18 23:11:01.909000','2024-04-18 23:11:03.028000','2024-04-18 23:11:03.028000','2024-04-18 23:11:03.013000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-ige1dcbf7g5hdfdbadhe6bh7'),
(3730,'2024-04-18 23:19:39.176000','2024-04-18 23:19:39.180000','2024-04-18 23:19:39.988000','2024-04-18 23:19:39.988000','2024-04-18 23:19:39.979000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-jb3cjbdh1bff2h26bh0eahj1'),
(3731,'2024-04-19 09:07:50.233000','2024-04-19 09:07:50.234000','2024-04-19 09:07:50.573000','2024-04-19 09:07:50.573000','2024-04-19 09:07:50.548000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0-Win32-0e2g3f8jh6if2222h74di28f'),
(3732,'2024-04-19 09:09:46.988000','2024-04-19 09:09:46.990000','2024-04-19 09:09:47.206000','2024-04-19 09:09:47.206000','2024-04-19 09:09:47.187000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:125.0) Gecko/20100101 Firefox/125.0-Win32-50ag7i9gh507jib0ihjc7gb6'),
(3733,'2024-04-19 09:42:51.714000','2024-04-19 09:42:51.718000','2024-04-19 09:42:52.077000','2024-04-19 09:42:52.077000','2024-04-19 09:42:52.061000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36-Win32-3if3648f5d4d1db998hgiid6'),
(3734,'2024-04-27 17:06:14.192000','2024-04-27 17:06:14.210000','2024-04-27 17:06:18.004000','2024-04-27 17:06:18.004000','2024-04-27 17:06:17.993000',NULL,NULL,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36-Linux armv81-4b8febdhfh4h84e6464dd68a'),
(3735,'2024-04-27 17:09:31.979000','2024-04-27 17:09:31.992000','2024-04-27 17:09:34.720000','2024-04-27 17:09:34.720000','2024-04-27 17:09:34.667000',NULL,NULL,'Mozilla/5.0 (Linux; Android 12; SM-A125F Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/124.0.6367.64 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/460.0.0.34.89;]-Linux aarch64-fda1bf46h1cg4bih0dhf63bd'),
(3736,'2024-04-28 17:15:57.088000','2024-04-28 17:15:57.097000','2024-04-28 17:15:59.313000','2024-04-28 17:15:59.313000','2024-04-28 17:15:59.298000',NULL,NULL,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36-Linux armv81-ige8j16gjbcc4e5a508i01j9'),
(3737,'2024-04-29 18:26:57.758000','2024-04-29 18:26:57.763000','2024-04-29 18:26:58.585000','2024-04-29 18:26:58.585000','2024-04-29 18:26:58.573000',NULL,NULL,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36-Linux armv81-h3b68ac9aag75h084d07f066'),
(3738,'2024-04-30 12:55:11.195000','2024-04-30 12:55:11.196000','2024-04-30 12:55:12.504000','2024-04-30 12:55:12.504000','2024-04-30 12:55:12.451000',NULL,NULL,'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1-Win32-96fifa9cj4j48hh672jijc8c'),
(3739,'2024-05-02 11:02:27.555000','2024-05-02 11:02:27.557000','2024-05-02 11:02:28.856000','2024-05-02 11:02:28.856000','2024-05-02 11:02:28.836000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36-Win32-6cc1f1bde79fb1ji7c4bd2ia'),
(3740,'2024-05-02 12:13:37.842000','2024-05-02 12:13:37.843000','2024-05-02 12:13:39.161000','2024-05-02 12:13:39.161000','2024-05-02 12:13:39.141000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36-Win32-da9f6999800cae465735ai84'),
(3741,'2024-05-02 12:15:26.674000','2024-05-02 12:15:26.675000','2024-05-02 12:15:27.848000','2024-05-02 12:15:27.848000','2024-05-02 12:15:27.831000',NULL,NULL,NULL),
(3742,'2024-05-02 13:18:37.149000','2024-05-02 13:18:37.150000','2024-05-02 13:18:38.621000','2024-05-02 13:18:38.621000','2024-05-02 13:18:38.587000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36-Win32-i9gh973behd88igf004603e6'),
(3743,'2024-05-02 13:27:42.069000','2024-05-02 13:27:42.071000','2024-05-02 13:27:43.353000','2024-05-02 13:27:43.353000','2024-05-02 13:27:43.337000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36-Win32-h5178b069cg6gd9a261329f0'),
(3744,'2024-05-02 17:24:44.668000','2024-05-02 17:24:44.670000','2024-05-02 17:24:46.261000','2024-05-02 17:24:46.261000','2024-05-02 17:24:46.232000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36-Win32-90i578ibj4i7ca6a7a44dh74'),
(3745,'2024-05-03 15:57:48.331000','2024-05-03 15:57:48.336000','2024-05-03 15:57:51.366000','2024-05-03 15:57:51.366000','2024-05-03 15:57:51.271000',NULL,NULL,'Mozilla/5.0 (Linux; Android 13; SAMSUNG SM-A032F Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 SamsungBrowser/7.4 Chrome/123.0.6312.118 Mobile Safari/537.36-Linux armv8l-bj8ig57518jh381a45944jaa'),
(3746,'2024-05-04 21:03:53.527000','2024-05-04 21:03:53.554000','2024-05-04 21:03:54.849000','2024-05-04 21:03:54.849000','2024-05-04 21:03:54.833000',NULL,NULL,'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1-iPhone-389cg242353j8gaicj0h2egb'),
(3747,'2024-05-11 12:38:31.240000','2024-05-11 12:38:31.243000','2024-05-11 12:38:31.950000','2024-05-11 12:38:31.950000','2024-05-11 12:38:31.914000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36-Win32-1bih79gi1b0eg6b4j6e15bbe'),
(3748,'2024-05-11 12:42:53.021000','2024-05-11 12:42:53.023000','2024-05-11 12:42:53.221000','2024-05-11 12:42:53.221000','2024-05-11 12:42:53.203000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36-Win32-0j2j2igbbgh81fcb50ahf0bg'),
(3749,'2024-05-11 12:48:03.682000','2024-05-11 12:48:03.684000','2024-05-11 12:48:04.389000','2024-05-11 12:48:04.389000','2024-05-11 12:48:04.336000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36-Win32-52jg11f916j9dh6ajh3f3ac9'),
(3750,'2024-06-23 15:48:03.930000','2024-06-23 15:48:03.931000','2024-06-23 15:48:04.709000','2024-06-23 15:48:04.709000','2024-06-23 15:48:04.697000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0-Win32-7id0220d78d674f61hh6ibe6'),
(3751,'2024-06-23 16:11:41.568000','2024-06-23 16:11:41.570000','2024-06-23 16:11:42.055000','2024-06-23 16:11:42.055000','2024-06-23 16:11:42.040000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0-Win32-he22e296chc51i81gi7fhd16'),
(3752,'2024-06-23 16:15:30.752000','2024-06-23 16:15:30.756000','2024-06-23 16:15:31.219000','2024-06-23 16:15:31.219000','2024-06-23 16:15:31.208000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:127.0) Gecko/20100101 Firefox/127.0-Win32-7id0220d78d674f61hh6ibe6'),
(3753,'2024-06-23 16:37:06.972000','2024-06-23 16:37:06.977000','2024-06-23 16:37:07.507000','2024-06-23 16:37:07.507000','2024-06-23 16:37:07.477000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36-Win32-0h7e9e325a0700i4fhd2d78i'),
(3754,'2024-06-26 13:07:49.725000','2024-06-26 13:07:49.746000','2024-06-26 13:07:50.134000','2024-06-26 13:07:50.134000','2024-06-26 13:07:50.124000',NULL,NULL,'Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0-Linux x86_64-a0a87gecjj7eg9bac988453f'),
(3755,'2024-06-26 14:27:36.095000','2024-06-26 14:27:36.096000','2024-06-26 14:27:36.932000','2024-06-26 14:27:36.932000','2024-06-26 14:27:36.917000',NULL,NULL,'Mozilla/5.0 (iPhone; CPU iPhone OS 17_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/126.0.6478.153 Mobile/15E148 Safari/604.1-iPhone-g4b3h07918f48c693jaa8d12'),
(3756,'2024-07-05 14:50:51.238000','2024-07-05 14:50:51.239000','2024-07-05 14:50:52.082000','2024-07-05 14:50:52.082000','2024-07-05 14:50:52.073000',NULL,NULL,'Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0-Linux x86_64-a0a87gecjj7eg9bac988453f'),
(3757,'2024-07-17 19:49:33.060000','2024-07-17 19:49:33.064000','2024-07-17 19:49:35.427000','2024-07-17 19:49:35.427000','2024-07-17 19:49:35.417000',NULL,NULL,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36-Linux armv81-fg203584b5ea0i4ci8h56ac'),
(3758,'2024-08-01 19:47:22.873000','2024-08-01 19:47:22.878000','2024-08-01 19:47:24.907000','2024-08-01 19:47:24.907000','2024-08-01 19:47:24.890000',NULL,NULL,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36-Linux armv81-fg203584b5ea0i4ci8h56ac'),
(3759,'2024-08-03 00:09:46.142000','2024-08-03 00:09:46.178000','2024-08-03 00:09:46.861000','2024-08-03 00:09:46.861000','2024-08-03 00:09:46.849000',NULL,NULL,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Mobile Safari/537.36-Linux armv81-fg203584b5ea0i4ci8h56ac'),
(3760,'2024-08-25 21:42:58.607000','2024-08-25 21:42:58.609000','2024-08-25 21:42:59.620000','2024-08-25 21:42:59.620000','2024-08-25 21:42:59.614000',NULL,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0-Win32-45624i31di45j05c5cd28j6f'),
(3761,'2024-08-30 11:21:09.548000','2024-08-30 11:21:09.554000','2024-08-30 11:21:10.406000','2024-08-30 11:21:10.406000','2024-08-30 11:21:10.396000',NULL,NULL,'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36-Linux armv81-50c0gdd076cbgf4fhfie250e');
/*!40000 ALTER TABLE `streams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streams_song_links`
--

DROP TABLE IF EXISTS `streams_song_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streams_song_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stream_id` int(10) unsigned DEFAULT NULL,
  `song_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `streams_song_links_unique` (`stream_id`,`song_id`),
  KEY `streams_song_links_fk` (`stream_id`),
  KEY `streams_song_links_inv_fk` (`song_id`),
  CONSTRAINT `streams_song_links_fk` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `streams_song_links_inv_fk` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streams_song_links`
--

LOCK TABLES `streams_song_links` WRITE;
/*!40000 ALTER TABLE `streams_song_links` DISABLE KEYS */;
INSERT INTO `streams_song_links` VALUES
(3254,3254,7),
(3255,3255,7),
(3256,3256,7),
(3257,3257,7),
(3258,3258,7),
(3259,3259,7),
(3260,3260,7),
(3261,3261,7),
(3262,3262,7),
(3263,3263,7),
(3264,3264,7),
(3265,3265,7),
(3266,3266,7),
(3267,3267,7),
(3268,3268,7),
(3269,3269,7),
(3270,3270,7),
(3271,3271,7),
(3272,3272,7),
(3273,3273,7),
(3274,3274,7),
(3275,3275,7),
(3276,3276,7),
(3277,3277,7),
(3278,3278,7),
(3279,3279,7),
(3280,3280,7),
(3281,3281,7),
(3282,3282,7),
(3283,3283,7),
(3284,3284,7),
(3285,3285,7),
(3286,3286,7),
(3287,3287,7),
(3288,3288,7),
(3289,3289,7),
(3290,3290,7),
(3291,3291,7),
(3292,3292,7),
(3293,3293,7),
(3294,3294,7),
(3295,3295,7),
(3296,3296,7),
(3297,3297,7),
(3298,3298,7),
(3299,3299,7),
(3300,3300,7),
(3301,3301,7),
(3302,3302,7),
(3303,3303,7),
(3304,3304,7),
(3305,3305,7),
(3306,3306,7),
(3307,3307,7),
(3308,3308,7),
(3309,3309,7),
(3310,3310,7),
(3311,3311,7),
(3312,3312,7),
(3313,3313,7),
(3314,3314,7),
(3315,3315,7),
(3316,3316,7),
(3317,3317,7),
(3318,3318,7),
(3319,3319,7),
(3320,3320,7),
(3321,3321,7),
(3322,3322,7),
(3323,3323,7),
(3324,3324,7),
(3325,3325,7),
(3326,3326,7),
(3327,3327,7),
(3328,3328,7),
(3329,3329,7),
(3330,3330,7),
(3331,3331,7),
(3332,3332,7),
(3333,3333,7),
(3334,3334,7),
(3335,3335,7),
(3336,3336,7),
(3337,3337,7),
(3338,3338,7),
(3339,3339,7),
(3340,3340,7),
(3341,3341,7),
(3342,3342,7),
(3343,3343,7),
(3344,3344,7),
(3345,3345,7),
(3346,3346,7),
(3347,3347,7),
(3348,3348,7),
(3349,3349,7),
(3350,3350,7),
(3351,3351,7),
(3352,3352,7),
(3353,3353,7),
(3354,3354,7),
(3355,3355,7),
(3356,3356,7),
(3357,3357,7),
(3358,3358,7),
(3359,3359,7),
(3360,3360,7),
(3361,3361,7),
(3362,3362,7),
(3363,3363,7),
(3364,3364,7),
(3365,3365,7),
(3366,3366,7),
(3367,3367,7),
(3368,3368,7),
(3369,3369,7),
(3370,3370,7),
(3371,3371,7),
(3372,3372,7),
(3373,3373,7),
(3374,3374,7),
(3375,3375,7),
(3376,3376,7),
(3377,3377,7),
(3378,3378,7),
(3379,3379,7),
(3380,3380,7),
(3381,3381,7),
(3382,3382,7),
(3383,3383,7),
(3384,3384,7),
(3385,3385,7),
(3386,3386,7),
(3387,3387,7),
(3388,3388,7),
(3389,3389,7),
(3390,3390,7),
(3391,3391,7),
(3392,3392,7),
(3393,3393,7),
(3394,3394,7),
(3395,3395,7),
(3396,3396,7),
(3397,3397,7),
(3398,3398,7),
(3399,3399,7),
(3400,3400,7),
(3401,3401,7),
(3402,3402,7),
(3403,3403,7),
(3404,3404,7),
(3405,3405,7),
(3406,3406,7),
(3407,3407,7),
(3408,3408,7),
(3409,3409,7),
(3410,3410,7),
(3411,3411,7),
(3412,3412,7),
(3413,3413,7),
(3414,3414,7),
(3415,3415,7),
(3416,3416,7),
(3417,3417,7),
(3418,3418,7),
(3419,3419,7),
(3420,3420,7),
(3421,3421,7),
(3422,3422,7),
(3423,3423,7),
(3424,3424,7),
(3425,3425,7),
(3426,3426,7),
(3427,3427,7),
(3428,3428,7),
(3429,3429,7),
(3430,3430,7),
(3431,3431,7),
(3432,3432,7),
(3433,3433,7),
(3434,3434,7),
(3435,3435,7),
(3436,3436,7),
(3437,3437,7),
(3438,3438,7),
(3439,3439,7),
(3440,3440,7),
(3441,3441,7),
(3442,3442,7),
(3443,3443,7),
(3444,3444,7),
(3445,3445,7),
(3446,3446,7),
(3447,3447,7),
(3448,3448,7),
(3449,3449,7),
(3450,3450,7),
(3451,3451,7),
(3452,3452,7),
(3453,3453,7),
(3454,3454,7),
(3455,3455,7),
(3456,3456,7),
(3457,3457,7),
(3458,3458,7),
(3459,3459,7),
(3460,3460,7),
(3461,3461,7),
(3462,3462,7),
(3463,3463,7),
(3464,3464,7),
(3465,3465,7),
(3466,3466,7),
(3467,3467,7),
(3468,3468,7),
(3469,3469,7),
(3470,3470,7),
(3471,3471,7),
(3472,3472,7),
(3473,3473,7),
(3474,3474,7),
(3475,3475,7),
(3476,3476,7),
(3477,3477,7),
(3478,3478,7),
(3479,3479,7),
(3480,3480,7),
(3481,3481,7),
(3482,3482,7),
(3483,3483,7),
(3484,3484,7),
(3485,3485,7),
(3486,3486,7),
(3487,3487,7),
(3488,3488,7),
(3489,3489,7),
(3490,3490,7),
(3491,3491,7),
(3492,3492,7),
(3493,3493,7),
(3494,3494,7),
(3495,3495,7),
(3496,3496,7),
(3497,3497,7),
(3498,3498,7),
(3499,3499,7),
(3500,3500,7),
(3501,3501,7),
(3502,3502,7),
(3503,3503,7),
(3504,3504,7),
(3505,3505,7),
(3506,3506,7),
(3507,3507,7),
(3508,3508,7),
(3509,3509,7),
(3510,3510,7),
(3511,3511,7),
(3512,3512,7),
(3513,3513,7),
(3514,3514,7),
(3515,3515,7),
(3516,3516,7),
(3517,3517,7),
(3518,3518,7),
(3519,3519,7),
(3520,3520,7),
(3521,3521,7),
(3522,3522,7),
(3523,3523,7),
(3524,3524,7),
(3525,3525,7),
(3526,3526,7),
(3527,3527,7),
(3528,3528,7),
(3529,3529,7),
(3530,3530,7),
(3531,3531,7),
(3532,3532,7),
(3533,3533,7),
(3534,3534,7),
(3535,3535,7),
(3536,3536,7),
(3537,3537,7),
(3538,3538,7),
(3539,3539,7),
(3540,3540,7),
(3541,3541,7),
(3542,3542,7),
(3543,3543,7),
(3544,3544,7),
(3545,3545,7),
(3546,3546,7),
(3547,3547,7),
(3548,3548,7),
(3549,3549,7),
(3550,3550,7),
(3551,3551,7),
(3552,3552,7),
(3553,3553,7),
(3554,3554,7),
(3555,3555,7),
(3556,3556,7),
(3557,3557,7),
(3558,3558,7),
(3559,3559,7),
(3560,3560,7),
(3561,3561,7),
(3562,3562,7),
(3563,3563,7),
(3564,3564,7),
(3565,3565,7),
(3566,3566,7),
(3567,3567,7),
(3568,3568,7),
(3569,3569,7),
(3570,3570,7),
(3571,3571,7),
(3572,3572,7),
(3573,3573,7),
(3574,3574,7),
(3575,3575,7),
(3576,3576,7),
(3577,3577,7),
(3578,3578,7),
(3579,3579,7),
(3580,3580,7),
(3581,3581,7),
(3582,3582,7),
(3583,3583,7),
(3584,3584,7),
(3585,3585,7),
(3586,3586,7),
(3587,3587,7),
(3588,3588,7),
(3589,3589,7),
(3590,3590,7),
(3591,3591,7),
(3592,3592,7),
(3593,3593,7),
(3594,3594,7),
(3595,3595,7),
(3596,3596,7),
(3597,3597,7),
(3598,3598,7),
(3599,3599,7),
(3600,3600,7),
(3601,3601,7),
(3602,3602,7),
(3603,3603,7),
(3604,3604,7),
(3605,3605,7),
(3606,3606,7),
(3607,3607,7),
(3608,3608,7),
(3609,3609,7),
(3610,3610,7),
(3611,3611,7),
(3612,3612,7),
(3613,3613,7),
(3614,3614,7),
(3615,3615,7),
(3616,3616,7),
(3617,3617,7),
(3618,3618,7),
(3619,3619,7),
(3620,3620,7),
(3621,3621,7),
(3622,3622,7),
(3623,3623,7),
(3624,3624,7),
(3625,3625,7),
(3626,3626,7),
(3627,3627,7),
(3628,3628,7),
(3629,3629,7),
(3630,3630,7),
(3631,3631,7),
(3632,3632,7),
(3633,3633,7),
(3634,3634,7),
(3635,3635,7),
(3636,3636,7),
(3637,3637,7),
(3638,3638,7),
(3639,3639,7),
(3640,3640,7),
(3641,3641,7),
(3642,3642,7),
(3643,3643,7),
(3644,3644,7),
(3645,3645,7),
(3646,3646,7),
(3647,3647,7),
(3648,3648,7),
(3649,3649,7),
(3650,3650,7),
(3651,3651,7),
(3652,3652,7),
(3653,3653,7),
(3654,3654,7),
(3655,3655,7),
(3656,3656,7),
(3657,3657,7),
(3658,3658,7),
(3659,3659,7),
(3660,3660,7),
(3661,3661,7),
(3662,3662,7),
(3663,3663,7),
(3664,3664,7),
(3665,3665,7),
(3666,3666,7),
(3667,3667,7),
(3668,3668,7),
(3669,3669,7),
(3670,3670,7),
(3671,3671,7),
(3672,3672,7),
(3673,3673,7),
(3674,3674,7),
(3675,3675,7),
(3676,3676,7),
(3677,3677,7),
(3678,3678,7),
(3679,3679,7),
(3680,3680,7),
(3681,3681,7),
(3682,3682,7),
(3683,3683,7),
(3684,3684,7),
(3685,3685,7),
(3686,3686,7),
(3687,3687,7),
(3688,3688,7),
(3689,3689,7),
(3690,3690,7),
(3691,3691,7),
(3692,3692,7),
(3693,3693,7),
(3694,3694,7),
(3695,3695,7),
(3696,3696,7),
(3697,3697,7),
(3698,3698,7),
(3699,3699,7),
(3700,3700,7),
(3701,3701,7),
(3702,3702,7),
(3703,3703,7),
(3704,3704,7),
(3705,3705,7),
(3706,3706,7),
(3707,3707,7),
(3708,3708,7),
(3709,3709,7),
(3710,3710,7),
(3711,3711,7),
(3712,3712,7),
(3713,3713,7),
(3714,3714,7),
(3715,3715,7),
(3716,3716,7),
(3717,3717,7),
(3718,3718,7),
(3719,3719,7),
(3720,3720,7),
(3721,3721,7),
(3722,3722,7),
(3723,3723,9),
(3724,3724,5),
(3725,3725,10),
(3726,3726,11),
(3727,3727,3),
(3728,3728,2),
(3729,3729,4),
(3730,3730,1),
(3731,3731,9),
(3732,3732,11),
(3733,3733,10),
(3734,3734,4),
(3735,3735,11),
(3736,3736,4),
(3737,3737,9),
(3738,3738,10),
(3739,3739,8),
(3740,3740,14),
(3741,3741,14),
(3742,3742,9),
(3743,3743,9),
(3744,3744,15),
(3745,3745,14),
(3746,3746,11),
(3747,3747,14),
(3748,3748,9),
(3749,3749,7),
(3750,3750,16),
(3751,3751,16),
(3752,3752,15),
(3753,3753,3),
(3754,3754,22),
(3755,3755,24),
(3756,3756,27),
(3757,3757,14),
(3758,3758,26),
(3759,3759,19),
(3760,3760,26),
(3761,3761,19);
/*!40000 ALTER TABLE `streams_song_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streams_user_links`
--

DROP TABLE IF EXISTS `streams_user_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streams_user_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stream_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `streams_user_links_unique` (`stream_id`,`user_id`),
  KEY `streams_user_links_fk` (`stream_id`),
  KEY `streams_user_links_inv_fk` (`user_id`),
  CONSTRAINT `streams_user_links_fk` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `streams_user_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streams_user_links`
--

LOCK TABLES `streams_user_links` WRITE;
/*!40000 ALTER TABLE `streams_user_links` DISABLE KEYS */;
INSERT INTO `streams_user_links` VALUES
(5,3750,3),
(6,3752,3),
(7,3753,3),
(8,3754,5),
(9,3755,6),
(10,3756,5),
(11,3757,3),
(12,3758,3),
(13,3759,3);
/*!40000 ALTER TABLE `streams_user_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_created_by_id_fk` (`created_by_id`),
  KEY `subscriptions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `subscriptions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `subscriptions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions_user_links`
--

DROP TABLE IF EXISTS `subscriptions_user_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions_user_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_user_links_unique` (`subscription_id`,`user_id`),
  KEY `subscriptions_user_links_fk` (`subscription_id`),
  KEY `subscriptions_user_links_inv_fk` (`user_id`),
  CONSTRAINT `subscriptions_user_links_fk` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscriptions_user_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions_user_links`
--

LOCK TABLES `subscriptions_user_links` WRITE;
/*!40000 ALTER TABLE `subscriptions_user_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions_user_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_permissions`
--

DROP TABLE IF EXISTS `up_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_permissions_created_by_id_fk` (`created_by_id`),
  KEY `up_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_permissions`
--

LOCK TABLES `up_permissions` WRITE;
/*!40000 ALTER TABLE `up_permissions` DISABLE KEYS */;
INSERT INTO `up_permissions` VALUES
(1,'plugin::users-permissions.user.me','2024-01-11 16:14:01.454000','2024-01-11 16:14:01.454000',NULL,NULL),
(2,'plugin::users-permissions.auth.changePassword','2024-01-11 16:14:01.454000','2024-01-11 16:14:01.454000',NULL,NULL),
(3,'plugin::users-permissions.auth.callback','2024-01-11 16:14:01.487000','2024-01-11 16:14:01.487000',NULL,NULL),
(4,'plugin::users-permissions.auth.connect','2024-01-11 16:14:01.487000','2024-01-11 16:14:01.487000',NULL,NULL),
(5,'plugin::users-permissions.auth.forgotPassword','2024-01-11 16:14:01.487000','2024-01-11 16:14:01.487000',NULL,NULL),
(6,'plugin::users-permissions.auth.resetPassword','2024-01-11 16:14:01.487000','2024-01-11 16:14:01.487000',NULL,NULL),
(7,'plugin::users-permissions.auth.register','2024-01-11 16:14:01.487000','2024-01-11 16:14:01.487000',NULL,NULL),
(8,'plugin::users-permissions.auth.emailConfirmation','2024-01-11 16:14:01.487000','2024-01-11 16:14:01.487000',NULL,NULL),
(9,'plugin::users-permissions.auth.sendEmailConfirmation','2024-01-11 16:14:01.487000','2024-01-11 16:14:01.487000',NULL,NULL),
(10,'api::artist.artist.findOne','2024-01-12 08:49:42.810000','2024-01-12 08:49:42.810000',NULL,NULL),
(11,'api::artist.artist.find','2024-01-12 08:49:42.809000','2024-01-12 08:49:42.809000',NULL,NULL),
(12,'api::category.category.find','2024-01-12 08:49:42.810000','2024-01-12 08:49:42.810000',NULL,NULL),
(13,'api::category.category.findOne','2024-01-12 08:49:42.810000','2024-01-12 08:49:42.810000',NULL,NULL),
(14,'api::genre.genre.find','2024-01-12 08:49:42.810000','2024-01-12 08:49:42.810000',NULL,NULL),
(15,'api::genre.genre.findOne','2024-01-12 08:49:42.810000','2024-01-12 08:49:42.810000',NULL,NULL),
(16,'api::song.song.find','2024-01-12 08:49:42.810000','2024-01-12 08:49:42.810000',NULL,NULL),
(17,'api::song.song.findOne','2024-01-12 08:49:42.810000','2024-01-12 08:49:42.810000',NULL,NULL),
(18,'api::album.album.find','2024-01-12 08:55:53.398000','2024-01-12 08:55:53.398000',NULL,NULL),
(19,'api::album.album.findOne','2024-01-12 08:55:53.398000','2024-01-12 08:55:53.398000',NULL,NULL),
(20,'api::artist.artist.find','2024-01-12 08:55:53.398000','2024-01-12 08:55:53.398000',NULL,NULL),
(21,'api::artist.artist.findOne','2024-01-12 08:55:53.398000','2024-01-12 08:55:53.398000',NULL,NULL),
(22,'api::category.category.find','2024-01-12 08:55:53.398000','2024-01-12 08:55:53.398000',NULL,NULL),
(23,'api::category.category.findOne','2024-01-12 08:55:53.398000','2024-01-12 08:55:53.398000',NULL,NULL),
(24,'api::genre.genre.find','2024-01-12 08:55:53.398000','2024-01-12 08:55:53.398000',NULL,NULL),
(25,'api::genre.genre.findOne','2024-01-12 08:55:53.398000','2024-01-12 08:55:53.398000',NULL,NULL),
(26,'api::song.song.find','2024-01-12 08:55:53.398000','2024-01-12 08:55:53.398000',NULL,NULL),
(27,'api::song.song.findOne','2024-01-12 08:55:53.398000','2024-01-12 08:55:53.398000',NULL,NULL),
(28,'api::like.like.find','2024-01-24 10:35:47.569000','2024-01-24 10:35:47.569000',NULL,NULL),
(29,'api::like.like.findOne','2024-01-24 10:35:47.569000','2024-01-24 10:35:47.569000',NULL,NULL),
(30,'api::like.like.create','2024-01-24 10:35:47.569000','2024-01-24 10:35:47.569000',NULL,NULL),
(31,'api::like.like.update','2024-01-24 10:35:47.569000','2024-01-24 10:35:47.569000',NULL,NULL),
(32,'api::like.like.delete','2024-01-24 10:35:47.569000','2024-01-24 10:35:47.569000',NULL,NULL),
(33,'plugin::users-permissions.user.find','2024-01-24 11:10:06.584000','2024-01-24 11:10:06.584000',NULL,NULL),
(34,'plugin::users-permissions.user.findOne','2024-01-24 11:10:06.585000','2024-01-24 11:10:06.585000',NULL,NULL),
(35,'api::stream.stream.find','2024-03-14 10:50:46.640000','2024-03-14 10:50:46.640000',NULL,NULL),
(36,'api::stream.stream.findOne','2024-03-14 10:50:46.640000','2024-03-14 10:50:46.640000',NULL,NULL),
(37,'api::stream.stream.update','2024-03-14 10:50:46.640000','2024-03-14 10:50:46.640000',NULL,NULL),
(38,'api::stream.stream.find','2024-03-14 10:51:06.382000','2024-03-14 10:51:06.382000',NULL,NULL),
(39,'api::stream.stream.create','2024-03-14 10:51:18.828000','2024-03-14 10:51:18.828000',NULL,NULL),
(40,'api::playlist.playlist.find','2024-04-07 21:58:36.024000','2024-04-07 21:58:36.024000',NULL,NULL),
(41,'api::playlist.playlist.findOne','2024-04-07 21:58:36.024000','2024-04-07 21:58:36.024000',NULL,NULL),
(42,'api::playlist.playlist.create','2024-04-07 21:58:36.025000','2024-04-07 21:58:36.025000',NULL,NULL),
(43,'api::playlist.playlist.update','2024-04-07 21:58:36.025000','2024-04-07 21:58:36.025000',NULL,NULL),
(44,'api::playlist.playlist.delete','2024-04-07 21:58:36.025000','2024-04-07 21:58:36.025000',NULL,NULL),
(45,'api::playlist-song.playlist-song.find','2024-04-07 21:58:45.417000','2024-04-07 21:58:45.417000',NULL,NULL),
(46,'api::playlist-song.playlist-song.findOne','2024-04-07 21:58:45.417000','2024-04-07 21:58:45.417000',NULL,NULL),
(47,'api::playlist-song.playlist-song.create','2024-04-07 21:58:45.417000','2024-04-07 21:58:45.417000',NULL,NULL),
(48,'api::playlist-song.playlist-song.update','2024-04-07 21:58:45.417000','2024-04-07 21:58:45.417000',NULL,NULL),
(49,'api::playlist-song.playlist-song.delete','2024-04-07 21:58:45.417000','2024-04-07 21:58:45.417000',NULL,NULL),
(50,'api::stream.stream.create','2024-04-12 11:14:06.904000','2024-04-12 11:14:06.904000',NULL,NULL),
(51,'plugin::upload.content-api.find','2024-05-13 12:51:15.313000','2024-05-13 12:51:15.313000',NULL,NULL),
(52,'plugin::upload.content-api.findOne','2024-05-13 12:51:15.313000','2024-05-13 12:51:15.313000',NULL,NULL),
(53,'plugin::upload.content-api.find','2024-05-13 12:51:27.127000','2024-05-13 12:51:27.127000',NULL,NULL),
(54,'api::download.download.find','2024-06-19 10:34:55.822000','2024-06-19 10:34:55.822000',NULL,NULL),
(55,'api::download.download.findOne','2024-06-19 10:34:55.822000','2024-06-19 10:34:55.822000',NULL,NULL),
(56,'api::download.download.create','2024-06-19 10:34:55.822000','2024-06-19 10:34:55.822000',NULL,NULL),
(57,'api::download.download.update','2024-06-19 10:34:55.822000','2024-06-19 10:34:55.822000',NULL,NULL),
(58,'api::album.album.find','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(59,'api::album.album.findOne','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(60,'api::album.album.create','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(61,'api::album.album.update','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(62,'api::like.like.find','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(63,'api::like.like.findOne','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(64,'api::like.like.create','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(65,'api::like.like.update','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(66,'api::playlist.playlist.find','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(67,'api::playlist.playlist.findOne','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(68,'api::playlist.playlist.create','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(69,'api::playlist.playlist.update','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(70,'api::playlist-song.playlist-song.find','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(71,'api::playlist-song.playlist-song.findOne','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(72,'api::playlist-song.playlist-song.create','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(73,'api::playlist-song.playlist-song.update','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(74,'api::song.song.find','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(75,'api::song.song.findOne','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(76,'api::song.song.create','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(77,'api::song.song.update','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(78,'api::stream.stream.find','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(79,'api::stream.stream.findOne','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(80,'api::stream.stream.create','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(81,'api::stream.stream.update','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(82,'plugin::upload.content-api.find','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(83,'plugin::upload.content-api.findOne','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(84,'plugin::upload.content-api.upload','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(85,'plugin::users-permissions.auth.changePassword','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(86,'plugin::users-permissions.auth.resetPassword','2024-07-02 10:48:23.658000','2024-07-02 10:48:23.658000',NULL,NULL),
(87,'plugin::users-permissions.auth.connect','2024-07-02 10:48:23.659000','2024-07-02 10:48:23.659000',NULL,NULL),
(88,'plugin::users-permissions.auth.forgotPassword','2024-07-02 10:48:23.659000','2024-07-02 10:48:23.659000',NULL,NULL),
(89,'plugin::users-permissions.auth.register','2024-07-02 10:48:23.659000','2024-07-02 10:48:23.659000',NULL,NULL),
(90,'api::artist.artist.findOne','2024-07-10 16:43:41.020000','2024-07-10 16:43:41.020000',NULL,NULL),
(91,'api::artist.artist.update','2024-07-10 16:43:41.020000','2024-07-10 16:43:41.020000',NULL,NULL),
(92,'api::genre.genre.find','2024-07-10 16:43:41.020000','2024-07-10 16:43:41.020000',NULL,NULL),
(93,'api::genre.genre.findOne','2024-07-10 16:43:41.020000','2024-07-10 16:43:41.020000',NULL,NULL),
(94,'api::revenu.revenu.find','2024-07-10 16:43:41.020000','2024-07-10 16:43:41.020000',NULL,NULL),
(95,'api::revenu.revenu.findOne','2024-07-10 16:43:41.020000','2024-07-10 16:43:41.020000',NULL,NULL),
(96,'api::artist.artist.find','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(97,'api::category.category.find','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(98,'api::category.category.findOne','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(99,'api::download.download.find','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(100,'api::download.download.findOne','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(101,'api::download.download.create','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(102,'api::download.download.update','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(103,'api::payment.payment.find','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(104,'api::payment.payment.findOne','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(105,'api::payment.payment.create','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(106,'plugin::users-permissions.user.update','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(107,'plugin::users-permissions.user.find','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(108,'plugin::users-permissions.user.findOne','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(109,'plugin::users-permissions.user.me','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(110,'plugin::users-permissions.role.findOne','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(111,'plugin::users-permissions.role.find','2024-09-10 13:15:28.956000','2024-09-10 13:15:28.956000',NULL,NULL),
(112,'plugin::users-permissions.role.findOne','2024-09-10 14:41:28.550000','2024-09-10 14:41:28.550000',NULL,NULL),
(113,'plugin::users-permissions.role.find','2024-09-10 14:41:28.550000','2024-09-10 14:41:28.550000',NULL,NULL),
(114,'plugin::users-permissions.user.me','2024-09-10 14:49:58.035000','2024-09-10 14:49:58.035000',NULL,NULL);
/*!40000 ALTER TABLE `up_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_permissions_role_links`
--

DROP TABLE IF EXISTS `up_permissions_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_permissions_role_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `permission_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_permissions_role_links_unique` (`permission_id`,`role_id`),
  KEY `up_permissions_role_links_fk` (`permission_id`),
  KEY `up_permissions_role_links_inv_fk` (`role_id`),
  KEY `up_permissions_role_links_order_inv_fk` (`permission_order`),
  CONSTRAINT `up_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `up_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_permissions_role_links`
--

LOCK TABLES `up_permissions_role_links` WRITE;
/*!40000 ALTER TABLE `up_permissions_role_links` DISABLE KEYS */;
INSERT INTO `up_permissions_role_links` VALUES
(1,1,1,1),
(2,2,1,1),
(3,3,2,1),
(4,5,2,1),
(5,4,2,1),
(6,6,2,1),
(7,9,2,1),
(8,7,2,1),
(9,8,2,1),
(10,12,1,2),
(11,10,1,2),
(12,11,1,2),
(13,14,1,2),
(14,15,1,2),
(15,16,1,2),
(16,17,1,2),
(17,13,1,2),
(18,18,2,2),
(19,19,2,2),
(20,20,2,2),
(21,21,2,2),
(22,22,2,2),
(23,23,2,2),
(24,24,2,2),
(25,25,2,2),
(26,26,2,2),
(27,27,2,2),
(28,28,1,3),
(29,29,1,3),
(30,30,1,3),
(31,32,1,3),
(32,31,1,3),
(33,33,1,4),
(34,34,1,4),
(35,35,1,5),
(36,36,1,5),
(37,37,1,6),
(38,38,2,3),
(39,39,1,7),
(40,40,1,8),
(41,41,1,8),
(42,42,1,8),
(43,44,1,8),
(44,43,1,8),
(45,45,1,9),
(46,46,1,9),
(47,47,1,9),
(48,48,1,9),
(49,49,1,9),
(50,50,2,4),
(51,51,1,10),
(52,52,1,10),
(53,53,2,5),
(54,54,1,11),
(55,55,1,11),
(56,56,1,11),
(57,57,1,11),
(58,58,3,1),
(59,59,3,1),
(60,60,3,1),
(61,61,3,1),
(62,62,3,1),
(63,63,3,1),
(64,64,3,1),
(65,65,3,1),
(66,66,3,1),
(67,67,3,1),
(68,68,3,2),
(69,69,3,2),
(70,70,3,2),
(71,71,3,2),
(72,72,3,2),
(73,74,3,2),
(74,75,3,2),
(75,76,3,2),
(76,77,3,2),
(77,78,3,2),
(78,79,3,3),
(79,80,3,3),
(80,81,3,3),
(81,82,3,3),
(82,73,3,3),
(83,83,3,3),
(84,84,3,3),
(85,85,3,3),
(86,86,3,3),
(87,87,3,4),
(88,88,3,4),
(89,89,3,4),
(90,90,3,5),
(91,91,3,5),
(92,92,3,5),
(93,93,3,5),
(94,94,3,5),
(95,95,3,5),
(96,96,3,6),
(97,97,3,6),
(98,98,3,6),
(99,99,3,6),
(100,100,3,6),
(101,101,3,6),
(102,102,3,6),
(103,103,3,6),
(104,104,3,6),
(105,105,3,6),
(106,106,3,7),
(107,107,3,7),
(108,108,3,7),
(109,109,3,7),
(110,110,3,7),
(111,111,3,7),
(112,112,1,12),
(113,113,1,12),
(114,114,2,6);
/*!40000 ALTER TABLE `up_permissions_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_roles`
--

DROP TABLE IF EXISTS `up_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_roles_created_by_id_fk` (`created_by_id`),
  KEY `up_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_roles`
--

LOCK TABLES `up_roles` WRITE;
/*!40000 ALTER TABLE `up_roles` DISABLE KEYS */;
INSERT INTO `up_roles` VALUES
(1,'Authenticated','Default role given to authenticated user.','authenticated','2024-01-11 16:14:01.422000','2024-09-10 14:41:28.543000',NULL,NULL),
(2,'Public','Default role given to unauthenticated user.','public','2024-01-11 16:14:01.430000','2024-09-10 14:49:58.023000',NULL,NULL),
(3,'Artist','Compte artiste','artist','2024-07-02 10:48:23.631000','2024-09-10 14:41:02.801000',NULL,NULL);
/*!40000 ALTER TABLE `up_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users`
--

DROP TABLE IF EXISTS `up_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_users_created_by_id_fk` (`created_by_id`),
  KEY `up_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users`
--

LOCK TABLES `up_users` WRITE;
/*!40000 ALTER TABLE `up_users` DISABLE KEYS */;
INSERT INTO `up_users` VALUES
(1,'71714978','71714978@diabara.tv','local','$2a$10$zjDUGmT2Pqr.W0Aikho77u0y3c/H.7zztb43ErJ7bIXzbdxSLceu6',NULL,NULL,1,0,'2024-01-12 10:12:03.346000','2024-01-12 10:12:03.346000',NULL,NULL),
(2,'78684328','78684328@diabara.tv','local','$2a$10$Ltgaz5FVrJpRUbY6HBc4Iu6aAAYiaV.6YA2WjiJOJuiNLUBY3.jgO',NULL,NULL,1,0,'2024-04-08 10:47:19.894000','2024-04-08 10:47:19.894000',NULL,NULL),
(3,'82796798','82796798@diabara.tv','local','$2a$10$5020t3uD6R0KPQO45irfTuYaf13sY2zixpQ2AbOfLfpu5PxB9WZpa',NULL,NULL,1,0,'2024-06-19 11:13:38.191000','2024-06-19 11:13:38.191000',NULL,NULL),
(4,'82788878','82788878@diabara.tv','local','$2a$10$vDu93zJayzse4LjJDBW1seOM/eOXsiQuKgZtLwjVVEuYOIldRwjdq',NULL,NULL,1,0,'2024-06-26 11:46:13.959000','2024-06-26 11:46:13.959000',NULL,NULL),
(5,'82789999','82789999@diabara.tv','local','$2a$10$O7UDbwHTp7qB0UJRUNv4xORBiRZUWDkJ24tM8nDrIvJGToKxaPS3W',NULL,NULL,1,0,'2024-06-26 11:46:56.130000','2024-06-26 11:46:56.130000',NULL,NULL),
(6,'83935366','ks4600137@gmail.com','local','$2a$10$vjSU.M0d1jPp2S1jiX8YG.UdaB4eTruhHw88WUF5SG2nLJ6jyqP/2',NULL,NULL,1,0,'2024-06-26 12:11:47.142000','2024-06-26 12:11:47.142000',1,1),
(7,'batiarebatiare','batiare@gmail.com','local','$2a$10$zml7BZGSOayru/IAxxpP7eFXkhDQTvRA8e4Oc.KJkNLVfVH.eVB9.',NULL,NULL,1,0,'2024-06-27 11:29:40.664000','2024-06-27 11:29:40.664000',NULL,NULL),
(8,'68989898','batiare2@gmail.com','local','$2a$10$wfp7odjOJFs9j0SC6IYnbeCZstVHLmWiXcQZoSQPKFexutAaNh4cm',NULL,NULL,1,0,'2024-06-27 11:33:40.680000','2024-06-27 11:33:40.680000',NULL,NULL),
(9,'68989899','batiare25@gmail.com','local','$2a$10$pBBn9bID6rgFdaDpsIi17eqx6QW2MLeMzc7E8nOEPnRpTyC6e4Aoi',NULL,NULL,1,0,'2024-06-27 11:36:01.714000','2024-06-27 11:36:01.714000',NULL,NULL),
(10,'mohva','mohva2@gmail.com','local','$2a$10$DgSXyJ5ZA5f263sjgx8Ecu4FWP14e8DwuhEkaVpvH1MUJlEN0IW1a',NULL,NULL,1,0,'2024-07-10 16:44:19.115000','2024-07-10 16:44:19.115000',1,1),
(11,'888888','888888@gmail.com','local','$2a$10$oqrAngCIVWckWj.mnhSRb.U/aL1QFQ78BFJaqNAaxnOiewF9e.hLi',NULL,NULL,1,0,'2024-09-10 12:49:34.123000','2024-09-10 12:49:34.123000',1,1);
/*!40000 ALTER TABLE `up_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users_role_links`
--

DROP TABLE IF EXISTS `up_users_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_users_role_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `user_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_users_role_links_unique` (`user_id`,`role_id`),
  KEY `up_users_role_links_fk` (`user_id`),
  KEY `up_users_role_links_inv_fk` (`role_id`),
  KEY `up_users_role_links_order_inv_fk` (`user_order`),
  CONSTRAINT `up_users_role_links_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_users_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users_role_links`
--

LOCK TABLES `up_users_role_links` WRITE;
/*!40000 ALTER TABLE `up_users_role_links` DISABLE KEYS */;
INSERT INTO `up_users_role_links` VALUES
(1,1,1,1),
(2,2,1,2),
(3,3,1,3),
(4,4,1,4),
(5,5,1,5),
(6,6,1,6),
(7,7,1,7),
(8,8,1,8),
(9,9,1,9),
(10,10,3,1),
(11,11,3,2);
/*!40000 ALTER TABLE `up_users_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_folders`
--

DROP TABLE IF EXISTS `upload_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_folders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `path_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_path_id_index` (`path_id`),
  UNIQUE KEY `upload_folders_path_index` (`path`),
  KEY `upload_folders_created_by_id_fk` (`created_by_id`),
  KEY `upload_folders_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `upload_folders_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `upload_folders_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_folders`
--

LOCK TABLES `upload_folders` WRITE;
/*!40000 ALTER TABLE `upload_folders` DISABLE KEYS */;
INSERT INTO `upload_folders` VALUES
(1,'audio',1,'/1','2024-01-12 09:47:39.879000','2024-01-12 09:47:39.879000',1,1);
/*!40000 ALTER TABLE `upload_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_folders_parent_links`
--

DROP TABLE IF EXISTS `upload_folders_parent_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_folders_parent_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `inv_folder_id` int(10) unsigned DEFAULT NULL,
  `folder_order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_parent_links_unique` (`folder_id`,`inv_folder_id`),
  KEY `upload_folders_parent_links_fk` (`folder_id`),
  KEY `upload_folders_parent_links_inv_fk` (`inv_folder_id`),
  KEY `upload_folders_parent_links_order_inv_fk` (`folder_order`),
  CONSTRAINT `upload_folders_parent_links_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_folders_parent_links_inv_fk` FOREIGN KEY (`inv_folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_folders_parent_links`
--

LOCK TABLES `upload_folders_parent_links` WRITE;
/*!40000 ALTER TABLE `upload_folders_parent_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_folders_parent_links` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-14 12:28:56
