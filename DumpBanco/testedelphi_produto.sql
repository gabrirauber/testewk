-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: testedelphi
-- ------------------------------------------------------
-- Server version	5.7.44-log

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
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(60) DEFAULT NULL,
  `precovenda` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nomeprod` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Teclado Mecânico',250.00),(2,'Mouse Gamer',150.00),(3,'Monitor Full HD 24\"',800.00),(4,'Cadeira Gamer',1200.00),(5,'Notebook i5',3500.00),(6,'Headset Bluetooth',300.00),(7,'Placa de Vídeo GTX 1660',2200.00),(8,'Processador Ryzen 5',1200.00),(9,'Memória RAM 8GB',300.00),(10,'SSD 480GB',400.00),(11,'Fonte 600W',350.00),(12,'Gabinete ATX',250.00),(13,'Smartphone Android',2000.00),(14,'Teclado Sem Fio',120.00),(15,'Mouse Óptico',50.00),(16,'Monitor 4K 27\"',1800.00),(17,'Cooler para CPU',100.00),(18,'Placa Mãe ATX',800.00),(19,'Memória RAM 16GB',600.00),(20,'HD 1TB',350.00),(21,'Webcam Full HD',200.00),(22,'Microfone Condensador',450.00),(23,'Tablet 10\"',1300.00),(24,'Carregador Portátil',90.00),(25,'Mousepad Grande',45.00),(26,'Placa de Som USB',150.00),(27,'Hub USB 3.0',80.00),(28,'Cabo HDMI 2m',30.00),(29,'Monitor Ultrawide 29\"',1900.00),(30,'Câmera de Segurança',600.00),(31,'Web Cam',250.50);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-30  1:46:07
