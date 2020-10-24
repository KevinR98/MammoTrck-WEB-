CREATE DATABASE  IF NOT EXISTS `mammotrck` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mammotrck`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: mammotrck
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (4,'admin'),(5,'asistente'),(6,'medico');
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
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (229,4,93),(230,4,94),(231,4,95),(232,4,96),(233,4,97),(234,4,98),(235,4,99),(236,4,100),(237,4,101),(238,4,102),(239,4,103),(240,4,104),(241,4,105),(242,4,106),(243,4,107),(244,4,108),(245,4,109),(246,4,110),(247,4,111),(248,4,112),(249,4,113),(250,4,114),(251,4,115),(252,4,116),(253,4,117),(254,4,118),(255,4,119),(256,4,120),(257,4,121),(258,4,122),(259,4,123),(260,4,124),(261,4,125),(262,4,126),(263,4,127),(192,4,128),(193,4,129),(194,4,130),(195,4,131),(196,4,132),(197,4,133),(198,4,134),(199,4,135),(200,4,136),(201,4,137),(202,4,138),(203,4,139),(204,4,140),(205,4,141),(206,4,142),(207,4,143),(208,4,144),(209,4,145),(210,4,146),(211,4,147),(212,4,148),(213,4,149),(214,4,150),(215,4,151),(216,4,152),(217,4,153),(218,4,154),(219,4,155),(220,4,156),(221,4,157),(222,4,158),(223,4,159),(224,4,160),(225,4,161),(226,4,162),(227,4,163),(228,4,164),(265,5,96),(267,5,100),(270,5,104),(272,5,108),(276,5,112),(279,5,116),(274,5,120),(277,5,124),(266,5,128),(268,5,132),(271,5,136),(273,5,140),(275,5,144),(278,5,148),(280,5,152),(281,5,156),(264,5,160),(269,5,164),(295,6,93),(296,6,94),(297,6,95),(298,6,96),(299,6,97),(300,6,98),(301,6,99),(302,6,100),(303,6,101),(304,6,102),(305,6,103),(306,6,104),(307,6,105),(308,6,106),(309,6,107),(310,6,108),(311,6,109),(312,6,110),(313,6,111),(314,6,112),(315,6,113),(316,6,114),(317,6,115),(318,6,116),(319,6,117),(320,6,118),(321,6,119),(322,6,120),(323,6,121),(324,6,122),(325,6,123),(326,6,124),(327,6,125),(328,6,126),(329,6,127),(282,6,128),(283,6,129),(284,6,130),(285,6,131),(286,6,132),(287,6,133),(288,6,134),(289,6,135),(290,6,136),(291,6,137),(292,6,138),(293,6,139),(294,6,140);
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
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (93,'Can add clinic',24,'add_clinic'),(94,'Can change clinic',24,'change_clinic'),(95,'Can delete clinic',24,'delete_clinic'),(96,'Can view clinic',24,'view_clinic'),(97,'Can add form',25,'add_form'),(98,'Can change form',25,'change_form'),(99,'Can delete form',25,'delete_form'),(100,'Can view form',25,'view_form'),(101,'Can add identidad_etnica',26,'add_identidad_etnica'),(102,'Can change identidad_etnica',26,'change_identidad_etnica'),(103,'Can delete identidad_etnica',26,'delete_identidad_etnica'),(104,'Can view identidad_etnica',26,'view_identidad_etnica'),(105,'Can add mamografia',27,'add_mamografia'),(106,'Can change mamografia',27,'change_mamografia'),(107,'Can delete mamografia',27,'delete_mamografia'),(108,'Can view mamografia',27,'view_mamografia'),(109,'Can add prueba_genetica',28,'add_prueba_genetica'),(110,'Can change prueba_genetica',28,'change_prueba_genetica'),(111,'Can delete prueba_genetica',28,'delete_prueba_genetica'),(112,'Can view prueba_genetica',28,'view_prueba_genetica'),(113,'Can add sub form_historia_personal',29,'add_subform_historia_personal'),(114,'Can change sub form_historia_personal',29,'change_subform_historia_personal'),(115,'Can delete sub form_historia_personal',29,'delete_subform_historia_personal'),(116,'Can view sub form_historia_personal',29,'view_subform_historia_personal'),(117,'Can add sub form_historia_familiar',30,'add_subform_historia_familiar'),(118,'Can change sub form_historia_familiar',30,'change_subform_historia_familiar'),(119,'Can delete sub form_historia_familiar',30,'delete_subform_historia_familiar'),(120,'Can view sub form_historia_familiar',30,'view_subform_historia_familiar'),(121,'Can add sub form_antecedentes_g_o',31,'add_subform_antecedentes_g_o'),(122,'Can change sub form_antecedentes_g_o',31,'change_subform_antecedentes_g_o'),(123,'Can delete sub form_antecedentes_g_o',31,'delete_subform_antecedentes_g_o'),(124,'Can view sub form_antecedentes_g_o',31,'view_subform_antecedentes_g_o'),(125,'Can add report',32,'add_report'),(126,'Can change report',32,'change_report'),(127,'Can delete report',32,'delete_report'),(128,'Can view report',32,'view_report'),(129,'Can add profile',33,'add_profile'),(130,'Can change profile',33,'change_profile'),(131,'Can delete profile',33,'delete_profile'),(132,'Can view profile',33,'view_profile'),(133,'Can add parentesco',34,'add_parentesco'),(134,'Can change parentesco',34,'change_parentesco'),(135,'Can delete parentesco',34,'delete_parentesco'),(136,'Can view parentesco',34,'view_parentesco'),(137,'Can add patient',35,'add_patient'),(138,'Can change patient',35,'change_patient'),(139,'Can delete patient',35,'delete_patient'),(140,'Can view patient',35,'view_patient'),(141,'Can add log entry',36,'add_logentry'),(142,'Can change log entry',36,'change_logentry'),(143,'Can delete log entry',36,'delete_logentry'),(144,'Can view log entry',36,'view_logentry'),(145,'Can add permission',37,'add_permission'),(146,'Can change permission',37,'change_permission'),(147,'Can delete permission',37,'delete_permission'),(148,'Can view permission',37,'view_permission'),(149,'Can add group',38,'add_group'),(150,'Can change group',38,'change_group'),(151,'Can delete group',38,'delete_group'),(152,'Can view group',38,'view_group'),(153,'Can add user',39,'add_user'),(154,'Can change user',39,'change_user'),(155,'Can delete user',39,'delete_user'),(156,'Can view user',39,'view_user'),(157,'Can add content type',40,'add_contenttype'),(158,'Can change content type',40,'change_contenttype'),(159,'Can delete content type',40,'delete_contenttype'),(160,'Can view content type',40,'view_contenttype'),(161,'Can add session',41,'add_session'),(162,'Can change session',41,'change_session'),(163,'Can delete session',41,'delete_session'),(164,'Can view session',41,'view_session');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (26,'pbkdf2_sha256$216000$XVs1sRU7MrI5$vTxLHWdm3nPoVu0qCJvrWJ5RHibFgszdGEFpAY7UiGE=','2020-10-24 04:10:29.098103',1,'a@gmail.com','juan','','a@gmail.com',1,1,'2020-10-24 04:07:41.995266'),(27,'pbkdf2_sha256$216000$aHinxJv9bigz$5uyfxAvuWHneiCZxpuu3BGfq8IHGuNKsQCmNjHIfiWM=','2020-10-24 04:16:53.331620',0,'b@gmail.com','','','b@gmail.com',0,1,'2020-10-24 04:16:52.306772'),(28,'pbkdf2_sha256$216000$5DuqkrzaSylx$s4OXJlYPHdQ7mgOYF5nlaVAHD2n7MbuBUgWTdycs5qw=','2020-10-24 04:18:03.341368',1,'c@gmail.com','','','c@gmail.com',1,1,'2020-10-24 04:17:30.974368');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,26,4),(10,27,6),(11,28,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (48,'2020-10-24 04:11:26.753890','4','admin',1,'[{\"added\": {}}]',38,26),(49,'2020-10-24 04:11:44.499420','5','asistente',1,'[{\"added\": {}}]',38,26),(50,'2020-10-24 04:14:51.425851','6','medico',1,'[{\"added\": {}}]',38,26);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (36,'admin','logentry'),(38,'auth','group'),(37,'auth','permission'),(39,'auth','user'),(40,'contenttypes','contenttype'),(24,'main','clinic'),(25,'main','form'),(26,'main','identidad_etnica'),(27,'main','mamografia'),(34,'main','parentesco'),(35,'main','patient'),(33,'main','profile'),(28,'main','prueba_genetica'),(32,'main','report'),(31,'main','subform_antecedentes_g_o'),(30,'main','subform_historia_familiar'),(29,'main','subform_historia_personal'),(41,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (57,'contenttypes','0001_initial','2020-10-24 04:00:05.129502'),(58,'auth','0001_initial','2020-10-24 04:00:05.155774'),(59,'admin','0001_initial','2020-10-24 04:00:05.170706'),(60,'admin','0002_logentry_remove_auto_add','2020-10-24 04:00:05.186800'),(61,'admin','0003_logentry_add_action_flag_choices','2020-10-24 04:00:05.200766'),(62,'contenttypes','0002_remove_content_type_name','2020-10-24 04:00:27.395499'),(63,'auth','0002_alter_permission_name_max_length','2020-10-24 04:00:27.408974'),(64,'auth','0003_alter_user_email_max_length','2020-10-24 04:00:27.413959'),(65,'auth','0004_alter_user_username_opts','2020-10-24 04:00:27.419943'),(66,'auth','0005_alter_user_last_login_null','2020-10-24 04:00:27.426925'),(67,'auth','0006_require_contenttypes_0002','2020-10-24 04:00:27.431911'),(68,'auth','0007_alter_validators_add_error_messages','2020-10-24 04:00:27.436898'),(69,'auth','0008_alter_user_username_max_length','2020-10-24 04:00:27.442882'),(70,'auth','0009_alter_user_last_name_max_length','2020-10-24 04:00:27.448869'),(71,'auth','0010_alter_group_name_max_length','2020-10-24 04:00:27.453853'),(72,'auth','0011_update_proxy_permissions','2020-10-24 04:00:27.460834'),(73,'auth','0012_alter_user_first_name_max_length','2020-10-24 04:00:27.467821'),(74,'main','0001_initial','2020-10-24 04:00:27.473802'),(75,'main','0002_auto_20201016_1630','2020-10-24 04:00:27.479784'),(76,'main','0003_auto_20201016_1645','2020-10-24 04:00:27.485769'),(77,'main','0004_auto_20201016_1725','2020-10-24 04:00:27.490754'),(78,'main','0005_delete_densidad_mamografica','2020-10-24 04:00:27.497736'),(79,'main','0006_auto_20201020_2342','2020-10-24 04:00:27.504717'),(80,'main','0007_auto_20201020_2351','2020-10-24 04:00:27.510700'),(81,'main','0008_remove_profile_clinic','2020-10-24 04:00:27.514691'),(82,'main','0009_auto_20201021_1325','2020-10-24 04:00:27.520675'),(83,'main','0010_profile_clinic','2020-10-24 04:00:27.525661'),(84,'main','0011_auto_20201021_1426','2020-10-24 04:00:27.531644'),(85,'main','0012_auto_20201021_1428','2020-10-24 04:00:27.537629'),(86,'main','0013_auto_20201021_1431','2020-10-24 04:00:27.542615'),(87,'main','0014_auto_20201021_1512','2020-10-24 04:00:27.548600'),(88,'main','0015_auto_20201021_1525','2020-10-24 04:00:27.554588'),(89,'main','0016_auto_20201021_1531','2020-10-24 04:00:27.560568'),(90,'main','0017_auto_20201021_1550','2020-10-24 04:00:27.567549'),(91,'main','0018_auto_20201021_2241','2020-10-24 04:00:27.573534'),(92,'main','0019_clinic_acronym','2020-10-24 04:00:27.578520'),(93,'main','0020_auto_20201021_2313','2020-10-24 04:00:27.584504'),(94,'main','0021_auto_20201021_2316','2020-10-24 04:00:27.591001'),(95,'main','0022_auto_20201021_2322','2020-10-24 04:00:27.596984'),(96,'main','0023_auto_20201021_2355','2020-10-24 04:00:27.601971'),(97,'main','0024_auto_20201022_0009','2020-10-24 04:00:27.607955'),(98,'main','0025_auto_20201022_0011','2020-10-24 04:00:27.613943'),(99,'main','0026_subform_historia_familiar_form_id','2020-10-24 04:00:27.619925'),(100,'main','0027_auto_20201022_0022','2020-10-24 04:00:27.625909'),(101,'main','0028_auto_20201022_1639','2020-10-24 04:00:27.630893'),(102,'main','0029_auto_20201022_1640','2020-10-24 04:00:27.636879'),(103,'main','0030_auto_20201022_2232','2020-10-24 04:00:27.642862'),(104,'main','0031_auto_20201023_0006','2020-10-24 04:00:27.647851'),(105,'main','0032_auto_20201023_1205','2020-10-24 04:00:27.654830'),(106,'main','0033_auto_20201023_1515','2020-10-24 04:00:27.660815'),(107,'main','0034_auto_20201023_1544','2020-10-24 04:00:27.665800'),(108,'main','0035_auto_20201023_1826','2020-10-24 04:00:27.673778'),(109,'main','0036_auto_20201023_1829','2020-10-24 04:00:27.678765'),(110,'main','0037_auto_20201023_1906','2020-10-24 04:00:27.684749'),(111,'main','0038_auto_20201023_2145','2020-10-24 04:00:27.692247'),(112,'sessions','0001_initial','2020-10-24 04:00:27.698229');
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
INSERT INTO `django_session` VALUES ('6j7fyutkscvw4wq2pfxkt0anige32e2j','.eJxVjEsOAiEQBe_C2hB-Irh07xlId0PLqIFkmFkZ766TzEK3r6reSyRYl5rWUeY0ZXEWJojD74hAj9I2ku_Qbl1Sb8s8odwUudMhrz2X52V3_w4qjPqtS1SZrCNG5YG1Yo9ekSn2aIzOhjkAagTHKp60L9qDjj6DIwyBbXDi_QElXDiI:1kWB0F:xJKiBxhrFlVeN_AnBXOGDcOmMe9vA3My9X85r7HaKmY','2020-11-07 04:18:03.352338');
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
INSERT INTO `main_clinic` VALUES (1,'Marcial Fallas','MF'),(2,'San Juan de Dios','SJD'),(3,'Calderón Guardia','CG');
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
  `id_patient_id` varchar(15) DEFAULT NULL,
  `subform_ant_g_o_id` int DEFAULT NULL,
  `subform_hist_fam_id` int DEFAULT NULL,
  `subform_hist_per_id` int DEFAULT NULL,
  PRIMARY KEY (`id_form`),
  UNIQUE KEY `subform_ant_g_o_id` (`subform_ant_g_o_id`),
  UNIQUE KEY `subform_hist_fam_id` (`subform_hist_fam_id`),
  UNIQUE KEY `subform_hist_per_id` (`subform_hist_per_id`),
  KEY `main_form_id_patient_id_eb0909cc_fk_main_patient_id_patient` (`id_patient_id`),
  CONSTRAINT `main_form_id_patient_id_eb0909cc_fk_main_patient_id_patient` FOREIGN KEY (`id_patient_id`) REFERENCES `main_patient` (`id_patient`),
  CONSTRAINT `main_form_subform_ant_g_o_id_2ce2be38_fk_main_subf` FOREIGN KEY (`subform_ant_g_o_id`) REFERENCES `main_subform_antecedentes_g_o` (`id`),
  CONSTRAINT `main_form_subform_hist_fam_id_1c078822_fk_main_subf` FOREIGN KEY (`subform_hist_fam_id`) REFERENCES `main_subform_historia_familiar` (`id`),
  CONSTRAINT `main_form_subform_hist_per_id_1b672055_fk_main_subf` FOREIGN KEY (`subform_hist_per_id`) REFERENCES `main_subform_historia_personal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_form`
--

LOCK TABLES `main_form` WRITE;
/*!40000 ALTER TABLE `main_form` DISABLE KEYS */;
INSERT INTO `main_form` VALUES ('2020-10-24 04:22:30.911648','2020-10-24 04:22:30.925610','CG241',NULL,1,NULL,'2',67,67,69),('2020-10-24 04:22:32.139013','2020-10-24 04:22:32.149918','CG844',NULL,1,NULL,'2',69,69,71);
/*!40000 ALTER TABLE `main_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_form_urls_imgs`
--

DROP TABLE IF EXISTS `main_form_urls_imgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_form_urls_imgs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `form_id` varchar(15) NOT NULL,
  `mamografia_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_form_urls_imgs_form_id_mamografia_id_2f82c145_uniq` (`form_id`,`mamografia_id`),
  KEY `main_form_urls_imgs_mamografia_id_80c3bbbf_fk_main_mamografia_id` (`mamografia_id`),
  CONSTRAINT `main_form_urls_imgs_form_id_76385bf4_fk_main_form_id_form` FOREIGN KEY (`form_id`) REFERENCES `main_form` (`id_form`),
  CONSTRAINT `main_form_urls_imgs_mamografia_id_80c3bbbf_fk_main_mamografia_id` FOREIGN KEY (`mamografia_id`) REFERENCES `main_mamografia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_form_urls_imgs`
