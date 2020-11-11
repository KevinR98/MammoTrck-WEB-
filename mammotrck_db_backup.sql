CREATE DATABASE  IF NOT EXISTS `mammotrck_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mammotrck_db`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: mammotrck_db
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'admin'),(3,'asistente'),(2,'medico');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,2,1),(74,2,2),(75,2,3),(76,2,4),(77,2,5),(78,2,6),(79,2,7),(80,2,8),(81,2,9),(82,2,10),(83,2,11),(84,2,12),(85,2,13),(86,2,14),(87,2,15),(88,2,16),(89,2,17),(90,2,18),(91,2,19),(92,2,20),(93,2,21),(94,2,22),(95,2,23),(96,2,24),(97,2,25),(98,2,26),(99,2,27),(100,2,28),(101,2,29),(102,2,30),(103,2,31),(104,2,32),(105,2,33),(106,2,34),(107,2,35),(108,2,36),(109,2,37),(110,2,38),(111,2,39),(112,2,40),(113,2,41),(114,2,42),(115,2,43),(116,2,44),(117,2,45),(118,2,46),(119,2,47),(120,2,48),(122,3,4),(124,3,8),(126,3,12),(128,3,16),(130,3,20),(131,3,24),(132,3,28),(121,3,32),(123,3,36),(125,3,40),(127,3,44),(129,3,48);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add clinic',1,'add_clinic'),(2,'Can change clinic',1,'change_clinic'),(3,'Can delete clinic',1,'delete_clinic'),(4,'Can view clinic',1,'view_clinic'),(5,'Can add form',2,'add_form'),(6,'Can change form',2,'change_form'),(7,'Can delete form',2,'delete_form'),(8,'Can view form',2,'view_form'),(9,'Can add identidad_etnica',3,'add_identidad_etnica'),(10,'Can change identidad_etnica',3,'change_identidad_etnica'),(11,'Can delete identidad_etnica',3,'delete_identidad_etnica'),(12,'Can view identidad_etnica',3,'view_identidad_etnica'),(13,'Can add mamografia',4,'add_mamografia'),(14,'Can change mamografia',4,'change_mamografia'),(15,'Can delete mamografia',4,'delete_mamografia'),(16,'Can view mamografia',4,'view_mamografia'),(17,'Can add parentesco',5,'add_parentesco'),(18,'Can change parentesco',5,'change_parentesco'),(19,'Can delete parentesco',5,'delete_parentesco'),(20,'Can view parentesco',5,'view_parentesco'),(21,'Can add patient',6,'add_patient'),(22,'Can change patient',6,'change_patient'),(23,'Can delete patient',6,'delete_patient'),(24,'Can view patient',6,'view_patient'),(25,'Can add prueba_genetica',7,'add_prueba_genetica'),(26,'Can change prueba_genetica',7,'change_prueba_genetica'),(27,'Can delete prueba_genetica',7,'delete_prueba_genetica'),(28,'Can view prueba_genetica',7,'view_prueba_genetica'),(29,'Can add sub form_historia_personal',8,'add_subform_historia_personal'),(30,'Can change sub form_historia_personal',8,'change_subform_historia_personal'),(31,'Can delete sub form_historia_personal',8,'delete_subform_historia_personal'),(32,'Can view sub form_historia_personal',8,'view_subform_historia_personal'),(33,'Can add sub form_historia_familiar',9,'add_subform_historia_familiar'),(34,'Can change sub form_historia_familiar',9,'change_subform_historia_familiar'),(35,'Can delete sub form_historia_familiar',9,'delete_subform_historia_familiar'),(36,'Can view sub form_historia_familiar',9,'view_subform_historia_familiar'),(37,'Can add sub form_antecedentes_g_o',10,'add_subform_antecedentes_g_o'),(38,'Can change sub form_antecedentes_g_o',10,'change_subform_antecedentes_g_o'),(39,'Can delete sub form_antecedentes_g_o',10,'delete_subform_antecedentes_g_o'),(40,'Can view sub form_antecedentes_g_o',10,'view_subform_antecedentes_g_o'),(41,'Can add report',11,'add_report'),(42,'Can change report',11,'change_report'),(43,'Can delete report',11,'delete_report'),(44,'Can view report',11,'view_report'),(45,'Can add profile',12,'add_profile'),(46,'Can change profile',12,'change_profile'),(47,'Can delete profile',12,'delete_profile'),(48,'Can view profile',12,'view_profile'),(49,'Can add log entry',13,'add_logentry'),(50,'Can change log entry',13,'change_logentry'),(51,'Can delete log entry',13,'delete_logentry'),(52,'Can view log entry',13,'view_logentry'),(53,'Can add permission',14,'add_permission'),(54,'Can change permission',14,'change_permission'),(55,'Can delete permission',14,'delete_permission'),(56,'Can view permission',14,'view_permission'),(57,'Can add group',15,'add_group'),(58,'Can change group',15,'change_group'),(59,'Can delete group',15,'delete_group'),(60,'Can view group',15,'view_group'),(61,'Can add user',16,'add_user'),(62,'Can change user',16,'change_user'),(63,'Can delete user',16,'delete_user'),(64,'Can view user',16,'view_user'),(65,'Can add content type',17,'add_contenttype'),(66,'Can change content type',17,'change_contenttype'),(67,'Can delete content type',17,'delete_contenttype'),(68,'Can view content type',17,'view_contenttype'),(69,'Can add session',18,'add_session'),(70,'Can change session',18,'change_session'),(71,'Can delete session',18,'delete_session'),(72,'Can view session',18,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (3,'pbkdf2_sha256$216000$z7r97hP5FPN2$DJZrI7VkA/BV+gGMo5eputJb/qAYgViCPcXyqSrGFzI=','2020-10-26 18:15:35.249354',1,'b@gmail.com','','','b@gmail.com',1,1,'2020-10-26 15:28:28.136980'),(4,'pbkdf2_sha256$216000$FwW1KRVEmaaq$26fryggFyYshfH94Y6TFkDGrcBPnfvZRQsNhqlVvkSE=','2020-11-09 20:11:30.728933',1,'prueba@gmail.com','','','prueba@gmai.com',1,1,'2020-10-29 20:36:13.000000'),(5,'pbkdf2_sha256$216000$GQYT9c4WFgtV$lX508TBi2Hk0ai75I4AcAj9RlgEl3bSc+ODoIjHUhpQ=','2020-10-29 21:00:30.854345',0,'m@gmail.com','','','m@gmail.com',0,1,'2020-10-29 21:00:29.837208'),(6,'pbkdf2_sha256$216000$HLd8wGNeNJg3$B2WM2soyhAbdLYl7OE4hegeAlY3S3YaunNLm+JUWm1E=','2020-10-29 21:12:34.849926',1,'prueba1@gmail.com','','','prueba1@gmail.com',1,1,'2020-10-29 21:12:33.761901'),(7,'pbkdf2_sha256$216000$Z1sFcI9kzDzj$+Cm4rXyjaAP448tX9Ehc/oIhc30xOFanPhJlFYeOM7I=','2020-11-08 23:52:40.443016',0,'asistente@gmail.com','','','asistente@gmail.com',0,1,'2020-10-31 18:27:40.983679'),(8,'pbkdf2_sha256$216000$6clRaIrju88L$Tu9/TTV0Dn1ZJl7+r1B3qqDo4GBuLVjlxc6LJ4xkmMw=','2020-10-31 18:29:18.096215',0,'asis@gmail.com','','','asis@gmail.com',0,1,'2020-10-31 18:29:17.057956'),(9,'pbkdf2_sha256$216000$crNYXLWlH0Kh$aRnmoJBQo2mH8S+Y9GzASbhvLDWwsXcsxmqEhDIP/ow=','2020-10-31 18:42:10.427092',0,'asi@gmail.com','','','asi@gmail.com',0,1,'2020-10-31 18:32:00.715563'),(10,'pbkdf2_sha256$216000$zAqgjqgKXbik$ZllQCkM1ufKjWbWoXVcFEUDNNwiBb06gYoMJVPZA/Zg=','2020-11-03 22:45:05.173631',0,'hola@gmail.com','','','hola@gmail.com',0,1,'2020-11-03 22:45:02.989334'),(11,'pbkdf2_sha256$216000$P4hc15ZyjqIS$qh9qB9YqpcpUaj/NMEznDyvy5pwZl4VhMkXO6uHclhU=','2020-11-06 03:18:47.499202',0,'doc@gmail.com','','','doc@gmail.com',0,1,'2020-11-06 03:18:46.478698');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,3,1),(5,4,1),(6,5,2),(7,6,1),(8,7,3),(9,8,3),(10,9,3),(11,10,3),(12,11,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (4,'2020-10-29 20:40:06.954028','2','a@gmail.com',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',16,4),(5,'2020-10-29 20:40:27.022163','4','prueba@gmail.com',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',16,4),(6,'2020-10-29 20:40:43.668670','4','prueba@gmail.com',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',16,4),(7,'2020-10-29 20:41:51.098235','4','prueba@gmail.com',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',16,4),(8,'2020-10-29 21:13:47.527076','2','a@gmail.com',3,'',16,6),(9,'2020-11-06 02:55:10.033684','40','Report object (40)',3,'',11,4),(10,'2020-11-06 02:55:10.051435','38','Report object (38)',3,'',11,4),(11,'2020-11-06 02:55:10.055181','37','Report object (37)',3,'',11,4),(12,'2020-11-06 02:55:10.057968','34','Report object (34)',3,'',11,4),(13,'2020-11-06 02:55:10.061695','32','Report object (32)',3,'',11,4),(14,'2020-11-06 02:55:10.064770','31','Report object (31)',3,'',11,4),(15,'2020-11-06 02:55:10.066743','30','Report object (30)',3,'',11,4),(16,'2020-11-06 02:55:10.070394','29','Report object (29)',3,'',11,4),(17,'2020-11-06 02:55:10.073338','28','Report object (28)',3,'',11,4),(18,'2020-11-06 02:55:10.076120','27','Report object (27)',3,'',11,4),(19,'2020-11-06 02:55:10.079009','26','Report object (26)',3,'',11,4),(20,'2020-11-06 02:55:10.082005','25','Report object (25)',3,'',11,4),(21,'2020-11-06 02:55:10.084000','24','Report object (24)',3,'',11,4),(22,'2020-11-06 02:55:10.087266','23','Report object (23)',3,'',11,4),(23,'2020-11-06 02:55:10.089347','21','Report object (21)',3,'',11,4),(24,'2020-11-06 02:55:10.092704','20','Report object (20)',3,'',11,4),(25,'2020-11-06 02:55:10.094714','19','Report object (19)',3,'',11,4),(26,'2020-11-06 02:55:10.097706','18','Report object (18)',3,'',11,4),(27,'2020-11-06 02:55:10.100698','17','Report object (17)',3,'',11,4),(28,'2020-11-06 02:55:10.103565','15','Report object (15)',3,'',11,4),(29,'2020-11-06 02:55:10.105563','13','Report object (13)',3,'',11,4),(30,'2020-11-06 02:55:10.109074','12','Report object (12)',3,'',11,4),(31,'2020-11-06 02:55:10.111613','11','Report object (11)',3,'',11,4),(32,'2020-11-06 02:55:10.113838','9','Report object (9)',3,'',11,4),(33,'2020-11-06 02:55:10.116634','8','Report object (8)',3,'',11,4),(34,'2020-11-06 02:55:10.119177','5','Report object (5)',3,'',11,4),(35,'2020-11-06 03:14:50.261439','42','Report object (42)',3,'',11,4),(36,'2020-11-07 04:35:06.712339','8','Mamografia object (8)',3,'',4,4),(37,'2020-11-07 04:35:06.761533','7','Mamografia object (7)',3,'',4,4),(38,'2020-11-07 04:35:06.765122','6','Mamografia object (6)',3,'',4,4),(39,'2020-11-07 04:35:06.768340','5','Mamografia object (5)',3,'',4,4),(40,'2020-11-07 04:35:06.771004','4','Mamografia object (4)',3,'',4,4),(41,'2020-11-07 04:35:06.774996','3','Mamografia object (3)',3,'',4,4),(42,'2020-11-07 04:35:06.778262','2','Mamografia object (2)',3,'',4,4),(43,'2020-11-07 04:35:06.780915','1','Mamografia object (1)',3,'',4,4),(44,'2020-11-07 07:13:54.637292','23','Mamografia object (23)',3,'',4,4),(45,'2020-11-07 07:13:54.644039','22','Mamografia object (22)',3,'',4,4),(46,'2020-11-07 07:13:54.647457','21','Mamografia object (21)',3,'',4,4),(47,'2020-11-07 07:13:54.651525','19','Mamografia object (19)',3,'',4,4),(48,'2020-11-07 07:13:54.654937','18','Mamografia object (18)',3,'',4,4),(49,'2020-11-07 07:13:54.657250','17','Mamografia object (17)',3,'',4,4),(50,'2020-11-07 07:13:54.661168','16','Mamografia object (16)',3,'',4,4),(51,'2020-11-07 07:13:54.663756','15','Mamografia object (15)',3,'',4,4),(52,'2020-11-07 07:13:54.666396','14','Mamografia object (14)',3,'',4,4),(53,'2020-11-07 07:13:54.668394','13','Mamografia object (13)',3,'',4,4),(54,'2020-11-07 07:13:54.672077','12','Mamografia object (12)',3,'',4,4),(55,'2020-11-07 07:13:54.675353','11','Mamografia object (11)',3,'',4,4),(56,'2020-11-07 07:13:54.678131','10','Mamografia object (10)',3,'',4,4),(57,'2020-11-07 07:54:05.028970','40','Mamografia object (40)',3,'',4,4),(58,'2020-11-07 07:54:05.040453','39','Mamografia object (39)',3,'',4,4),(59,'2020-11-07 07:54:05.043445','38','Mamografia object (38)',3,'',4,4),(60,'2020-11-07 07:54:05.046437','37','Mamografia object (37)',3,'',4,4),(61,'2020-11-07 07:54:05.049429','36','Mamografia object (36)',3,'',4,4),(62,'2020-11-07 07:54:05.052421','35','Mamografia object (35)',3,'',4,4),(63,'2020-11-07 07:54:05.055416','34','Mamografia object (34)',3,'',4,4),(64,'2020-11-07 07:54:05.058406','33','Mamografia object (33)',3,'',4,4),(65,'2020-11-07 07:54:05.062394','32','Mamografia object (32)',3,'',4,4),(66,'2020-11-07 07:54:05.065386','31','Mamografia object (31)',3,'',4,4),(67,'2020-11-07 08:09:02.300783','44','Mamografia object (44)',3,'',4,4),(68,'2020-11-07 08:09:02.303767','43','Mamografia object (43)',3,'',4,4),(69,'2020-11-07 08:09:02.306314','42','Mamografia object (42)',3,'',4,4),(70,'2020-11-07 08:09:02.308676','41','Mamografia object (41)',3,'',4,4),(71,'2020-11-07 08:15:07.105355','49','Mamografia object (49)',3,'',4,4),(72,'2020-11-07 08:15:07.117465','48','Mamografia object (48)',3,'',4,4),(73,'2020-11-07 08:15:07.121179','47','Mamografia object (47)',3,'',4,4),(74,'2020-11-07 08:15:07.125097','46','Mamografia object (46)',3,'',4,4),(75,'2020-11-07 08:15:07.128759','45','Mamografia object (45)',3,'',4,4),(76,'2020-11-09 00:35:38.930002','patient0','Patient object (patient0)',1,'[{\"added\": {}}]',6,4);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (13,'admin','logentry'),(15,'auth','group'),(14,'auth','permission'),(16,'auth','user'),(17,'contenttypes','contenttype'),(1,'main','clinic'),(2,'main','form'),(3,'main','identidad_etnica'),(4,'main','mamografia'),(5,'main','parentesco'),(6,'main','patient'),(12,'main','profile'),(7,'main','prueba_genetica'),(11,'main','report'),(10,'main','subform_antecedentes_g_o'),(9,'main','subform_historia_familiar'),(8,'main','subform_historia_personal'),(18,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-10-26 15:12:41.089085'),(2,'auth','0001_initial','2020-10-26 15:12:41.304907'),(3,'admin','0001_initial','2020-10-26 15:12:41.890864'),(4,'admin','0002_logentry_remove_auto_add','2020-10-26 15:12:42.069233'),(5,'admin','0003_logentry_add_action_flag_choices','2020-10-26 15:12:42.075771'),(6,'contenttypes','0002_remove_content_type_name','2020-10-26 15:12:42.222905'),(7,'auth','0002_alter_permission_name_max_length','2020-10-26 15:12:42.291878'),(8,'auth','0003_alter_user_email_max_length','2020-10-26 15:12:42.338762'),(9,'auth','0004_alter_user_username_opts','2020-10-26 15:12:42.338762'),(10,'auth','0005_alter_user_last_login_null','2020-10-26 15:12:42.423388'),(11,'auth','0006_require_contenttypes_0002','2020-10-26 15:12:42.423388'),(12,'auth','0007_alter_validators_add_error_messages','2020-10-26 15:12:42.439031'),(13,'auth','0008_alter_user_username_max_length','2020-10-26 15:12:42.592691'),(14,'auth','0009_alter_user_last_name_max_length','2020-10-26 15:12:42.677304'),(15,'auth','0010_alter_group_name_max_length','2020-10-26 15:12:42.708552'),(16,'auth','0011_update_proxy_permissions','2020-10-26 15:12:42.724173'),(17,'auth','0012_alter_user_first_name_max_length','2020-10-26 15:12:42.793202'),(18,'main','0001_initial','2020-10-26 15:12:43.526246'),(19,'main','0002_auto_20201025_2324','2020-10-26 15:12:45.230383'),(20,'main','0003_auto_20201025_2346','2020-10-26 15:12:45.399618'),(21,'main','0004_auto_20201025_2351','2020-10-26 15:12:45.562342'),(22,'main','0005_auto_20201026_0004','2020-10-26 15:12:45.963300'),(23,'sessions','0001_initial','2020-10-26 15:12:46.016676'),(24,'main','0006_report_user','2020-11-06 02:56:15.598005'),(25,'main','0007_auto_20201105_2116','2020-11-06 03:16:27.595563'),(26,'main','0008_auto_20201106_2143','2020-11-07 03:43:48.326546'),(27,'main','0009_auto_20201106_2321','2020-11-07 05:21:30.225957'),(28,'main','0010_mamografia_filename','2020-11-07 07:13:21.487113');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2l65m8dri4kc7rfn0uo12fqw1rwoh21n','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1kapFW:SpDfPQyVZum9VuSkQAbTLQYpAAmWukDYhncMxmvINK0','2020-11-20 00:05:02.869865'),('84i3yyzqxab3q8x9n7t7f4vnzx23eiy7','.eJxVjMEOwiAQBf-FsyFQCiwevfcbyLKAVA0kpT0Z_9026UGvb2bem3nc1uK3nhY_R3Zljl1-t4D0TPUA8YH13ji1ui5z4IfCT9r51GJ63U7376BgL3utlciopDMkNFiAIWPQTjktCRSQFkgKQVg1CnSDzjIF2Js0CjCUrWGfL7sbNsE:1kYvpK:YKD-F0YHWVpDqnaxINVfAi6aq1XFJb9p5ajOuOvJlT4','2020-11-14 18:42:10.438120'),('blv6o6whwpafutnk16pfi78csch4rixr','.eJxVjEEOwiAQRe_C2hCmSAGX7nsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwk7gILU6_W8T04LoDumO9NZlaXZc5yl2RB-1yasTP6-H-HRTs5Vsrk70D52AAUoZt8qPRNnOM3iflCXgkYiITtUJH-UweALVNKcKQM4n3B-AROJ4:1kX71r:xXpY8_zJs26roQRzu0zmYc4KZmip5HIuYeXF8wsDyLg','2020-11-09 18:15:35.258095'),('h2sb4uew2fjle8y6uqcn4sml46yjz6q9','.eJxVjEEOwiAQRe_C2hCmSAGX7nsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwk7gILU6_W8T04LoDumO9NZlaXZc5yl2RB-1yasTP6-H-HRTs5Vsrk70D52AAUoZt8qPRNnOM3iflCXgkYiITtUJH-UweALVNKcKQM4n3B-AROJ4:1kX4fN:H-6QgNxrQyzpRd9Ra5Zef0weKlBmafVW7XhYxjAy7Ps','2020-11-09 15:44:13.735727'),('mii3iz514u2l4cxe32lwxiywray9qtnm','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1kasIj:YnCZND9gjFsAXaiR07U0j3PPIcyokdl-HC7Y1duS8Eo','2020-11-20 03:20:33.483565'),('p9bmpagd8yf02gaxa0wacobgfl498nyg','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1ka567:RUcbSpSHchwYl2WoPTgUmCbEnSrIBfe9rS-xh2CFaVQ','2020-11-17 22:48:15.628368'),('snnxeuyvfpsg02jl22xw8v978vz0r8ek','.eJxVjEEOwiAQRe_C2hCmSAGX7nsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwk7gILU6_W8T04LoDumO9NZlaXZc5yl2RB-1yasTP6-H-HRTs5Vsrk70D52AAUoZt8qPRNnOM3iflCXgkYiITtUJH-UweALVNKcKQM4n3B-AROJ4:1kX6zd:ttoNKqwT33v6Gk4MseFZBLwZloDTp-pXRmg-Vuq6S6U','2020-11-09 18:13:17.208845'),('tc12zg7se7mcxcp41q9u8wgdgbyuao3z','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1kcDVi:Vil6bh6WsGYYIIfLxXDaHyI8DgxP96U6AnqSvMqfUIY','2020-11-23 20:11:30.756383'),('u060hah4lta8k9u1n7qhlvbksm2xnww6','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1kbutN:R7tyYyvdKjennFPD-uIxjPaYZu41yc4pIa8K4YV_KBg','2020-11-23 00:18:41.705975');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_clinic`
--

DROP TABLE IF EXISTS `main_clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_clinic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `acronym` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_clinic`
--

LOCK TABLES `main_clinic` WRITE;
/*!40000 ALTER TABLE `main_clinic` DISABLE KEYS */;
INSERT INTO `main_clinic` VALUES (1,'Marcial Fallas','MF'),(2,'Calderon Guardia','CG'),(3,'San Juan de Dios','SJD');
/*!40000 ALTER TABLE `main_clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_form`
--

DROP TABLE IF EXISTS `main_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_form` (
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `id_form` varchar(15) NOT NULL,
  `submitted_at` datetime(6) DEFAULT NULL,
  `habilitado` tinyint(1) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  `id_patient_id` varchar(15),
  PRIMARY KEY (`id_form`),
  KEY `main_form_id_patient_id_eb0909cc_fk_main_patient_id_patient` (`id_patient_id`),
  CONSTRAINT `main_form_id_patient_id_eb0909cc_fk_main_patient_id_patient` FOREIGN KEY (`id_patient_id`) REFERENCES `main_patient` (`id_patient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_form`
--

LOCK TABLES `main_form` WRITE;
/*!40000 ALTER TABLE `main_form` DISABLE KEYS */;
INSERT INTO `main_form` VALUES ('2020-10-26 17:35:47.319138','2020-10-29 21:16:41.256647','MF102',NULL,0,NULL,'3'),('2020-11-09 00:37:52.261697','2020-11-09 00:37:52.295267','MF133',NULL,1,NULL,'patient0'),('2020-11-09 00:35:47.949240','2020-11-09 00:35:47.974847','MF143',NULL,1,NULL,'patient0'),('2020-10-26 17:35:44.818107','2020-10-29 21:16:45.774131','MF178',NULL,0,NULL,'3'),('2020-11-04 19:26:33.016001','2020-11-04 19:26:33.054239','MF200',NULL,1,NULL,'1'),('2020-10-26 17:35:39.399109','2020-10-26 18:13:48.909162','MF232',NULL,0,NULL,'3'),('2020-10-31 05:21:28.246111','2020-10-31 05:21:28.273038','MF281',NULL,1,NULL,'3'),('2020-11-04 00:47:19.103198','2020-11-04 00:47:19.134803','MF312',NULL,1,NULL,'1'),('2020-11-03 22:43:28.898112','2020-11-05 22:10:02.011745','MF316',NULL,0,NULL,'2'),('2020-10-26 15:42:01.879289','2020-10-31 14:04:39.484229','MF320',NULL,0,NULL,'3'),('2020-10-26 17:35:28.513038','2020-10-31 14:02:31.722424','MF322',NULL,0,NULL,'3'),('2020-11-04 18:43:46.373193','2020-11-04 18:43:46.405064','MF324',NULL,1,NULL,'1'),('2020-11-08 23:46:41.149324','2020-11-08 23:46:41.191830','MF337',NULL,1,NULL,'1'),('2020-10-26 17:35:24.150114','2020-10-31 14:04:56.067761','MF348',NULL,0,NULL,'3'),('2020-10-29 21:17:06.200032','2020-10-29 21:17:06.235553','MF35',NULL,1,NULL,'3'),('2020-10-31 17:48:30.554904','2020-10-31 17:48:30.585870','MF362',NULL,1,NULL,'2'),('2020-10-26 17:35:43.457831','2020-10-26 17:35:43.490607','MF403',NULL,1,NULL,'3'),('2020-10-31 05:19:43.232172','2020-10-31 05:19:43.261131','MF414',NULL,1,NULL,'3'),('2020-10-31 04:57:54.267939','2020-10-31 04:57:54.303046','MF418',NULL,1,NULL,'2'),('2020-10-31 04:57:51.369273','2020-10-31 06:08:08.058631','MF432',NULL,0,NULL,'2'),('2020-10-26 17:35:31.396019','2020-10-26 17:35:31.431922','MF440',NULL,1,NULL,'3'),('2020-10-29 20:42:28.143173','2020-10-29 20:43:08.496985','MF449',NULL,0,NULL,'2'),('2020-11-03 22:43:26.732853','2020-11-03 22:43:26.772857','MF458',NULL,1,NULL,'2'),('2020-10-26 17:35:25.605525','2020-10-26 18:13:26.360420','MF491',NULL,0,NULL,'3'),('2020-10-26 15:30:19.322937','2020-11-03 20:40:04.279169','MF509',NULL,0,NULL,'2'),('2020-10-31 14:14:53.392245','2020-10-31 14:14:53.425758','MF514',NULL,1,NULL,'3'),('2020-10-26 17:35:48.710084','2020-10-26 17:35:48.743100','MF537',NULL,1,NULL,'3'),('2020-10-31 05:21:32.111594','2020-10-31 05:21:32.145730','MF546',NULL,1,NULL,'3'),('2020-11-09 00:37:49.918761','2020-11-09 00:37:49.942356','MF559',NULL,1,NULL,'patient0'),('2020-11-09 00:35:47.010348','2020-11-09 00:35:47.039276','MF563',NULL,1,NULL,'patient0'),('2020-10-31 04:58:08.820320','2020-10-31 04:58:08.848874','MF565',NULL,1,NULL,'3'),('2020-11-04 18:43:47.385033','2020-11-04 18:43:47.422479','MF581',NULL,1,NULL,'1'),('2020-11-04 19:26:33.983614','2020-11-04 19:26:34.019583','MF583',NULL,1,NULL,'1'),('2020-10-31 14:14:03.488618','2020-10-31 14:14:03.514731','MF599',NULL,1,NULL,'3'),('2020-10-26 17:35:29.603443','2020-10-26 17:35:29.634460','MF625',NULL,1,NULL,'3'),('2020-10-26 17:35:35.125161','2020-10-26 17:35:35.161122','MF626',NULL,1,NULL,'3'),('2020-10-26 17:35:26.764766','2020-10-26 17:35:26.793549','MF63',NULL,1,NULL,'3'),('2020-11-04 19:26:52.951658','2020-11-04 19:26:52.986191','MF70',NULL,1,NULL,'1'),('2020-11-04 00:23:58.490203','2020-11-04 00:40:00.626344','MF711',NULL,0,NULL,'1'),('2020-11-04 00:44:22.648091','2020-11-04 00:44:22.674989','MF715',NULL,1,NULL,'1'),('2020-11-03 21:23:10.323160','2020-11-03 21:23:10.360964','MF730',NULL,1,NULL,'2'),('2020-10-26 17:35:33.356893','2020-10-26 17:35:33.393117','MF731',NULL,1,NULL,'3'),('2020-11-04 19:26:08.263878','2020-11-04 19:26:08.299005','MF738',NULL,1,NULL,'1'),('2020-10-26 17:35:36.608736','2020-10-26 17:35:36.642153','MF770',NULL,1,NULL,'3'),('2020-10-26 17:35:40.768340','2020-10-26 17:35:40.798265','MF797',NULL,1,NULL,'3'),('2020-10-31 14:14:39.314219','2020-10-31 14:14:39.341892','MF825',NULL,1,NULL,'3'),('2020-10-31 04:58:02.635325','2020-10-31 04:58:02.665550','MF830',NULL,1,NULL,'3'),('2020-11-05 20:40:42.040480','2020-11-05 20:40:42.082052','MF84',NULL,1,NULL,'1'),('2020-10-26 17:35:37.960374','2020-10-26 17:35:37.985819','MF858',NULL,1,NULL,'3'),('2020-10-26 17:35:49.901917','2020-10-26 17:35:49.929956','MF872',NULL,1,NULL,'3'),('2020-10-31 14:14:00.289268','2020-11-05 23:54:46.281459','MF878',NULL,0,NULL,'3'),('2020-10-26 15:30:20.331564','2020-10-31 06:05:48.611145','MF891',NULL,0,NULL,'2'),('2020-10-31 14:14:02.108311','2020-10-31 14:14:21.685782','MF90',NULL,0,NULL,'3'),('2020-10-26 17:35:42.095594','2020-10-31 14:14:48.977798','MF920',NULL,0,NULL,'3'),('2020-10-26 17:35:46.149535','2020-10-31 14:02:38.561256','MF923',NULL,0,NULL,'3'),('2020-10-31 05:21:30.784558','2020-10-31 14:02:36.503320','MF935',NULL,0,NULL,'3'),('2020-11-09 00:37:50.988219','2020-11-09 00:37:51.012868','MF996',NULL,1,NULL,'patient0');
/*!40000 ALTER TABLE `main_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_identidad_etnica`
--

DROP TABLE IF EXISTS `main_identidad_etnica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_identidad_etnica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identidad` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_identidad_etnica`
--

LOCK TABLES `main_identidad_etnica` WRITE;
/*!40000 ALTER TABLE `main_identidad_etnica` DISABLE KEYS */;
INSERT INTO `main_identidad_etnica` VALUES (1,'Indígena'),(2,'Afrodescendiente'),(3,'Origen asiático'),(4,'Mulata'),(5,'Mestiza'),(6,'Blanca'),(7,'No Sabe');
/*!40000 ALTER TABLE `main_identidad_etnica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_mamografia`
--

DROP TABLE IF EXISTS `main_mamografia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_mamografia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url_imagen` varchar(200) DEFAULT NULL,
  `form_id` varchar(15) NOT NULL,
  `filename` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_mamografia_url_imagen_948b33fd_uniq` (`url_imagen`),
  UNIQUE KEY `filename` (`filename`),
  KEY `main_mamografia_form_id_fbbc2610_fk_main_form_id_form` (`form_id`),
  CONSTRAINT `main_mamografia_form_id_fbbc2610_fk_main_form_id_form` FOREIGN KEY (`form_id`) REFERENCES `main_form` (`id_form`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_mamografia`
--

LOCK TABLES `main_mamografia` WRITE;
/*!40000 ALTER TABLE `main_mamografia` DISABLE KEYS */;
INSERT INTO `main_mamografia` VALUES (54,'https://storage.googleapis.com/mammotrck.appspot.com/08_11_20_17_48_36_9577_rum.png','MF200','08_11_20_17_48_36_9577_rum.png'),(55,'https://storage.googleapis.com/mammotrck.appspot.com/08_11_20_17_48_36_9727_sake.png','MF200','08_11_20_17_48_36_9727_sake.png'),(56,'https://storage.googleapis.com/mammotrck.appspot.com/08_11_20_17_48_37_8703_wine.png','MF200','08_11_20_17_48_37_8703_wine.png'),(57,'https://storage.googleapis.com/mammotrck.appspot.com/08_11_20_17_49_12_2319_Mass-Test_P_00114_LEFT_MLO.png','MF200','08_11_20_17_49_12_2319_Mass-Test_P_00114_LEFT_MLO.png'),(58,'https://storage.googleapis.com/mammotrck.appspot.com/08_11_20_17_49_26_2498_Mass-Test_P_00126_RIGHT_MLO.png','MF200','08_11_20_17_49_26_2498_Mass-Test_P_00126_RIGHT_MLO.png'),(59,'https://storage.googleapis.com/mammotrck.appspot.com/08_11_20_17_49_26_3306_Mass-Test_P_00131_LEFT_CC.png','MF200','08_11_20_17_49_26_3306_Mass-Test_P_00131_LEFT_CC.png'),(60,'https://storage.googleapis.com/mammotrck.appspot.com/08_11_20_17_49_42_5374_Mass-Test_P_00131_LEFT_MLO.png','MF200','08_11_20_17_49_42_5374_Mass-Test_P_00131_LEFT_MLO.png'),(61,'https://storage.googleapis.com/mammotrck.appspot.com/08_11_20_17_50_07_6554_Mass-Test_P_00032_RIGHT_CC.png','MF200','08_11_20_17_50_07_6554_Mass-Test_P_00032_RIGHT_CC.png'),(62,'https://storage.googleapis.com/mammotrck.appspot.com/08_11_20_17_50_07_6923_Mass-Test_P_00032_RIGHT_MLO.png','MF200','08_11_20_17_50_07_6923_Mass-Test_P_00032_RIGHT_MLO.png'),(63,'https://storage.googleapis.com/mammotrck.appspot.com/08_11_20_17_50_23_5113_Mass-Test_P_00124_RIGHT_CC.png','MF200','08_11_20_17_50_23_5113_Mass-Test_P_00124_RIGHT_CC.png'),(67,'https://storage.googleapis.com/mammotrck.appspot.com/08_11_20_18_36_42_9290_sake.png','MF563','08_11_20_18_36_42_9290_sake.png'),(68,'https://storage.googleapis.com/mammotrck.appspot.com/08_11_20_18_36_44_6655_wine.png','MF563','08_11_20_18_36_44_6655_wine.png');
/*!40000 ALTER TABLE `main_mamografia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_parentesco`
--

DROP TABLE IF EXISTS `main_parentesco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_parentesco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_parentesco` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_parentesco`
--

LOCK TABLES `main_parentesco` WRITE;
/*!40000 ALTER TABLE `main_parentesco` DISABLE KEYS */;
INSERT INTO `main_parentesco` VALUES (1,'Madre'),(2,'Tía materna'),(3,'Tía paterna'),(4,'Abuela materna'),(5,'Abuela paterna');
/*!40000 ALTER TABLE `main_parentesco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_patient`
--

DROP TABLE IF EXISTS `main_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_patient` (
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `id_patient` varchar(15) NOT NULL,
  PRIMARY KEY (`id_patient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_patient`
--

LOCK TABLES `main_patient` WRITE;
/*!40000 ALTER TABLE `main_patient` DISABLE KEYS */;
INSERT INTO `main_patient` VALUES ('2020-10-26 00:00:00.000000','2020-10-26 00:00:00.000000','juana','1'),('2020-10-26 00:00:00.000000','2020-10-26 00:00:00.000000','sotana','2'),('2020-10-26 00:00:00.000000','2020-10-26 00:00:00.000000','fulana','3'),('2020-11-09 00:35:38.928974','2020-11-09 00:35:38.928974','jenny','patient0');
/*!40000 ALTER TABLE `main_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_profile`
--

DROP TABLE IF EXISTS `main_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_profile` (
  `user_id` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `clinic_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `main_profile_clinic_id_5f662d76_fk_main_clinic_id` (`clinic_id`),
  CONSTRAINT `main_profile_clinic_id_5f662d76_fk_main_clinic_id` FOREIGN KEY (`clinic_id`) REFERENCES `main_clinic` (`id`),
  CONSTRAINT `main_profile_user_id_b40d720a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_profile`
--

LOCK TABLES `main_profile` WRITE;
/*!40000 ALTER TABLE `main_profile` DISABLE KEYS */;
INSERT INTO `main_profile` VALUES (3,'2020-10-26 15:28:28.619601','2020-10-26 18:15:35.254187',1),(4,'2020-10-29 20:36:14.426929','2020-11-09 20:11:30.746228',1),(5,'2020-10-29 21:00:30.321302','2020-10-29 21:00:30.860386',1),(6,'2020-10-29 21:12:34.289223','2020-10-29 21:12:34.855907',1),(7,'2020-10-31 18:27:41.476214','2020-11-08 23:52:40.449000',1),(8,'2020-10-31 18:29:17.572279','2020-10-31 18:29:18.102194',1),(9,'2020-10-31 18:32:01.197235','2020-10-31 18:42:10.433465',1),(10,'2020-11-03 22:45:03.491408','2020-11-03 22:45:05.179583',1),(11,'2020-11-06 03:18:46.970473','2020-11-06 03:18:47.503757',1);
/*!40000 ALTER TABLE `main_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_prueba_genetica`
--

DROP TABLE IF EXISTS `main_prueba_genetica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_prueba_genetica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_prueba_genetica` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_prueba_genetica`
--

LOCK TABLES `main_prueba_genetica` WRITE;
/*!40000 ALTER TABLE `main_prueba_genetica` DISABLE KEYS */;
INSERT INTO `main_prueba_genetica` VALUES (1,'BRCA1'),(2,'BRCA2'),(3,'TP53'),(4,'PTEN'),(5,'CDH1'),(6,'STK11'),(7,'Otro');
/*!40000 ALTER TABLE `main_prueba_genetica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_report`
--

DROP TABLE IF EXISTS `main_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `contenido` varchar(500) DEFAULT NULL,
  `formulario_id` varchar(15) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `formulario_id` (`formulario_id`),
  KEY `main_report_user_id_5ddde156` (`user_id`),
  CONSTRAINT `main_report_formulario_id_5d787778_fk_main_form_id_form` FOREIGN KEY (`formulario_id`) REFERENCES `main_form` (`id_form`),
  CONSTRAINT `main_report_user_id_5ddde156_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_report`
--

LOCK TABLES `main_report` WRITE;
/*!40000 ALTER TABLE `main_report` DISABLE KEYS */;
INSERT INTO `main_report` VALUES (44,'2020-11-06 03:16:41.231334','2020-11-07 05:15:37.829723','holaas','MF362',4),(46,'2020-11-06 03:17:42.945124','2020-11-06 03:17:42.955650','aaaadios','MF418',4),(48,'2020-11-06 03:19:24.723103','2020-11-06 03:19:33.454084','tusa','MF730',11),(50,'2020-11-08 23:47:05.653696','2020-11-08 23:47:05.663669','adios','MF312',4),(51,'2020-11-08 23:47:32.315293','2020-11-08 23:47:32.327522','aaaaaa','MF200',4),(53,'2020-11-09 00:37:24.752139','2020-11-09 00:37:24.763797','dfgdfg','MF563',4),(54,'2020-11-09 00:37:37.147262','2020-11-10 00:11:32.785278','aaaaaaaaaaaakkk','MF143',4);
/*!40000 ALTER TABLE `main_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_subform_antecedentes_g_o`
--

DROP TABLE IF EXISTS `main_subform_antecedentes_g_o`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_subform_antecedentes_g_o` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `manopausa_aplica` tinyint(1) DEFAULT NULL,
  `edad_menstruacion` smallint unsigned DEFAULT NULL,
  `edad_manopausa` smallint unsigned DEFAULT NULL,
  `parto_aplica` tinyint(1) DEFAULT NULL,
  `parto_cantidad` smallint unsigned DEFAULT NULL,
  `edad_ult_hijo` smallint unsigned DEFAULT NULL,
  `lactancia_aplica` tinyint(1) DEFAULT NULL,
  `lactancia_tiempo` varchar(40) DEFAULT NULL,
  `anticonceptivos_aplica` tinyint(1) DEFAULT NULL,
  `anticonceptivos_cuanto` varchar(40) DEFAULT NULL,
  `anticonceptivos_ult_vez` varchar(40) DEFAULT NULL,
  `terapia_hormonal_aplica` tinyint(1) DEFAULT NULL,
  `terapia` varchar(1) DEFAULT NULL,
  `cuanto_tiempo_terapia` varchar(40) DEFAULT NULL,
  `biopsia_aplica` tinyint(1) DEFAULT NULL,
  `biopsia_cuantas` smallint unsigned DEFAULT NULL,
  `biopsia_resultado` varchar(40) DEFAULT NULL,
  `form_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_id` (`form_id`),
  CONSTRAINT `main_subform_anteced_form_id_a2b611f5_fk_main_form` FOREIGN KEY (`form_id`) REFERENCES `main_form` (`id_form`),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_1` CHECK ((`edad_menstruacion` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_2` CHECK ((`edad_manopausa` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_3` CHECK ((`parto_cantidad` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_4` CHECK ((`edad_ult_hijo` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_6` CHECK ((`biopsia_cuantas` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_antecedentes_g_o`
--

LOCK TABLES `main_subform_antecedentes_g_o` WRITE;
/*!40000 ALTER TABLE `main_subform_antecedentes_g_o` DISABLE KEYS */;
INSERT INTO `main_subform_antecedentes_g_o` VALUES (1,'2020-10-26 15:30:19.335226','2020-11-03 20:40:04.301643',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF509'),(2,'2020-10-26 15:30:20.345996','2020-10-31 06:05:48.632661',NULL,NULL,NULL,1,3,12,1,'3 meses',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,'MF891'),(3,'2020-10-26 15:42:01.894432','2020-10-31 14:04:39.499216',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF320'),(4,'2020-10-26 17:35:24.164752','2020-10-31 14:04:56.087227',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF348'),(5,'2020-10-26 17:35:25.613057','2020-10-26 18:13:26.381379',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF491'),(6,'2020-10-26 17:35:26.773739','2020-10-26 17:35:26.801035',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF63'),(7,'2020-10-26 17:35:28.528397','2020-10-31 14:02:31.742120',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF322'),(8,'2020-10-26 17:35:29.615958','2020-10-26 17:35:29.642093',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF625'),(9,'2020-10-26 17:35:31.411506','2020-10-26 17:35:31.438936',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF440'),(10,'2020-10-26 17:35:33.372815','2020-10-26 17:35:33.402241',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF731'),(11,'2020-10-26 17:35:35.141023','2020-10-26 17:35:35.169506',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF626'),(12,'2020-10-26 17:35:36.624200','2020-10-26 17:35:36.651127',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF770'),(13,'2020-10-26 17:35:37.967357','2020-10-26 17:35:37.993052',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF858'),(14,'2020-10-26 17:35:39.413966','2020-10-26 18:13:48.921693',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF232'),(15,'2020-10-26 17:35:40.776273','2020-10-26 17:35:40.806311',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF797'),(16,'2020-10-26 17:35:42.112316','2020-10-31 14:14:48.992761',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF920'),(17,'2020-10-26 17:35:43.467717','2020-10-26 17:35:43.499243',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF403'),(18,'2020-10-26 17:35:44.825089','2020-10-29 21:16:45.831023',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF178'),(19,'2020-10-26 17:35:46.156517','2020-10-31 14:02:38.581255',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF923'),(20,'2020-10-26 17:35:47.335093','2020-10-29 21:16:41.312450',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF102'),(21,'2020-10-26 17:35:48.724799','2020-10-26 17:35:48.749717',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF537'),(22,'2020-10-26 17:35:49.909967','2020-10-26 17:35:49.938044',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF872'),(23,'2020-10-29 20:42:28.166511','2020-10-29 20:43:08.517972',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF449'),(24,'2020-10-29 21:17:06.216602','2020-10-29 21:17:06.243530',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF35'),(25,'2020-10-31 04:57:51.387672','2020-10-31 06:08:08.070625',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF432'),(26,'2020-10-31 04:57:54.283081','2020-10-31 04:57:54.311744',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF418'),(27,'2020-10-31 04:58:02.644416','2020-10-31 04:58:02.674246',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF830'),(28,'2020-10-31 04:58:08.827665','2020-10-31 04:58:08.856865',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF565'),(29,'2020-10-31 05:19:43.241013','2020-10-31 05:19:43.269744',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF414'),(30,'2020-10-31 05:21:28.255085','2020-10-31 05:21:28.280019',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF281'),(31,'2020-10-31 05:21:30.791961','2020-10-31 14:02:36.516287',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF935'),(32,'2020-10-31 05:21:32.125637','2020-10-31 05:21:32.153748',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF546'),(33,'2020-10-31 14:14:00.298786','2020-11-05 23:54:46.305248',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF878'),(34,'2020-10-31 14:14:02.117286','2020-10-31 14:14:21.705848',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF90'),(35,'2020-10-31 14:14:03.496558','2020-10-31 14:14:03.522708',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF599'),(36,'2020-10-31 14:14:39.322896','2020-10-31 14:14:39.350879',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF825'),(37,'2020-10-31 14:14:53.405845','2020-10-31 14:14:53.432920',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF514'),(38,'2020-10-31 17:48:30.566873','2020-10-31 17:48:30.593500',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF362'),(39,'2020-11-03 21:23:10.338727','2020-11-03 21:23:10.369899',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF730'),(40,'2020-11-03 22:43:26.752785','2020-11-03 22:43:26.780878',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF458'),(41,'2020-11-03 22:43:28.906108','2020-11-05 22:10:02.028683',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF316'),(42,'2020-11-04 00:23:58.498086','2020-11-04 00:40:00.644764',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF711'),(43,'2020-11-04 00:44:22.656378','2020-11-04 00:44:22.682846',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF715'),(44,'2020-11-04 00:47:19.116984','2020-11-04 00:47:19.141472',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF312'),(45,'2020-11-04 18:43:46.385125','2020-11-04 18:43:46.415040',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF324'),(46,'2020-11-04 18:43:47.401540','2020-11-04 18:43:47.430960',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF581'),(47,'2020-11-04 19:26:08.278637','2020-11-04 19:26:08.305174',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF738'),(48,'2020-11-04 19:26:33.032491','2020-11-04 19:26:33.063116',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF200'),(49,'2020-11-04 19:26:33.999795','2020-11-04 19:26:34.028330',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF583'),(50,'2020-11-04 19:26:52.966921','2020-11-04 19:26:52.994959',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF70'),(51,'2020-11-05 20:40:42.059112','2020-11-05 20:40:42.090030',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF84'),(52,'2020-11-08 23:46:41.165693','2020-11-08 23:46:41.199380',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF337'),(53,'2020-11-09 00:35:47.020322','2020-11-09 00:36:28.044401',0,NULL,45345,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,'MF563'),(54,'2020-11-09 00:35:47.955886','2020-11-09 00:35:47.982837',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF143'),(55,'2020-11-09 00:37:49.926742','2020-11-09 00:37:49.949337',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF559'),(56,'2020-11-09 00:37:50.995185','2020-11-09 00:37:51.019423',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF996'),(57,'2020-11-09 00:37:52.277019','2020-11-09 00:37:52.303322',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF133');
/*!40000 ALTER TABLE `main_subform_antecedentes_g_o` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_subform_historia_familiar`
--

DROP TABLE IF EXISTS `main_subform_historia_familiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_subform_historia_familiar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `prueba_genetica` tinyint(1) DEFAULT NULL,
  `prueba_genetica_otro` varchar(40) DEFAULT NULL,
  `familiares_mama` tinyint(1) DEFAULT NULL,
  `familiares_cancer` tinyint(1) DEFAULT NULL,
  `familiares_cancer_tipo` varchar(40) DEFAULT NULL,
  `familiares_cancer_parentesco` varchar(40) DEFAULT NULL,
  `form_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_id` (`form_id`),
  CONSTRAINT `main_subform_histori_form_id_a142b9c3_fk_main_form` FOREIGN KEY (`form_id`) REFERENCES `main_form` (`id_form`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_familiar`
--

LOCK TABLES `main_subform_historia_familiar` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_familiar` DISABLE KEYS */;
INSERT INTO `main_subform_historia_familiar` VALUES (1,'2020-10-26 15:30:19.339692','2020-11-03 20:40:04.308813',NULL,NULL,NULL,NULL,NULL,NULL,'MF509'),(2,'2020-10-26 15:30:20.350985','2020-10-31 06:05:48.639674',1,NULL,1,NULL,NULL,NULL,'MF891'),(3,'2020-10-26 15:42:01.898425','2020-10-31 14:04:39.506170',NULL,NULL,NULL,NULL,NULL,NULL,'MF320'),(4,'2020-10-26 17:35:24.167766','2020-10-31 14:04:56.092214',NULL,NULL,NULL,NULL,NULL,NULL,'MF348'),(5,'2020-10-26 17:35:25.617287','2020-10-26 18:13:26.387580',NULL,NULL,NULL,NULL,NULL,NULL,'MF491'),(6,'2020-10-26 17:35:26.777729','2020-10-29 21:18:03.731119',1,'otro',1,0,NULL,NULL,'MF63'),(7,'2020-10-26 17:35:28.533116','2020-10-31 14:02:31.748138',NULL,NULL,NULL,NULL,NULL,NULL,'MF322'),(8,'2020-10-26 17:35:29.619556','2020-10-26 17:35:29.646090',NULL,NULL,NULL,NULL,NULL,NULL,'MF625'),(9,'2020-10-26 17:35:31.415360','2020-10-26 17:35:31.442689',NULL,NULL,NULL,NULL,NULL,NULL,'MF440'),(10,'2020-10-26 17:35:33.375940','2020-10-26 17:35:33.405762',NULL,NULL,NULL,NULL,NULL,NULL,'MF731'),(11,'2020-10-26 17:35:35.144805','2020-10-26 17:35:35.173908',NULL,NULL,NULL,NULL,NULL,NULL,'MF626'),(12,'2020-10-26 17:35:36.627193','2020-10-26 17:35:36.655116',NULL,NULL,NULL,NULL,NULL,NULL,'MF770'),(13,'2020-10-26 17:35:37.970915','2020-10-26 17:35:37.996071',NULL,NULL,NULL,NULL,NULL,NULL,'MF858'),(14,'2020-10-26 17:35:39.417658','2020-10-26 18:13:48.927292',NULL,NULL,NULL,NULL,NULL,NULL,'MF232'),(15,'2020-10-26 17:35:40.781261','2020-10-26 17:35:40.810172',NULL,NULL,NULL,NULL,NULL,NULL,'MF797'),(16,'2020-10-26 17:35:42.118302','2020-10-31 14:14:48.998742',NULL,NULL,NULL,NULL,NULL,NULL,'MF920'),(17,'2020-10-26 17:35:43.473294','2020-10-31 16:26:16.663572',NULL,NULL,NULL,NULL,NULL,NULL,'MF403'),(18,'2020-10-26 17:35:44.828081','2020-10-29 21:16:45.837007',NULL,NULL,NULL,NULL,NULL,NULL,'MF178'),(19,'2020-10-26 17:35:46.160506','2020-10-31 14:02:38.586947',NULL,NULL,NULL,NULL,NULL,NULL,'MF923'),(20,'2020-10-26 17:35:47.338223','2020-10-29 21:16:41.319569',NULL,NULL,NULL,NULL,NULL,NULL,'MF102'),(21,'2020-10-26 17:35:48.729100','2020-10-26 17:35:48.753684',NULL,NULL,NULL,NULL,NULL,NULL,'MF537'),(22,'2020-10-26 17:35:49.913925','2020-10-26 17:35:49.940899',NULL,NULL,NULL,NULL,NULL,NULL,'MF872'),(23,'2020-10-29 20:42:28.172465','2020-10-29 20:43:08.524199',NULL,NULL,NULL,NULL,NULL,NULL,'MF449'),(24,'2020-10-29 21:17:06.220590','2020-10-29 21:17:06.247518',NULL,NULL,NULL,NULL,NULL,NULL,'MF35'),(25,'2020-10-31 04:57:51.392673','2020-10-31 06:08:08.076579',NULL,NULL,NULL,NULL,NULL,NULL,'MF432'),(26,'2020-10-31 04:57:54.287070','2020-10-31 04:57:54.315831',NULL,NULL,NULL,NULL,NULL,NULL,'MF418'),(27,'2020-10-31 04:58:02.648453','2020-10-31 04:58:02.678640',NULL,NULL,NULL,NULL,NULL,NULL,'MF830'),(28,'2020-10-31 04:58:08.831994','2020-10-31 04:58:08.861728',NULL,NULL,NULL,NULL,NULL,NULL,'MF565'),(29,'2020-10-31 05:19:43.244924','2020-10-31 05:19:43.274209',NULL,NULL,NULL,NULL,NULL,NULL,'MF414'),(30,'2020-10-31 05:21:28.258078','2020-11-09 00:19:45.426885',NULL,NULL,0,NULL,NULL,NULL,'MF281'),(31,'2020-10-31 05:21:30.795981','2020-10-31 14:02:36.521242',NULL,NULL,NULL,NULL,NULL,NULL,'MF935'),(32,'2020-10-31 05:21:32.129673','2020-10-31 05:21:32.157729',NULL,NULL,NULL,NULL,NULL,NULL,'MF546'),(33,'2020-10-31 14:14:00.303772','2020-11-05 23:54:46.312257',NULL,NULL,NULL,NULL,NULL,NULL,'MF878'),(34,'2020-10-31 14:14:02.122272','2020-10-31 14:14:21.711985',NULL,NULL,NULL,NULL,NULL,NULL,'MF90'),(35,'2020-10-31 14:14:03.499606','2020-10-31 14:14:03.526634',NULL,NULL,NULL,NULL,NULL,NULL,'MF599'),(36,'2020-10-31 14:14:39.325885','2020-10-31 14:14:39.354864',NULL,NULL,NULL,NULL,NULL,NULL,'MF825'),(37,'2020-10-31 14:14:53.409805','2020-10-31 14:14:53.436748',NULL,NULL,NULL,NULL,NULL,NULL,'MF514'),(38,'2020-10-31 17:48:30.569911','2020-11-09 00:21:23.288096',NULL,NULL,1,NULL,NULL,NULL,'MF362'),(39,'2020-11-03 21:23:10.343370','2020-11-03 21:23:10.373842',NULL,NULL,NULL,NULL,NULL,NULL,'MF730'),(40,'2020-11-03 22:43:26.756803','2020-11-03 22:43:26.783869',NULL,NULL,NULL,NULL,NULL,NULL,'MF458'),(41,'2020-11-03 22:43:28.910096','2020-11-05 22:10:02.035696',NULL,NULL,NULL,NULL,NULL,NULL,'MF316'),(42,'2020-11-04 00:23:58.502314','2020-11-04 00:40:00.650303',NULL,NULL,NULL,NULL,NULL,NULL,'MF711'),(43,'2020-11-04 00:44:22.659982','2020-11-04 00:44:22.687041',NULL,NULL,NULL,NULL,NULL,NULL,'MF715'),(44,'2020-11-04 00:47:19.120352','2020-11-04 00:47:19.144752',NULL,NULL,NULL,NULL,NULL,NULL,'MF312'),(45,'2020-11-04 18:43:46.390111','2020-11-04 18:43:46.419028',NULL,NULL,NULL,NULL,NULL,NULL,'MF324'),(46,'2020-11-04 18:43:47.405412','2020-11-04 18:43:47.435928',NULL,NULL,NULL,NULL,NULL,NULL,'MF581'),(47,'2020-11-04 19:26:08.282929','2020-11-04 19:26:08.309261',NULL,NULL,NULL,NULL,NULL,NULL,'MF738'),(48,'2020-11-04 19:26:33.036458','2020-11-09 00:20:07.548562',NULL,NULL,1,NULL,NULL,NULL,'MF200'),(49,'2020-11-04 19:26:34.004157','2020-11-04 19:26:34.032160',NULL,NULL,NULL,NULL,NULL,NULL,'MF583'),(50,'2020-11-04 19:26:52.969797','2020-11-04 19:26:52.999323',NULL,NULL,NULL,NULL,NULL,NULL,'MF70'),(51,'2020-11-05 20:40:42.065101','2020-11-05 20:40:42.093022',NULL,NULL,NULL,NULL,NULL,NULL,'MF84'),(52,'2020-11-08 23:46:41.172642','2020-11-08 23:46:41.202844',NULL,NULL,NULL,NULL,NULL,NULL,'MF337'),(53,'2020-11-09 00:35:47.024310','2020-11-09 00:36:18.954634',NULL,NULL,NULL,NULL,NULL,NULL,'MF563'),(54,'2020-11-09 00:35:47.959912','2020-11-09 00:35:47.986825',NULL,NULL,NULL,NULL,NULL,NULL,'MF143'),(55,'2020-11-09 00:37:49.929732','2020-11-09 00:37:49.952331',NULL,NULL,NULL,NULL,NULL,NULL,'MF559'),(56,'2020-11-09 00:37:50.998210','2020-11-09 00:37:51.022327',NULL,NULL,NULL,NULL,NULL,NULL,'MF996'),(57,'2020-11-09 00:37:52.280335','2020-11-09 00:37:52.306395',NULL,NULL,NULL,NULL,NULL,NULL,'MF133');
/*!40000 ALTER TABLE `main_subform_historia_familiar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_subform_historia_familiar_parentesco`
--

DROP TABLE IF EXISTS `main_subform_historia_familiar_parentesco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_subform_historia_familiar_parentesco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subform_historia_familiar_id` int NOT NULL,
  `parentesco_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_subform_historia_fa_subform_historia_familia_318c3acb_uniq` (`subform_historia_familiar_id`,`parentesco_id`),
  KEY `main_subform_histori_parentesco_id_a61df8b8_fk_main_pare` (`parentesco_id`),
  CONSTRAINT `main_subform_histori_parentesco_id_a61df8b8_fk_main_pare` FOREIGN KEY (`parentesco_id`) REFERENCES `main_parentesco` (`id`),
  CONSTRAINT `main_subform_histori_subform_historia_fam_779fd55e_fk_main_subf` FOREIGN KEY (`subform_historia_familiar_id`) REFERENCES `main_subform_historia_familiar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_familiar_parentesco`
--

LOCK TABLES `main_subform_historia_familiar_parentesco` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_familiar_parentesco` DISABLE KEYS */;
INSERT INTO `main_subform_historia_familiar_parentesco` VALUES (1,2,2),(3,2,3),(7,6,1),(6,6,4),(9,17,1),(10,17,2),(12,38,3),(13,53,1),(14,53,3);
/*!40000 ALTER TABLE `main_subform_historia_familiar_parentesco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_subform_historia_familiar_prueba_genetica_resultado`
--

DROP TABLE IF EXISTS `main_subform_historia_familiar_prueba_genetica_resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_subform_historia_familiar_prueba_genetica_resultado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subform_historia_familiar_id` int NOT NULL,
  `prueba_genetica_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_subform_historia_fa_subform_historia_familia_bccc2968_uniq` (`subform_historia_familiar_id`,`prueba_genetica_id`),
  KEY `main_subform_histori_prueba_genetica_id_ae611099_fk_main_prue` (`prueba_genetica_id`),
  CONSTRAINT `main_subform_histori_prueba_genetica_id_ae611099_fk_main_prue` FOREIGN KEY (`prueba_genetica_id`) REFERENCES `main_prueba_genetica` (`id`),
  CONSTRAINT `main_subform_histori_subform_historia_fam_140f5741_fk_main_subf` FOREIGN KEY (`subform_historia_familiar_id`) REFERENCES `main_subform_historia_familiar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_familiar_prueba_genetica_resultado`
--

LOCK TABLES `main_subform_historia_familiar_prueba_genetica_resultado` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_familiar_prueba_genetica_resultado` DISABLE KEYS */;
INSERT INTO `main_subform_historia_familiar_prueba_genetica_resultado` VALUES (1,2,3),(3,2,5),(5,2,6),(9,6,1),(8,6,2),(10,6,5);
/*!40000 ALTER TABLE `main_subform_historia_familiar_prueba_genetica_resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_subform_historia_personal`
--

DROP TABLE IF EXISTS `main_subform_historia_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_subform_historia_personal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `cedula` varchar(40) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(40) DEFAULT NULL,
  `identidad_etnica_otro` varchar(40) DEFAULT NULL,
  `peso` smallint unsigned DEFAULT NULL,
  `talla` smallint unsigned DEFAULT NULL,
  `imc` smallint unsigned DEFAULT NULL,
  `fuma` tinyint(1) DEFAULT NULL,
  `fuma_edad` smallint unsigned DEFAULT NULL,
  `fuma_actualmente` tinyint(1) DEFAULT NULL,
  `fuma_cuanto` varchar(40) DEFAULT NULL,
  `bebidas` tinyint(1) DEFAULT NULL,
  `bebidas_cuanto` varchar(40) DEFAULT NULL,
  `bebidas_cuanto_otro` varchar(40) DEFAULT NULL,
  `actividad_fisica` tinyint(1) DEFAULT NULL,
  `actividad_fisica_cuanto` varchar(40) DEFAULT NULL,
  `consume_alimentos_con_grasa` tinyint(1) DEFAULT NULL,
  `consume_veg_frut_gram` tinyint(1) DEFAULT NULL,
  `diabetes` varchar(40) DEFAULT NULL,
  `toma_medicamento_tamoxifeno` tinyint(1) DEFAULT NULL,
  `cuanto_tamoxifeno` varchar(40) DEFAULT NULL,
  `toma_medicamento_anastrozol` tinyint(1) DEFAULT NULL,
  `cuanto_anastrozol` varchar(40) DEFAULT NULL,
  `toma_medicamento_metformina` tinyint(1) DEFAULT NULL,
  `cuanto_metformina` varchar(40) DEFAULT NULL,
  `toma_medicamento_bifosfonatos` tinyint(1) DEFAULT NULL,
  `cuanto_bifosfonatos` varchar(40) DEFAULT NULL,
  `toma_medicamento_aspirina` tinyint(1) DEFAULT NULL,
  `cuanto_aspirina` varchar(40) DEFAULT NULL,
  `radiacion` tinyint(1) DEFAULT NULL,
  `clinic_id` int DEFAULT NULL,
  `form_id` varchar(15) NOT NULL,
  `identidad_etnica_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_id` (`form_id`),
  KEY `main_subform_histori_clinic_id_874d7d3b_fk_main_clin` (`clinic_id`),
  KEY `main_subform_histori_identidad_etnica_id_16d84215_fk_main_iden` (`identidad_etnica_id`),
  CONSTRAINT `main_subform_histori_clinic_id_874d7d3b_fk_main_clin` FOREIGN KEY (`clinic_id`) REFERENCES `main_clinic` (`id`),
  CONSTRAINT `main_subform_histori_form_id_d176d93b_fk_main_form` FOREIGN KEY (`form_id`) REFERENCES `main_form` (`id_form`),
  CONSTRAINT `main_subform_histori_identidad_etnica_id_16d84215_fk_main_iden` FOREIGN KEY (`identidad_etnica_id`) REFERENCES `main_identidad_etnica` (`id`),
  CONSTRAINT `main_subform_historia_personal_chk_1` CHECK ((`peso` >= 0)),
  CONSTRAINT `main_subform_historia_personal_chk_2` CHECK ((`talla` >= 0)),
  CONSTRAINT `main_subform_historia_personal_chk_3` CHECK ((`imc` >= 0)),
  CONSTRAINT `main_subform_historia_personal_chk_4` CHECK ((`fuma_edad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_personal`
--

LOCK TABLES `main_subform_historia_personal` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_personal` DISABLE KEYS */;
INSERT INTO `main_subform_historia_personal` VALUES (1,'2020-10-26 15:30:19.327929','2020-11-03 20:40:04.294888',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF509',1),(2,'2020-10-26 15:30:20.342006','2020-10-31 06:05:48.625679','Juana valeria',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF891',1),(3,'2020-10-26 15:42:01.890104','2020-10-31 14:04:39.491207',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF320',1),(4,'2020-10-26 17:35:24.160070','2020-10-31 14:04:56.081247','dsfd',NULL,'2020-10-11','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,'4',0,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF348',1),(5,'2020-10-26 17:35:25.609240','2020-10-26 18:13:26.375411',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF491',1),(6,'2020-10-26 17:35:26.768755','2020-10-26 17:35:26.797539',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF63',1),(7,'2020-10-26 17:35:28.525101','2020-10-31 14:02:31.736115',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF322',1),(8,'2020-10-26 17:35:29.612593','2020-10-26 17:35:29.638302',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF625',1),(9,'2020-10-26 17:35:31.407438','2020-10-26 17:35:31.435387',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF440',1),(10,'2020-10-26 17:35:33.368905','2020-10-26 17:35:33.397595',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF731',1),(11,'2020-10-26 17:35:35.137067','2020-10-26 17:35:35.165199',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF626',1),(12,'2020-10-26 17:35:36.620211','2020-10-26 17:35:36.646141',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF770',1),(13,'2020-10-26 17:35:37.963367','2020-10-26 17:35:37.989652',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF858',1),(14,'2020-10-26 17:35:39.408917','2020-10-26 18:13:48.914710',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF232',1),(15,'2020-10-26 17:35:40.772279','2020-10-26 17:35:40.801815',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF797',1),(16,'2020-10-26 17:35:42.107329','2020-10-31 14:14:48.983782',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF920',1),(17,'2020-10-26 17:35:43.461824','2020-10-31 14:58:42.236858',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,0,NULL,1,NULL,0,'0',NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF403',1),(18,'2020-10-26 17:35:44.821130','2020-10-29 21:16:45.824040',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF178',1),(19,'2020-10-26 17:35:46.153525','2020-10-31 14:02:38.574989',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF923',1),(20,'2020-10-26 17:35:47.330108','2020-10-29 21:16:41.305465',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF102',1),(21,'2020-10-26 17:35:48.721054','2020-10-26 17:35:48.745666',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF537',1),(22,'2020-10-26 17:35:49.906621','2020-10-26 17:35:49.933936',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF872',1),(23,'2020-10-29 20:42:28.153547','2020-10-29 20:43:08.510948',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF449',1),(24,'2020-10-29 21:17:06.211614','2020-11-04 00:20:13.712781',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,'0','ggggg',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF35',1),(25,'2020-10-31 04:57:51.381318','2020-10-31 06:08:08.064641',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF432',1),(26,'2020-10-31 04:57:54.278124','2020-10-31 04:57:54.306990',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF418',1),(27,'2020-10-31 04:58:02.639336','2020-10-31 04:58:02.669724',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF830',1),(28,'2020-10-31 04:58:08.824307','2020-10-31 04:58:08.852870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF565',1),(29,'2020-10-31 05:19:43.236027','2020-10-31 05:19:43.265660',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF414',1),(30,'2020-10-31 05:21:28.250098','2020-11-09 00:18:48.933535',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,0,NULL,1,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF281',1),(31,'2020-10-31 05:21:30.787768','2020-10-31 14:02:36.510302',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF935',1),(32,'2020-10-31 05:21:32.121508','2020-10-31 05:21:32.149728',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF546',1),(33,'2020-10-31 14:14:00.293258','2020-11-05 23:54:46.297033',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF878',1),(34,'2020-10-31 14:14:02.112300','2020-10-31 14:14:21.699865',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF90',1),(35,'2020-10-31 14:14:03.492569','2020-10-31 14:14:03.518783',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF599',1),(36,'2020-10-31 14:14:39.317938','2020-10-31 14:14:39.346238',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF825',1),(37,'2020-10-31 14:14:53.401794','2020-10-31 14:14:53.429745',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF514',1),(38,'2020-10-31 17:48:30.561856','2020-10-31 17:48:30.589509',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF362',1),(39,'2020-11-03 21:23:10.333790','2020-11-03 21:23:10.365266',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF730',1),(40,'2020-11-03 22:43:26.747828','2020-11-03 22:43:26.776917',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF458',1),(41,'2020-11-03 22:43:28.902082','2020-11-05 22:10:02.020727',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF316',1),(42,'2020-11-04 00:23:58.494067','2020-11-04 00:40:00.638281',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF711',1),(43,'2020-11-04 00:44:22.650972','2020-11-04 00:44:22.677987',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF715',1),(44,'2020-11-04 00:47:19.112961','2020-11-04 00:47:19.137478',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF312',1),(45,'2020-11-04 18:43:46.380132','2020-11-04 18:43:46.410052',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF324',1),(46,'2020-11-04 18:43:47.396971','2020-11-04 18:43:47.426473',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF581',1),(47,'2020-11-04 19:26:08.274849','2020-11-04 19:26:08.302177',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF738',1),(48,'2020-11-04 19:26:33.028004','2020-11-09 00:22:49.873335',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF200',1),(49,'2020-11-04 19:26:33.995581','2020-11-04 19:26:34.023591',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF583',1),(50,'2020-11-04 19:26:52.961899','2020-11-04 19:26:52.990385',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF70',1),(51,'2020-11-05 20:40:42.054126','2020-11-05 20:40:42.086044',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF84',1),(52,'2020-11-08 23:46:41.153727','2020-11-08 23:46:41.195653',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF337',1),(53,'2020-11-09 00:35:47.015338','2020-11-09 00:36:12.715313',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF563',1),(54,'2020-11-09 00:35:47.952203','2020-11-10 00:11:52.602614',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'MF143',1),(55,'2020-11-09 00:37:49.922749','2020-11-09 00:37:49.945352',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF559',1),(56,'2020-11-09 00:37:50.991213','2020-11-09 00:37:51.015863',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF996',1),(57,'2020-11-09 00:37:52.273203','2020-11-09 00:37:52.299576',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF133',1);
/*!40000 ALTER TABLE `main_subform_historia_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mammotrck_db'
--

--
-- Dumping routines for database 'mammotrck_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-09 19:40:42
