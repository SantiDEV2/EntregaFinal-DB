-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: localhost    Database: dbproj
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `idDiscount` int NOT NULL AUTO_INCREMENT,
  `idProduct` int NOT NULL,
  `discount` int NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`idDiscount`),
  KEY `discount_product_idx` (`idProduct`),
  CONSTRAINT `discount_product` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,1,10,NULL,NULL),(2,2,15,NULL,NULL);
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `idGame` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `developer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGame`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'SimsStore','Alfateam');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `idProductCategory` int NOT NULL,
  `idProductRarity` int NOT NULL,
  `idGame` int NOT NULL,
  `imgURL` varchar(200) NOT NULL,
  `name` varchar(45) NOT NULL,
  `salePrice` float DEFAULT NULL,
  `rentPrice` float DEFAULT NULL,
  `sprite` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `product_productCategory_idx` (`idProductCategory`),
  KEY `product_productRarity_idx` (`idProductRarity`),
  KEY `product_game_idx` (`idGame`),
  CONSTRAINT `product_game` FOREIGN KEY (`idGame`) REFERENCES `game` (`idGame`),
  CONSTRAINT `product_productCategory` FOREIGN KEY (`idProductCategory`) REFERENCES `productcategory` (`idProductCategory`),
  CONSTRAINT `product_productRarity` FOREIGN KEY (`idProductRarity`) REFERENCES `productrarity` (`idProductRarity`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,3,1,'img1.jpg','Santa Hat',499.99,19.99,'hat_1'),(2,2,2,1,'img2.jpg','Green Elf Hat',79.99,5.99,'hat_2'),(3,3,3,1,'img3.jpg','Blue Elf Hat',149.99,10.99,'hat_3'),(4,3,4,1,'img4.jpg','Orange Elf Hat',299.99,14.99,'hat_4'),(5,1,1,1,'img5.jpg','Red Elf Hat',59.99,3.99,'hat_5'),(6,2,4,1,'img6.jpg','Purple Elf Hat',399.99,18.99,'hat_6'),(7,1,2,1,'img7.jpg','Pink Elf Hat',89.99,6.99,'hat_7');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcategory` (
  `idProductCategory` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `descript` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idProductCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategory`
--

LOCK TABLES `productcategory` WRITE;
/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` VALUES (1,'Hat','Sombreros y accesorios para la cabeza'),(2,'Torso','Prendas para el torso y armaduras'),(3,'Legs','Prendas para las piernas y pantalones');
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productrarity`
--

DROP TABLE IF EXISTS `productrarity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productrarity` (
  `idProductRarity` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  PRIMARY KEY (`idProductRarity`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productrarity`
--

LOCK TABLES `productrarity` WRITE;
/*!40000 ALTER TABLE `productrarity` DISABLE KEYS */;
INSERT INTO `productrarity` VALUES (1,'Común','Objetos verdes básicos',0),(2,'Raro','Objetos azules poco comunes',30),(3,'Épico','Objetos morados de alta calidad',60),(4,'Legendario','Objetos amarillos extremadamente raros',90);
/*!40000 ALTER TABLE `productrarity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent`
--

DROP TABLE IF EXISTS `rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent` (
  `idRent` int NOT NULL AUTO_INCREMENT,
  `idUser` int unsigned NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`idRent`),
  KEY `rent_user_idx` (`idUser`),
  CONSTRAINT `rent_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent`
--

LOCK TABLES `rent` WRITE;
/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
INSERT INTO `rent` VALUES (1,1,'2025-05-01'),(2,1,'2025-05-10');
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentdetail`
--

DROP TABLE IF EXISTS `rentdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentdetail` (
  `idRent` int NOT NULL,
  `idProduct` int NOT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`idRent`,`idProduct`),
  KEY `rentDetail_product_idx` (`idProduct`),
  CONSTRAINT `rentDetail_product` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `rentDetail_rent` FOREIGN KEY (`idRent`) REFERENCES `rent` (`idRent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentdetail`
--

LOCK TABLES `rentdetail` WRITE;
/*!40000 ALTER TABLE `rentdetail` DISABLE KEYS */;
INSERT INTO `rentdetail` VALUES (1,1,15),(1,4,5),(2,6,10),(2,7,25);
/*!40000 ALTER TABLE `rentdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `idSale` int NOT NULL AUTO_INCREMENT,
  `idUser` int unsigned NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`idSale`),
  KEY `sale_user_idx` (`idUser`),
  CONSTRAINT `sale_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,1,'2025-05-03'),(2,1,'2025-05-12'),(3,2,'2025-05-15'),(4,2,'2025-05-20');
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saledetail`
--

DROP TABLE IF EXISTS `saledetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saledetail` (
  `idSale` int NOT NULL,
  `idProduct` int NOT NULL,
  `price` float DEFAULT NULL,
  `idDiscount` int DEFAULT NULL,
  PRIMARY KEY (`idSale`,`idProduct`),
  KEY `sellDetail_product_idx` (`idProduct`),
  KEY `saleDetail_discount_idx` (`idDiscount`),
  CONSTRAINT `saleDetail_discount` FOREIGN KEY (`idDiscount`) REFERENCES `discount` (`idDiscount`),
  CONSTRAINT `saleDetail_product` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `saleDetail_sale` FOREIGN KEY (`idSale`) REFERENCES `sale` (`idSale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saledetail`
--

LOCK TABLES `saledetail` WRITE;
/*!40000 ALTER TABLE `saledetail` DISABLE KEYS */;
INSERT INTO `saledetail` VALUES (1,2,100,1),(1,5,40,NULL),(2,3,500,2),(2,4,20,NULL),(3,6,80,NULL),(4,7,120,NULL);
/*!40000 ALTER TABLE `saledetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `passw` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Teseo','asd','edsongp@gmail.com','Edson','Prado','2003-01-07'),(2,'Edgar69','123','edgarpinto@example.com','Edgar','Pinto','2002-06-15'),(14,'asd','asd',NULL,NULL,NULL,NULL),(15,'asd','asd',NULL,NULL,NULL,NULL),(16,'asd','asd',NULL,NULL,NULL,NULL),(17,'asd','asd',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-31  0:28:52
