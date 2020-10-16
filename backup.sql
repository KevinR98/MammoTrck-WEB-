CREATE DATABASE  IF NOT EXISTS `mammotrck` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mammotrck`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: mammotrck
-- ------------------------------------------------------
-- Server version	8.0.21

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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add clinic',1,'add_clinic'),(2,'Can change clinic',1,'change_clinic'),(3,'Can delete clinic',1,'delete_clinic'),(4,'Can view clinic',1,'view_clinic'),(5,'Can add densidad_mamografica',2,'add_densidad_mamografica'),(6,'Can change densidad_mamografica',2,'change_densidad_mamografica'),(7,'Can delete densidad_mamografica',2,'delete_densidad_mamografica'),(8,'Can view densidad_mamografica',2,'view_densidad_mamografica'),(9,'Can add form',3,'add_form'),(10,'Can change form',3,'change_form'),(11,'Can delete form',3,'delete_form'),(12,'Can view form',3,'view_form'),(13,'Can add identidad_etnica',4,'add_identidad_etnica'),(14,'Can change identidad_etnica',4,'change_identidad_etnica'),(15,'Can delete identidad_etnica',4,'delete_identidad_etnica'),(16,'Can view identidad_etnica',4,'view_identidad_etnica'),(17,'Can add mamografia',5,'add_mamografia'),(18,'Can change mamografia',5,'change_mamografia'),(19,'Can delete mamografia',5,'delete_mamografia'),(20,'Can view mamografia',5,'view_mamografia'),(21,'Can add medicamento',6,'add_medicamento'),(22,'Can change medicamento',6,'change_medicamento'),(23,'Can delete medicamento',6,'delete_medicamento'),(24,'Can view medicamento',6,'view_medicamento'),(25,'Can add medicamento_ subformulario',7,'add_medicamento_subformulario'),(26,'Can change medicamento_ subformulario',7,'change_medicamento_subformulario'),(27,'Can delete medicamento_ subformulario',7,'delete_medicamento_subformulario'),(28,'Can view medicamento_ subformulario',7,'view_medicamento_subformulario'),(29,'Can add pacient',8,'add_pacient'),(30,'Can change pacient',8,'change_pacient'),(31,'Can delete pacient',8,'delete_pacient'),(32,'Can view pacient',8,'view_pacient'),(33,'Can add parentezco',9,'add_parentezco'),(34,'Can change parentezco',9,'change_parentezco'),(35,'Can delete parentezco',9,'delete_parentezco'),(36,'Can view parentezco',9,'view_parentezco'),(37,'Can add prueba_genetica',10,'add_prueba_genetica'),(38,'Can change prueba_genetica',10,'change_prueba_genetica'),(39,'Can delete prueba_genetica',10,'delete_prueba_genetica'),(40,'Can view prueba_genetica',10,'view_prueba_genetica'),(41,'Can add terapia_hormonal',11,'add_terapia_hormonal'),(42,'Can change terapia_hormonal',11,'change_terapia_hormonal'),(43,'Can delete terapia_hormonal',11,'delete_terapia_hormonal'),(44,'Can view terapia_hormonal',11,'view_terapia_hormonal'),(45,'Can add tiempo_bebida',12,'add_tiempo_bebida'),(46,'Can change tiempo_bebida',12,'change_tiempo_bebida'),(47,'Can delete tiempo_bebida',12,'delete_tiempo_bebida'),(48,'Can view tiempo_bebida',12,'view_tiempo_bebida'),(49,'Can add sub form_historia_personal',13,'add_subform_historia_personal'),(50,'Can change sub form_historia_personal',13,'change_subform_historia_personal'),(51,'Can delete sub form_historia_personal',13,'delete_subform_historia_personal'),(52,'Can view sub form_historia_personal',13,'view_subform_historia_personal'),(53,'Can add sub form_historia_familiar',14,'add_subform_historia_familiar'),(54,'Can change sub form_historia_familiar',14,'change_subform_historia_familiar'),(55,'Can delete sub form_historia_familiar',14,'delete_subform_historia_familiar'),(56,'Can view sub form_historia_familiar',14,'view_subform_historia_familiar'),(57,'Can add sub form_antecedentes_g_o',15,'add_subform_antecedentes_g_o'),(58,'Can change sub form_antecedentes_g_o',15,'change_subform_antecedentes_g_o'),(59,'Can delete sub form_antecedentes_g_o',15,'delete_subform_antecedentes_g_o'),(60,'Can view sub form_antecedentes_g_o',15,'view_subform_antecedentes_g_o'),(61,'Can add report',16,'add_report'),(62,'Can change report',16,'change_report'),(63,'Can delete report',16,'delete_report'),(64,'Can view report',16,'view_report'),(65,'Can add profile',17,'add_profile'),(66,'Can change profile',17,'change_profile'),(67,'Can delete profile',17,'delete_profile'),(68,'Can view profile',17,'view_profile'),(69,'Can add log entry',18,'add_logentry'),(70,'Can change log entry',18,'change_logentry'),(71,'Can delete log entry',18,'delete_logentry'),(72,'Can view log entry',18,'view_logentry'),(73,'Can add permission',19,'add_permission'),(74,'Can change permission',19,'change_permission'),(75,'Can delete permission',19,'delete_permission'),(76,'Can view permission',19,'view_permission'),(77,'Can add group',20,'add_group'),(78,'Can change group',20,'change_group'),(79,'Can delete group',20,'delete_group'),(80,'Can view group',20,'view_group'),(81,'Can add user',21,'add_user'),(82,'Can change user',21,'change_user'),(83,'Can delete user',21,'delete_user'),(84,'Can view user',21,'view_user'),(85,'Can add content type',22,'add_contenttype'),(86,'Can change content type',22,'change_contenttype'),(87,'Can delete content type',22,'delete_contenttype'),(88,'Can view content type',22,'view_contenttype'),(89,'Can add session',23,'add_session'),(90,'Can change session',23,'change_session'),(91,'Can delete session',23,'delete_session'),(92,'Can view session',23,'view_session'),(93,'Can add familiar_cancer',24,'add_familiar_cancer'),(94,'Can change familiar_cancer',24,'change_familiar_cancer'),(95,'Can delete familiar_cancer',24,'delete_familiar_cancer'),(96,'Can view familiar_cancer',24,'view_familiar_cancer'),(97,'Can add parentesco',9,'add_parentesco'),(98,'Can change parentesco',9,'change_parentesco'),(99,'Can delete parentesco',9,'delete_parentesco'),(100,'Can view parentesco',9,'view_parentesco');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$C1jKdMFj88xC$Egzs5pkBNRTcchezdAGOMXfR8exX9UEVaQP3VpsUzmE=','2020-10-16 22:14:33.473103',1,'admin','','','admin@email.com',1,1,'2020-10-15 23:22:02.325424');
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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-10-15 23:31:15.652787','1','Clinic object (1)',1,'[{\"added\": {}}]',1,1),(2,'2020-10-15 23:33:06.121627','1','Identidad_etnica object (1)',1,'[{\"added\": {}}]',4,1),(3,'2020-10-15 23:33:13.012302','2','Identidad_etnica object (2)',1,'[{\"added\": {}}]',4,1),(4,'2020-10-15 23:33:40.731163','3','Identidad_etnica object (3)',1,'[{\"added\": {}}]',4,1),(5,'2020-10-15 23:40:01.480600','1','Tiempo_bebida object (1)',1,'[{\"added\": {}}]',12,1),(6,'2020-10-15 23:40:28.410774','1','Tiempo_bebida object (1)',2,'[{\"changed\": {\"fields\": [\"Tiempo\"]}}]',12,1),(7,'2020-10-16 22:15:15.747067','2','Tiempo_bebida object (2)',1,'[{\"added\": {}}]',12,1),(8,'2020-10-16 22:15:20.209746','3','Tiempo_bebida object (3)',1,'[{\"added\": {}}]',12,1),(9,'2020-10-16 22:17:54.477045','1','Medicamento object (1)',1,'[{\"added\": {}}]',6,1),(10,'2020-10-16 22:17:57.877737','1','Medicamento_Subformulario object (1)',1,'[{\"added\": {}}]',7,1),(11,'2020-10-16 22:21:35.697493','2','Medicamento object (2)',1,'[{\"added\": {}}]',6,1),(12,'2020-10-16 22:21:39.060327','2','Medicamento_Subformulario object (2)',1,'[{\"added\": {}}]',7,1),(13,'2020-10-16 22:22:03.590319','3','Medicamento object (3)',1,'[{\"added\": {}}]',6,1),(14,'2020-10-16 22:22:07.224075','3','Medicamento_Subformulario object (3)',1,'[{\"added\": {}}]',7,1),(15,'2020-10-16 22:22:19.986533','4','Medicamento object (4)',1,'[{\"added\": {}}]',6,1),(16,'2020-10-16 22:22:31.638352','4','Medicamento_Subformulario object (4)',1,'[{\"added\": {}}]',7,1),(17,'2020-10-16 22:25:06.188023','1','Parentezco object (1)',1,'[{\"added\": {}}]',9,1),(18,'2020-10-16 22:27:37.211275','2','Parentezco object (2)',1,'[{\"added\": {}}]',9,1),(19,'2020-10-16 22:30:33.047772','3','SubForm_historia_familiar object (3)',1,'[{\"added\": {}}]',14,1),(20,'2020-10-16 22:34:45.177431','3','SubForm_historia_familiar object (3)',2,'[{\"changed\": {\"fields\": [\"Prueba genetica resultado\"]}}]',14,1),(21,'2020-10-16 22:38:01.188701','3','SubForm_historia_familiar object (3)',2,'[{\"changed\": {\"fields\": [\"Bebidas cuanto otro\"]}}]',14,1),(22,'2020-10-16 22:38:38.556941','3','SubForm_historia_familiar object (3)',2,'[{\"changed\": {\"fields\": [\"Bebidas cuanto otro\"]}}]',14,1),(23,'2020-10-16 22:41:38.305259','3','SubForm_historia_familiar object (3)',2,'[{\"changed\": {\"fields\": [\"Bebidas cuanto otro\"]}}]',14,1),(24,'2020-10-16 22:43:33.559307','3','SubForm_historia_familiar object (3)',2,'[{\"changed\": {\"fields\": [\"Bebidas cuanto otro\"]}}]',14,1),(25,'2020-10-16 22:43:50.921744','3','SubForm_historia_familiar object (3)',2,'[{\"changed\": {\"fields\": [\"Bebidas cuanto otro\"]}}]',14,1),(26,'2020-10-16 22:48:40.362315','1','Clinic object (1)',3,'',1,1),(27,'2020-10-16 22:48:45.094991','3','Tiempo_bebida object (3)',3,'',12,1),(28,'2020-10-16 22:48:47.105946','2','Tiempo_bebida object (2)',3,'',12,1),(29,'2020-10-16 22:48:48.969563','1','Tiempo_bebida object (1)',3,'',12,1),(30,'2020-10-16 22:48:54.274056','3','SubForm_historia_familiar object (3)',3,'',14,1),(31,'2020-10-16 22:49:00.528904','2','Parentezco object (2)',3,'',9,1),(32,'2020-10-16 22:49:02.336468','1','Parentezco object (1)',3,'',9,1),(33,'2020-10-16 22:49:12.251571','4','Medicamento_Subformulario object (4)',3,'',7,1),(34,'2020-10-16 22:49:14.652476','3','Medicamento_Subformulario object (3)',3,'',7,1),(35,'2020-10-16 22:49:16.336307','2','Medicamento_Subformulario object (2)',3,'',7,1),(36,'2020-10-16 22:49:18.229012','1','Medicamento_Subformulario object (1)',3,'',7,1),(37,'2020-10-16 22:49:21.925247','3','Identidad_etnica object (3)',3,'',4,1),(38,'2020-10-16 22:49:23.675878','2','Identidad_etnica object (2)',3,'',4,1),(39,'2020-10-16 22:49:25.325049','1','Identidad_etnica object (1)',3,'',4,1),(40,'2020-10-16 22:49:32.368099','4','Medicamento object (4)',3,'',6,1),(41,'2020-10-16 22:49:33.934135','3','Medicamento object (3)',3,'',6,1),(42,'2020-10-16 22:49:35.546011','2','Medicamento object (2)',3,'',6,1),(43,'2020-10-16 22:49:37.220449','1','Medicamento object (1)',3,'',6,1),(44,'2020-10-16 22:53:35.671682','2','Clinic object (2)',1,'[{\"added\": {}}]',1,1),(45,'2020-10-16 22:53:39.255718','2','Clinic object (2)',2,'[]',1,1),(46,'2020-10-16 22:53:46.932445','3','Clinic object (3)',1,'[{\"added\": {}}]',1,1),(47,'2020-10-16 22:55:24.177390','4','Identidad_etnica object (4)',1,'[{\"added\": {}}]',4,1),(48,'2020-10-16 22:55:40.961427','5','Identidad_etnica object (5)',1,'[{\"added\": {}}]',4,1),(49,'2020-10-16 22:55:46.145307','6','Identidad_etnica object (6)',1,'[{\"added\": {}}]',4,1),(50,'2020-10-16 22:55:54.117484','7','Identidad_etnica object (7)',1,'[{\"added\": {}}]',4,1),(51,'2020-10-16 22:56:06.705445','6','Identidad_etnica object (6)',3,'',4,1),(52,'2020-10-16 22:56:25.585322','8','Identidad_etnica object (8)',1,'[{\"added\": {}}]',4,1),(53,'2020-10-16 22:56:36.152335','9','Identidad_etnica object (9)',1,'[{\"added\": {}}]',4,1),(54,'2020-10-16 22:56:53.309139','10','Identidad_etnica object (10)',1,'[{\"added\": {}}]',4,1),(55,'2020-10-16 22:57:42.318831','11','Identidad_etnica object (11)',1,'[{\"added\": {}}]',4,1),(56,'2020-10-16 23:12:46.700993','4','Tiempo_bebida object (4)',1,'[{\"added\": {}}]',12,1),(57,'2020-10-16 23:12:57.941141','5','Tiempo_bebida object (5)',1,'[{\"added\": {}}]',12,1),(58,'2020-10-16 23:14:08.916465','6','Tiempo_bebida object (6)',1,'[{\"added\": {}}]',12,1),(59,'2020-10-16 23:14:18.248084','7','Tiempo_bebida object (7)',1,'[{\"added\": {}}]',12,1),(60,'2020-10-16 23:14:44.212651','7','Tiempo_bebida object (7)',3,'',12,1),(61,'2020-10-16 23:16:50.588118','5','Medicamento object (5)',1,'[{\"added\": {}}]',6,1),(62,'2020-10-16 23:17:13.648328','6','Medicamento object (6)',1,'[{\"added\": {}}]',6,1),(63,'2020-10-16 23:17:30.465103','7','Medicamento object (7)',1,'[{\"added\": {}}]',6,1),(64,'2020-10-16 23:17:40.962909','8','Medicamento object (8)',1,'[{\"added\": {}}]',6,1),(65,'2020-10-16 23:17:54.282079','9','Medicamento object (9)',1,'[{\"added\": {}}]',6,1),(66,'2020-10-16 23:18:48.500420','1','Terapia_hormonal object (1)',1,'[{\"added\": {}}]',11,1),(67,'2020-10-16 23:19:03.017993','2','Terapia_hormonal object (2)',1,'[{\"added\": {}}]',11,1),(68,'2020-10-16 23:19:22.164081','3','Terapia_hormonal object (3)',1,'[{\"added\": {}}]',11,1),(69,'2020-10-16 23:19:26.698950','4','Terapia_hormonal object (4)',1,'[{\"added\": {}}]',11,1),(70,'2020-10-16 23:20:27.417500','1','Prueba_genetica object (1)',1,'[{\"added\": {}}]',10,1),(71,'2020-10-16 23:20:34.208750','2','Prueba_genetica object (2)',1,'[{\"added\": {}}]',10,1),(72,'2020-10-16 23:20:43.586538','3','Prueba_genetica object (3)',1,'[{\"added\": {}}]',10,1),(73,'2020-10-16 23:20:53.796113','4','Prueba_genetica object (4)',1,'[{\"added\": {}}]',10,1),(74,'2020-10-16 23:21:00.883235','5','Prueba_genetica object (5)',1,'[{\"added\": {}}]',10,1),(75,'2020-10-16 23:21:09.398347','6','Prueba_genetica object (6)',1,'[{\"added\": {}}]',10,1),(76,'2020-10-16 23:21:14.573816','7','Prueba_genetica object (7)',1,'[{\"added\": {}}]',10,1),(77,'2020-10-16 23:21:38.347244','3','Parentezco object (3)',1,'[{\"added\": {}}]',9,1),(78,'2020-10-16 23:21:46.647348','4','Parentezco object (4)',1,'[{\"added\": {}}]',9,1),(79,'2020-10-16 23:21:56.515381','5','Parentezco object (5)',1,'[{\"added\": {}}]',9,1),(80,'2020-10-16 23:22:07.134010','6','Parentezco object (6)',1,'[{\"added\": {}}]',9,1),(81,'2020-10-16 23:22:17.077464','7','Parentezco object (7)',1,'[{\"added\": {}}]',9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (18,'admin','logentry'),(20,'auth','group'),(19,'auth','permission'),(21,'auth','user'),(22,'contenttypes','contenttype'),(1,'main','clinic'),(2,'main','densidad_mamografica'),(24,'main','familiar_cancer'),(3,'main','form'),(4,'main','identidad_etnica'),(5,'main','mamografia'),(6,'main','medicamento'),(7,'main','medicamento_subformulario'),(8,'main','pacient'),(9,'main','parentesco'),(17,'main','profile'),(10,'main','prueba_genetica'),(16,'main','report'),(15,'main','subform_antecedentes_g_o'),(14,'main','subform_historia_familiar'),(13,'main','subform_historia_personal'),(11,'main','terapia_hormonal'),(12,'main','tiempo_bebida'),(23,'sessions','session');
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-10-15 23:11:54.873262'),(2,'auth','0001_initial','2020-10-15 23:11:55.092179'),(3,'admin','0001_initial','2020-10-15 23:11:55.550106'),(4,'admin','0002_logentry_remove_auto_add','2020-10-15 23:11:55.625908'),(5,'admin','0003_logentry_add_action_flag_choices','2020-10-15 23:11:55.631892'),(6,'contenttypes','0002_remove_content_type_name','2020-10-15 23:11:55.711716'),(7,'auth','0002_alter_permission_name_max_length','2020-10-15 23:11:55.749621'),(8,'auth','0003_alter_user_email_max_length','2020-10-15 23:11:55.769568'),(9,'auth','0004_alter_user_username_opts','2020-10-15 23:11:55.776549'),(10,'auth','0005_alter_user_last_login_null','2020-10-15 23:11:55.810484'),(11,'auth','0006_require_contenttypes_0002','2020-10-15 23:11:55.812478'),(12,'auth','0007_alter_validators_add_error_messages','2020-10-15 23:11:55.819460'),(13,'auth','0008_alter_user_username_max_length','2020-10-15 23:11:55.857359'),(14,'auth','0009_alter_user_last_name_max_length','2020-10-15 23:11:55.898284'),(15,'auth','0010_alter_group_name_max_length','2020-10-15 23:11:55.913244'),(16,'auth','0011_update_proxy_permissions','2020-10-15 23:11:55.920225'),(17,'auth','0012_alter_user_first_name_max_length','2020-10-15 23:11:55.958136'),(18,'main','0001_initial','2020-10-15 23:11:56.734745'),(19,'sessions','0001_initial','2020-10-15 23:11:57.752387'),(20,'main','0002_auto_20201016_1630','2020-10-16 22:30:06.566849'),(21,'main','0003_auto_20201016_1645','2020-10-16 22:45:54.736552'),(22,'main','0004_auto_20201016_1725','2020-10-16 23:26:00.235886'),(23,'main','0005_delete_densidad_mamografica','2020-10-16 23:28:23.076629');
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
INSERT INTO `django_session` VALUES ('7n4usf581r5skdsji607bjajsuydifr2','.eJxVjDsOwyAQBe9CHSHMz0vK9D4DWmAJTiKQjF1FuXuE5CJp38y8N_N47MUfnTa_JnZlE7v8bgHjk-oA6YH13nhsdd_WwIfCT9r50hK9bqf7d1Cwl1ETmDmBdSkblKR1VEKiDaCMpaxTcKgkGiUtSBQOgNxsLKhJg84CHPt8Ad_kNwc:1kTCZf:q32q8eMVZ0faTmS3so8ZA-nzZVwyaPD_aXdh4iuvbXs','2020-10-29 23:22:19.256700'),('kgnvopnf04ba1y88jrocppcw09n64jw2','.eJxVjDsOwyAQBe9CHSHMz0vK9D4DWmAJTiKQjF1FuXuE5CJp38y8N_N47MUfnTa_JnZlE7v8bgHjk-oA6YH13nhsdd_WwIfCT9r50hK9bqf7d1Cwl1ETmDmBdSkblKR1VEKiDaCMpaxTcKgkGiUtSBQOgNxsLKhJg84CHPt8Ad_kNwc:1kTXzd:Lmo0VgpBJInqL8JaCWay_VzTrRTigYLD3rjQXtdPc6A','2020-10-30 22:14:33.473103');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_clinic`
--

