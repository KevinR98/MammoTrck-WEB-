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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `subform_ant_g_o_id` int,
  `subform_hist_fam_id` int,
  `subform_hist_per_id` int,
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
-- Table structure for table `main_identidad_etnica`
--

DROP TABLE IF EXISTS `main_identidad_etnica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_identidad_etnica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identidad` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `main_parentesco`
--

DROP TABLE IF EXISTS `main_parentesco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_parentesco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_parentesco` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `main_profile`
--

DROP TABLE IF EXISTS `main_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_profile` (
  `user_id` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `clinic_id` int,
  PRIMARY KEY (`user_id`),
  KEY `main_profile_clinic_id_5f662d76` (`clinic_id`),
  CONSTRAINT `main_profile_clinic_id_5f662d76_fk_main_clinic_id` FOREIGN KEY (`clinic_id`) REFERENCES `main_clinic` (`id`),
  CONSTRAINT `main_profile_user_id_b40d720a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `familiares_cancer_parentezco` varchar(40) DEFAULT NULL,
  `familiares_cancer_tipo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `clinic_id` int,
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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

-- Dump completed on 2020-10-23 18:48:51
