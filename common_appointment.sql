CREATE DATABASE  IF NOT EXISTS `common_appointment_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `common_appointment_db`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: common_appointment_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('c40edbf54288');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `date` date NOT NULL,
  `time_slot` varchar(20) NOT NULL,
  `doctor_name` varchar(100) NOT NULL,
  `doctor_image` varchar(255) DEFAULT NULL,
  `doctor_specialty` varchar(100) NOT NULL,
  `doctor_rating` varchar(10) NOT NULL,
  `doctor_reviews` varchar(20) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `ix_appointments_id` (`id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,7,8,'2023-01-23','10:30 AM','Dr. Rakesh Iyer','https://randomuser.me/api/portraits/thumb/men/77.jpg','Physiotherapist','4.3','65','cancelled',NULL),(2,7,4,'2025-06-23','09.00 AM','Dr. Arjun Verma','https://randomuser.me/api/portraits/thumb/men/32.jpg','General','4.5','88','completed',NULL),(3,7,3,'2025-07-24','05:00 PM','Dr. Sneha Rao','https://randomuser.me/api/portraits/thumb/women/11.jpg','Cardiologist','4.8','120','upcoming',NULL),(4,6,3,'2025-06-24','03:00 PM','Dr. Sneha Rao','https://randomuser.me/api/portraits/thumb/women/11.jpg','Cardiologist','4.8','120','cancelled',NULL),(5,6,1,'2025-06-23','04.00 PM','Dr. Swathi','https://randomuser.me/api/portraits/thumb/women/44.jpg','General','4.7','115','cancelled',NULL),(6,6,1,'2025-06-25','04.00 PM','Dr. Swathi','https://randomuser.me/api/portraits/thumb/women/44.jpg','General','4.7','115','upcoming','2025-06-23 18:58:48'),(7,7,7,'2025-06-27','10.30 AM','Dr. Anjali Sharma','https://randomuser.me/api/portraits/thumb/women/29.jpg','Surgeon','4.8','102','upcoming',NULL),(8,6,5,'2025-06-25','03.00 PM','Dr. Kavya Nair','https://randomuser.me/api/portraits/thumb/women/15.jpg','Gynecologist','4.9','134','cancelled','2025-06-23 18:58:35'),(9,7,9,'2025-06-22','04.30 PM','Dr. Neha Sinha','https://randomuser.me/api/portraits/thumb/women/68.jpg','Cardiologist','4.4','94','upcoming',NULL),(10,7,4,'2025-06-23','10.30 AM','Dr. Arjun Verma','https://randomuser.me/api/portraits/thumb/men/32.jpg','General','4.5','88','upcoming',NULL),(11,7,10,'2025-06-27','03.00 PM','Dr. Rahul Deshmukh','https://randomuser.me/api/portraits/thumb/men/11.jpg','Dentist','4.7','109','upcoming',NULL),(12,6,2,'2025-06-22','11.30 AM','Dr. Priya Mehta','https://randomuser.me/api/portraits/thumb/women/10.jpg','Cardiologist','4.7','120','upcoming',NULL),(13,6,2,'2025-06-22','11.00 AM','Dr. Priya Mehta','https://randomuser.me/api/portraits/thumb/women/10.jpg','Cardiologist','4.7','120','upcoming',NULL),(14,6,2,'2025-06-22','11.00 AM','Dr. Priya Mehta','https://randomuser.me/api/portraits/thumb/women/10.jpg','Cardiologist','4.7','120','upcoming',NULL),(15,6,2,'2025-06-22','11.00 AM','Dr. Priya Mehta','https://randomuser.me/api/portraits/thumb/women/10.jpg','Cardiologist','4.7','120','upcoming',NULL),(16,6,9,'2025-06-29','11.30 AM','Dr. Neha Sinha','https://randomuser.me/api/portraits/thumb/women/68.jpg','Cardiologist','4.4','94','upcoming',NULL),(17,6,9,'2025-06-29','09.00 AM','Dr. Neha Sinha','https://randomuser.me/api/portraits/thumb/women/68.jpg','Cardiologist','4.4','94','upcoming',NULL),(18,3,1,'2025-06-22','11.30 AM','Dr. Swathi','https://randomuser.me/api/portraits/thumb/women/44.jpg','General','4.7','115','upcoming',NULL),(19,3,2,'2025-06-25','11.00 AM','Dr. Priya Mehta','https://randomuser.me/api/portraits/thumb/women/10.jpg','Cardiologist','4.7','120','cancelled',NULL),(20,6,4,'2025-06-23','10.30 AM','Dr. Arjun Verma','https://randomuser.me/api/portraits/thumb/men/32.jpg','General','4.5','88','upcoming',NULL),(21,6,4,'2025-06-23','04.30 PM','Dr. Arjun Verma','https://randomuser.me/api/portraits/thumb/men/32.jpg','General','4.5','88','cancelled',NULL),(22,10,2,'2025-06-27','11.30 AM','Dr. Priya Mehta','https://randomuser.me/api/portraits/thumb/women/10.jpg','Cardiologist','4.7','120','cancelled','2025-06-24 09:02:51'),(23,10,1,'2025-06-24','04.00 PM','Dr. Swathi','https://randomuser.me/api/portraits/thumb/women/44.jpg','General','4.7','115','cancelled','2025-06-25 16:37:52'),(24,6,8,'2025-06-24','09.30 AM','Dr. Rakesh Iyer','https://randomuser.me/api/portraits/thumb/men/77.jpg','Physiotherapist','4.3','65','upcoming','2025-06-23 21:09:25'),(25,16,1,'2025-06-24','11.30 AM','Dr. Swathi','https://randomuser.me/api/portraits/thumb/women/44.jpg','General','4.7','115','upcoming','2025-06-23 21:25:22'),(26,17,1,'2025-06-25','04.30 PM','Dr. Swathi','https://randomuser.me/api/portraits/thumb/women/44.jpg','General','4.7','115','upcoming','2025-06-24 06:10:04'),(27,10,2,'2025-06-25','10.30 AM','Dr. Priya Mehta','https://randomuser.me/api/portraits/thumb/women/10.jpg','Cardiologist','4.7','120','completed','2025-06-24 10:31:52'),(28,10,7,'2025-06-28','11.00 AM','Dr. Anjali Sharma','https://randomuser.me/api/portraits/thumb/women/29.jpg','Surgeon','4.8','102','cancelled','2025-06-25 05:25:56'),(29,10,6,'2025-06-26','10.00 AM','Dr. Manish Patel','https://randomuser.me/api/portraits/thumb/men/45.jpg','Dentist','4.6','76','cancelled','2025-06-25 16:42:21'),(30,10,3,'2025-06-25','04.30 PM','Dr. Sneha Rao','https://randomuser.me/api/portraits/thumb/women/11.jpg','Cardiologist','4.8','120','upcoming','2025-06-25 16:42:15'),(31,10,8,'2025-06-25','10.00 AM','Dr. Rakesh Iyer','https://randomuser.me/api/portraits/thumb/men/77.jpg','Physiotherapist','4.3','65','upcoming','2025-06-25 05:47:50'),(32,10,10,'2025-06-25','11.30 AM','Dr. Rahul Deshmukh','https://randomuser.me/api/portraits/thumb/men/11.jpg','Dentist','4.7','109','upcoming','2025-06-25 05:53:14'),(33,10,5,'2025-06-29','04.30 PM','Dr. Kavya Nair','https://randomuser.me/api/portraits/thumb/women/15.jpg','Gynecologist','4.9','134','upcoming','2025-06-25 16:37:34');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `specialty` varchar(255) NOT NULL,
  `rating` float DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `review_count` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_doctors_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Dr. Swathi','General',4.7,'Parvathipuram','https://randomuser.me/api/portraits/thumb/women/44.jpg',115),(2,'Dr. Priya Mehta','Cardiologist',4.7,'Mumbai','https://randomuser.me/api/portraits/thumb/women/10.jpg',120),(3,'Dr. Sneha Rao','Cardiologist',4.8,'Bangalore','https://randomuser.me/api/portraits/thumb/women/11.jpg',120),(4,'Dr. Arjun Verma','General',4.5,'Delhi','https://randomuser.me/api/portraits/thumb/men/32.jpg',88),(5,'Dr. Kavya Nair','Gynecologist',4.9,'Kochi','https://randomuser.me/api/portraits/thumb/women/15.jpg',134),(6,'Dr. Manish Patel','Dentist',4.6,'Ahmedabad','https://randomuser.me/api/portraits/thumb/men/45.jpg',76),(7,'Dr. Anjali Sharma','Surgeon',4.8,'Pune','https://randomuser.me/api/portraits/thumb/women/29.jpg',102),(8,'Dr. Rakesh Iyer','Physiotherapist',4.3,'Chennai','https://randomuser.me/api/portraits/thumb/men/77.jpg',65),(9,'Dr. Neha Sinha','Cardiologist',4.4,'Hyderabad','https://randomuser.me/api/portraits/thumb/women/68.jpg',94),(10,'Dr. Rahul Deshmukh','Dentist',4.7,'Nagpur','https://randomuser.me/api/portraits/thumb/men/11.jpg',109);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `anotheremail` varchar(100) DEFAULT NULL,
  `dateofbirth` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_users_email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `ix_users_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'prameshkumar431@gmail.com','$2b$12$o7TIT7iFo5CrlkvzcF7kXeyzymse.UiseKkMox5NGSuHcuZ5c4JIm','male','ramesh1234','Ramesh Babu','uploads/12fef99c-a7c6-4d15-8d26-e6e92d0edd2e/profile.jpg','babu','babu@gmail.com','23-09-1999'),(2,'uttej431@gmail.com','$2b$12$wpvCMeScm3kkOBXMfJJ5mOvRRHPJwX0EunSZktd87BUXrhYt6.8h2','male','uttej1234','Uttej Kumar',NULL,'uttej','uttej.kumar@ctctechservices.com','23-07-1988'),(3,'venkatrajesh@gmail.com','$2b$12$tXlsl7rhDI1y7iE7u/wbPec6quiw4pvv9sRTKHc/SWkIEY8iF67gC','Male','venkat1234','venkat rajesh','uploads/4127e961-e5dc-4941-839c-eb0ccb3edab4/profile.jpg','raja','venkatrajeshghhh@gmail.com','2005-06-19'),(4,'neelima@gmail.com','$2b$12$cSWlA0p/UINEG6azW7y31.zHj676R5DpRlRMk4jQcyAoj7GVyu.YG','Male','neelima1234','neelima battula','uploads/1762bd70-c78b-4353-b34e-4efe78534127/profile.jpg','neelu','neelimarajesh','2005-06-12'),(5,'swathi@gmail.com','$2b$12$m/rtDn5oJOvD8y//c90Sa.t0irqqXZdhfmjudSAB2lOfYz0Q5vDfC','Female','swathi1234','swathi battula','uploads/ca1fbf8b-be55-4e4c-aef8-f1474dd1e5e5/profile.jpg','swathi','swathiii@gmail.com','2005-06-05'),(6,'mohini@gmail.com','$2b$12$/nkBHmZPrCOLdvYgHvnN2.iAJ80jK3e9GvHoxqFxV4ybndEvSEY0a','Female','mohini1234','mohini gupta','uploads/1bd03d73-1abd-4867-aadd-641495a04e9b/profile.jpg','bdnd','re@gmail.com','2005-06-19'),(7,'gayatri@gmail.com','$2b$12$gKreEHmWqYuU5K.hoH40IOtDI8jTG10oDr1DymQk731GQG7h05mgi','Male','gayatri1234','gayatri devi','uploads/c296cd9b-55bb-468a-8edd-d8555d6a8368/profile.jpg','gayi','gayi@gmail.com','2005-06-05'),(8,'siri@gmail.com','$2b$12$IVEC5vho.xWOitPkwtCfgOsKw195NCe72CijQVLzP8WNRvKQ6RcoK','Male','siri','siriiii','uploads/efe59ef6-52c8-4845-8ac6-3fc14b9ab3b0/profile.jpg','saru','saru@gmail.com','2005-06-19'),(9,'rakesh431@gmail.com','$2b$12$d8pEVxzEKQmGOAXOmUvTgOw3gpEgHOBPsMBgESStiIQv.WAGcOYpy','male','rakesh1234','Rakesh Kumar','uploads/a06c4b73-2265-4ddd-9ca5-fad7c254c9a3/profile.jpeg','rakesh','rakesh.kumar@ctctechservices.com','23-07-1989'),(10,'uday@gmail.com','$2b$12$M/CN4ZMYWz.28/rqud6yIur7rYR8895zhr/0O.FJjLH8IuFE0p8fe','Male','uday1234','uday karee','uploads/b79ab848-37bd-45d8-8373-5d12449138b0/profile.jpg','ndn','gh@gmail.com','2005-06-12'),(11,'deepika@gmail.com','$2b$12$EzoQAsrkA1r2KnlOyuymguMvpdG4xbuhwgKAeJQ3er807ghDwUHRm','Female','deepika1234','deepika','uploads/5c3ee1b8-ae9f-447f-8062-704a35f2ef95/profile.jpg','deepu','deepu@gmail.com','2005-06-20'),(12,'shyamla@gmail.com','$2b$12$Wtw4stbBVrV9hwLX97izXugJJFQR/d1emDYrX7AtZr28v0Kc2TUai','Female','shyamla1234','shyamla devi','uploads/4050f9ab-1799-4d32-8dab-14a563472482/profile.jpg','shyamu','shyam@gmail.com','2005-06-12'),(13,'omprakash@gmail.com','$2b$12$75dnIlTTZR/tBAmj5oGg9edRR3R2um2X/dgmhsWAo.vj476VlrEUK','Male','omprakash1234','omprakash nirmalkar','uploads/4c9702e3-e21c-416e-9068-0c2640eac430/profile.jpg','omprakash','omprash@gmail.com','2005-06-19'),(14,'abhishek@gmail.com','$2b$12$CJh7c0Er6YAJUBpaVQRilOh.PuXaIo3H9YIoXJlNO.EOXTEd3CZ6W','Male','abhishek1234','abhishek agarwal','uploads/542ee464-477a-43d0-a94a-73a67a46ba9c/profile.jpg','abhi','abhi@gmail.com','2005-06-17'),(15,'raji@gmail.com','$2b$12$birTmZalZ11hwmU/iWGqR.Zl9Dkfsez2AjklS9HtljayKjzXnWiva','Female','rajyalakshmi1234','rajyam','uploads/7fa7a042-db35-4b75-9876-43742549a43d/profile.jpg','rahiii','rajyam@gnail.com','2005-06-12'),(16,'praveena@gmail.com','$2b$12$/fCfYRjcg7nfHRTF6pFSp.bhjOa1vUYB8Cy4Q0G1VSMhxpItI.ru6','Female','praveena1234','praveena mungra','uploads/972cffe0-1664-4241-83b3-035a6c956986/profile.jpg','mungara','mungara@gmail.com','2005-06-12'),(17,'tousif@gmail.com','$2b$12$rogDABZyxyLySzzsUlodGuMAE5/kf0QHLqgE3yZVlwqL0gMEAYWRy','Male','tousif123','tousif ahmed','uploads/ea8d63ad-da98-4887-8397-940827fd599f/profile.jpg','ahmed','ahmed@gmail.com','2005-06-12');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-21 22:20:33