LOCK TABLES `main_clinic` WRITE;
/*!40000 ALTER TABLE `main_clinic` DISABLE KEYS */;
INSERT INTO `main_clinic` VALUES (2,'Marcial Fallas'),(3,'San Juan de Dios');
/*!40000 ALTER TABLE `main_clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_familiar_cancer`
--

DROP TABLE IF EXISTS `main_familiar_cancer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_familiar_cancer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `familiares_cancer_tipo` varchar(40) DEFAULT NULL,
  `familiares_cancer_parentezco` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_familiar_cancer`
--

LOCK TABLES `main_familiar_cancer` WRITE;
/*!40000 ALTER TABLE `main_familiar_cancer` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_familiar_cancer` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_identidad_etnica`
--

LOCK TABLES `main_identidad_etnica` WRITE;
/*!40000 ALTER TABLE `main_identidad_etnica` DISABLE KEYS */;
INSERT INTO `main_identidad_etnica` VALUES (4,'Indígena'),(5,'Afrodescendiente'),(7,'Mulata'),(8,'Origen asiatico'),(9,'Mestiza'),(10,'Blanca'),(11,'Otra');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_medicamento`
--

LOCK TABLES `main_medicamento` WRITE;
/*!40000 ALTER TABLE `main_medicamento` DISABLE KEYS */;
INSERT INTO `main_medicamento` VALUES (5,'Tamoxifeno'),(6,'Anastrozol'),(7,'Metformina'),(8,'Bifosfonatos'),(9,'Aspirina');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
-- Table structure for table `main_parentesco`
--

DROP TABLE IF EXISTS `main_parentesco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_parentesco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_parentesco` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_parentesco`
--