--

LOCK TABLES `main_form_urls_imgs` WRITE;
/*!40000 ALTER TABLE `main_form_urls_imgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_form_urls_imgs` ENABLE KEYS */;
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
INSERT INTO `main_identidad_etnica` VALUES (1,'indígena'),(2,'afrodescendiente'),(3,'origen asiático'),(4,'mulata'),(5,'mestiza'),(6,'blanca'),(7,'no sabe');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_mamografia`
--

LOCK TABLES `main_mamografia` WRITE;
/*!40000 ALTER TABLE `main_mamografia` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_parentesco`
--

LOCK TABLES `main_parentesco` WRITE;
/*!40000 ALTER TABLE `main_parentesco` DISABLE KEYS */;
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
INSERT INTO `main_patient` VALUES ('2020-10-23 00:00:00.000000','2020-10-23 00:00:00.000000','juana','1'),('2020-10-23 00:00:00.000000','2020-10-23 00:00:00.000000','sotana','2'),('2020-10-23 00:00:00.000000','2020-10-23 00:00:00.000000','mengana','3');
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
  KEY `main_profile_clinic_id_5f662d76` (`clinic_id`),
  CONSTRAINT `main_profile_clinic_id_5f662d76_fk_main_clinic_id` FOREIGN KEY (`clinic_id`) REFERENCES `main_clinic` (`id`),
  CONSTRAINT `main_profile_user_id_b40d720a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_profile`
