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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add densidad_mamografica',7,'add_densidad_mamografica'),(26,'Can change densidad_mamografica',7,'change_densidad_mamografica'),(27,'Can delete densidad_mamografica',7,'delete_densidad_mamografica'),(28,'Can view densidad_mamografica',7,'view_densidad_mamografica'),(29,'Can add prueba_genetica',8,'add_prueba_genetica'),(30,'Can change prueba_genetica',8,'change_prueba_genetica'),(31,'Can delete prueba_genetica',8,'delete_prueba_genetica'),(32,'Can view prueba_genetica',8,'view_prueba_genetica'),(33,'Can add profile',9,'add_profile'),(34,'Can change profile',9,'change_profile'),(35,'Can delete profile',9,'delete_profile'),(36,'Can view profile',9,'view_profile'),(37,'Can add clinic',10,'add_clinic'),(38,'Can change clinic',10,'change_clinic'),(39,'Can delete clinic',10,'delete_clinic'),(40,'Can view clinic',10,'view_clinic'),(41,'Can add sub form_historia_familiar',11,'add_subform_historia_familiar'),(42,'Can change sub form_historia_familiar',11,'change_subform_historia_familiar'),(43,'Can delete sub form_historia_familiar',11,'delete_subform_historia_familiar'),(44,'Can view sub form_historia_familiar',11,'view_subform_historia_familiar'),(45,'Can add report',12,'add_report'),(46,'Can change report',12,'change_report'),(47,'Can delete report',12,'delete_report'),(48,'Can view report',12,'view_report'),(49,'Can add form',13,'add_form'),(50,'Can change form',13,'change_form'),(51,'Can delete form',13,'delete_form'),(52,'Can view form',13,'view_form'),(53,'Can add sub form_historia_personal',14,'add_subform_historia_personal'),(54,'Can change sub form_historia_personal',14,'change_subform_historia_personal'),(55,'Can delete sub form_historia_personal',14,'delete_subform_historia_personal'),(56,'Can view sub form_historia_personal',14,'view_subform_historia_personal'),(57,'Can add terapia_hormonal',15,'add_terapia_hormonal'),(58,'Can change terapia_hormonal',15,'change_terapia_hormonal'),(59,'Can delete terapia_hormonal',15,'delete_terapia_hormonal'),(60,'Can view terapia_hormonal',15,'view_terapia_hormonal'),(61,'Can add pacient',16,'add_pacient'),(62,'Can change pacient',16,'change_pacient'),(63,'Can delete pacient',16,'delete_pacient'),(64,'Can view pacient',16,'view_pacient'),(65,'Can add parentezco',17,'add_parentezco'),(66,'Can change parentezco',17,'change_parentezco'),(67,'Can delete parentezco',17,'delete_parentezco'),(68,'Can view parentezco',17,'view_parentezco'),(69,'Can add medicamento',18,'add_medicamento'),(70,'Can change medicamento',18,'change_medicamento'),(71,'Can delete medicamento',18,'delete_medicamento'),(72,'Can view medicamento',18,'view_medicamento'),(73,'Can add sub form_antecedentes_g_o',19,'add_subform_antecedentes_g_o'),(74,'Can change sub form_antecedentes_g_o',19,'change_subform_antecedentes_g_o'),(75,'Can delete sub form_antecedentes_g_o',19,'delete_subform_antecedentes_g_o'),(76,'Can view sub form_antecedentes_g_o',19,'view_subform_antecedentes_g_o'),(77,'Can add medicamento_ subformulario',20,'add_medicamento_subformulario'),(78,'Can change medicamento_ subformulario',20,'change_medicamento_subformulario'),(79,'Can delete medicamento_ subformulario',20,'delete_medicamento_subformulario'),(80,'Can view medicamento_ subformulario',20,'view_medicamento_subformulario'),(81,'Can add mamografia',21,'add_mamografia'),(82,'Can change mamografia',21,'change_mamografia'),(83,'Can delete mamografia',21,'delete_mamografia'),(84,'Can view mamografia',21,'view_mamografia'),(85,'Can add identidad_etnica',22,'add_identidad_etnica'),(86,'Can change identidad_etnica',22,'change_identidad_etnica'),(87,'Can delete identidad_etnica',22,'delete_identidad_etnica'),(88,'Can view identidad_etnica',22,'view_identidad_etnica'),(89,'Can add tiempo_bebida',23,'add_tiempo_bebida'),(90,'Can change tiempo_bebida',23,'change_tiempo_bebida'),(91,'Can delete tiempo_bebida',23,'delete_tiempo_bebida'),(92,'Can view tiempo_bebida',23,'view_tiempo_bebida');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$ge6Tpq9VAee9$6WwyZ2fniKvkJibIsiKPKrwdzmuIhg4adiCm3O2qxJA=','2020-09-11 18:18:18.465164',1,'admin','','','diemurillo976@gmail.com',1,1,'2020-09-11 18:17:37.108044');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'main','clinic'),(7,'main','densidad_mamografica'),(13,'main','form'),(22,'main','identidad_etnica'),(21,'main','mamografia'),(18,'main','medicamento'),(20,'main','medicamento_subformulario'),(16,'main','pacient'),(17,'main','parentezco'),(9,'main','profile'),(8,'main','prueba_genetica'),(12,'main','report'),(19,'main','subform_antecedentes_g_o'),(11,'main','subform_historia_familiar'),(14,'main','subform_historia_personal'),(15,'main','terapia_hormonal'),(23,'main','tiempo_bebida'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-09-11 00:06:59.990812'),(2,'auth','0001_initial','2020-09-11 00:07:00.210229'),(3,'admin','0001_initial','2020-09-11 00:07:00.773784'),(4,'admin','0002_logentry_remove_auto_add','2020-09-11 00:07:00.902819'),(5,'admin','0003_logentry_add_action_flag_choices','2020-09-11 00:07:00.915027'),(6,'contenttypes','0002_remove_content_type_name','2020-09-11 00:07:01.112028'),(7,'auth','0002_alter_permission_name_max_length','2020-09-11 00:07:01.252217'),(8,'auth','0003_alter_user_email_max_length','2020-09-11 00:07:01.288472'),(9,'auth','0004_alter_user_username_opts','2020-09-11 00:07:01.300440'),(10,'auth','0005_alter_user_last_login_null','2020-09-11 00:07:01.364738'),(11,'auth','0006_require_contenttypes_0002','2020-09-11 00:07:01.369412'),(12,'auth','0007_alter_validators_add_error_messages','2020-09-11 00:07:01.382243'),(13,'auth','0008_alter_user_username_max_length','2020-09-11 00:07:01.466036'),(14,'auth','0009_alter_user_last_name_max_length','2020-09-11 00:07:01.543262'),(15,'auth','0010_alter_group_name_max_length','2020-09-11 00:07:01.574245'),(16,'auth','0011_update_proxy_permissions','2020-09-11 00:07:01.588205'),(17,'auth','0012_alter_user_first_name_max_length','2020-09-11 00:07:01.663380'),(18,'sessions','0001_initial','2020-09-11 00:07:01.695459'),(19,'main','0001_initial','2020-10-13 01:19:55.357170');
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
INSERT INTO `django_session` VALUES ('st0hve867vfx4aebtndk3j1x1an28ey1','.eJxVjEEOgjAURO_StWmgtKV16Z4zkP_7B0FNSSisjHcXEha6nHlv5q162tax3wqWfhJ1VbW6_HZM6Yl8AHlQvs86zXldJtaHok9adDcLXrfT_TsYqYz72gemWiq4Co0LgyB4wHpn91SbmJh8BTM4jhzgGU0kj2hsagWtjaQ-X-zyOEw:1kGnco:aqb4FedVU-DART8Xax8WpGdSrQCBhUElN4i1s0nvde8','2020-09-25 18:18:18.470667');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_clinic`
--

LOCK TABLES `main_clinic` WRITE;
/*!40000 ALTER TABLE `main_clinic` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_densidad_mamografica`
--

DROP TABLE IF EXISTS `main_densidad_mamografica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_densidad_mamografica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_densidad` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_densidad_mamografica`
--

LOCK TABLES `main_densidad_mamografica` WRITE;
/*!40000 ALTER TABLE `main_densidad_mamografica` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_densidad_mamografica` ENABLE KEYS */;
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
  `submitted_at` datetime(6) NOT NULL,
  `habilitado` tinyint(1) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  `SubForm_antecedentes_g_o_id` int NOT NULL,
  `SubForm_historia_familiar_id` int NOT NULL,
  `SubForm_historia_personal_id` int NOT NULL,
  PRIMARY KEY (`id_form`),
  UNIQUE KEY `SubForm_antecedentes_g_o_id` (`SubForm_antecedentes_g_o_id`),
  UNIQUE KEY `SubForm_historia_familiar_id` (`SubForm_historia_familiar_id`),
  UNIQUE KEY `SubForm_historia_personal_id` (`SubForm_historia_personal_id`),
  CONSTRAINT `main_form_SubForm_antecedentes_715cdbc7_fk_main_subf` FOREIGN KEY (`SubForm_antecedentes_g_o_id`) REFERENCES `main_subform_antecedentes_g_o` (`id`),
  CONSTRAINT `main_form_SubForm_historia_fam_52a56d2a_fk_main_subf` FOREIGN KEY (`SubForm_historia_familiar_id`) REFERENCES `main_subform_historia_familiar` (`id`),
  CONSTRAINT `main_form_SubForm_historia_per_7daf28fc_fk_main_subf` FOREIGN KEY (`SubForm_historia_personal_id`) REFERENCES `main_subform_historia_personal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_form`
--

LOCK TABLES `main_form` WRITE;
/*!40000 ALTER TABLE `main_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_form_id_pacient`
--

DROP TABLE IF EXISTS `main_form_id_pacient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_form_id_pacient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `form_id` varchar(15) NOT NULL,
  `pacient_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_form_id_pacient_form_id_pacient_id_7cc1825a_uniq` (`form_id`,`pacient_id`),
  KEY `main_form_id_pacient_pacient_id_f5dabc9a_fk_main_paci` (`pacient_id`),
  CONSTRAINT `main_form_id_pacient_form_id_32fd9984_fk_main_form_id_form` FOREIGN KEY (`form_id`) REFERENCES `main_form` (`id_form`),
  CONSTRAINT `main_form_id_pacient_pacient_id_f5dabc9a_fk_main_paci` FOREIGN KEY (`pacient_id`) REFERENCES `main_pacient` (`id_pacient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_form_id_pacient`
--

LOCK TABLES `main_form_id_pacient` WRITE;
/*!40000 ALTER TABLE `main_form_id_pacient` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_form_id_pacient` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_identidad_etnica`
--

LOCK TABLES `main_identidad_etnica` WRITE;
/*!40000 ALTER TABLE `main_identidad_etnica` DISABLE KEYS */;
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
-- Table structure for table `main_medicamento`
--

DROP TABLE IF EXISTS `main_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_medicamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medicamento` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_medicamento`
--

LOCK TABLES `main_medicamento` WRITE;
/*!40000 ALTER TABLE `main_medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_medicamento_subformulario`
--

DROP TABLE IF EXISTS `main_medicamento_subformulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_medicamento_subformulario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cuanto` varchar(40) DEFAULT NULL,
  `id_medicamento_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_medicamento_id` (`id_medicamento_id`),
  CONSTRAINT `main_medicamento_sub_id_medicamento_id_d7a94cee_fk_main_medi` FOREIGN KEY (`id_medicamento_id`) REFERENCES `main_medicamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_medicamento_subformulario`
--

LOCK TABLES `main_medicamento_subformulario` WRITE;
/*!40000 ALTER TABLE `main_medicamento_subformulario` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_medicamento_subformulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_pacient`
--

DROP TABLE IF EXISTS `main_pacient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_pacient` (
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `id_pacient` varchar(15) NOT NULL,
  PRIMARY KEY (`id_pacient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_pacient`
--

LOCK TABLES `main_pacient` WRITE;
/*!40000 ALTER TABLE `main_pacient` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_pacient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_parentezco`
--

DROP TABLE IF EXISTS `main_parentezco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_parentezco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_parentezco` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_parentezco`
--

LOCK TABLES `main_parentezco` WRITE;
/*!40000 ALTER TABLE `main_parentezco` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_parentezco` ENABLE KEYS */;
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
  `clinic_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `clinic_id` (`clinic_id`),
  CONSTRAINT `main_profile_clinic_id_5f662d76_fk_main_clinic_id` FOREIGN KEY (`clinic_id`) REFERENCES `main_clinic` (`id`),
  CONSTRAINT `main_profile_user_id_b40d720a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_profile`
--

LOCK TABLES `main_profile` WRITE;
/*!40000 ALTER TABLE `main_profile` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `densidad_mamografica_id` int NOT NULL,
  `formulario_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `densidad_mamografica_id` (`densidad_mamografica_id`),
  UNIQUE KEY `formulario_id` (`formulario_id`),
  CONSTRAINT `main_report_densidad_mamografica_d7707a8a_fk_main_tiem` FOREIGN KEY (`densidad_mamografica_id`) REFERENCES `main_tiempo_bebida` (`id`),
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
  `anticonceptivos_cuanto` smallint unsigned DEFAULT NULL,
  `anticonceptivos_ult_vez` date NOT NULL,
  `terapia_hormonal_aplica` tinyint(1) DEFAULT NULL,
  `terapia_hormonal_tiempo` varchar(40) DEFAULT NULL,
  `biopsia_aplica` tinyint(1) DEFAULT NULL,
  `biopsia_cuantas` smallint unsigned DEFAULT NULL,
  `biopsia_resultado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_1` CHECK ((`edad_menstruacion` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_2` CHECK ((`edad_manopausa` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_3` CHECK ((`parto_cantidad` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_4` CHECK ((`edad_ult_hijo` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_5` CHECK ((`lactancia_tiempo` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_6` CHECK ((`anticonceptivos_cuanto` >= 0)),
  CONSTRAINT `main_subform_antecedentes_g_o_chk_7` CHECK ((`biopsia_cuantas` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_antecedentes_g_o`
--

LOCK TABLES `main_subform_antecedentes_g_o` WRITE;
/*!40000 ALTER TABLE `main_subform_antecedentes_g_o` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_subform_antecedentes_g_o` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_subform_antecedentes_g_o_terapia_hormonal_tipo`
--

DROP TABLE IF EXISTS `main_subform_antecedentes_g_o_terapia_hormonal_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_subform_antecedentes_g_o_terapia_hormonal_tipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subform_antecedentes_g_o_id` int NOT NULL,
  `terapia_hormonal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_subform_antecedente_subform_antecedentes_g_o_09409818_uniq` (`subform_antecedentes_g_o_id`,`terapia_hormonal_id`),
  KEY `main_subform_anteced_terapia_hormonal_id_a31d9ad5_fk_main_tera` (`terapia_hormonal_id`),
  CONSTRAINT `main_subform_anteced_subform_antecedentes_40c7fd33_fk_main_subf` FOREIGN KEY (`subform_antecedentes_g_o_id`) REFERENCES `main_subform_antecedentes_g_o` (`id`),
  CONSTRAINT `main_subform_anteced_terapia_hormonal_id_a31d9ad5_fk_main_tera` FOREIGN KEY (`terapia_hormonal_id`) REFERENCES `main_terapia_hormonal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_antecedentes_g_o_terapia_hormonal_tipo`
--

LOCK TABLES `main_subform_antecedentes_g_o_terapia_hormonal_tipo` WRITE;
/*!40000 ALTER TABLE `main_subform_antecedentes_g_o_terapia_hormonal_tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_subform_antecedentes_g_o_terapia_hormonal_tipo` ENABLE KEYS */;
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
  `bebidas_cuanto_otro` varchar(40) DEFAULT NULL,
  `familiares_mama` tinyint(1) DEFAULT NULL,
  `familiares_cancer` tinyint(1) DEFAULT NULL,
  `familiares_cancer_tipo` varchar(40) DEFAULT NULL,
  `familiares_cancer_parentezco` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_familiar`
--

LOCK TABLES `main_subform_historia_familiar` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_familiar` DISABLE KEYS */;
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
  `parentezco_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_subform_historia_fa_subform_historia_familia_0a0ee1fb_uniq` (`subform_historia_familiar_id`,`parentezco_id`),
  KEY `main_subform_histori_parentezco_id_4fdbe63b_fk_main_pare` (`parentezco_id`),
  CONSTRAINT `main_subform_histori_parentezco_id_4fdbe63b_fk_main_pare` FOREIGN KEY (`parentezco_id`) REFERENCES `main_parentezco` (`id`),
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
  `tiempo_bebida_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_subform_historia_fa_subform_historia_familia_9e79ae29_uniq` (`subform_historia_familiar_id`,`tiempo_bebida_id`),
  KEY `main_subform_histori_tiempo_bebida_id_7728850b_fk_main_tiem` (`tiempo_bebida_id`),
  CONSTRAINT `main_subform_histori_subform_historia_fam_140f5741_fk_main_subf` FOREIGN KEY (`subform_historia_familiar_id`) REFERENCES `main_subform_historia_familiar` (`id`),
  CONSTRAINT `main_subform_histori_tiempo_bebida_id_7728850b_fk_main_tiem` FOREIGN KEY (`tiempo_bebida_id`) REFERENCES `main_tiempo_bebida` (`id`)
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
  `fecha_de_nacimiento` date NOT NULL,
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
  `diabetes` tinyint(1) DEFAULT NULL,
  `diabetes_tipo` smallint unsigned DEFAULT NULL,
  `radiacion` tinyint(1) DEFAULT NULL,
  `bebidas_cuanto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bebidas_cuanto_id` (`bebidas_cuanto_id`),
  CONSTRAINT `main_subform_histori_bebidas_cuanto_id_965abac8_fk_main_tiem` FOREIGN KEY (`bebidas_cuanto_id`) REFERENCES `main_tiempo_bebida` (`id`),
  CONSTRAINT `main_subform_historia_personal_chk_1` CHECK ((`peso` >= 0)),
  CONSTRAINT `main_subform_historia_personal_chk_2` CHECK ((`talla` >= 0)),
  CONSTRAINT `main_subform_historia_personal_chk_3` CHECK ((`imc` >= 0)),
  CONSTRAINT `main_subform_historia_personal_chk_4` CHECK ((`fuma_edad` >= 0)),
  CONSTRAINT `main_subform_historia_personal_chk_5` CHECK ((`diabetes_tipo` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_personal`
--

LOCK TABLES `main_subform_historia_personal` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_subform_historia_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_subform_historia_personal_identidad_etnica`
--

DROP TABLE IF EXISTS `main_subform_historia_personal_identidad_etnica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_subform_historia_personal_identidad_etnica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subform_historia_personal_id` int NOT NULL,
  `identidad_etnica_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_subform_historia_pe_subform_historia_persona_3445138f_uniq` (`subform_historia_personal_id`,`identidad_etnica_id`),
  KEY `main_subform_histori_identidad_etnica_id_ee4fe75b_fk_main_iden` (`identidad_etnica_id`),
  CONSTRAINT `main_subform_histori_identidad_etnica_id_ee4fe75b_fk_main_iden` FOREIGN KEY (`identidad_etnica_id`) REFERENCES `main_identidad_etnica` (`id`),
  CONSTRAINT `main_subform_histori_subform_historia_per_d6c8f29a_fk_main_subf` FOREIGN KEY (`subform_historia_personal_id`) REFERENCES `main_subform_historia_personal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_personal_identidad_etnica`
--

LOCK TABLES `main_subform_historia_personal_identidad_etnica` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_personal_identidad_etnica` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_subform_historia_personal_identidad_etnica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_subform_historia_personal_medicamento`
--

DROP TABLE IF EXISTS `main_subform_historia_personal_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_subform_historia_personal_medicamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subform_historia_personal_id` int NOT NULL,
  `medicamento_subformulario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_subform_historia_pe_subform_historia_persona_3f537adc_uniq` (`subform_historia_personal_id`,`medicamento_subformulario_id`),
  KEY `main_subform_histori_medicamento_subformu_3d89874e_fk_main_medi` (`medicamento_subformulario_id`),
  CONSTRAINT `main_subform_histori_medicamento_subformu_3d89874e_fk_main_medi` FOREIGN KEY (`medicamento_subformulario_id`) REFERENCES `main_medicamento_subformulario` (`id`),
  CONSTRAINT `main_subform_histori_subform_historia_per_d54e3179_fk_main_subf` FOREIGN KEY (`subform_historia_personal_id`) REFERENCES `main_subform_historia_personal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_personal_medicamento`
--

LOCK TABLES `main_subform_historia_personal_medicamento` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_personal_medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_subform_historia_personal_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_terapia_hormonal`
--

DROP TABLE IF EXISTS `main_terapia_hormonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_terapia_hormonal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_terapia` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_terapia_hormonal`
--

LOCK TABLES `main_terapia_hormonal` WRITE;
/*!40000 ALTER TABLE `main_terapia_hormonal` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_terapia_hormonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_tiempo_bebida`
--

DROP TABLE IF EXISTS `main_tiempo_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_tiempo_bebida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tiempo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_tiempo_bebida`
--

LOCK TABLES `main_tiempo_bebida` WRITE;
/*!40000 ALTER TABLE `main_tiempo_bebida` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_tiempo_bebida` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-12 19:35:13
