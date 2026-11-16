
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `todofreakstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `todofreakstore`;
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
DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `catalog_catalogauditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_catalogauditlog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(20) NOT NULL,
  `entity_id` bigint unsigned NOT NULL,
  `entity_name` varchar(200) NOT NULL,
  `action` varchar(20) NOT NULL,
  `previous_data` json NOT NULL,
  `new_data` json NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `performed_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_catalogauditlog_performed_by_id_56a12df3_fk_auth_user_id` (`performed_by_id`),
  KEY `catalog_audit_entity_idx` (`entity_type`,`entity_id`),
  CONSTRAINT `catalog_catalogauditlog_performed_by_id_56a12df3_fk_auth_user_id` FOREIGN KEY (`performed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `catalog_catalogauditlog_chk_1` CHECK ((`entity_id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `catalog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `display_order` int unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `kind` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `catalog_category_kind_name_unique` (`kind`,`name`),
  KEY `catalog_category_kind_402b71d9` (`kind`),
  CONSTRAINT `catalog_category_chk_1` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `catalog_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `barcode` varchar(64) DEFAULT NULL,
  `description` longtext NOT NULL,
  `price` decimal(12,0) NOT NULL,
  `promotional_price` decimal(12,0) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `category_id` bigint NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cost` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `sku` (`sku`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `catalog_product_category_id_35bf920b_fk_catalog_category_id` (`category_id`),
  CONSTRAINT `catalog_product_category_id_35bf920b_fk_catalog_category_id` FOREIGN KEY (`category_id`) REFERENCES `catalog_category` (`id`),
  CONSTRAINT `catalog_product_cost_nonnegative` CHECK (((`cost` is null) or (`cost` >= 0))),
  CONSTRAINT `catalog_product_price_nonnegative` CHECK ((`price` >= 0)),
  CONSTRAINT `catalog_product_valid_promotional_price` CHECK (((`promotional_price` is null) or ((`promotional_price` >= 0) and (`promotional_price` < `price`))))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `catalog_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_productimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL,
  `alt_text` varchar(160) NOT NULL,
  `display_order` int unsigned NOT NULL,
  `is_primary` tinyint(1) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalog_productimage_one_primary` (((case when (`is_primary` = 0x01) then `product_id` else NULL end))),
  KEY `catalog_productimage_product_id_1f42dd8c_fk_catalog_product_id` (`product_id`),
  CONSTRAINT `catalog_productimage_product_id_1f42dd8c_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `catalog_productimage_chk_1` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `customers_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `source` varchar(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `alias` varchar(80) NOT NULL,
  `city` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `merged_into_id` bigint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `anonymization_requested_at` datetime(6) DEFAULT NULL,
  `anonymization_requested_by_id` int DEFAULT NULL,
  `anonymized_at` datetime(6) DEFAULT NULL,
  `anonymized_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `customers_c_email_4fdeb3_idx` (`email`),
  KEY `customers_c_phone_8493fa_idx` (`phone`),
  KEY `customers_customer_merged_into_id_2994ddb6_fk_customers` (`merged_into_id`),
  KEY `customers_customer_anonymization_reques_fa70dc58_fk_auth_user` (`anonymization_requested_by_id`),
  KEY `customers_customer_anonymized_by_id_b2b7d61f_fk_auth_user_id` (`anonymized_by_id`),
  CONSTRAINT `customers_customer_anonymization_reques_fa70dc58_fk_auth_user` FOREIGN KEY (`anonymization_requested_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `customers_customer_anonymized_by_id_b2b7d61f_fk_auth_user_id` FOREIGN KEY (`anonymized_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `customers_customer_merged_into_id_2994ddb6_fk_customers` FOREIGN KEY (`merged_into_id`) REFERENCES `customers_customer` (`id`),
  CONSTRAINT `customers_customer_user_id_a9568d6c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `customers_customerorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_customerorder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `customer_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `customers_customeror_customer_id_7339c352_fk_customers` (`customer_id`),
  CONSTRAINT `customers_customeror_customer_id_7339c352_fk_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers_customer` (`id`),
  CONSTRAINT `customers_customerorder_order_id_0e6e70c9_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `customers_customerrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_customerrequest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `kind` varchar(20) NOT NULL,
  `details` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  `staff_note` longtext NOT NULL,
  `requested_at` datetime(6) NOT NULL,
  `resolved_at` datetime(6) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `resolved_by_id` int DEFAULT NULL,
  `requester_email` varchar(254) NOT NULL,
  `response_sent_at` datetime(6) DEFAULT NULL,
  `response_text` longtext NOT NULL,
  `verification_expires_at` datetime(6) DEFAULT NULL,
  `verification_method` varchar(20) NOT NULL,
  `verification_token_digest` varchar(64) NOT NULL,
  `verified_at` datetime(6) DEFAULT NULL,
  `response_due_at` datetime(6) DEFAULT NULL,
  `requester_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_customerre_resolved_by_id_234601c2_fk_auth_user` (`resolved_by_id`),
  KEY `customers_customerre_customer_id_6d5630e0_fk_customers` (`customer_id`),
  CONSTRAINT `customers_customerre_customer_id_6d5630e0_fk_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers_customer` (`id`),
  CONSTRAINT `customers_customerre_resolved_by_id_234601c2_fk_auth_user` FOREIGN KEY (`resolved_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `customers_marketingconsent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_marketingconsent` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `opted_in` tinyint(1) NOT NULL,
  `purpose` varchar(40) NOT NULL,
  `notice_version` varchar(40) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `customer_id` bigint NOT NULL,
  `recorded_by_id` int DEFAULT NULL,
  `evidence` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_marketingc_customer_id_353d79c3_fk_customers` (`customer_id`),
  KEY `customers_marketingc_recorded_by_id_63671f2f_fk_auth_user` (`recorded_by_id`),
  CONSTRAINT `customers_marketingc_customer_id_353d79c3_fk_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers_customer` (`id`),
  CONSTRAINT `customers_marketingc_recorded_by_id_63671f2f_fk_auth_user` FOREIGN KEY (`recorded_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `dashboard_aichatthread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_aichatthread` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `selection` varchar(64) NOT NULL,
  `messages` json NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dashboard_ai_chat_selection_unique` (`user_id`,`selection`),
  CONSTRAINT `dashboard_aichatthread_user_id_f33acf1c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `dashboard_aireportsnapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_aireportsnapshot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `selection` varchar(64) NOT NULL,
  `report` json NOT NULL,
  `analysis_input` varchar(64) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dashboard_ai_report_selection_unique` (`user_id`,`selection`),
  CONSTRAINT `dashboard_aireportsnapshot_user_id_b584f08b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
DROP TABLE IF EXISTS `finance_cashmovement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_cashmovement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `kind` varchar(10) NOT NULL,
  `amount` decimal(12,0) NOT NULL,
  `occurred_on` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `payment_method` varchar(10) NOT NULL,
  `reference` varchar(64) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `voided_at` datetime(6) DEFAULT NULL,
  `void_reason` varchar(200) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `voided_by_id` int DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `finance_cashmovement_created_by_id_c13cbe2b_fk_auth_user_id` (`created_by_id`),
  KEY `finance_cashmovement_voided_by_id_7b6de255_fk_auth_user_id` (`voided_by_id`),
  KEY `finance_movement_date_idx` (`occurred_on`),
  KEY `finance_movement_kind_matches_category` (`category_id`,`kind`),
  CONSTRAINT `finance_cashmovement_category_id_f1599e33_fk_finance_f` FOREIGN KEY (`category_id`) REFERENCES `finance_financecategory` (`id`),
  CONSTRAINT `finance_cashmovement_created_by_id_c13cbe2b_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `finance_cashmovement_voided_by_id_7b6de255_fk_auth_user_id` FOREIGN KEY (`voided_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `finance_movement_kind_matches_category` FOREIGN KEY (`category_id`, `kind`) REFERENCES `finance_financecategory` (`id`, `kind`),
  CONSTRAINT `finance_movement_amount_positive` CHECK ((`amount` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `finance_financecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance_financecategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `kind` varchar(10) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `finance_category_unique_name_per_kind` (`kind`,`name`),
  UNIQUE KEY `finance_category_unique_id_kind` (`id`,`kind`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `inventory_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `low_stock_threshold` int unsigned NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  CONSTRAINT `inventory_inventory_product_id_5b835926_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `inventory_inventory_chk_1` CHECK ((`quantity` >= 0)),
  CONSTRAINT `inventory_inventory_chk_2` CHECK ((`low_stock_threshold` >= 0)),
  CONSTRAINT `inventory_low_stock_threshold_nonnegative` CHECK ((`low_stock_threshold` >= 0)),
  CONSTRAINT `inventory_quantity_nonnegative` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `inventory_inventorymovement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_inventorymovement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `movement_type` varchar(20) NOT NULL,
  `quantity_delta` int NOT NULL,
  `balance_before` int unsigned NOT NULL,
  `balance_after` int unsigned NOT NULL,
  `reason` longtext NOT NULL,
  `reference` varchar(128) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `inventory_id` bigint NOT NULL,
  `performed_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_inventorym_inventory_id_dd087dd5_fk_inventory` (`inventory_id`),
  KEY `inventory_inventorym_performed_by_id_8c8383e2_fk_auth_user` (`performed_by_id`),
  CONSTRAINT `inventory_inventorym_inventory_id_dd087dd5_fk_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `inventory_inventory` (`id`),
  CONSTRAINT `inventory_inventorym_performed_by_id_8c8383e2_fk_auth_user` FOREIGN KEY (`performed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `inventory_inventorymovement_chk_1` CHECK ((`balance_before` >= 0)),
  CONSTRAINT `inventory_inventorymovement_chk_2` CHECK ((`balance_after` >= 0)),
  CONSTRAINT `inventory_movement_after_nonnegative` CHECK ((`balance_after` >= 0)),
  CONSTRAINT `inventory_movement_balance_matches_delta` CHECK ((`balance_after` = (`balance_before` + `quantity_delta`))),
  CONSTRAINT `inventory_movement_before_nonnegative` CHECK ((`balance_before` >= 0)),
  CONSTRAINT `inventory_movement_delta_nonzero` CHECK ((`quantity_delta` <> 0))
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `marketing_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_campaign` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `kind` varchar(20) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL,
  `message` longtext NOT NULL,
  `cta_label` varchar(60) NOT NULL,
  `cta_url` varchar(500) NOT NULL,
  `status` varchar(20) NOT NULL,
  `recipients_count` int unsigned NOT NULL,
  `sent_count` int unsigned NOT NULL,
  `failed_count` int unsigned NOT NULL,
  `skipped_count` int unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `queued_at` datetime(6) DEFAULT NULL,
  `finished_at` datetime(6) DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `sent_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_campaign_created_by_id_c4d2ec89_fk_auth_user_id` (`created_by_id`),
  KEY `marketing_campaign_sent_by_id_c6cffb74_fk_auth_user_id` (`sent_by_id`),
  CONSTRAINT `marketing_campaign_created_by_id_c4d2ec89_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `marketing_campaign_sent_by_id_c6cffb74_fk_auth_user_id` FOREIGN KEY (`sent_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `marketing_campaign_chk_1` CHECK ((`recipients_count` >= 0)),
  CONSTRAINT `marketing_campaign_chk_2` CHECK ((`sent_count` >= 0)),
  CONSTRAINT `marketing_campaign_chk_3` CHECK ((`failed_count` >= 0)),
  CONSTRAINT `marketing_campaign_chk_4` CHECK ((`skipped_count` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `marketing_campaigndelivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_campaigndelivery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `status` varchar(20) NOT NULL,
  `error` varchar(255) NOT NULL,
  `sent_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `campaign_id` bigint NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `marketing_delivery_once_per_email` (`campaign_id`,`email`),
  KEY `marketing_campaignde_customer_id_db03e36b_fk_customers` (`customer_id`),
  KEY `marketing_delivery_status_idx` (`campaign_id`,`status`),
  CONSTRAINT `marketing_campaignde_campaign_id_c8e1be74_fk_marketing` FOREIGN KEY (`campaign_id`) REFERENCES `marketing_campaign` (`id`),
  CONSTRAINT `marketing_campaignde_customer_id_db03e36b_fk_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `marketing_campaignproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_campaignproduct` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `position` smallint unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `price` decimal(12,0) NOT NULL,
  `regular_price` decimal(12,0) DEFAULT NULL,
  `campaign_id` bigint NOT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `marketing_campaign_product_once` (`campaign_id`,`product_id`),
  KEY `marketing_campaignpr_product_id_c5185fab_fk_catalog_p` (`product_id`),
  KEY `marketing_campaignproduct_slug_6b4d9656` (`slug`),
  CONSTRAINT `marketing_campaignpr_campaign_id_48b3df1a_fk_marketing` FOREIGN KEY (`campaign_id`) REFERENCES `marketing_campaign` (`id`),
  CONSTRAINT `marketing_campaignpr_product_id_c5185fab_fk_catalog_p` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `marketing_campaignproduct_chk_1` CHECK ((`position` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `marketing_categorycatalogbanner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_categorycatalogbanner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(160) NOT NULL,
  `description` varchar(350) NOT NULL,
  `image` varchar(100) NOT NULL,
  `start_color` varchar(7) NOT NULL,
  `end_color` varchar(7) NOT NULL,
  `is_hidden` tinyint(1) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`),
  CONSTRAINT `marketing_categoryca_category_id_59d6f14e_fk_catalog_c` FOREIGN KEY (`category_id`) REFERENCES `catalog_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `marketing_communitygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_communitygroup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `background` varchar(100) NOT NULL,
  `invite_url` varchar(200) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `display_order` int unsigned NOT NULL,
  `authorized_by` varchar(80) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `updated_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `marketing_communitygroup_updated_by_id_098d5ba5_fk_auth_user_id` (`updated_by_id`),
  CONSTRAINT `marketing_communitygroup_updated_by_id_098d5ba5_fk_auth_user_id` FOREIGN KEY (`updated_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `marketing_community_group_active_needs_url` CHECK (((`invite_url` <> _utf8mb4'') or (`is_active` <> 0x01))),
  CONSTRAINT `marketing_communitygroup_chk_1` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `marketing_homefeaturedexpansions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_homefeaturedexpansions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_title` varchar(160) NOT NULL,
  `first_image` varchar(100) NOT NULL,
  `second_title` varchar(160) NOT NULL,
  `second_image` varchar(100) NOT NULL,
  `first_category_id` bigint DEFAULT NULL,
  `second_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_homefeatur_first_category_id_09a5ce39_fk_catalog_c` (`first_category_id`),
  KEY `marketing_homefeatur_second_category_id_ba7d2962_fk_catalog_c` (`second_category_id`),
  CONSTRAINT `marketing_homefeatur_first_category_id_09a5ce39_fk_catalog_c` FOREIGN KEY (`first_category_id`) REFERENCES `catalog_category` (`id`),
  CONSTRAINT `marketing_homefeatur_second_category_id_ba7d2962_fk_catalog_c` FOREIGN KEY (`second_category_id`) REFERENCES `catalog_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `marketing_homeheroslide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_homeheroslide` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(160) NOT NULL,
  `subtitle` varchar(500) NOT NULL,
  `image` varchar(100) NOT NULL,
  `alt_text` varchar(200) NOT NULL,
  `cta_label` varchar(60) NOT NULL,
  `cta_href` varchar(500) NOT NULL,
  `display_order` int unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `marketing_homeheroslide_chk_1` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `orders_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `orders_cart_user_id_121a069e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `orders_cartline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_cartline` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `cart_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_cartline_unique_product` (`cart_id`,`product_id`),
  KEY `orders_cartline_product_id_50c0512b_fk_catalog_product_id` (`product_id`),
  CONSTRAINT `orders_cartline_cart_id_af5e6867_fk_orders_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `orders_cart` (`id`),
  CONSTRAINT `orders_cartline_product_id_50c0512b_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `orders_cartline_chk_1` CHECK ((`quantity` >= 0)),
  CONSTRAINT `orders_cartline_quantity_positive` CHECK ((`quantity` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `orders_cashregistermovement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_cashregistermovement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `kind` varchar(10) NOT NULL,
  `amount` decimal(12,0) NOT NULL,
  `reason` varchar(200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `session_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_cashmovement_one_refund_per_order` (`order_id`),
  KEY `orders_cashregisterm_created_by_id_b258c4a7_fk_auth_user` (`created_by_id`),
  KEY `orders_cashregisterm_session_id_55b32a5c_fk_orders_ca` (`session_id`),
  CONSTRAINT `orders_cashregisterm_created_by_id_b258c4a7_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `orders_cashregisterm_session_id_55b32a5c_fk_orders_ca` FOREIGN KEY (`session_id`) REFERENCES `orders_cashregistersession` (`id`),
  CONSTRAINT `orders_cashregistermovement_order_id_a19c7a82_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_cashmovement_amount_positive` CHECK ((`amount` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `orders_cashregistersession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_cashregistersession` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(10) NOT NULL,
  `open_marker` smallint unsigned DEFAULT NULL,
  `opened_at` datetime(6) NOT NULL,
  `opening_amount` decimal(12,0) NOT NULL,
  `opening_note` varchar(200) NOT NULL,
  `closed_at` datetime(6) DEFAULT NULL,
  `expected_cash` decimal(12,0) DEFAULT NULL,
  `counted_cash` decimal(12,0) DEFAULT NULL,
  `difference` decimal(12,0) DEFAULT NULL,
  `closing_note` varchar(300) NOT NULL,
  `summary` json DEFAULT NULL,
  `closed_by_id` int DEFAULT NULL,
  `opened_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `open_marker` (`open_marker`),
  KEY `orders_cashregistersession_closed_by_id_eb71151b_fk_auth_user_id` (`closed_by_id`),
  KEY `orders_cashregistersession_opened_by_id_cfc709de_fk_auth_user_id` (`opened_by_id`),
  CONSTRAINT `orders_cashregistersession_closed_by_id_eb71151b_fk_auth_user_id` FOREIGN KEY (`closed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `orders_cashregistersession_opened_by_id_cfc709de_fk_auth_user_id` FOREIGN KEY (`opened_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `orders_cashregistersession_chk_1` CHECK ((`open_marker` >= 0)),
  CONSTRAINT `orders_cashsession_amounts_nonnegative` CHECK (((`opening_amount` >= 0) and ((`counted_cash` is null) or (`counted_cash` >= 0)))),
  CONSTRAINT `orders_cashsession_marker_matches_status` CHECK ((((`open_marker` = 1) and (`status` = _utf8mb4'open')) or ((`open_marker` is null) and (`status` = _utf8mb4'closed'))))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `orders_emaildelivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_emaildelivery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `kind` varchar(40) NOT NULL,
  `dedupe_key` varchar(160) DEFAULT NULL,
  `to_email` varchar(320) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `status` varchar(12) NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `last_error` longtext NOT NULL,
  `provider_message_id` varchar(255) NOT NULL,
  `params` json NOT NULL,
  `next_attempt_at` datetime(6) DEFAULT NULL,
  `sent_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dedupe_key` (`dedupe_key`),
  KEY `orders_emaildelivery_order_id_f45a4e6b_fk_orders_order_id` (`order_id`),
  KEY `orders_email_retry_idx` (`status`,`next_attempt_at`),
  CONSTRAINT `orders_emaildelivery_order_id_f45a4e6b_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_emaildelivery_chk_1` CHECK ((`attempts` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `newsletter_opt_in` tinyint(1) NOT NULL,
  `delivery_method` varchar(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `rut` varchar(15) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `region` varchar(30) NOT NULL,
  `postal_code` varchar(15) NOT NULL,
  `discount_code` varchar(30) NOT NULL,
  `subtotal` decimal(12,0) NOT NULL,
  `shipping_cost` decimal(12,0) NOT NULL,
  `discount_amount` decimal(12,0) NOT NULL,
  `total` decimal(12,0) NOT NULL,
  `user_id` int DEFAULT NULL,
  `payment_provider` varchar(20) NOT NULL,
  `payment_token` varchar(64) DEFAULT NULL,
  `payment_buy_order` varchar(26) DEFAULT NULL,
  `payment_session_id` varchar(61) NOT NULL,
  `payment_authorization_code` varchar(20) NOT NULL,
  `payment_type_code` varchar(20) NOT NULL,
  `payment_card_last4` varchar(4) NOT NULL,
  `payment_expires_at` datetime(6) DEFAULT NULL,
  `paid_at` datetime(6) DEFAULT NULL,
  `channel` varchar(10) NOT NULL,
  `payment_method` varchar(10) NOT NULL,
  `pickup_code` varchar(11) DEFAULT NULL,
  `payment_merchant_code` varchar(32) NOT NULL,
  `payment_transaction_id` varchar(64) NOT NULL,
  `payment_transaction_code` varchar(64) NOT NULL,
  `hidden_by_customer_at` datetime(6) DEFAULT NULL,
  `cash_received` decimal(12,0) DEFAULT NULL,
  `client_sale_id` char(32) DEFAULT NULL,
  `public_code` varchar(9) NOT NULL,
  `cash_session_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_public_code_2921af4d_uniq` (`public_code`),
  UNIQUE KEY `payment_token` (`payment_token`),
  UNIQUE KEY `payment_buy_order` (`payment_buy_order`),
  UNIQUE KEY `pickup_code` (`pickup_code`),
  UNIQUE KEY `client_sale_id` (`client_sale_id`),
  KEY `orders_order_user_id_e9b59eb1_fk_auth_user_id` (`user_id`),
  KEY `orders_status_created_idx` (`status`,`created_at`),
  KEY `orders_order_cash_session_id_3a8d5915_fk_orders_ca` (`cash_session_id`),
  CONSTRAINT `orders_order_cash_session_id_3a8d5915_fk_orders_ca` FOREIGN KEY (`cash_session_id`) REFERENCES `orders_cashregistersession` (`id`),
  CONSTRAINT `orders_order_user_id_e9b59eb1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `orders_order_amounts_nonnegative` CHECK (((`discount_amount` >= 0) and (`shipping_cost` >= 0) and (`subtotal` >= 0) and (`total` >= 0))),
  CONSTRAINT `orders_order_shipping_requires_address` CHECK (((`delivery_method` in (_utf8mb4'pickup',_utf8mb4'tournament')) or ((`address_line1` > _utf8mb4'') and (`city` > _utf8mb4'') and (`delivery_method` = _utf8mb4'shipping') and (`first_name` > _utf8mb4'') and (`last_name` > _utf8mb4'') and (`region` > _utf8mb4'') and (`rut` > _utf8mb4'')))),
  CONSTRAINT `orders_order_total_matches_parts` CHECK ((`total` = ((`subtotal` - `discount_amount`) + `shipping_cost`)))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `orders_orderline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderline` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_name` varchar(200) NOT NULL,
  `product_sku` varchar(64) NOT NULL,
  `unit_price` decimal(12,0) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `line_total` decimal(12,0) NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `unit_cost` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderline_order_id_17f8f3ef_fk_orders_order_id` (`order_id`),
  KEY `orders_orderline_product_id_a68772b6_fk_catalog_product_id` (`product_id`),
  CONSTRAINT `orders_orderline_order_id_17f8f3ef_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_orderline_product_id_a68772b6_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `orders_orderline_amounts_nonnegative` CHECK (((`unit_price` >= 0) and ((`unit_cost` is null) or (`unit_cost` >= 0)))),
  CONSTRAINT `orders_orderline_chk_1` CHECK ((`quantity` >= 0)),
  CONSTRAINT `orders_orderline_quantity_positive` CHECK ((`quantity` >= 1)),
  CONSTRAINT `orders_orderline_total_matches_quantity` CHECK ((`line_total` = (`unit_price` * `quantity`)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `orders_ordernotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_ordernotification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `read_at` datetime(6) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `recipient_id` int NOT NULL,
  `notification_type` varchar(32) NOT NULL,
  `event_key` varchar(96) NOT NULL,
  `tournament_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ord_notif_user_event_uniq` (`recipient_id`,`order_id`,`event_key`),
  UNIQUE KEY `ord_notif_user_tourney_event_uniq` (`recipient_id`,`tournament_id`,`event_key`),
  KEY `ord_notif_user_read_idx` (`recipient_id`,`read_at`),
  KEY `orders_ordernotification_order_id_3af33b65_fk_orders_order_id` (`order_id`),
  KEY `orders_ordernotifica_tournament_id_4222485f_fk_tournamen` (`tournament_id`),
  CONSTRAINT `orders_ordernotifica_tournament_id_4222485f_fk_tournamen` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments_tournament` (`id`),
  CONSTRAINT `orders_ordernotification_order_id_3af33b65_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_ordernotification_recipient_id_227d2e6d_fk_auth_user_id` FOREIGN KEY (`recipient_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `orders_ordernotificationsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_ordernotificationsettings` (
  `id` smallint unsigned NOT NULL,
  `admin_email` varchar(254) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `notify_order_payment_approved` tinyint(1) NOT NULL,
  `notify_order_ready_for_pickup` tinyint(1) NOT NULL,
  `notify_order_pending_preparation` tinyint(1) NOT NULL,
  `notify_tournament_activity` tinyint(1) NOT NULL,
  `notify_tournament_reminders` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `orders_ordernotificationsettings_chk_1` CHECK ((`id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `orders_orderstatushistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderstatushistory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_status` varchar(20) NOT NULL,
  `to_status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `changed_by_id` int DEFAULT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderstatushistory_changed_by_id_d823a516_fk_auth_user_id` (`changed_by_id`),
  KEY `orders_orderstatushistory_order_id_bf09a0e1_fk_orders_order_id` (`order_id`),
  CONSTRAINT `orders_orderstatushistory_changed_by_id_d823a516_fk_auth_user_id` FOREIGN KEY (`changed_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `orders_orderstatushistory_order_id_bf09a0e1_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tournaments_tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournaments_tournament` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `starts_at` datetime(6) NOT NULL,
  `max_capacity` int unsigned NOT NULL,
  `status` varchar(12) NOT NULL,
  `product_id` bigint NOT NULL,
  `registrations_closed` tinyint(1) NOT NULL,
  `cancellation_message` longtext NOT NULL,
  `cancelled_at` datetime(6) DEFAULT NULL,
  `is_weekly` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `tournaments_tournament_status_73d940aa` (`status`),
  CONSTRAINT `tournaments_tournament_product_id_634357b1_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `tournaments_capacity_positive` CHECK ((`max_capacity` >= 1)),
  CONSTRAINT `tournaments_tournament_chk_1` CHECK ((`max_capacity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tournaments_tournamentregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournaments_tournamentregistration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `participant_name` varchar(200) NOT NULL,
  `participant_email` varchar(254) NOT NULL,
  `status` varchar(20) NOT NULL,
  `attendance_status` varchar(20) NOT NULL,
  `attendance_method` varchar(12) NOT NULL,
  `attendance_checked_at` datetime(6) DEFAULT NULL,
  `attendance_checked_by_id` int DEFAULT NULL,
  `order_id` bigint NOT NULL,
  `tournament_id` bigint NOT NULL,
  `user_id` int DEFAULT NULL,
  `confirmation_email_sent_at` datetime(6) DEFAULT NULL,
  `qr_email_sent_at` datetime(6) DEFAULT NULL,
  `rescheduled_to_id` bigint DEFAULT NULL,
  `cancelled_by_customer_at` datetime(6) DEFAULT NULL,
  `rescheduled_at` datetime(6) DEFAULT NULL,
  `rescheduled_by_id` int DEFAULT NULL,
  `hidden_by_customer_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  UNIQUE KEY `rescheduled_to_id` (`rescheduled_to_id`),
  KEY `tourn_reg_list_idx` (`tournament_id`,`status`,`created_at`),
  KEY `tourn_reg_email_idx` (`tournament_id`,`participant_email`),
  KEY `tournaments_tourname_attendance_checked_b_5888bf2a_fk_auth_user` (`attendance_checked_by_id`),
  KEY `tournaments_tourname_user_id_b0b0eac5_fk_auth_user` (`user_id`),
  KEY `tournaments_tournamentregistration_status_105dcb47` (`status`),
  KEY `tournaments_tourname_rescheduled_by_id_749d9532_fk_auth_user` (`rescheduled_by_id`),
  CONSTRAINT `tournaments_tourname_attendance_checked_b_5888bf2a_fk_auth_user` FOREIGN KEY (`attendance_checked_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `tournaments_tourname_order_id_f3e225fc_fk_orders_or` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `tournaments_tourname_rescheduled_by_id_749d9532_fk_auth_user` FOREIGN KEY (`rescheduled_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `tournaments_tourname_rescheduled_to_id_a4d600ca_fk_tournamen` FOREIGN KEY (`rescheduled_to_id`) REFERENCES `tournaments_tournamentregistration` (`id`),
  CONSTRAINT `tournaments_tourname_tournament_id_ae9a3536_fk_tournamen` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments_tournament` (`id`),
  CONSTRAINT `tournaments_tourname_user_id_b0b0eac5_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`todofreak`@`%`*/ /*!50003 TRIGGER `tournaments_capacity_before_insert` BEFORE INSERT ON `tournaments_tournamentregistration` FOR EACH ROW BEGIN
    DECLARE v_active_count INT;
    DECLARE v_max INT;
    DECLARE v_new_expires_at DATETIME(6);
    DECLARE v_new_is_active BOOLEAN DEFAULT FALSE;

    IF NEW.status = 'confirmed' THEN
        SET v_new_is_active = TRUE;
    ELSEIF NEW.status = 'pending_payment' THEN
        SELECT payment_expires_at INTO v_new_expires_at
        FROM orders_order WHERE id = NEW.order_id;
        IF v_new_expires_at IS NOT NULL AND v_new_expires_at > UTC_TIMESTAMP(6) THEN
            SET v_new_is_active = TRUE;
        END IF;
    END IF;


    IF v_new_is_active THEN
        SELECT COUNT(*) INTO v_active_count
        FROM tournaments_tournamentregistration tr
        INNER JOIN orders_order o ON o.id = tr.order_id
        WHERE tr.tournament_id = NEW.tournament_id
          AND (
              tr.status = 'confirmed'
              OR (tr.status = 'pending_payment' AND o.payment_expires_at > UTC_TIMESTAMP(6))
          );
        SELECT max_capacity INTO v_max
        FROM tournaments_tournament
        WHERE id = NEW.tournament_id;
        IF v_active_count >= v_max THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'No quedan cupos disponibles para este torneo.';
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
DROP TABLE IF EXISTS `tournaments_tournamentvisual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournaments_tournamentvisual` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `placement` varchar(12) NOT NULL,
  `image` varchar(100) NOT NULL,
  `alt_text` varchar(200) NOT NULL,
  `display_order` int unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `tournament_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tournaments_tourname_tournament_id_249bfbef_fk_tournamen` (`tournament_id`),
  CONSTRAINT `tournaments_tourname_tournament_id_249bfbef_fk_tournamen` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments_tournament` (`id`),
  CONSTRAINT `tournaments_tournamentvisual_chk_1` CHECK ((`display_order` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users_supportactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_supportactivity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `method` varchar(10) NOT NULL,
  `path` varchar(255) NOT NULL,
  `status_code` smallint unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_supportactivity_user_id_134e07f1_fk_auth_user_id` (`user_id`),
  KEY `users_supportactivity_created_at_a20a2bd6` (`created_at`),
  CONSTRAINT `users_supportactivity_user_id_134e07f1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `users_supportactivity_chk_1` CHECK ((`status_code` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `role` varchar(20) NOT NULL,
  `pending_email` varchar(254) NOT NULL,
  `pending_staff_role` varchar(20) NOT NULL,
  `staff_invitation_nonce` char(32) DEFAULT NULL,
  `access_expires_at` datetime(6) DEFAULT NULL,
  `access_granted_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `users_userprofile_access_granted_by_id_cd692db9_fk_auth_user_id` (`access_granted_by_id`),
  CONSTRAINT `users_userprofile_access_granted_by_id_cd692db9_fk_auth_user_id` FOREIGN KEY (`access_granted_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `users_userprofile_user_id_87251ef1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

