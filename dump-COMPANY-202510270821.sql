-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: COMPANY
-- ------------------------------------------------------
-- Server version	8.0.30

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

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `DNumber` int NOT NULL,
  `DName` varchar(15) NOT NULL,
  `MgrSSN` char(9) NOT NULL,
  `MgrStartDate` date DEFAULT NULL,
  PRIMARY KEY (`DNumber`),
  UNIQUE KEY `Dept_DName_Unique` (`DName`),
  KEY `Dept_MgrSSN_FK` (`MgrSSN`),
  CONSTRAINT `Dept_MgrSSN_FK` FOREIGN KEY (`MgrSSN`) REFERENCES `Employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,'HRD','E001','2002-01-09'),(2,'FINANCE','E002','2003-02-27'),(3,'HUMAS','E003','2006-05-30'),(4,'PRODUKSI','E004','2005-05-08');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dependent`
--

DROP TABLE IF EXISTS `Dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dependent` (
  `ESSN` char(9) NOT NULL,
  `Dependent_Name` varchar(15) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `BDate` date DEFAULT NULL,
  `Relationship` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`ESSN`,`Dependent_Name`),
  CONSTRAINT `Dependent_ESSN_FK` FOREIGN KEY (`ESSN`) REFERENCES `Employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dependent`
--

