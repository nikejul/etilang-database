-- MySQL dump 10.13  Distrib 26.7.0, for macos15 (x86_64)
--
-- Host: localhost    Database: etilang_db
-- ------------------------------------------------------
-- Server version	26.7.0

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
-- Table structure for table `DriverViolation`
--

DROP TABLE IF EXISTS `DriverViolation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DriverViolation` (
  `DriverViolationID` int NOT NULL,
  `DriverID` int DEFAULT NULL,
  `ViolationID` int DEFAULT NULL,
  `TanggalPelanggaran` date DEFAULT NULL,
  PRIMARY KEY (`DriverViolationID`),
  KEY `DriverID` (`DriverID`),
  KEY `ViolationID` (`ViolationID`),
  CONSTRAINT `driverviolation_ibfk_1` FOREIGN KEY (`DriverID`) REFERENCES `User` (`UserID`),
  CONSTRAINT `driverviolation_ibfk_2` FOREIGN KEY (`ViolationID`) REFERENCES `Violation` (`ViolationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DriverViolation`
--

LOCK TABLES `DriverViolation` WRITE;
/*!40000 ALTER TABLE `DriverViolation` DISABLE KEYS */;
INSERT INTO `DriverViolation` VALUES (1,2,1,'2023-11-01'),(2,3,2,'2023-11-03'),(3,2,3,'2023-11-05');
/*!40000 ALTER TABLE `DriverViolation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EtilangTransaction`
--

DROP TABLE IF EXISTS `EtilangTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EtilangTransaction` (
  `TransactionID` int NOT NULL,
  `DriverID` int DEFAULT NULL,
  `ViolationID` int DEFAULT NULL,
  `TanggalTransaksi` date DEFAULT NULL,
  `StatusPembayaran` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `DriverID` (`DriverID`),
  KEY `ViolationID` (`ViolationID`),
  CONSTRAINT `etilangtransaction_ibfk_1` FOREIGN KEY (`DriverID`) REFERENCES `User` (`UserID`),
  CONSTRAINT `etilangtransaction_ibfk_2` FOREIGN KEY (`ViolationID`) REFERENCES `Violation` (`ViolationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EtilangTransaction`
--

LOCK TABLES `EtilangTransaction` WRITE;
/*!40000 ALTER TABLE `EtilangTransaction` DISABLE KEYS */;
INSERT INTO `EtilangTransaction` VALUES (1,2,1,'2023-11-02','Lunas'),(2,3,2,'2023-11-04','Belum Lunas'),(3,2,3,'2023-11-06','Belum Lunas'),(4,3,4,'2023-11-09','Belum Lunas');
/*!40000 ALTER TABLE `EtilangTransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `UserID` int NOT NULL,
  `Username` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Nama` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Alamat` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Role` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'admin','contoh_password','Administrator','Bandung','admin'),(2,'budi','contoh_password','Budi Santoso','Jl. Merdeka No. 10, Bandung','pengemudi'),(3,'sari','contoh_password','Sari Wulandari','Jl. Asia Afrika No. 5, Bandung','pengemudi');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle`
--

DROP TABLE IF EXISTS `Vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vehicle` (
  `VehicleID` int NOT NULL,
  `NomorPolisi` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Merk` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Tipe` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DriverID` int DEFAULT NULL,
  PRIMARY KEY (`VehicleID`),
  KEY `DriverID` (`DriverID`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`DriverID`) REFERENCES `User` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle`
--

LOCK TABLES `Vehicle` WRITE;
/*!40000 ALTER TABLE `Vehicle` DISABLE KEYS */;
INSERT INTO `Vehicle` VALUES (1,'D 1234 AB','Honda','Vario 125',2),(2,'D 5678 CD','Yamaha','NMAX',3);
/*!40000 ALTER TABLE `Vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Violation`
--

DROP TABLE IF EXISTS `Violation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Violation` (
  `ViolationID` int NOT NULL,
  `NamaPelanggaran` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Denda` decimal(10,2) DEFAULT NULL,
  `Deskripsi` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`ViolationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Violation`
--

LOCK TABLES `Violation` WRITE;
/*!40000 ALTER TABLE `Violation` DISABLE KEYS */;
INSERT INTO `Violation` VALUES (1,'Tidak memakai helm',250000.00,'Pengendara motor tidak memakai helm SNI'),(2,'Melanggar lampu merah',500000.00,'Menerobos lampu lalu lintas saat merah'),(3,'Tidak membawa SIM',250000.00,'Tidak dapat menunjukkan SIM saat pemeriksaan'),(4,'Melawan arus',500000.00,'Berkendara berlawanan arah dengan arus lalu lintas'),(5,'Tidak membawa STNK',250000.00,'Tidak dapat menunjukkan STNK saat pemeriksaan'),(6,'Melebihi batas kecepatan',500000.00,'Berkendara melebihi batas kecepatan yang ditetapkan'),(7,'Melebihi muatan',350000.00,'Berkendara lebih dari seharusnya');
/*!40000 ALTER TABLE `Violation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-29 15:35:31
