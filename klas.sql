-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: klas
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advisor` (
  `s_id` varchar(10) NOT NULL,
  `i_id` varchar(45) NOT NULL,
  PRIMARY KEY (`s_id`),
  KEY `i_id_idx` (`i_id`),
  CONSTRAINT `i_id` FOREIGN KEY (`i_id`) REFERENCES `person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `s_id` FOREIGN KEY (`s_id`) REFERENCES `person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisor`
--

LOCK TABLES `advisor` WRITE;
/*!40000 ALTER TABLE `advisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` varchar(14) NOT NULL,
  `title` varchar(45) NOT NULL,
  `dept_name` varchar(45) NOT NULL,
  `kind` char(2) NOT NULL,
  `credits` int NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_name_idx` (`dept_name`),
  CONSTRAINT `course_dept_name` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('6030-2-0779-01','상미분방정식론','수학과','전선',3),('6030-2-1821-01','해석학1','수학과','전필',3),('6030-2-9639-01','일반기하학','수학과','전선',3),('H030-2-1234-01','진로탐색및설계','소프트웨어학부','전선',1),('H030-3-0969-02','알고리즘','소프트웨어학부','전선',3),('H030-3-3663-01','데이터베이스','소프트웨어학부','전선',3),('H030-3-6899-01','휴먼컴퓨터인터페이스','소프트웨어학부','전선',3),('H030-3-8485-03','응용소프트웨어실습','소프트웨어학부','전필',3);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_name` varchar(45) NOT NULL,
  `college` varchar(45) NOT NULL,
  `building` varchar(45) NOT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('소프트웨어학부','소프트웨어융합대학','새빛관'),('수학과','자연과학대학','옥의관');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_list`
--

DROP TABLE IF EXISTS `notice_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_list` (
  `course_id` varchar(14) NOT NULL,
  `notice_id` int NOT NULL,
  `notice_type` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `writer_id` varchar(10) NOT NULL,
  `importance` tinyint DEFAULT NULL,
  `content` mediumtext,
  `file` varchar(45) DEFAULT NULL,
  `hits` int DEFAULT NULL,
  PRIMARY KEY (`course_id`,`notice_id`),
  KEY `notice_writer_id_idx` (`writer_id`),
  KEY `notice_type_idx` (`notice_type`),
  CONSTRAINT `notice_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notice_type` FOREIGN KEY (`notice_type`) REFERENCES `notice_type` (`notice_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notice_writer_id` FOREIGN KEY (`writer_id`) REFERENCES `person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_list`
--

LOCK TABLES `notice_list` WRITE;
/*!40000 ALTER TABLE `notice_list` DISABLE KEYS */;
INSERT INTO `notice_list` VALUES ('H030-3-0969-02',0,'강의 공지사항','익명게시판 답변영상 업로드 알림 (13주차 3회)','2021-05-29 14:14:00','2019203039',0,NULL,NULL,0),('H030-3-6899-01',0,'수시퀴즈','Motion Processing','2021-05-28 00:00:00','2019203039',0,NULL,NULL,0);
/*!40000 ALTER TABLE `notice_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_type`
--

DROP TABLE IF EXISTS `notice_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_type` (
  `notice_type` varchar(45) NOT NULL,
  PRIMARY KEY (`notice_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_type`
--

LOCK TABLES `notice_type` WRITE;
/*!40000 ALTER TABLE `notice_type` DISABLE KEYS */;
INSERT INTO `notice_type` VALUES ('강의 공지사항'),('강의 자료실'),('과제제출'),('설문참여'),('수시퀴즈'),('온라인시험'),('팀프로젝트');
/*!40000 ALTER TABLE `notice_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password`
--

DROP TABLE IF EXISTS `password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password` (
  `ID` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `password_ID` FOREIGN KEY (`ID`) REFERENCES `person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password`
--

LOCK TABLES `password` WRITE;
/*!40000 ALTER TABLE `password` DISABLE KEYS */;
INSERT INTO `password` VALUES ('2019203039','alstn2512!');
/*!40000 ALTER TABLE `password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `ID` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dept_name` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  `birth_date` varchar(8) NOT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name_idx` (`dept_name`),
  CONSTRAINT `person_dept_name` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('2019203039','송민수','남','소프트웨어학부','학부생','19990423','01092776792');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prereq`
--

DROP TABLE IF EXISTS `prereq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prereq` (
  `course_id` varchar(14) NOT NULL,
  `prereq_id` varchar(14) NOT NULL,
  PRIMARY KEY (`course_id`,`prereq_id`),
  KEY `prereq_id_idx` (`prereq_id`),
  CONSTRAINT `prereq_course_id_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prereq_course_id_2` FOREIGN KEY (`prereq_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prereq`
--

LOCK TABLES `prereq` WRITE;
/*!40000 ALTER TABLE `prereq` DISABLE KEYS */;
/*!40000 ALTER TABLE `prereq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `course_id` varchar(14) NOT NULL,
  `semester` int NOT NULL,
  `year` int NOT NULL,
  `building` varchar(45) DEFAULT NULL,
  `room_number` varchar(4) DEFAULT NULL,
  `time_slot_1` varchar(10) NOT NULL,
  `time_slot_2` varchar(10) DEFAULT NULL,
  `time_slot_3` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`course_id`,`semester`,`year`),
  CONSTRAINT `section_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('6030-2-0779-01',1,2021,'옥의관','205','화5','목6',NULL),('6030-2-1821-01',1,2021,'옥의관','101','화2','목1',NULL),('6030-2-9639-01',1,2021,'옥의관','207','월3','수4',NULL),('H030-2-1234-01',1,2021,NULL,NULL,'화3',NULL,NULL),('H030-3-0969-02',1,2021,'',NULL,'월6',NULL,NULL),('H030-3-3663-01',1,2021,'새빛관','204','화1','목2',NULL),('H030-3-6899-01',1,2021,'새빛관','204','','수5',NULL),('H030-3-8485-03',1,2021,'새빛관','301','금0','금1','금2');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `takes` (
  `ID` varchar(10) NOT NULL,
  `course_id` varchar(14) NOT NULL,
  `semester` int NOT NULL,
  `year` int NOT NULL,
  `grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`,`course_id`,`semester`,`year`),
  KEY `takes_sec_idx` (`course_id`,`semester`,`year`),
  CONSTRAINT `takes_ID` FOREIGN KEY (`ID`) REFERENCES `person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `takes_sec` FOREIGN KEY (`course_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `semester`, `year`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
INSERT INTO `takes` VALUES ('2019203039','6030-2-0779-01',1,2021,NULL),('2019203039','6030-2-1821-01',1,2021,NULL),('2019203039','6030-2-9639-01',1,2021,NULL),('2019203039','H030-2-1234-01',1,2021,NULL),('2019203039','H030-3-0969-02',1,2021,NULL),('2019203039','H030-3-3663-01',1,2021,NULL),('2019203039','H030-3-6899-01',1,2021,NULL),('2019203039','H030-3-8485-03',1,2021,NULL);
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaches` (
  `ID` varchar(10) NOT NULL,
  `course_id` varchar(14) NOT NULL,
  `semester` int NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (`ID`,`course_id`,`semester`,`year`),
  KEY `teaches_sec_idx` (`course_id`,`semester`,`year`),
  CONSTRAINT `teaches_ID` FOREIGN KEY (`ID`) REFERENCES `person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teaches_sec` FOREIGN KEY (`course_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `semester`, `year`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-30 16:55:00