LOCK TABLES `Dependent` WRITE;
/*!40000 ALTER TABLE `Dependent` DISABLE KEYS */;
INSERT INTO `Dependent` VALUES ('E001','Doni','M','2007-01-09','SON'),('E001','Rita','F','2005-09-18','DAUGHTER'),('E002','Roy','M','2006-12-15','SON'),('E002','Wawan','M','1984-10-23','HUSBAND'),('E003','Dewi','F','2006-01-01','DAUGHTER'),('E003','Roni','M','1985-08-23','HUSBAND'),('E004','Rani','M','2007-02-10','DAUGHTER'),('E004','Susi','F','1987-09-05','WIFE'),('E011','Dina','F','1987-01-13','WIFE'),('E011','Riko','M','2006-03-21','SON'),('E013','Rini','F','1987-08-15','WIFE'),('E013','Tina','F','2005-12-17','DAUGHTER'),('E014','Ayu','F','1988-12-08','WIFE'),('E014','Didiet','M','2006-12-05','SON');
/*!40000 ALTER TABLE `Dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dept_Locations`
--

DROP TABLE IF EXISTS `Dept_Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dept_Locations` (
  `DNum` int NOT NULL,
  `DLocation` varchar(15) NOT NULL,
  PRIMARY KEY (`DNum`,`DLocation`),
  CONSTRAINT `DLoc_DNum_FK` FOREIGN KEY (`DNum`) REFERENCES `Department` (`DNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dept_Locations`
--

LOCK TABLES `Dept_Locations` WRITE;
/*!40000 ALTER TABLE `Dept_Locations` DISABLE KEYS */;
INSERT INTO `Dept_Locations` VALUES (1,'Darmaga'),(2,'Darmaga'),(3,'Darmaga'),(4,'Baranang Siang');
/*!40000 ALTER TABLE `Dept_Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `SSN` char(9) NOT NULL,
  `FName` varchar(15) NOT NULL,
  `MName` char(1) DEFAULT NULL,
  `LName` varchar(15) NOT NULL,
  `BDate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `SuperSSN` char(9) DEFAULT NULL,
  `DNum` int NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `Employee_SuperSSN_FK` (`SuperSSN`),
  KEY `Employee_DNum_FK` (`DNum`),
  CONSTRAINT `Employee_DNum_FK` FOREIGN KEY (`DNum`) REFERENCES `Department` (`DNumber`),
  CONSTRAINT `Employee_SuperSSN_FK` FOREIGN KEY (`SuperSSN`) REFERENCES `Employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('E001','Hakim',NULL,'Arifin','1987-01-12','BATENG','M',4000000.00,NULL,1),('E002','Yuni',NULL,'Arti','1987-02-15','BARA','F',5000000.00,NULL,2),('E003','Mutia',NULL,'Aziza','1987-03-23','BATENG','F',4000000.00,NULL,3),('E004','Hanif',NULL,'Affandi','1987-04-21','BARA','M',5000000.00,NULL,4),('E005','Vera',NULL,'Yunita','1987-05-16','BALEBAK','F',3500000.00,'E001',1),('E006','Pritasri',NULL,'Palupiningsih','1987-12-09','BADONENG','F',3500000.00,'E001',1),('E007','Rifki','Y','Haidar','1987-08-02','BATENG','M',3000000.00,'E001',1),('E008','Muhammad','A','Rosyidi','1987-06-22','PERUMDOS','M',2750000.00,'E001',1),('E009','Ferry',NULL,'Pratama','1987-07-11','BARA','M',5000000.00,'E002',2),('E010','Andi',NULL,'Sasmita','1987-02-15','BATENG','M',3000000.00,'E002',2),('E011','Yuhan','A','Kusuma','1987-03-16','BARA','M',5000000.00,'E002',2),('E012','Ferdian',NULL,'Feisal','1987-03-23','BATENG','M',2000000.00,'E002',2),('E013','Albertus','A','M','1986-05-22','BARA','M',5000000.00,'E003',3),('E014','Benedika','F','Hutabarat','1987-06-21','BADONENG','M',3250000.00,'E003',3);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DeleteEmployee` AFTER DELETE ON `employee` FOR EACH ROW INSERT INTO TransactionLog (TableName, Action, `Timestamp`)
    VALUES ('Employee', 'DELETE', current_timestamp()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Project` (
  `PNumber` int NOT NULL,
  `PName` varchar(15) NOT NULL,
  `PLocation` varchar(15) DEFAULT NULL,
  `DNum` int NOT NULL,
  PRIMARY KEY (`PNumber`),
  UNIQUE KEY `Project_PName_Unique` (`PName`),
  KEY `Project_DNum_FK` (`DNum`),
  CONSTRAINT `Project_DNum_FK` FOREIGN KEY (`DNum`) REFERENCES `Department` (`DNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES (1,'AAA','Bogor',1),(2,'BBB','Jakarta',2),(3,'CCC','Tangerang',2),(4,'DDD','Bekasi',2),(5,'EEE','Depok',3),(6,'FFF','Bogor',3),(7,'GGG','Tangerang',4),(8,'HHH','Jakarta',4);
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransactionLog`
--

DROP TABLE IF EXISTS `TransactionLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TransactionLog` (
  `TableName` varchar(50) NOT NULL,
  `Action` varchar(15) NOT NULL,
  `Timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransactionLog`
--

LOCK TABLES `TransactionLog` WRITE;
/*!40000 ALTER TABLE `TransactionLog` DISABLE KEYS */;
INSERT INTO `TransactionLog` VALUES ('Employee','DELETE','2024-09-23 08:33:33');
/*!40000 ALTER TABLE `TransactionLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Works_On`
--

DROP TABLE IF EXISTS `Works_On`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Works_On` (
  `ESSN` char(9) NOT NULL,
  `PNum` int NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`ESSN`,`PNum`),
  KEY `Works_PNum_FK` (`PNum`),
  CONSTRAINT `Works_ESSN_FK` FOREIGN KEY (`ESSN`) REFERENCES `Employee` (`SSN`),
  CONSTRAINT `Works_PNum_FK` FOREIGN KEY (`PNum`) REFERENCES `Project` (`PNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Works_On`
--

LOCK TABLES `Works_On` WRITE;
/*!40000 ALTER TABLE `Works_On` DISABLE KEYS */;
INSERT INTO `Works_On` VALUES ('E001',1,90.0),('E001',2,98.0),('E002',2,55.0),('E002',3,78.0),('E003',3,53.0),('E003',4,77.0),('E004',4,77.0),('E004',5,98.0),('E004',7,85.0),('E004',8,68.0),('E005',5,57.0),('E005',6,87.0),('E006',6,87.0),('E006',7,45.0),('E007',7,40.0),('E007',8,88.0),('E008',1,78.0),('E008',8,87.0),('E009',1,88.0),('E009',2,65.0),('E010',2,34.0),('E010',3,78.0),('E011',1,68.0),('E011',3,88.0);
/*!40000 ALTER TABLE `Works_On` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'COMPANY'
--
/*!50003 DROP PROCEDURE IF EXISTS `prod_new` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prod_new`(IN num INT)
BEGIN
SELECT SSN, FName, LName, e.DNum
FROM COMPANY.Employee e
WHERE e.DNum = num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_employee`(IN num INT)
BEGIN
SELECT SSN, FName, LName, e.DNum
FROM COMPANY.Employee e
WHERE e.DNum = num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-27  8:21:29