--

LOCK TABLES `main_profile` WRITE;
/*!40000 ALTER TABLE `main_profile` DISABLE KEYS */;
INSERT INTO `main_profile` VALUES (26,'2020-10-24 04:07:42.498125','2020-10-24 04:10:29.105108',2),(27,'2020-10-24 04:16:52.805486','2020-10-24 04:16:53.335605',1),(28,'2020-10-24 04:17:31.491528','2020-10-24 04:18:03.347352',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_prueba_genetica`
--

LOCK TABLES `main_prueba_genetica` WRITE;
/*!40000 ALTER TABLE `main_prueba_genetica` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `formulario_id` (`formulario_id`),
  CONSTRAINT `main_report_formulario_id_5d787778_fk_main_form_id_form` FOREIGN KEY (`formulario_id`) REFERENCES `main_form` (`id_form`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_report`
--

LOCK TABLES `main_report` WRITE;
/*!40000 ALTER TABLE `main_report` DISABLE KEYS */;
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
  `lactancia_tiempo` smallint unsigned DEFAULT NULL,
  `anticonceptivos_aplica` tinyint(1) DEFAULT NULL,
  `anticonceptivos_cuanto` varchar(40) DEFAULT NULL,
  `anticonceptivos_ult_vez` varchar(40) DEFAULT NULL,
  `terapia_hormonal_aplica` tinyint(1) DEFAULT NULL,
  `cuanto_tiempo_terapia` varchar(40) DEFAULT NULL,
  `biopsia_aplica` tinyint(1) DEFAULT NULL,
  `biopsia_cuantas` smallint unsigned DEFAULT NULL,
  `biopsia_resultado` varchar(40) DEFAULT NULL,
  `terapia` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_1` CHECK ((`edad_menstruacion` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_2` CHECK ((`edad_manopausa` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_3` CHECK ((`parto_cantidad` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_4` CHECK ((`edad_ult_hijo` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_5` CHECK ((`lactancia_tiempo` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_7` CHECK ((`biopsia_cuantas` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_antecedentes_g_o`
--

LOCK TABLES `main_subform_antecedentes_g_o` WRITE;
/*!40000 ALTER TABLE `main_subform_antecedentes_g_o` DISABLE KEYS */;
INSERT INTO `main_subform_antecedentes_g_o` VALUES (66,'2020-10-24 04:22:30.899680','2020-10-24 04:22:30.899680',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,'2020-10-24 04:22:30.918631','2020-10-24 04:22:30.918631',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,'2020-10-24 04:22:32.131049','2020-10-24 04:22:32.131049',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,'2020-10-24 04:22:32.144996','2020-10-24 04:22:32.144996',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `familiares_cancer_parentesco` varchar(40) DEFAULT NULL,
  `familiares_cancer_tipo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_familiar`
--

LOCK TABLES `main_subform_historia_familiar` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_familiar` DISABLE KEYS */;
INSERT INTO `main_subform_historia_familiar` VALUES (66,'2020-10-24 04:22:30.907659','2020-10-24 04:22:30.907659',NULL,NULL,NULL,NULL,NULL,NULL),(67,'2020-10-24 04:22:30.922617','2020-10-24 04:22:30.922617',NULL,NULL,NULL,NULL,NULL,NULL),(68,'2020-10-24 04:22:32.135054','2020-10-24 04:22:32.135054',NULL,NULL,NULL,NULL,NULL,NULL),(69,'2020-10-24 04:22:32.147986','2020-10-24 04:22:32.147986',NULL,NULL,NULL,NULL,NULL,NULL);
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
  UNIQUE KEY `main_subform_historia_fa_subform_historia_familia_0a0ee1fb_uniq` (`subform_historia_familiar_id`,`parentesco_id`),
  KEY `main_subform_histori_parentesco_id_a61df8b8_fk_main_pare` (`parentesco_id`),
  CONSTRAINT `main_subform_histori_parentesco_id_a61df8b8_fk_main_pare` FOREIGN KEY (`parentesco_id`) REFERENCES `main_parentesco` (`id`),
  CONSTRAINT `main_subform_histori_subform_historia_fam_779fd55e_fk_main_subf` FOREIGN KEY (`subform_historia_familiar_id`) REFERENCES `main_subform_historia_familiar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_familiar_parentesco`
--

LOCK TABLES `main_subform_historia_familiar_parentesco` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_familiar_parentesco` DISABLE KEYS */;
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
  UNIQUE KEY `main_subform_historia_fa_subform_historia_familia_9e79ae29_uniq` (`subform_historia_familiar_id`,`prueba_genetica_id`),
  KEY `main_subform_histori_prueba_genetica_id_ae611099_fk_main_prue` (`prueba_genetica_id`),
  CONSTRAINT `main_subform_histori_prueba_genetica_id_ae611099_fk_main_prue` FOREIGN KEY (`prueba_genetica_id`) REFERENCES `main_prueba_genetica` (`id`),
  CONSTRAINT `main_subform_histori_subform_historia_fam_140f5741_fk_main_subf` FOREIGN KEY (`subform_historia_familiar_id`) REFERENCES `main_subform_historia_familiar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_familiar_prueba_genetica_resultado`
--

LOCK TABLES `main_subform_historia_familiar_prueba_genetica_resultado` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_familiar_prueba_genetica_resultado` DISABLE KEYS */;
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
  `bebidas_cuanto_otro` varchar(40) DEFAULT NULL,
  `actividad_fisica` tinyint(1) DEFAULT NULL,
  `actividad_fisica_cuanto` varchar(40) DEFAULT NULL,
  `consume_alimentos_con_grasa` tinyint(1) DEFAULT NULL,
  `consume_veg_frut_gram` tinyint(1) DEFAULT NULL,
  `diabetes` varchar(40) DEFAULT NULL,
  `radiacion` tinyint(1) DEFAULT NULL,
  `bebidas_cuanto` varchar(40) DEFAULT NULL,
  `identidad_etnica_id` int DEFAULT NULL,
  `clinic_id` int DEFAULT NULL,
  `cuanto_anastrozol` varchar(40) DEFAULT NULL,
  `cuanto_aspirina` varchar(40) DEFAULT NULL,
  `cuanto_bifosfonatos` varchar(40) DEFAULT NULL,
  `cuanto_metformina` varchar(40) DEFAULT NULL,
  `cuanto_tamoxifeno` varchar(40) DEFAULT NULL,
  `toma_medicamento_anastrozol` tinyint(1) DEFAULT NULL,
  `toma_medicamento_aspirina` tinyint(1) DEFAULT NULL,
  `toma_medicamento_bifosfonatos` tinyint(1) DEFAULT NULL,
  `toma_medicamento_metformina` tinyint(1) DEFAULT NULL,
  `toma_medicamento_tamoxifeno` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `main_subform_historia_personal_identidad_etnica_id_16d84215` (`identidad_etnica_id`),
  KEY `main_subform_histori_clinic_id_874d7d3b_fk_main_clin` (`clinic_id`),
  CONSTRAINT `main_subform_histori_clinic_id_874d7d3b_fk_main_clin` FOREIGN KEY (`clinic_id`) REFERENCES `main_clinic` (`id`),
  CONSTRAINT `main_subform_histori_identidad_etnica_id_16d84215_fk_main_iden` FOREIGN KEY (`identidad_etnica_id`) REFERENCES `main_identidad_etnica` (`id`),
  CONSTRAINT `main_subform_historia_personal_chk_1` CHECK ((`peso` >= 0)),
  CONSTRAINT `main_subform_historia_personal_chk_2` CHECK ((`talla` >= 0)),
  CONSTRAINT `main_subform_historia_personal_chk_3` CHECK ((`imc` >= 0)),
  CONSTRAINT `main_subform_historia_personal_chk_4` CHECK ((`fuma_edad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_personal`
--

LOCK TABLES `main_subform_historia_personal` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_personal` DISABLE KEYS */;
INSERT INTO `main_subform_historia_personal` VALUES (68,'2020-10-24 04:22:30.895695','2020-10-24 04:22:30.895695',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,'2020-10-24 04:22:30.915638','2020-10-24 04:22:30.915638',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,'2020-10-24 04:22:32.127074','2020-10-24 04:22:32.127074',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,'2020-10-24 04:22:32.142003','2020-10-24 04:22:32.142003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `main_subform_historia_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mammotrck'
--

--
-- Dumping routines for database 'mammotrck'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-23 22:23:42