LOCK TABLES `main_parentesco` WRITE;
/*!40000 ALTER TABLE `main_parentesco` DISABLE KEYS */;
INSERT INTO `main_parentesco` VALUES (3,'Madre'),(4,'Tía (Materna)'),(5,'Tía (Paterna)'),(6,'Abuela (Paterna)'),(7,'Abuela (Materna)');
/*!40000 ALTER TABLE `main_parentesco` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `parentesco_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_subform_historia_fa_subform_historia_familia_0a0ee1fb_uniq` (`subform_historia_familiar_id`,`parentesco_id`),
  KEY `main_subform_histori_parentesco_id_a61df8b8_fk_main_pare` (`parentesco_id`),
  CONSTRAINT `main_subform_histori_parentesco_id_a61df8b8_fk_main_pare` FOREIGN KEY (`parentesco_id`) REFERENCES `main_parentesco` (`id`),
  CONSTRAINT `main_subform_histori_subform_historia_fam_779fd55e_fk_main_subf` FOREIGN KEY (`subform_historia_familiar_id`) REFERENCES `main_subform_historia_familiar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_familiar_parentesco`
--

LOCK TABLES `main_subform_historia_familiar_parentesco` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_familiar_parentesco` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_subform_historia_familiar_parentesco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_subform_historia_familiar_parentesco_tipo`
--

DROP TABLE IF EXISTS `main_subform_historia_familiar_parentesco_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_subform_historia_familiar_parentesco_tipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subform_historia_familiar_id` int NOT NULL,
  `familiar_cancer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_subform_historia_fa_subform_historia_familia_8dc2c455_uniq` (`subform_historia_familiar_id`,`familiar_cancer_id`),
  KEY `main_subform_histori_familiar_cancer_id_cb10beb1_fk_main_fami` (`familiar_cancer_id`),
  CONSTRAINT `main_subform_histori_familiar_cancer_id_cb10beb1_fk_main_fami` FOREIGN KEY (`familiar_cancer_id`) REFERENCES `main_familiar_cancer` (`id`),
  CONSTRAINT `main_subform_histori_subform_historia_fam_c652e6a2_fk_main_subf` FOREIGN KEY (`subform_historia_familiar_id`) REFERENCES `main_subform_historia_familiar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_familiar_parentesco_tipo`
--

LOCK TABLES `main_subform_historia_familiar_parentesco_tipo` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_familiar_parentesco_tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_subform_historia_familiar_parentesco_tipo` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `identidad_etnica_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bebidas_cuanto_id` (`bebidas_cuanto_id`),
  UNIQUE KEY `identidad_etnica_id` (`identidad_etnica_id`),
  CONSTRAINT `main_subform_histori_bebidas_cuanto_id_965abac8_fk_main_tiem` FOREIGN KEY (`bebidas_cuanto_id`) REFERENCES `main_tiempo_bebida` (`id`),
  CONSTRAINT `main_subform_histori_identidad_etnica_id_16d84215_fk_main_iden` FOREIGN KEY (`identidad_etnica_id`) REFERENCES `main_identidad_etnica` (`id`),
  CONSTRAINT `main_subform_historia_personal_chk_1` CHECK ((`peso` >= 0)),
  CONSTRAINT `main_subform_historia_personal_chk_2` CHECK ((`talla` >= 0)),
  CONSTRAINT `main_subform_historia_personal_chk_3` CHECK ((`imc` >= 0)),
  CONSTRAINT `main_subform_historia_personal_chk_4` CHECK ((`fuma_edad` >= 0)),
  CONSTRAINT `main_subform_historia_personal_chk_5` CHECK ((`diabetes_tipo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subform_historia_personal`
--

LOCK TABLES `main_subform_historia_personal` WRITE;
/*!40000 ALTER TABLE `main_subform_historia_personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_subform_historia_personal` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_terapia_hormonal`
--

LOCK TABLES `main_terapia_hormonal` WRITE;
/*!40000 ALTER TABLE `main_terapia_hormonal` DISABLE KEYS */;
INSERT INTO `main_terapia_hormonal` VALUES (1,'Sistémico (Oral)'),(2,'Tópico (Crema o Parche)'),(3,'Intravaginal (Óvulos o Anillo)'),(4,'No sabe');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_tiempo_bebida`
--

LOCK TABLES `main_tiempo_bebida` WRITE;
/*!40000 ALTER TABLE `main_tiempo_bebida` DISABLE KEYS */;
INSERT INTO `main_tiempo_bebida` VALUES (4,'más de tres a la semana'),(5,'más de dos al día'),(6,'Otro');
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

-- Dump completed on 2020-10-16 17:30:16
