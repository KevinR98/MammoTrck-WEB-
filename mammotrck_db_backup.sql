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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$216000$hcphrF6QPNuc$fByf/WAsavhTgkvpUVECB9GUKVwZfGX/zUZpJhISMJ0=','2020-10-26 15:26:09.144954',1,'a@gmail.com','','','a@gmail.com',1,1,'2020-10-26 15:24:21.169984'),(3,'pbkdf2_sha256$216000$z7r97hP5FPN2$DJZrI7VkA/BV+gGMo5eputJb/qAYgViCPcXyqSrGFzI=','2020-10-26 15:28:29.132824',1,'b@gmail.com','','','b@gmail.com',1,1,'2020-10-26 15:28:28.136980');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-10-26 15:26:42.524272','1','admin',1,'[{\"added\": {}}]',15,2),(2,'2020-10-26 15:27:15.426769','2','medico',1,'[{\"added\": {}}]',15,2),(3,'2020-10-26 15:28:02.049102','3','asistente',1,'[{\"added\": {}}]',15,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-10-26 15:12:41.089085'),(2,'auth','0001_initial','2020-10-26 15:12:41.304907'),(3,'admin','0001_initial','2020-10-26 15:12:41.890864'),(4,'admin','0002_logentry_remove_auto_add','2020-10-26 15:12:42.069233'),(5,'admin','0003_logentry_add_action_flag_choices','2020-10-26 15:12:42.075771'),(6,'contenttypes','0002_remove_content_type_name','2020-10-26 15:12:42.222905'),(7,'auth','0002_alter_permission_name_max_length','2020-10-26 15:12:42.291878'),(8,'auth','0003_alter_user_email_max_length','2020-10-26 15:12:42.338762'),(9,'auth','0004_alter_user_username_opts','2020-10-26 15:12:42.338762'),(10,'auth','0005_alter_user_last_login_null','2020-10-26 15:12:42.423388'),(11,'auth','0006_require_contenttypes_0002','2020-10-26 15:12:42.423388'),(12,'auth','0007_alter_validators_add_error_messages','2020-10-26 15:12:42.439031'),(13,'auth','0008_alter_user_username_max_length','2020-10-26 15:12:42.592691'),(14,'auth','0009_alter_user_last_name_max_length','2020-10-26 15:12:42.677304'),(15,'auth','0010_alter_group_name_max_length','2020-10-26 15:12:42.708552'),(16,'auth','0011_update_proxy_permissions','2020-10-26 15:12:42.724173'),(17,'auth','0012_alter_user_first_name_max_length','2020-10-26 15:12:42.793202'),(18,'main','0001_initial','2020-10-26 15:12:43.526246'),(19,'main','0002_auto_20201025_2324','2020-10-26 15:12:45.230383'),(20,'main','0003_auto_20201025_2346','2020-10-26 15:12:45.399618'),(21,'main','0004_auto_20201025_2351','2020-10-26 15:12:45.562342'),(22,'main','0005_auto_20201026_0004','2020-10-26 15:12:45.963300'),(23,'sessions','0001_initial','2020-10-26 15:12:46.016676');
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
INSERT INTO `django_session` VALUES ('3wgc9sxceqk9wqcjyxfm0lmo1ssrnqob','.eJxVjEEOwiAQRe_C2hCmSAGX7nsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwk7gILU6_W8T04LoDumO9NZlaXZc5yl2RB-1yasTP6-H-HRTs5Vsrk70D52AAUoZt8qPRNnOM3iflCXgkYiITtUJH-UweALVNKcKQM4n3B-AROJ4:1kX4Q9:4ObC45U8334TPoHjI9buNkfv-fV57zdYWL6VSQqoC_w','2020-11-09 15:28:29.148688');
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
INSERT INTO `main_form` VALUES ('2020-10-26 15:30:19.322937','2020-10-26 15:30:19.356332','MF509',NULL,1,NULL,'2'),('2020-10-26 15:30:20.331564','2020-10-26 15:30:20.368935','MF891',NULL,1,NULL,'2');
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
INSERT INTO `main_patient` VALUES ('2020-10-26 00:00:00.000000','2020-10-26 00:00:00.000000','juana','1'),('2020-10-26 00:00:00.000000','2020-10-26 00:00:00.000000','sotana','2'),('2020-10-26 00:00:00.000000','2020-10-26 00:00:00.000000','fulana','3');
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
INSERT INTO `main_profile` VALUES (2,'2020-10-26 15:24:21.664315','2020-10-26 15:26:09.149972',2),(3,'2020-10-26 15:28:28.619601','2020-10-26 15:28:29.138320',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_antecedentes_g_o`
--

LOCK TABLES `main_subform_antecedentes_g_o` WRITE;
/*!40000 ALTER TABLE `main_subform_antecedentes_g_o` DISABLE KEYS */;
INSERT INTO `main_subform_antecedentes_g_o` VALUES (1,'2020-10-26 15:30:19.335226','2020-10-26 15:30:19.365259',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF509'),(2,'2020-10-26 15:30:20.345996','2020-10-26 15:30:20.377912',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MF891');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_familiar`
--

LOCK TABLES `main_subform_historia_familiar` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_familiar` DISABLE KEYS */;
INSERT INTO `main_subform_historia_familiar` VALUES (1,'2020-10-26 15:30:19.339692','2020-10-26 15:30:19.369519',NULL,NULL,NULL,NULL,NULL,NULL,'MF509'),(2,'2020-10-26 15:30:20.350985','2020-10-26 15:30:20.381902',NULL,NULL,NULL,NULL,NULL,NULL,'MF891');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  UNIQUE KEY `main_subform_historia_fa_subform_historia_familia_bccc2968_uniq` (`subform_historia_familiar_id`,`prueba_genetica_id`),
  KEY `main_subform_histori_prueba_genetica_id_ae611099_fk_main_prue` (`prueba_genetica_id`),
  CONSTRAINT `main_subform_histori_prueba_genetica_id_ae611099_fk_main_prue` FOREIGN KEY (`prueba_genetica_id`) REFERENCES `main_prueba_genetica` (`id`),
  CONSTRAINT `main_subform_histori_subform_historia_fam_140f5741_fk_main_subf` FOREIGN KEY (`subform_historia_familiar_id`) REFERENCES `main_subform_historia_familiar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_personal`
--

LOCK TABLES `main_subform_historia_personal` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_personal` DISABLE KEYS */;
INSERT INTO `main_subform_historia_personal` VALUES (1,'2020-10-26 15:30:19.327929','2020-10-26 15:35:26.373745',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF509',1),(2,'2020-10-26 15:30:20.342006','2020-10-26 15:30:20.373926',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'MF891',1);
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

-- Dump completed on 2020-10-26  9:36:39
