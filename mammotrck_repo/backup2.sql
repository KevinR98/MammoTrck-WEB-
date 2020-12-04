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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (3,'pbkdf2_sha256$216000$z7r97hP5FPN2$DJZrI7VkA/BV+gGMo5eputJb/qAYgViCPcXyqSrGFzI=','2020-10-26 18:15:35.249354',1,'b@gmail.com','','','b@gmail.com',1,1,'2020-10-26 15:28:28.136980'),(4,'pbkdf2_sha256$216000$FwW1KRVEmaaq$26fryggFyYshfH94Y6TFkDGrcBPnfvZRQsNhqlVvkSE=','2020-12-04 17:03:17.350657',1,'prueba@gmail.com','','','prueba@gmai.com',1,1,'2020-10-29 20:36:13.000000'),(5,'pbkdf2_sha256$216000$GQYT9c4WFgtV$lX508TBi2Hk0ai75I4AcAj9RlgEl3bSc+ODoIjHUhpQ=','2020-10-29 21:00:30.854345',0,'m@gmail.com','','','m@gmail.com',0,1,'2020-10-29 21:00:29.837208'),(6,'pbkdf2_sha256$216000$HLd8wGNeNJg3$B2WM2soyhAbdLYl7OE4hegeAlY3S3YaunNLm+JUWm1E=','2020-10-29 21:12:34.849926',1,'prueba1@gmail.com','','','prueba1@gmail.com',1,1,'2020-10-29 21:12:33.761901'),(7,'pbkdf2_sha256$216000$Z1sFcI9kzDzj$+Cm4rXyjaAP448tX9Ehc/oIhc30xOFanPhJlFYeOM7I=','2020-11-27 22:46:47.482302',0,'asistente@gmail.com','','','asistente@gmail.com',0,1,'2020-10-31 18:27:40.983679'),(8,'pbkdf2_sha256$216000$6clRaIrju88L$Tu9/TTV0Dn1ZJl7+r1B3qqDo4GBuLVjlxc6LJ4xkmMw=','2020-10-31 18:29:18.096215',0,'asis@gmail.com','','','asis@gmail.com',0,1,'2020-10-31 18:29:17.057956'),(9,'pbkdf2_sha256$216000$HGnhReRFMb3F$+m4gu4zBlhhRs48Ent8rX0ArxUrEEk1aZTnocZCDBwc=','2020-10-31 18:42:10.427092',0,'asi@gmail.com','','','asi@gmail.com',0,1,'2020-10-31 18:32:00.715563'),(10,'pbkdf2_sha256$216000$zAqgjqgKXbik$ZllQCkM1ufKjWbWoXVcFEUDNNwiBb06gYoMJVPZA/Zg=','2020-11-03 22:45:05.173631',0,'hola@gmail.com','','','hola@gmail.com',0,1,'2020-11-03 22:45:02.989334'),(11,'pbkdf2_sha256$216000$P4hc15ZyjqIS$qh9qB9YqpcpUaj/NMEznDyvy5pwZl4VhMkXO6uHclhU=','2020-11-06 03:18:47.499202',0,'doc@gmail.com','','','doc@gmail.com',0,1,'2020-11-06 03:18:46.478698'),(12,'pbkdf2_sha256$216000$0Dz3fW0HoALY$KPGpNI//zQc1uQ7ifqkEKAqrPDtzrIkvt187bYvR7zw=','2020-11-11 02:01:01.668232',1,'hoja@gmail.com','','','hoja@gmail.com',1,1,'2020-11-11 02:00:40.101442'),(13,'pbkdf2_sha256$216000$EOdatCbQJB3p$WVSis2Y4RLIl7UpF3EBo2FmmX8bC0lA34OkxKw2Y89E=','2020-11-27 22:59:53.946537',0,'doctor@gmail.com','','','doctor@gmail.com',0,1,'2020-11-19 20:42:57.088515'),(14,'pbkdf2_sha256$216000$OxDYaiG0EffR$mmJnvJUWM96mezqP8kkA2bkJ87yV2z8ngGQM2QxpWZE=','2020-11-27 22:59:43.611095',0,'doctor2@gmail.com','','','doctor2@gmail.com',0,1,'2020-11-27 22:59:42.359154'),(15,'pbkdf2_sha256$216000$3WFf92WYrGJO$lOEfOsUjo981JhwWaZF9qg2e6pBO15nmFfl/iQRdLds=','2020-12-04 17:41:14.741545',1,'asalas@med.com','','','asalas@med.com',1,1,'2020-12-04 17:12:41.689037');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,3,1),(5,4,1),(6,5,2),(7,6,1),(8,7,3),(9,8,3),(10,9,3),(11,10,3),(12,11,2),(13,12,1),(14,13,2),(15,14,2),(16,15,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (4,'2020-10-29 20:40:06.954028','2','a@gmail.com',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',16,4),(5,'2020-10-29 20:40:27.022163','4','prueba@gmail.com',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',16,4),(6,'2020-10-29 20:40:43.668670','4','prueba@gmail.com',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',16,4),(7,'2020-10-29 20:41:51.098235','4','prueba@gmail.com',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',16,4),(8,'2020-10-29 21:13:47.527076','2','a@gmail.com',3,'',16,6),(9,'2020-11-06 02:55:10.033684','40','Report object (40)',3,'',11,4),(10,'2020-11-06 02:55:10.051435','38','Report object (38)',3,'',11,4),(11,'2020-11-06 02:55:10.055181','37','Report object (37)',3,'',11,4),(12,'2020-11-06 02:55:10.057968','34','Report object (34)',3,'',11,4),(13,'2020-11-06 02:55:10.061695','32','Report object (32)',3,'',11,4),(14,'2020-11-06 02:55:10.064770','31','Report object (31)',3,'',11,4),(15,'2020-11-06 02:55:10.066743','30','Report object (30)',3,'',11,4),(16,'2020-11-06 02:55:10.070394','29','Report object (29)',3,'',11,4),(17,'2020-11-06 02:55:10.073338','28','Report object (28)',3,'',11,4),(18,'2020-11-06 02:55:10.076120','27','Report object (27)',3,'',11,4),(19,'2020-11-06 02:55:10.079009','26','Report object (26)',3,'',11,4),(20,'2020-11-06 02:55:10.082005','25','Report object (25)',3,'',11,4),(21,'2020-11-06 02:55:10.084000','24','Report object (24)',3,'',11,4),(22,'2020-11-06 02:55:10.087266','23','Report object (23)',3,'',11,4),(23,'2020-11-06 02:55:10.089347','21','Report object (21)',3,'',11,4),(24,'2020-11-06 02:55:10.092704','20','Report object (20)',3,'',11,4),(25,'2020-11-06 02:55:10.094714','19','Report object (19)',3,'',11,4),(26,'2020-11-06 02:55:10.097706','18','Report object (18)',3,'',11,4),(27,'2020-11-06 02:55:10.100698','17','Report object (17)',3,'',11,4),(28,'2020-11-06 02:55:10.103565','15','Report object (15)',3,'',11,4),(29,'2020-11-06 02:55:10.105563','13','Report object (13)',3,'',11,4),(30,'2020-11-06 02:55:10.109074','12','Report object (12)',3,'',11,4),(31,'2020-11-06 02:55:10.111613','11','Report object (11)',3,'',11,4),(32,'2020-11-06 02:55:10.113838','9','Report object (9)',3,'',11,4),(33,'2020-11-06 02:55:10.116634','8','Report object (8)',3,'',11,4),(34,'2020-11-06 02:55:10.119177','5','Report object (5)',3,'',11,4),(35,'2020-11-06 03:14:50.261439','42','Report object (42)',3,'',11,4),(36,'2020-11-07 04:35:06.712339','8','Mamografia object (8)',3,'',4,4),(37,'2020-11-07 04:35:06.761533','7','Mamografia object (7)',3,'',4,4),(38,'2020-11-07 04:35:06.765122','6','Mamografia object (6)',3,'',4,4),(39,'2020-11-07 04:35:06.768340','5','Mamografia object (5)',3,'',4,4),(40,'2020-11-07 04:35:06.771004','4','Mamografia object (4)',3,'',4,4),(41,'2020-11-07 04:35:06.774996','3','Mamografia object (3)',3,'',4,4),(42,'2020-11-07 04:35:06.778262','2','Mamografia object (2)',3,'',4,4),(43,'2020-11-07 04:35:06.780915','1','Mamografia object (1)',3,'',4,4),(44,'2020-11-07 07:13:54.637292','23','Mamografia object (23)',3,'',4,4),(45,'2020-11-07 07:13:54.644039','22','Mamografia object (22)',3,'',4,4),(46,'2020-11-07 07:13:54.647457','21','Mamografia object (21)',3,'',4,4),(47,'2020-11-07 07:13:54.651525','19','Mamografia object (19)',3,'',4,4),(48,'2020-11-07 07:13:54.654937','18','Mamografia object (18)',3,'',4,4),(49,'2020-11-07 07:13:54.657250','17','Mamografia object (17)',3,'',4,4),(50,'2020-11-07 07:13:54.661168','16','Mamografia object (16)',3,'',4,4),(51,'2020-11-07 07:13:54.663756','15','Mamografia object (15)',3,'',4,4),(52,'2020-11-07 07:13:54.666396','14','Mamografia object (14)',3,'',4,4),(53,'2020-11-07 07:13:54.668394','13','Mamografia object (13)',3,'',4,4),(54,'2020-11-07 07:13:54.672077','12','Mamografia object (12)',3,'',4,4),(55,'2020-11-07 07:13:54.675353','11','Mamografia object (11)',3,'',4,4),(56,'2020-11-07 07:13:54.678131','10','Mamografia object (10)',3,'',4,4),(57,'2020-11-07 07:54:05.028970','40','Mamografia object (40)',3,'',4,4),(58,'2020-11-07 07:54:05.040453','39','Mamografia object (39)',3,'',4,4),(59,'2020-11-07 07:54:05.043445','38','Mamografia object (38)',3,'',4,4),(60,'2020-11-07 07:54:05.046437','37','Mamografia object (37)',3,'',4,4),(61,'2020-11-07 07:54:05.049429','36','Mamografia object (36)',3,'',4,4),(62,'2020-11-07 07:54:05.052421','35','Mamografia object (35)',3,'',4,4),(63,'2020-11-07 07:54:05.055416','34','Mamografia object (34)',3,'',4,4),(64,'2020-11-07 07:54:05.058406','33','Mamografia object (33)',3,'',4,4),(65,'2020-11-07 07:54:05.062394','32','Mamografia object (32)',3,'',4,4),(66,'2020-11-07 07:54:05.065386','31','Mamografia object (31)',3,'',4,4),(67,'2020-11-07 08:09:02.300783','44','Mamografia object (44)',3,'',4,4),(68,'2020-11-07 08:09:02.303767','43','Mamografia object (43)',3,'',4,4),(69,'2020-11-07 08:09:02.306314','42','Mamografia object (42)',3,'',4,4),(70,'2020-11-07 08:09:02.308676','41','Mamografia object (41)',3,'',4,4),(71,'2020-11-07 08:15:07.105355','49','Mamografia object (49)',3,'',4,4),(72,'2020-11-07 08:15:07.117465','48','Mamografia object (48)',3,'',4,4),(73,'2020-11-07 08:15:07.121179','47','Mamografia object (47)',3,'',4,4),(74,'2020-11-07 08:15:07.125097','46','Mamografia object (46)',3,'',4,4),(75,'2020-11-07 08:15:07.128759','45','Mamografia object (45)',3,'',4,4),(76,'2020-11-09 00:35:38.930002','patient0','Patient object (patient0)',1,'[{\"added\": {}}]',6,4),(77,'2020-11-11 02:02:23.702863','9','asi@gmail.com',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',16,12),(78,'2020-11-14 00:54:04.704871','75','Mamografia object (75)',2,'[{\"changed\": {\"fields\": [\"Filename\"]}}]',4,4),(79,'2020-11-14 01:07:08.974495','75','Mamografia object (75)',2,'[{\"changed\": {\"fields\": [\"Filename\"]}}]',4,4),(80,'2020-12-04 17:03:53.336117','patient0','Patient object (patient0)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',6,4),(81,'2020-12-04 17:04:03.144738','3','Patient object (3)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',6,4),(82,'2020-12-04 17:04:12.088006','2','Patient object (2)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',6,4),(83,'2020-12-04 17:05:13.219870','1','Patient object (1)',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',6,4),(84,'2020-12-04 17:06:27.015696','91','Mamografia object (91)',3,'',4,4),(85,'2020-12-04 17:06:27.018705','83','Mamografia object (83)',3,'',4,4),(86,'2020-12-04 17:06:27.022676','71','Mamografia object (71)',3,'',4,4),(87,'2020-12-04 17:06:27.025665','70','Mamografia object (70)',3,'',4,4),(88,'2020-12-04 17:06:27.029717','69','Mamografia object (69)',3,'',4,4),(89,'2020-12-04 17:06:27.036393','68','Mamografia object (68)',3,'',4,4),(90,'2020-12-04 17:06:27.040065','67','Mamografia object (67)',3,'',4,4),(91,'2020-12-04 17:06:27.043764','58','Mamografia object (58)',3,'',4,4),(92,'2020-12-04 17:06:27.046759','57','Mamografia object (57)',3,'',4,4),(93,'2020-12-04 17:06:40.000281','66','Report object (66)',3,'',11,4),(94,'2020-12-04 17:06:40.011426','64','Report object (64)',3,'',11,4),(95,'2020-12-04 17:06:40.015369','63','Report object (63)',3,'',11,4),(96,'2020-12-04 17:06:40.018727','60','Report object (60)',3,'',11,4),(97,'2020-12-04 17:06:40.022721','57','Report object (57)',3,'',11,4),(98,'2020-12-04 17:06:40.025714','55','Report object (55)',3,'',11,4),(99,'2020-12-04 17:06:40.028734','54','Report object (54)',3,'',11,4),(100,'2020-12-04 17:06:40.030732','53','Report object (53)',3,'',11,4),(101,'2020-12-04 17:06:40.034440','50','Report object (50)',3,'',11,4),(102,'2020-12-04 17:06:40.037459','48','Report object (48)',3,'',11,4),(103,'2020-12-04 17:06:40.040406','46','Report object (46)',3,'',11,4),(104,'2020-12-04 17:06:40.043635','44','Report object (44)',3,'',11,4),(105,'2020-12-04 17:07:15.162259','108','SubForm_antecedentes_g_o object (108)',3,'',10,4),(106,'2020-12-04 17:07:15.166811','107','SubForm_antecedentes_g_o object (107)',3,'',10,4),(107,'2020-12-04 17:07:15.170699','106','SubForm_antecedentes_g_o object (106)',3,'',10,4),(108,'2020-12-04 17:07:15.173807','105','SubForm_antecedentes_g_o object (105)',3,'',10,4),(109,'2020-12-04 17:07:15.176803','104','SubForm_antecedentes_g_o object (104)',3,'',10,4),(110,'2020-12-04 17:07:15.179795','103','SubForm_antecedentes_g_o object (103)',3,'',10,4),(111,'2020-12-04 17:07:15.183815','102','SubForm_antecedentes_g_o object (102)',3,'',10,4),(112,'2020-12-04 17:07:15.185778','101','SubForm_antecedentes_g_o object (101)',3,'',10,4),(113,'2020-12-04 17:07:15.188801','100','SubForm_antecedentes_g_o object (100)',3,'',10,4),(114,'2020-12-04 17:07:15.191784','99','SubForm_antecedentes_g_o object (99)',3,'',10,4),(115,'2020-12-04 17:07:15.193758','98','SubForm_antecedentes_g_o object (98)',3,'',10,4),(116,'2020-12-04 17:07:15.196784','97','SubForm_antecedentes_g_o object (97)',3,'',10,4),(117,'2020-12-04 17:07:15.198781','96','SubForm_antecedentes_g_o object (96)',3,'',10,4),(118,'2020-12-04 17:07:15.201774','95','SubForm_antecedentes_g_o object (95)',3,'',10,4),(119,'2020-12-04 17:07:15.204924','94','SubForm_antecedentes_g_o object (94)',3,'',10,4),(120,'2020-12-04 17:07:15.207607','93','SubForm_antecedentes_g_o object (93)',3,'',10,4),(121,'2020-12-04 17:07:15.209611','92','SubForm_antecedentes_g_o object (92)',3,'',10,4),(122,'2020-12-04 17:07:15.212598','91','SubForm_antecedentes_g_o object (91)',3,'',10,4),(123,'2020-12-04 17:07:15.215700','90','SubForm_antecedentes_g_o object (90)',3,'',10,4),(124,'2020-12-04 17:07:15.217700','89','SubForm_antecedentes_g_o object (89)',3,'',10,4),(125,'2020-12-04 17:07:15.220690','88','SubForm_antecedentes_g_o object (88)',3,'',10,4),(126,'2020-12-04 17:07:15.223681','87','SubForm_antecedentes_g_o object (87)',3,'',10,4),(127,'2020-12-04 17:07:15.226219','86','SubForm_antecedentes_g_o object (86)',3,'',10,4),(128,'2020-12-04 17:07:15.229207','85','SubForm_antecedentes_g_o object (85)',3,'',10,4),(129,'2020-12-04 17:07:15.232200','84','SubForm_antecedentes_g_o object (84)',3,'',10,4),(130,'2020-12-04 17:07:15.235189','83','SubForm_antecedentes_g_o object (83)',3,'',10,4),(131,'2020-12-04 17:07:15.238185','82','SubForm_antecedentes_g_o object (82)',3,'',10,4),(132,'2020-12-04 17:07:15.240177','79','SubForm_antecedentes_g_o object (79)',3,'',10,4),(133,'2020-12-04 17:07:15.243170','78','SubForm_antecedentes_g_o object (78)',3,'',10,4),(134,'2020-12-04 17:07:15.246210','77','SubForm_antecedentes_g_o object (77)',3,'',10,4),(135,'2020-12-04 17:07:15.249152','76','SubForm_antecedentes_g_o object (76)',3,'',10,4),(136,'2020-12-04 17:07:15.252145','75','SubForm_antecedentes_g_o object (75)',3,'',10,4),(137,'2020-12-04 17:07:15.255565','74','SubForm_antecedentes_g_o object (74)',3,'',10,4),(138,'2020-12-04 17:07:15.257661','73','SubForm_antecedentes_g_o object (73)',3,'',10,4),(139,'2020-12-04 17:07:15.260472','72','SubForm_antecedentes_g_o object (72)',3,'',10,4),(140,'2020-12-04 17:07:15.263464','71','SubForm_antecedentes_g_o object (71)',3,'',10,4),(141,'2020-12-04 17:07:15.266239','70','SubForm_antecedentes_g_o object (70)',3,'',10,4),(142,'2020-12-04 17:07:15.269234','69','SubForm_antecedentes_g_o object (69)',3,'',10,4),(143,'2020-12-04 17:07:15.271674','68','SubForm_antecedentes_g_o object (68)',3,'',10,4),(144,'2020-12-04 17:07:15.273536','67','SubForm_antecedentes_g_o object (67)',3,'',10,4),(145,'2020-12-04 17:07:15.277148','66','SubForm_antecedentes_g_o object (66)',3,'',10,4),(146,'2020-12-04 17:07:15.280200','65','SubForm_antecedentes_g_o object (65)',3,'',10,4),(147,'2020-12-04 17:07:15.283131','64','SubForm_antecedentes_g_o object (64)',3,'',10,4),(148,'2020-12-04 17:07:15.285690','63','SubForm_antecedentes_g_o object (63)',3,'',10,4),(149,'2020-12-04 17:07:15.287688','62','SubForm_antecedentes_g_o object (62)',3,'',10,4),(150,'2020-12-04 17:07:15.290680','61','SubForm_antecedentes_g_o object (61)',3,'',10,4),(151,'2020-12-04 17:07:15.293674','60','SubForm_antecedentes_g_o object (60)',3,'',10,4),(152,'2020-12-04 17:07:15.296680','59','SubForm_antecedentes_g_o object (59)',3,'',10,4),(153,'2020-12-04 17:07:15.299678','58','SubForm_antecedentes_g_o object (58)',3,'',10,4),(154,'2020-12-04 17:07:15.302667','57','SubForm_antecedentes_g_o object (57)',3,'',10,4),(155,'2020-12-04 17:07:15.305757','56','SubForm_antecedentes_g_o object (56)',3,'',10,4),(156,'2020-12-04 17:07:15.307710','55','SubForm_antecedentes_g_o object (55)',3,'',10,4),(157,'2020-12-04 17:07:15.310706','54','SubForm_antecedentes_g_o object (54)',3,'',10,4),(158,'2020-12-04 17:07:15.314644','53','SubForm_antecedentes_g_o object (53)',3,'',10,4),(159,'2020-12-04 17:07:15.317692','52','SubForm_antecedentes_g_o object (52)',3,'',10,4),(160,'2020-12-04 17:07:15.320699','51','SubForm_antecedentes_g_o object (51)',3,'',10,4),(161,'2020-12-04 17:07:15.323993','50','SubForm_antecedentes_g_o object (50)',3,'',10,4),(162,'2020-12-04 17:07:15.326910','49','SubForm_antecedentes_g_o object (49)',3,'',10,4),(163,'2020-12-04 17:07:15.329727','48','SubForm_antecedentes_g_o object (48)',3,'',10,4),(164,'2020-12-04 17:07:15.332700','47','SubForm_antecedentes_g_o object (47)',3,'',10,4),(165,'2020-12-04 17:07:15.335691','46','SubForm_antecedentes_g_o object (46)',3,'',10,4),(166,'2020-12-04 17:07:15.338742','45','SubForm_antecedentes_g_o object (45)',3,'',10,4),(167,'2020-12-04 17:07:15.342026','44','SubForm_antecedentes_g_o object (44)',3,'',10,4),(168,'2020-12-04 17:07:15.344716','43','SubForm_antecedentes_g_o object (43)',3,'',10,4),(169,'2020-12-04 17:07:15.347779','42','SubForm_antecedentes_g_o object (42)',3,'',10,4),(170,'2020-12-04 17:07:15.350704','41','SubForm_antecedentes_g_o object (41)',3,'',10,4),(171,'2020-12-04 17:07:15.353993','40','SubForm_antecedentes_g_o object (40)',3,'',10,4),(172,'2020-12-04 17:07:15.357218','39','SubForm_antecedentes_g_o object (39)',3,'',10,4),(173,'2020-12-04 17:07:15.359831','38','SubForm_antecedentes_g_o object (38)',3,'',10,4),(174,'2020-12-04 17:07:15.363822','37','SubForm_antecedentes_g_o object (37)',3,'',10,4),(175,'2020-12-04 17:07:15.366814','36','SubForm_antecedentes_g_o object (36)',3,'',10,4),(176,'2020-12-04 17:07:15.369806','35','SubForm_antecedentes_g_o object (35)',3,'',10,4),(177,'2020-12-04 17:07:15.373795','34','SubForm_antecedentes_g_o object (34)',3,'',10,4),(178,'2020-12-04 17:07:15.376786','33','SubForm_antecedentes_g_o object (33)',3,'',10,4),(179,'2020-12-04 17:07:15.379786','32','SubForm_antecedentes_g_o object (32)',3,'',10,4),(180,'2020-12-04 17:07:15.382771','31','SubForm_antecedentes_g_o object (31)',3,'',10,4),(181,'2020-12-04 17:07:15.385798','30','SubForm_antecedentes_g_o object (30)',3,'',10,4),(182,'2020-12-04 17:07:15.389899','29','SubForm_antecedentes_g_o object (29)',3,'',10,4),(183,'2020-12-04 17:07:15.392778','28','SubForm_antecedentes_g_o object (28)',3,'',10,4),(184,'2020-12-04 17:07:15.395771','27','SubForm_antecedentes_g_o object (27)',3,'',10,4),(185,'2020-12-04 17:07:15.399762','26','SubForm_antecedentes_g_o object (26)',3,'',10,4),(186,'2020-12-04 17:07:15.402755','25','SubForm_antecedentes_g_o object (25)',3,'',10,4),(187,'2020-12-04 17:07:15.405745','24','SubForm_antecedentes_g_o object (24)',3,'',10,4),(188,'2020-12-04 17:07:15.408736','23','SubForm_antecedentes_g_o object (23)',3,'',10,4),(189,'2020-12-04 17:07:15.411748','22','SubForm_antecedentes_g_o object (22)',3,'',10,4),(190,'2020-12-04 17:07:15.414724','21','SubForm_antecedentes_g_o object (21)',3,'',10,4),(191,'2020-12-04 17:07:15.417414','20','SubForm_antecedentes_g_o object (20)',3,'',10,4),(192,'2020-12-04 17:07:15.420001','19','SubForm_antecedentes_g_o object (19)',3,'',10,4),(193,'2020-12-04 17:07:15.422685','18','SubForm_antecedentes_g_o object (18)',3,'',10,4),(194,'2020-12-04 17:07:15.425637','17','SubForm_antecedentes_g_o object (17)',3,'',10,4),(195,'2020-12-04 17:07:15.427631','16','SubForm_antecedentes_g_o object (16)',3,'',10,4),(196,'2020-12-04 17:07:15.430622','15','SubForm_antecedentes_g_o object (15)',3,'',10,4),(197,'2020-12-04 17:07:15.433897','14','SubForm_antecedentes_g_o object (14)',3,'',10,4),(198,'2020-12-04 17:07:15.436533','13','SubForm_antecedentes_g_o object (13)',3,'',10,4),(199,'2020-12-04 17:07:15.438576','12','SubForm_antecedentes_g_o object (12)',3,'',10,4),(200,'2020-12-04 17:07:15.441762','11','SubForm_antecedentes_g_o object (11)',3,'',10,4),(201,'2020-12-04 17:07:15.444101','10','SubForm_antecedentes_g_o object (10)',3,'',10,4),(202,'2020-12-04 17:07:15.447096','9','SubForm_antecedentes_g_o object (9)',3,'',10,4),(203,'2020-12-04 17:07:15.450089','8','SubForm_antecedentes_g_o object (8)',3,'',10,4),(204,'2020-12-04 17:07:15.455075','7','SubForm_antecedentes_g_o object (7)',3,'',10,4),(205,'2020-12-04 17:07:25.212409','6','SubForm_antecedentes_g_o object (6)',3,'',10,4),(206,'2020-12-04 17:07:25.215413','5','SubForm_antecedentes_g_o object (5)',3,'',10,4),(207,'2020-12-04 17:07:25.219372','4','SubForm_antecedentes_g_o object (4)',3,'',10,4),(208,'2020-12-04 17:07:25.222362','3','SubForm_antecedentes_g_o object (3)',3,'',10,4),(209,'2020-12-04 17:07:25.225353','2','SubForm_antecedentes_g_o object (2)',3,'',10,4),(210,'2020-12-04 17:07:25.228346','1','SubForm_antecedentes_g_o object (1)',3,'',10,4),(211,'2020-12-04 17:07:46.763389','108','SubForm_historia_familiar object (108)',3,'',9,4),(212,'2020-12-04 17:07:46.773911','107','SubForm_historia_familiar object (107)',3,'',9,4),(213,'2020-12-04 17:07:46.776899','106','SubForm_historia_familiar object (106)',3,'',9,4),(214,'2020-12-04 17:07:46.779893','105','SubForm_historia_familiar object (105)',3,'',9,4),(215,'2020-12-04 17:07:46.781886','104','SubForm_historia_familiar object (104)',3,'',9,4),(216,'2020-12-04 17:07:46.784879','103','SubForm_historia_familiar object (103)',3,'',9,4),(217,'2020-12-04 17:07:46.787874','102','SubForm_historia_familiar object (102)',3,'',9,4),(218,'2020-12-04 17:07:46.790894','101','SubForm_historia_familiar object (101)',3,'',9,4),(219,'2020-12-04 17:07:46.793885','100','SubForm_historia_familiar object (100)',3,'',9,4),(220,'2020-12-04 17:07:46.796846','99','SubForm_historia_familiar object (99)',3,'',9,4),(221,'2020-12-04 17:07:46.799838','98','SubForm_historia_familiar object (98)',3,'',9,4),(222,'2020-12-04 17:07:46.801834','97','SubForm_historia_familiar object (97)',3,'',9,4),(223,'2020-12-04 17:07:46.805857','96','SubForm_historia_familiar object (96)',3,'',9,4),(224,'2020-12-04 17:07:46.808814','95','SubForm_historia_familiar object (95)',3,'',9,4),(225,'2020-12-04 17:07:46.811806','94','SubForm_historia_familiar object (94)',3,'',9,4),(226,'2020-12-04 17:07:46.814799','93','SubForm_historia_familiar object (93)',3,'',9,4),(227,'2020-12-04 17:07:46.817790','92','SubForm_historia_familiar object (92)',3,'',9,4),(228,'2020-12-04 17:07:46.820783','91','SubForm_historia_familiar object (91)',3,'',9,4),(229,'2020-12-04 17:07:46.822777','90','SubForm_historia_familiar object (90)',3,'',9,4),(230,'2020-12-04 17:07:46.825769','89','SubForm_historia_familiar object (89)',3,'',9,4),(231,'2020-12-04 17:07:46.828761','88','SubForm_historia_familiar object (88)',3,'',9,4),(232,'2020-12-04 17:07:46.830757','87','SubForm_historia_familiar object (87)',3,'',9,4),(233,'2020-12-04 17:07:46.833779','86','SubForm_historia_familiar object (86)',3,'',9,4),(234,'2020-12-04 17:07:46.836741','85','SubForm_historia_familiar object (85)',3,'',9,4),(235,'2020-12-04 17:07:46.839731','84','SubForm_historia_familiar object (84)',3,'',9,4),(236,'2020-12-04 17:07:46.841728','83','SubForm_historia_familiar object (83)',3,'',9,4),(237,'2020-12-04 17:07:46.845716','82','SubForm_historia_familiar object (82)',3,'',9,4),(238,'2020-12-04 17:07:46.847419','79','SubForm_historia_familiar object (79)',3,'',9,4),(239,'2020-12-04 17:07:46.850414','78','SubForm_historia_familiar object (78)',3,'',9,4),(240,'2020-12-04 17:07:46.853407','77','SubForm_historia_familiar object (77)',3,'',9,4),(241,'2020-12-04 17:07:46.855401','76','SubForm_historia_familiar object (76)',3,'',9,4),(242,'2020-12-04 17:07:46.859392','75','SubForm_historia_familiar object (75)',3,'',9,4),(243,'2020-12-04 17:07:46.862553','74','SubForm_historia_familiar object (74)',3,'',9,4),(244,'2020-12-04 17:07:46.865427','73','SubForm_historia_familiar object (73)',3,'',9,4),(245,'2020-12-04 17:07:46.868414','72','SubForm_historia_familiar object (72)',3,'',9,4),(246,'2020-12-04 17:07:46.871434','71','SubForm_historia_familiar object (71)',3,'',9,4),(247,'2020-12-04 17:07:46.874403','70','SubForm_historia_familiar object (70)',3,'',9,4),(248,'2020-12-04 17:07:46.880403','69','SubForm_historia_familiar object (69)',3,'',9,4),(249,'2020-12-04 17:07:46.883421','68','SubForm_historia_familiar object (68)',3,'',9,4),(250,'2020-12-04 17:07:46.886605','67','SubForm_historia_familiar object (67)',3,'',9,4),(251,'2020-12-04 17:07:46.889230','66','SubForm_historia_familiar object (66)',3,'',9,4),(252,'2020-12-04 17:07:46.892096','65','SubForm_historia_familiar object (65)',3,'',9,4),(253,'2020-12-04 17:07:46.895090','64','SubForm_historia_familiar object (64)',3,'',9,4),(254,'2020-12-04 17:07:46.897801','63','SubForm_historia_familiar object (63)',3,'',9,4),(255,'2020-12-04 17:07:46.900641','62','SubForm_historia_familiar object (62)',3,'',9,4),(256,'2020-12-04 17:07:46.903658','61','SubForm_historia_familiar object (61)',3,'',9,4),(257,'2020-12-04 17:07:46.906624','60','SubForm_historia_familiar object (60)',3,'',9,4),(258,'2020-12-04 17:07:46.909616','59','SubForm_historia_familiar object (59)',3,'',9,4),(259,'2020-12-04 17:07:46.912608','58','SubForm_historia_familiar object (58)',3,'',9,4),(260,'2020-12-04 17:07:46.915601','57','SubForm_historia_familiar object (57)',3,'',9,4),(261,'2020-12-04 17:07:46.918593','56','SubForm_historia_familiar object (56)',3,'',9,4),(262,'2020-12-04 17:07:46.921585','55','SubForm_historia_familiar object (55)',3,'',9,4),(263,'2020-12-04 17:07:46.924578','54','SubForm_historia_familiar object (54)',3,'',9,4),(264,'2020-12-04 17:07:46.927569','53','SubForm_historia_familiar object (53)',3,'',9,4),(265,'2020-12-04 17:07:46.930561','52','SubForm_historia_familiar object (52)',3,'',9,4),(266,'2020-12-04 17:07:46.933206','51','SubForm_historia_familiar object (51)',3,'',9,4),(267,'2020-12-04 17:07:46.936167','50','SubForm_historia_familiar object (50)',3,'',9,4),(268,'2020-12-04 17:07:46.939191','49','SubForm_historia_familiar object (49)',3,'',9,4),(269,'2020-12-04 17:07:46.942151','48','SubForm_historia_familiar object (48)',3,'',9,4),(270,'2020-12-04 17:07:46.945143','47','SubForm_historia_familiar object (47)',3,'',9,4),(271,'2020-12-04 17:07:46.949132','46','SubForm_historia_familiar object (46)',3,'',9,4),(272,'2020-12-04 17:07:46.952124','45','SubForm_historia_familiar object (45)',3,'',9,4),(273,'2020-12-04 17:07:46.955139','44','SubForm_historia_familiar object (44)',3,'',9,4),(274,'2020-12-04 17:07:46.958108','43','SubForm_historia_familiar object (43)',3,'',9,4),(275,'2020-12-04 17:07:46.961100','42','SubForm_historia_familiar object (42)',3,'',9,4),(276,'2020-12-04 17:07:46.965523','41','SubForm_historia_familiar object (41)',3,'',9,4),(277,'2020-12-04 17:07:46.967783','40','SubForm_historia_familiar object (40)',3,'',9,4),(278,'2020-12-04 17:07:46.970778','39','SubForm_historia_familiar object (39)',3,'',9,4),(279,'2020-12-04 17:07:46.974769','38','SubForm_historia_familiar object (38)',3,'',9,4),(280,'2020-12-04 17:07:46.978101','37','SubForm_historia_familiar object (37)',3,'',9,4),(281,'2020-12-04 17:07:46.981097','36','SubForm_historia_familiar object (36)',3,'',9,4),(282,'2020-12-04 17:07:46.984090','35','SubForm_historia_familiar object (35)',3,'',9,4),(283,'2020-12-04 17:07:46.987081','34','SubForm_historia_familiar object (34)',3,'',9,4),(284,'2020-12-04 17:07:46.990076','33','SubForm_historia_familiar object (33)',3,'',9,4),(285,'2020-12-04 17:07:46.993065','32','SubForm_historia_familiar object (32)',3,'',9,4),(286,'2020-12-04 17:07:46.996057','31','SubForm_historia_familiar object (31)',3,'',9,4),(287,'2020-12-04 17:07:47.000540','30','SubForm_historia_familiar object (30)',3,'',9,4),(288,'2020-12-04 17:07:47.003532','29','SubForm_historia_familiar object (29)',3,'',9,4),(289,'2020-12-04 17:07:47.007220','28','SubForm_historia_familiar object (28)',3,'',9,4),(290,'2020-12-04 17:07:47.009219','27','SubForm_historia_familiar object (27)',3,'',9,4),(291,'2020-12-04 17:07:47.012210','26','SubForm_historia_familiar object (26)',3,'',9,4),(292,'2020-12-04 17:07:47.015203','25','SubForm_historia_familiar object (25)',3,'',9,4),(293,'2020-12-04 17:07:47.018195','24','SubForm_historia_familiar object (24)',3,'',9,4),(294,'2020-12-04 17:07:47.021186','23','SubForm_historia_familiar object (23)',3,'',9,4),(295,'2020-12-04 17:07:47.024177','22','SubForm_historia_familiar object (22)',3,'',9,4),(296,'2020-12-04 17:07:47.027503','21','SubForm_historia_familiar object (21)',3,'',9,4),(297,'2020-12-04 17:07:47.030588','20','SubForm_historia_familiar object (20)',3,'',9,4),(298,'2020-12-04 17:07:47.032581','19','SubForm_historia_familiar object (19)',3,'',9,4),(299,'2020-12-04 17:07:47.035582','18','SubForm_historia_familiar object (18)',3,'',9,4),(300,'2020-12-04 17:07:47.039592','17','SubForm_historia_familiar object (17)',3,'',9,4),(301,'2020-12-04 17:07:47.042556','16','SubForm_historia_familiar object (16)',3,'',9,4),(302,'2020-12-04 17:07:47.045549','15','SubForm_historia_familiar object (15)',3,'',9,4),(303,'2020-12-04 17:07:47.049537','14','SubForm_historia_familiar object (14)',3,'',9,4),(304,'2020-12-04 17:07:47.052531','13','SubForm_historia_familiar object (13)',3,'',9,4),(305,'2020-12-04 17:07:47.055547','12','SubForm_historia_familiar object (12)',3,'',9,4),(306,'2020-12-04 17:07:47.059158','11','SubForm_historia_familiar object (11)',3,'',9,4),(307,'2020-12-04 17:07:47.062164','10','SubForm_historia_familiar object (10)',3,'',9,4),(308,'2020-12-04 17:07:47.064841','9','SubForm_historia_familiar object (9)',3,'',9,4),(309,'2020-12-04 17:07:47.067822','8','SubForm_historia_familiar object (8)',3,'',9,4),(310,'2020-12-04 17:07:47.069819','7','SubForm_historia_familiar object (7)',3,'',9,4),(311,'2020-12-04 17:07:47.073828','6','SubForm_historia_familiar object (6)',3,'',9,4),(312,'2020-12-04 17:07:47.076841','5','SubForm_historia_familiar object (5)',3,'',9,4),(313,'2020-12-04 17:07:47.080809','4','SubForm_historia_familiar object (4)',3,'',9,4),(314,'2020-12-04 17:07:47.083905','3','SubForm_historia_familiar object (3)',3,'',9,4),(315,'2020-12-04 17:07:47.086933','2','SubForm_historia_familiar object (2)',3,'',9,4),(316,'2020-12-04 17:07:47.089894','1','SubForm_historia_familiar object (1)',3,'',9,4),(317,'2020-12-04 17:08:02.503795','108','SubForm_historia_personal object (108)',3,'',8,4),(318,'2020-12-04 17:08:02.514179','107','SubForm_historia_personal object (107)',3,'',8,4),(319,'2020-12-04 17:08:02.517720','106','SubForm_historia_personal object (106)',3,'',8,4),(320,'2020-12-04 17:08:02.521728','105','SubForm_historia_personal object (105)',3,'',8,4),(321,'2020-12-04 17:08:02.524670','104','SubForm_historia_personal object (104)',3,'',8,4),(322,'2020-12-04 17:08:02.527662','103','SubForm_historia_personal object (103)',3,'',8,4),(323,'2020-12-04 17:08:02.530651','102','SubForm_historia_personal object (102)',3,'',8,4),(324,'2020-12-04 17:08:02.533038','101','SubForm_historia_personal object (101)',3,'',8,4),(325,'2020-12-04 17:08:02.536458','100','SubForm_historia_personal object (100)',3,'',8,4),(326,'2020-12-04 17:08:02.538802','99','SubForm_historia_personal object (99)',3,'',8,4),(327,'2020-12-04 17:08:02.540776','98','SubForm_historia_personal object (98)',3,'',8,4),(328,'2020-12-04 17:08:02.544069','97','SubForm_historia_personal object (97)',3,'',8,4),(329,'2020-12-04 17:08:02.547242','96','SubForm_historia_personal object (96)',3,'',8,4),(330,'2020-12-04 17:08:02.550237','95','SubForm_historia_personal object (95)',3,'',8,4),(331,'2020-12-04 17:08:02.552776','94','SubForm_historia_personal object (94)',3,'',8,4),(332,'2020-12-04 17:08:02.556241','93','SubForm_historia_personal object (93)',3,'',8,4),(333,'2020-12-04 17:08:02.558240','92','SubForm_historia_personal object (92)',3,'',8,4),(334,'2020-12-04 17:08:02.561235','91','SubForm_historia_personal object (91)',3,'',8,4),(335,'2020-12-04 17:08:02.564224','90','SubForm_historia_personal object (90)',3,'',8,4),(336,'2020-12-04 17:08:02.567214','89','SubForm_historia_personal object (89)',3,'',8,4),(337,'2020-12-04 17:08:02.570208','88','SubForm_historia_personal object (88)',3,'',8,4),(338,'2020-12-04 17:08:02.572201','87','SubForm_historia_personal object (87)',3,'',8,4),(339,'2020-12-04 17:08:02.575214','86','SubForm_historia_personal object (86)',3,'',8,4),(340,'2020-12-04 17:08:02.578187','85','SubForm_historia_personal object (85)',3,'',8,4),(341,'2020-12-04 17:08:02.581178','84','SubForm_historia_personal object (84)',3,'',8,4),(342,'2020-12-04 17:08:02.583513','83','SubForm_historia_personal object (83)',3,'',8,4),(343,'2020-12-04 17:08:02.585513','82','SubForm_historia_personal object (82)',3,'',8,4),(344,'2020-12-04 17:08:02.588035','79','SubForm_historia_personal object (79)',3,'',8,4),(345,'2020-12-04 17:08:02.591032','78','SubForm_historia_personal object (78)',3,'',8,4),(346,'2020-12-04 17:08:02.594023','77','SubForm_historia_personal object (77)',3,'',8,4),(347,'2020-12-04 17:08:02.596018','76','SubForm_historia_personal object (76)',3,'',8,4),(348,'2020-12-04 17:08:02.598884','75','SubForm_historia_personal object (75)',3,'',8,4),(349,'2020-12-04 17:08:02.601619','74','SubForm_historia_personal object (74)',3,'',8,4),(350,'2020-12-04 17:08:02.604442','73','SubForm_historia_personal object (73)',3,'',8,4),(351,'2020-12-04 17:08:02.606440','72','SubForm_historia_personal object (72)',3,'',8,4),(352,'2020-12-04 17:08:02.610028','71','SubForm_historia_personal object (71)',3,'',8,4),(353,'2020-12-04 17:08:02.613026','70','SubForm_historia_personal object (70)',3,'',8,4),(354,'2020-12-04 17:08:02.616543','69','SubForm_historia_personal object (69)',3,'',8,4),(355,'2020-12-04 17:08:02.618931','68','SubForm_historia_personal object (68)',3,'',8,4),(356,'2020-12-04 17:08:02.622051','67','SubForm_historia_personal object (67)',3,'',8,4),(357,'2020-12-04 17:08:02.624663','66','SubForm_historia_personal object (66)',3,'',8,4),(358,'2020-12-04 17:08:02.627660','65','SubForm_historia_personal object (65)',3,'',8,4),(359,'2020-12-04 17:08:02.630654','64','SubForm_historia_personal object (64)',3,'',8,4),(360,'2020-12-04 17:08:02.633783','63','SubForm_historia_personal object (63)',3,'',8,4),(361,'2020-12-04 17:08:02.636674','62','SubForm_historia_personal object (62)',3,'',8,4),(362,'2020-12-04 17:08:02.639021','61','SubForm_historia_personal object (61)',3,'',8,4),(363,'2020-12-04 17:08:02.641015','60','SubForm_historia_personal object (60)',3,'',8,4),(364,'2020-12-04 17:08:02.644786','59','SubForm_historia_personal object (59)',3,'',8,4),(365,'2020-12-04 17:08:02.646688','58','SubForm_historia_personal object (58)',3,'',8,4),(366,'2020-12-04 17:08:02.649693','57','SubForm_historia_personal object (57)',3,'',8,4),(367,'2020-12-04 17:08:02.652107','56','SubForm_historia_personal object (56)',3,'',8,4),(368,'2020-12-04 17:08:02.653764','55','SubForm_historia_personal object (55)',3,'',8,4),(369,'2020-12-04 17:08:02.656758','54','SubForm_historia_personal object (54)',3,'',8,4),(370,'2020-12-04 17:08:02.658753','53','SubForm_historia_personal object (53)',3,'',8,4),(371,'2020-12-04 17:08:02.661745','52','SubForm_historia_personal object (52)',3,'',8,4),(372,'2020-12-04 17:08:02.664668','51','SubForm_historia_personal object (51)',3,'',8,4),(373,'2020-12-04 17:08:02.666666','50','SubForm_historia_personal object (50)',3,'',8,4),(374,'2020-12-04 17:08:02.669657','49','SubForm_historia_personal object (49)',3,'',8,4),(375,'2020-12-04 17:08:02.671652','48','SubForm_historia_personal object (48)',3,'',8,4),(376,'2020-12-04 17:08:02.673649','47','SubForm_historia_personal object (47)',3,'',8,4),(377,'2020-12-04 17:08:02.677637','46','SubForm_historia_personal object (46)',3,'',8,4),(378,'2020-12-04 17:08:02.680628','45','SubForm_historia_personal object (45)',3,'',8,4),(379,'2020-12-04 17:08:02.683172','44','SubForm_historia_personal object (44)',3,'',8,4),(380,'2020-12-04 17:08:02.685882','43','SubForm_historia_personal object (43)',3,'',8,4),(381,'2020-12-04 17:08:02.688659','42','SubForm_historia_personal object (42)',3,'',8,4),(382,'2020-12-04 17:08:02.690654','41','SubForm_historia_personal object (41)',3,'',8,4),(383,'2020-12-04 17:08:02.693645','40','SubForm_historia_personal object (40)',3,'',8,4),(384,'2020-12-04 17:08:02.696766','39','SubForm_historia_personal object (39)',3,'',8,4),(385,'2020-12-04 17:08:02.699676','38','SubForm_historia_personal object (38)',3,'',8,4),(386,'2020-12-04 17:08:02.701670','37','SubForm_historia_personal object (37)',3,'',8,4),(387,'2020-12-04 17:08:02.705108','36','SubForm_historia_personal object (36)',3,'',8,4),(388,'2020-12-04 17:08:02.708102','35','SubForm_historia_personal object (35)',3,'',8,4),(389,'2020-12-04 17:08:02.711094','34','SubForm_historia_personal object (34)',3,'',8,4),(390,'2020-12-04 17:08:02.713748','33','SubForm_historia_personal object (33)',3,'',8,4),(391,'2020-12-04 17:08:02.716569','32','SubForm_historia_personal object (32)',3,'',8,4),(392,'2020-12-04 17:08:02.718566','31','SubForm_historia_personal object (31)',3,'',8,4),(393,'2020-12-04 17:08:02.721857','30','SubForm_historia_personal object (30)',3,'',8,4),(394,'2020-12-04 17:08:02.724266','29','SubForm_historia_personal object (29)',3,'',8,4),(395,'2020-12-04 17:08:02.726717','28','SubForm_historia_personal object (28)',3,'',8,4),(396,'2020-12-04 17:08:02.728671','27','SubForm_historia_personal object (27)',3,'',8,4),(397,'2020-12-04 17:08:02.730644','26','SubForm_historia_personal object (26)',3,'',8,4),(398,'2020-12-04 17:08:02.733637','25','SubForm_historia_personal object (25)',3,'',8,4),(399,'2020-12-04 17:08:02.735821','24','SubForm_historia_personal object (24)',3,'',8,4),(400,'2020-12-04 17:08:02.738063','23','SubForm_historia_personal object (23)',3,'',8,4),(401,'2020-12-04 17:08:02.740055','22','SubForm_historia_personal object (22)',3,'',8,4),(402,'2020-12-04 17:08:02.742051','21','SubForm_historia_personal object (21)',3,'',8,4),(403,'2020-12-04 17:08:02.745091','20','SubForm_historia_personal object (20)',3,'',8,4),(404,'2020-12-04 17:08:02.747427','19','SubForm_historia_personal object (19)',3,'',8,4),(405,'2020-12-04 17:08:02.749091','18','SubForm_historia_personal object (18)',3,'',8,4),(406,'2020-12-04 17:08:02.752232','17','SubForm_historia_personal object (17)',3,'',8,4),(407,'2020-12-04 17:08:02.755212','16','SubForm_historia_personal object (16)',3,'',8,4),(408,'2020-12-04 17:08:02.757209','15','SubForm_historia_personal object (15)',3,'',8,4),(409,'2020-12-04 17:08:02.760202','14','SubForm_historia_personal object (14)',3,'',8,4),(410,'2020-12-04 17:08:02.763193','13','SubForm_historia_personal object (13)',3,'',8,4),(411,'2020-12-04 17:08:02.766186','12','SubForm_historia_personal object (12)',3,'',8,4),(412,'2020-12-04 17:08:02.768171','11','SubForm_historia_personal object (11)',3,'',8,4),(413,'2020-12-04 17:08:02.771202','10','SubForm_historia_personal object (10)',3,'',8,4),(414,'2020-12-04 17:08:02.773158','9','SubForm_historia_personal object (9)',3,'',8,4),(415,'2020-12-04 17:08:02.776208','8','SubForm_historia_personal object (8)',3,'',8,4),(416,'2020-12-04 17:08:02.779203','7','SubForm_historia_personal object (7)',3,'',8,4),(417,'2020-12-04 17:08:02.781198','6','SubForm_historia_personal object (6)',3,'',8,4),(418,'2020-12-04 17:08:02.784419','5','SubForm_historia_personal object (5)',3,'',8,4),(419,'2020-12-04 17:08:02.786417','4','SubForm_historia_personal object (4)',3,'',8,4),(420,'2020-12-04 17:08:02.788646','3','SubForm_historia_personal object (3)',3,'',8,4),(421,'2020-12-04 17:08:02.791709','2','SubForm_historia_personal object (2)',3,'',8,4),(422,'2020-12-04 17:08:02.794658','1','SubForm_historia_personal object (1)',3,'',8,4),(423,'2020-12-04 17:08:31.793555','MF996','Form object (MF996)',3,'',2,4),(424,'2020-12-04 17:08:31.796550','MF968','Form object (MF968)',3,'',2,4),(425,'2020-12-04 17:08:31.799508','MF966','Form object (MF966)',3,'',2,4),(426,'2020-12-04 17:08:31.802501','MF963','Form object (MF963)',3,'',2,4),(427,'2020-12-04 17:08:31.805493','MF954','Form object (MF954)',3,'',2,4),(428,'2020-12-04 17:08:31.808515','MF943','Form object (MF943)',3,'',2,4),(429,'2020-12-04 17:08:31.811510','MF937','Form object (MF937)',3,'',2,4),(430,'2020-12-04 17:08:31.813472','MF935','Form object (MF935)',3,'',2,4),(431,'2020-12-04 17:08:31.816464','MF923','Form object (MF923)',3,'',2,4),(432,'2020-12-04 17:08:31.820453','MF920','Form object (MF920)',3,'',2,4),(433,'2020-12-04 17:08:31.823475','MF914','Form object (MF914)',3,'',2,4),(434,'2020-12-04 17:08:31.825438','MF908','Form object (MF908)',3,'',2,4),(435,'2020-12-04 17:08:31.828463','MF90','Form object (MF90)',3,'',2,4),(436,'2020-12-04 17:08:31.831424','MF891','Form object (MF891)',3,'',2,4),(437,'2020-12-04 17:08:31.833419','MF885','Form object (MF885)',3,'',2,4),(438,'2020-12-04 17:08:31.837437','MF878','Form object (MF878)',3,'',2,4),(439,'2020-12-04 17:08:31.839403','MF875','Form object (MF875)',3,'',2,4),(440,'2020-12-04 17:08:31.842394','MF872','Form object (MF872)',3,'',2,4),(441,'2020-12-04 17:08:31.845416','MF858','Form object (MF858)',3,'',2,4),(442,'2020-12-04 17:08:31.847417','MF856','Form object (MF856)',3,'',2,4),(443,'2020-12-04 17:08:31.850373','MF853','Form object (MF853)',3,'',2,4),(444,'2020-12-04 17:08:31.853399','MF84','Form object (MF84)',3,'',2,4),(445,'2020-12-04 17:08:31.855390','MF830','Form object (MF830)',3,'',2,4),(446,'2020-12-04 17:08:31.858352','MF825','Form object (MF825)',3,'',2,4),(447,'2020-12-04 17:08:31.861344','MF797','Form object (MF797)',3,'',2,4),(448,'2020-12-04 17:08:31.863338','MF793','Form object (MF793)',3,'',2,4),(449,'2020-12-04 17:08:31.866331','MF770','Form object (MF770)',3,'',2,4),(450,'2020-12-04 17:08:31.869324','MF769','Form object (MF769)',3,'',2,4),(451,'2020-12-04 17:08:31.872334','MF757','Form object (MF757)',3,'',2,4),(452,'2020-12-04 17:08:31.874516','MF754','Form object (MF754)',3,'',2,4),(453,'2020-12-04 17:08:31.877591','MF738','Form object (MF738)',3,'',2,4),(454,'2020-12-04 17:08:31.882582','MF731','Form object (MF731)',3,'',2,4),(455,'2020-12-04 17:08:31.886571','MF730','Form object (MF730)',3,'',2,4),(456,'2020-12-04 17:08:31.889636','MF715','Form object (MF715)',3,'',2,4),(457,'2020-12-04 17:08:31.892553','MF714','Form object (MF714)',3,'',2,4),(458,'2020-12-04 17:08:31.896544','MF711','Form object (MF711)',3,'',2,4),(459,'2020-12-04 17:08:31.899534','MF70','Form object (MF70)',3,'',2,4),(460,'2020-12-04 17:08:31.903525','MF694','Form object (MF694)',3,'',2,4),(461,'2020-12-04 17:08:31.906237','MF687','Form object (MF687)',3,'',2,4),(462,'2020-12-04 17:08:31.908233','MF68','Form object (MF68)',3,'',2,4),(463,'2020-12-04 17:08:31.911291','MF647','Form object (MF647)',3,'',2,4),(464,'2020-12-04 17:08:31.914217','MF640','Form object (MF640)',3,'',2,4),(465,'2020-12-04 17:08:31.917209','MF637','Form object (MF637)',3,'',2,4),(466,'2020-12-04 17:08:31.919204','MF63','Form object (MF63)',3,'',2,4),(467,'2020-12-04 17:08:31.922195','MF626','Form object (MF626)',3,'',2,4),(468,'2020-12-04 17:08:31.924192','MF625','Form object (MF625)',3,'',2,4),(469,'2020-12-04 17:08:31.927182','MF612','Form object (MF612)',3,'',2,4),(470,'2020-12-04 17:08:31.930211','MF61','Form object (MF61)',3,'',2,4),(471,'2020-12-04 17:08:31.933168','MF607','Form object (MF607)',3,'',2,4),(472,'2020-12-04 17:08:31.937156','MF599','Form object (MF599)',3,'',2,4),(473,'2020-12-04 17:08:31.940148','MF583','Form object (MF583)',3,'',2,4),(474,'2020-12-04 17:08:31.943142','MF581','Form object (MF581)',3,'',2,4),(475,'2020-12-04 17:08:31.945102','MF565','Form object (MF565)',3,'',2,4),(476,'2020-12-04 17:08:31.948098','MF563','Form object (MF563)',3,'',2,4),(477,'2020-12-04 17:08:31.951526','MF560','Form object (MF560)',3,'',2,4),(478,'2020-12-04 17:08:31.954284','MF559','Form object (MF559)',3,'',2,4),(479,'2020-12-04 17:08:31.957532','MF546','Form object (MF546)',3,'',2,4),(480,'2020-12-04 17:08:31.959529','MF540','Form object (MF540)',3,'',2,4),(481,'2020-12-04 17:08:31.962280','MF537','Form object (MF537)',3,'',2,4),(482,'2020-12-04 17:08:31.965397','MF536','Form object (MF536)',3,'',2,4),(483,'2020-12-04 17:08:31.967391','MF514','Form object (MF514)',3,'',2,4),(484,'2020-12-04 17:08:31.970383','MF509','Form object (MF509)',3,'',2,4),(485,'2020-12-04 17:08:31.973121','MF494','Form object (MF494)',3,'',2,4),(486,'2020-12-04 17:08:31.975142','MF491','Form object (MF491)',3,'',2,4),(487,'2020-12-04 17:08:31.978138','MF487','Form object (MF487)',3,'',2,4),(488,'2020-12-04 17:08:31.980321','MF458','Form object (MF458)',3,'',2,4),(489,'2020-12-04 17:08:31.983313','MF456','Form object (MF456)',3,'',2,4),(490,'2020-12-04 17:08:31.985312','MF455','Form object (MF455)',3,'',2,4),(491,'2020-12-04 17:08:31.988300','MF449','Form object (MF449)',3,'',2,4),(492,'2020-12-04 17:08:31.991292','MF440','Form object (MF440)',3,'',2,4),(493,'2020-12-04 17:08:31.994177','MF432','Form object (MF432)',3,'',2,4),(494,'2020-12-04 17:08:31.996543','MF418','Form object (MF418)',3,'',2,4),(495,'2020-12-04 17:08:31.999308','MF414','Form object (MF414)',3,'',2,4),(496,'2020-12-04 17:08:32.001339','MF410','Form object (MF410)',3,'',2,4),(497,'2020-12-04 17:08:32.004119','MF406','Form object (MF406)',3,'',2,4),(498,'2020-12-04 17:08:32.006531','MF403','Form object (MF403)',3,'',2,4),(499,'2020-12-04 17:08:32.008529','MF369','Form object (MF369)',3,'',2,4),(500,'2020-12-04 17:08:32.011521','MF362','Form object (MF362)',3,'',2,4),(501,'2020-12-04 17:08:32.013516','MF35','Form object (MF35)',3,'',2,4),(502,'2020-12-04 17:08:32.015511','MF348','Form object (MF348)',3,'',2,4),(503,'2020-12-04 17:08:32.018526','MF337','Form object (MF337)',3,'',2,4),(504,'2020-12-04 17:08:32.021495','MF335','Form object (MF335)',3,'',2,4),(505,'2020-12-04 17:08:32.024511','MF324','Form object (MF324)',3,'',2,4),(506,'2020-12-04 17:08:32.026481','MF322','Form object (MF322)',3,'',2,4),(507,'2020-12-04 17:08:32.029473','MF321','Form object (MF321)',3,'',2,4),(508,'2020-12-04 17:08:32.031468','MF320','Form object (MF320)',3,'',2,4),(509,'2020-12-04 17:08:32.034460','MF316','Form object (MF316)',3,'',2,4),(510,'2020-12-04 17:08:32.037453','MF312','Form object (MF312)',3,'',2,4),(511,'2020-12-04 17:08:32.040499','MF306','Form object (MF306)',3,'',2,4),(512,'2020-12-04 17:08:32.043112','MF281','Form object (MF281)',3,'',2,4),(513,'2020-12-04 17:08:32.045150','MF267','Form object (MF267)',3,'',2,4),(514,'2020-12-04 17:08:32.047514','MF248','Form object (MF248)',3,'',2,4),(515,'2020-12-04 17:08:32.050532','MF232','Form object (MF232)',3,'',2,4),(516,'2020-12-04 17:08:32.053502','MF205','Form object (MF205)',3,'',2,4),(517,'2020-12-04 17:08:32.055497','MF200','Form object (MF200)',3,'',2,4),(518,'2020-12-04 17:08:32.058489','MF199','Form object (MF199)',3,'',2,4),(519,'2020-12-04 17:08:32.061504','MF183','Form object (MF183)',3,'',2,4),(520,'2020-12-04 17:08:32.063475','MF178','Form object (MF178)',3,'',2,4),(521,'2020-12-04 17:08:32.066467','MF143','Form object (MF143)',3,'',2,4),(522,'2020-12-04 17:08:32.068462','MF133','Form object (MF133)',3,'',2,4),(523,'2020-12-04 17:08:32.070456','MF129','Form object (MF129)',3,'',2,4),(524,'2020-12-04 17:08:32.072727','MF117','Form object (MF117)',3,'',2,4),(525,'2020-12-04 17:08:32.074412','MF113','Form object (MF113)',3,'',2,4),(526,'2020-12-04 17:08:32.077408','MF102','Form object (MF102)',3,'',2,4),(527,'2020-12-04 17:08:32.079352','MF1000','Form object (MF1000)',3,'',2,4),(528,'2020-12-04 17:08:32.081350','MF10','Form object (MF10)',3,'',2,4),(529,'2020-12-04 17:09:40.924933','patient0','Patient object (patient0)',3,'',6,4),(530,'2020-12-04 17:09:40.927752','3','Patient object (3)',3,'',6,4),(531,'2020-12-04 17:09:40.930748','2','Patient object (2)',3,'',6,4),(532,'2020-12-04 17:09:40.933739','1','Patient object (1)',3,'',6,4),(533,'2020-12-04 17:09:58.415933','3204','Patient object (3204)',1,'[{\"added\": {}}]',6,4),(534,'2020-12-04 17:10:08.206579','9382','Patient object (9382)',1,'[{\"added\": {}}]',6,4),(535,'2020-12-04 17:10:17.431808','9837','Patient object (9837)',1,'[{\"added\": {}}]',6,4),(536,'2020-12-04 17:10:30.265710','2256','Patient object (2256)',1,'[{\"added\": {}}]',6,4),(537,'2020-12-04 17:17:01.097369','MF235','Form object (MF235)',2,'[{\"changed\": {\"fields\": [\"Submitted at\"]}}]',2,15),(538,'2020-12-04 17:17:11.621902','MF935','Form object (MF935)',2,'[{\"changed\": {\"fields\": [\"Submitted at\"]}}]',2,15);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-10-26 15:12:41.089085'),(2,'auth','0001_initial','2020-10-26 15:12:41.304907'),(3,'admin','0001_initial','2020-10-26 15:12:41.890864'),(4,'admin','0002_logentry_remove_auto_add','2020-10-26 15:12:42.069233'),(5,'admin','0003_logentry_add_action_flag_choices','2020-10-26 15:12:42.075771'),(6,'contenttypes','0002_remove_content_type_name','2020-10-26 15:12:42.222905'),(7,'auth','0002_alter_permission_name_max_length','2020-10-26 15:12:42.291878'),(8,'auth','0003_alter_user_email_max_length','2020-10-26 15:12:42.338762'),(9,'auth','0004_alter_user_username_opts','2020-10-26 15:12:42.338762'),(10,'auth','0005_alter_user_last_login_null','2020-10-26 15:12:42.423388'),(11,'auth','0006_require_contenttypes_0002','2020-10-26 15:12:42.423388'),(12,'auth','0007_alter_validators_add_error_messages','2020-10-26 15:12:42.439031'),(13,'auth','0008_alter_user_username_max_length','2020-10-26 15:12:42.592691'),(14,'auth','0009_alter_user_last_name_max_length','2020-10-26 15:12:42.677304'),(15,'auth','0010_alter_group_name_max_length','2020-10-26 15:12:42.708552'),(16,'auth','0011_update_proxy_permissions','2020-10-26 15:12:42.724173'),(17,'auth','0012_alter_user_first_name_max_length','2020-10-26 15:12:42.793202'),(18,'main','0001_initial','2020-10-26 15:12:43.526246'),(19,'main','0002_auto_20201025_2324','2020-10-26 15:12:45.230383'),(20,'main','0003_auto_20201025_2346','2020-10-26 15:12:45.399618'),(21,'main','0004_auto_20201025_2351','2020-10-26 15:12:45.562342'),(22,'main','0005_auto_20201026_0004','2020-10-26 15:12:45.963300'),(23,'sessions','0001_initial','2020-10-26 15:12:46.016676'),(24,'main','0006_report_user','2020-11-06 02:56:15.598005'),(25,'main','0007_auto_20201105_2116','2020-11-06 03:16:27.595563'),(26,'main','0008_auto_20201106_2143','2020-11-07 03:43:48.326546'),(27,'main','0009_auto_20201106_2321','2020-11-07 05:21:30.225957'),(28,'main','0010_mamografia_filename','2020-11-07 07:13:21.487113'),(29,'main','0011_auto_20201115_1808','2020-11-16 00:08:39.886372');
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
INSERT INTO `django_session` VALUES ('2l65m8dri4kc7rfn0uo12fqw1rwoh21n','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1kapFW:SpDfPQyVZum9VuSkQAbTLQYpAAmWukDYhncMxmvINK0','2020-11-20 00:05:02.869865'),('5a1hhxm2wdk329boccztmk446ywsthg0','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1keRiO:rWofwp1Jy8wTbOyFTR_maHCx_WcCkVLb6eF1zWZaY7A','2020-11-29 23:45:48.436457'),('84i3yyzqxab3q8x9n7t7f4vnzx23eiy7','.eJxVjMEOwiAQBf-FsyFQCiwevfcbyLKAVA0kpT0Z_9026UGvb2bem3nc1uK3nhY_R3Zljl1-t4D0TPUA8YH13ji1ui5z4IfCT9r51GJ63U7376BgL3utlciopDMkNFiAIWPQTjktCRSQFkgKQVg1CnSDzjIF2Js0CjCUrWGfL7sbNsE:1kYvpK:YKD-F0YHWVpDqnaxINVfAi6aq1XFJb9p5ajOuOvJlT4','2020-11-14 18:42:10.438120'),('8jz3ksuvxsr862ia2x3e7x4wz5ql1h3o','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1kd4Yq:BEjd4wc5VCPlu9GJVayyxpuRtrHKOY5YmJoBQ1IN9aA','2020-11-26 04:50:16.124648'),('b8ufwt6owf9csj780zbjcdr7pyvs8ggm','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1kdkKe:B6BSdGPTIcwUHt0kd5GinoYNOvCMkUTlJ1NZ5E4bynQ','2020-11-28 01:26:24.141346'),('bcxicxe3dibpc3cws9jeit09pi9q4h6h','.eJxVjMEOwiAQRP-FsyEs0EI9evcbCOwuUjU0Ke3J-O9K0oPeJvPezEuEuG8l7I3XMJM4CxjE6bdMER9cO6F7rLdF4lK3dU6yK_KgTV4X4uflcP8OSmylryeXHShLCY3-Rk_GAIBDPY5aMWtirTx7G60ymDMS4KAoTZDQGm_F-wP97jf4:1klF50:c90BxntPugHDOtMicmLFYFGhRkNMkcuMATNkEreLt84','2020-12-18 17:41:14.752512'),('blv6o6whwpafutnk16pfi78csch4rixr','.eJxVjEEOwiAQRe_C2hCmSAGX7nsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwk7gILU6_W8T04LoDumO9NZlaXZc5yl2RB-1yasTP6-H-HRTs5Vsrk70D52AAUoZt8qPRNnOM3iflCXgkYiITtUJH-UweALVNKcKQM4n3B-AROJ4:1kX71r:xXpY8_zJs26roQRzu0zmYc4KZmip5HIuYeXF8wsDyLg','2020-11-09 18:15:35.258095'),('ec0h77l2oxj9sipbd2blipob8b94a4sw','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1kdRHo:JJsZcg5G9qWh1Nqih0cUxFrLUSj_eKCbFp4QlMgP2VI','2020-11-27 05:06:12.872190'),('h2sb4uew2fjle8y6uqcn4sml46yjz6q9','.eJxVjEEOwiAQRe_C2hCmSAGX7nsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwk7gILU6_W8T04LoDumO9NZlaXZc5yl2RB-1yasTP6-H-HRTs5Vsrk70D52AAUoZt8qPRNnOM3iflCXgkYiITtUJH-UweALVNKcKQM4n3B-AROJ4:1kX4fN:H-6QgNxrQyzpRd9Ra5Zef0weKlBmafVW7XhYxjAy7Ps','2020-11-09 15:44:13.735727'),('mii3iz514u2l4cxe32lwxiywray9qtnm','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1kasIj:YnCZND9gjFsAXaiR07U0j3PPIcyokdl-HC7Y1duS8Eo','2020-11-20 03:20:33.483565'),('nbi3pd4qxmjyyw8gmarusxycl6sj6fer','.eJxVjEEOwiAQRe_C2pAWGCgu3XsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwkzgLJ06_W8T04LoDumO9NZlaXZc5yl2RB-3y2oifl8P9OyjYy7cGVFYxjIZ0BgejTwNnMATKRQeR2HFWNqP1qPxkhwmMsxQjG--VJi3eH9ozN5M:1kcLEW:1zjt25iQz8jrzvQbRKWArG9K_Xoz25600UZ95HIisHg','2020-11-24 04:26:16.121951'),('o5gk4o36txvtjp8piuh4z8rnldo7yy00','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1kkxrv:L7GKdpdKqUiKEQ5ISxLQS4hxhUigssdD_bfWNTMxk8g','2020-12-17 23:18:35.809380'),('p9bmpagd8yf02gaxa0wacobgfl498nyg','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1ka567:RUcbSpSHchwYl2WoPTgUmCbEnSrIBfe9rS-xh2CFaVQ','2020-11-17 22:48:15.628368'),('snnxeuyvfpsg02jl22xw8v978vz0r8ek','.eJxVjEEOwiAQRe_C2hCmSAGX7nsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwk7gILU6_W8T04LoDumO9NZlaXZc5yl2RB-1yasTP6-H-HRTs5Vsrk70D52AAUoZt8qPRNnOM3iflCXgkYiITtUJH-UweALVNKcKQM4n3B-AROJ4:1kX6zd:ttoNKqwT33v6Gk4MseFZBLwZloDTp-pXRmg-Vuq6S6U','2020-11-09 18:13:17.208845'),('tc12zg7se7mcxcp41q9u8wgdgbyuao3z','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1kcDVi:Vil6bh6WsGYYIIfLxXDaHyI8DgxP96U6AnqSvMqfUIY','2020-11-23 20:11:30.756383'),('u060hah4lta8k9u1n7qhlvbksm2xnww6','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1kbutN:R7tyYyvdKjennFPD-uIxjPaYZu41yc4pIa8K4YV_KBg','2020-11-23 00:18:41.705975'),('vk4244ou379x623ux5pxaujnbni23m0t','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1kkYn8:_ScAGJ7mytJOHL0jqGea9FdyF_aEzL-35dM1HSNf3cE','2020-12-16 20:31:58.704227'),('y79n14l2mda2hai8h2qtxpx2vnf9v47a','.eJxVjMsOwiAQRf-FtSE8B3Dpvt9ABgalaiAp7cr479qkC93ec859sYjbWuM2yhJnYmdm2Ol3S5gfpe2A7thunefe1mVOfFf4QQefOpXn5XD_DiqO-q2F0FJ4a4xxOhBZHZDAQiKFNoA0HqS4olZS6IwCQwAAA16pYp2VLrD3B5v4NcY:1kjFSa:dDSDWE6WdyoTMShRLGRqQGJFgD-JdUXVqEDVq2bo9CQ','2020-12-13 05:41:20.944335');
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
INSERT INTO `main_form` VALUES ('2020-12-04 17:16:08.934961','2020-12-04 17:17:01.086399','MF235','2020-11-24 06:00:00.000000',1,1,'2256'),('2020-12-04 17:11:00.189457','2020-12-04 17:11:00.220566','MF32',NULL,1,NULL,'2256'),('2020-12-04 17:10:46.647188','2020-12-04 17:10:46.674072','MF34',NULL,1,NULL,'3204'),('2020-12-04 17:11:03.466720','2020-12-04 17:11:03.502501','MF40',NULL,1,NULL,'9382'),('2020-12-04 17:10:51.828141','2020-12-04 17:10:51.853281','MF60',NULL,1,NULL,'3204'),('2020-12-04 17:11:08.250742','2020-12-04 17:11:08.281999','MF803',NULL,1,NULL,'9837'),('2020-12-04 17:15:37.936680','2020-12-04 17:15:37.968152','MF932','2020-12-04 06:00:00.000000',1,1,'2256'),('2020-12-04 17:15:52.459921','2020-12-04 17:17:11.601966','MF935','2020-12-02 06:00:00.000000',1,1,'2256'),('2020-12-04 17:14:31.593363','2020-12-04 17:15:00.051539','prueb1','2020-12-04 06:00:00.000000',0,1,'2256');
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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_mamografia`
--

LOCK TABLES `main_mamografia` WRITE;
/*!40000 ALTER TABLE `main_mamografia` DISABLE KEYS */;
INSERT INTO `main_mamografia` VALUES (94,'https://storage.googleapis.com/mammotrck.appspot.com/04_12_20_12_35_06_8567_20586908_6c613a14b80a8591_MG_R_CC_ANON.png','MF235','04_12_20_12_35_06_8567_20586908_6c613a14b80a8591_MG_R_CC_ANON.png'),(95,'https://storage.googleapis.com/mammotrck.appspot.com/04_12_20_12_35_06_9629_20586960_6c613a14b80a8591_MG_R_ML_ANON.png','MF235','04_12_20_12_35_06_9629_20586960_6c613a14b80a8591_MG_R_ML_ANON.png');
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
INSERT INTO `main_patient` VALUES ('2020-12-04 17:10:30.263713','2020-12-04 17:10:30.263713','Rosalía Fernández','2256'),('2020-12-04 17:09:58.406576','2020-12-04 17:09:58.406576','Juana Camacho','3204'),('2020-12-04 17:10:08.197326','2020-12-04 17:10:08.197326','Susana Rivera','9382'),('2020-12-04 17:10:17.430811','2020-12-04 17:10:17.430811','Flora Montero','9837');
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
INSERT INTO `main_profile` VALUES (3,'2020-10-26 15:28:28.619601','2020-10-26 18:15:35.254187',1),(4,'2020-10-29 20:36:14.426929','2020-12-04 17:03:17.356646',1),(5,'2020-10-29 21:00:30.321302','2020-10-29 21:00:30.860386',1),(6,'2020-10-29 21:12:34.289223','2020-10-29 21:12:34.855907',1),(7,'2020-10-31 18:27:41.476214','2020-11-27 22:46:47.489283',1),(8,'2020-10-31 18:29:17.572279','2020-10-31 18:29:18.102194',1),(9,'2020-10-31 18:32:01.197235','2020-11-11 02:02:23.697879',1),(10,'2020-11-03 22:45:03.491408','2020-11-03 22:45:05.179583',1),(11,'2020-11-06 03:18:46.970473','2020-11-06 03:18:47.503757',1),(12,'2020-11-11 02:00:40.648031','2020-11-11 02:01:01.676501',1),(13,'2020-11-19 20:42:57.579454','2020-11-27 22:59:53.952494',1),(14,'2020-11-27 22:59:42.946152','2020-11-27 22:59:43.616082',3),(15,'2020-12-04 17:12:42.288359','2020-12-04 17:41:14.748523',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_report`
--

LOCK TABLES `main_report` WRITE;
/*!40000 ALTER TABLE `main_report` DISABLE KEYS */;
INSERT INTO `main_report` VALUES (68,'2020-12-04 18:42:16.145251','2020-12-04 18:42:16.156223','Reporte #1','MF235',15),(69,'2020-12-04 18:42:26.764819','2020-12-04 18:42:26.767780','Reporte #2','MF32',15),(70,'2020-12-04 18:42:36.029952','2020-12-04 18:42:36.033938','Reporte #3\r\n','MF932',15);
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
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_antecedentes_g_o`
--

LOCK TABLES `main_subform_antecedentes_g_o` WRITE;
/*!40000 ALTER TABLE `main_subform_antecedentes_g_o` DISABLE KEYS */;
INSERT INTO `main_subform_antecedentes_g_o` VALUES (109,'2020-12-04 17:10:46.656163','2020-12-04 17:10:46.680708',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF34'),(110,'2020-12-04 17:10:51.836092','2020-12-04 17:10:51.859732',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF60'),(111,'2020-12-04 17:11:00.199583','2020-12-04 17:11:00.229076',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF32'),(112,'2020-12-04 17:11:03.481428','2020-12-04 17:11:03.508967',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF40'),(113,'2020-12-04 17:11:08.265376','2020-12-04 17:11:08.287982',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF803'),(114,'2020-12-04 17:14:31.608590','2020-12-04 17:15:00.072616',0,20,NULL,0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'0',NULL,0,NULL,NULL,'prueb1'),(115,'2020-12-04 17:15:37.951197','2020-12-04 17:26:42.266623',0,20,NULL,0,NULL,20,NULL,NULL,1,'dos meses','ayer',NULL,'0',NULL,0,NULL,NULL,'MF932'),(116,'2020-12-04 17:15:52.469895','2020-12-04 17:17:11.616914',0,20,NULL,0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'0',NULL,0,NULL,NULL,'MF935'),(117,'2020-12-04 17:16:08.943933','2020-12-04 17:17:01.093415',0,20,NULL,0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'0',NULL,0,NULL,NULL,'MF235');
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
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_familiar`
--

LOCK TABLES `main_subform_historia_familiar` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_familiar` DISABLE KEYS */;
INSERT INTO `main_subform_historia_familiar` VALUES (109,'2020-12-04 17:10:46.659155','2020-12-04 17:10:46.684113',NULL,NULL,NULL,NULL,NULL,NULL,'MF34'),(110,'2020-12-04 17:10:51.840099','2020-12-04 17:10:51.862822',NULL,NULL,NULL,NULL,NULL,NULL,'MF60'),(111,'2020-12-04 17:11:00.204558','2020-12-04 17:11:00.233063',NULL,NULL,NULL,NULL,NULL,NULL,'MF32'),(112,'2020-12-04 17:11:03.485917','2020-12-04 17:11:03.512509',NULL,NULL,NULL,NULL,NULL,NULL,'MF40'),(113,'2020-12-04 17:11:08.269089','2020-12-04 17:11:08.291085',NULL,NULL,NULL,NULL,NULL,NULL,'MF803'),(114,'2020-12-04 17:14:31.613609','2020-12-04 17:15:00.078566',1,NULL,0,0,NULL,NULL,'prueb1'),(115,'2020-12-04 17:15:37.955186','2020-12-04 17:15:37.998075',1,NULL,0,0,NULL,NULL,'MF932'),(116,'2020-12-04 17:15:52.473881','2020-12-04 17:26:16.695533',1,NULL,1,1,'colon','padre','MF935'),(117,'2020-12-04 17:16:08.946925','2020-12-04 18:00:00.739673',1,NULL,1,0,NULL,NULL,'MF235');
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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_familiar_parentesco`
--

LOCK TABLES `main_subform_historia_familiar_parentesco` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_familiar_parentesco` DISABLE KEYS */;
INSERT INTO `main_subform_historia_familiar_parentesco` VALUES (83,114,1),(84,115,1),(87,116,3),(88,116,4),(89,117,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_familiar_prueba_genetica_resultado`
--

LOCK TABLES `main_subform_historia_familiar_prueba_genetica_resultado` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_familiar_prueba_genetica_resultado` DISABLE KEYS */;
INSERT INTO `main_subform_historia_familiar_prueba_genetica_resultado` VALUES (123,114,2),(124,114,4),(125,115,2),(126,115,4),(131,116,2),(132,116,3),(133,116,4),(134,116,5),(135,117,2),(136,117,4);
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
  `imc` double DEFAULT NULL,
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
  CONSTRAINT `main_subform_historia_personal_chk_4` CHECK ((`fuma_edad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_personal`
--

LOCK TABLES `main_subform_historia_personal` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_personal` DISABLE KEYS */;
INSERT INTO `main_subform_historia_personal` VALUES (109,'2020-12-04 17:10:46.651176','2020-12-04 17:10:46.677085',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF34',1),(110,'2020-12-04 17:10:51.832101','2020-12-04 17:10:51.856080',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF60',1),(111,'2020-12-04 17:11:00.192691','2020-12-04 17:11:00.224445',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF32',1),(112,'2020-12-04 17:11:03.477121','2020-12-04 17:11:03.505933',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF40',1),(113,'2020-12-04 17:11:08.261386','2020-12-04 17:11:08.284990',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF803',1),(114,'2020-12-04 17:14:31.603633','2020-12-04 17:15:00.065601','Nombre de prueba','cedula','2020-10-10','0',NULL,10,10,0.10000000149011612,0,NULL,0,NULL,0,NULL,NULL,0,NULL,0,0,'0',0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,2,'prueb1',1),(115,'2020-12-04 17:15:37.948205','2020-12-04 17:27:05.884976','Nombre de prueba','cedula','2020-10-10','0',NULL,30,11,0.10000000149011612,0,NULL,1,'2 semanas',0,'0',NULL,0,NULL,0,0,'0',0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,2,'MF932',1),(116,'2020-12-04 17:15:52.463912','2020-12-04 17:17:11.611927','Nombre de prueba','cedula','2020-10-10','0',NULL,10,10,0.10000000149011612,0,NULL,0,NULL,0,NULL,NULL,0,NULL,0,0,'0',0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,2,'MF935',1),(117,'2020-12-04 17:16:08.939943','2020-12-04 17:25:47.465617','Nombre de prueba','cedula','2020-10-10','0',NULL,10,10,0.10000000149011612,1,NULL,0,NULL,1,'0',NULL,0,NULL,0,0,'0',0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,2,'MF235',1);
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

-- Dump completed on 2020-12-04 13:20:17
