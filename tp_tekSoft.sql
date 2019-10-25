-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tp_software
-- ------------------------------------------------------
-- Server version	5.7.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `caracteristicas`
--

DROP TABLE IF EXISTS `caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `caracteristicas` (
  `idCaracteristica` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  PRIMARY KEY (`idCaracteristica`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas`
--

LOCK TABLES `caracteristicas` WRITE;
/*!40000 ALTER TABLE `caracteristicas` DISABLE KEYS */;
INSERT INTO `caracteristicas` VALUES (1,'¿Necesita sistema de login?'),(2,'Titulo pregunta numero 2'),(3,'Titulo pregunta numero 3');
/*!40000 ALTER TABLE `caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `opciones` (
  `idCaracteristica` int(11) NOT NULL,
  `idOpcion` int(11) NOT NULL,
  `subtitulo` varchar(80) NOT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  `textIcono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idCaracteristica`,`idOpcion`),
  CONSTRAINT `opciones_FK1` FOREIGN KEY (`idCaracteristica`) REFERENCES `caracteristicas` (`idCaracteristica`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
INSERT INTO `opciones` VALUES (1,1,'Si, con redes sociales y email','Los usuarios podran iniciar sesión a través de ellos','fa-twitter'),(1,2,'Si, con email','Los usuarios se podrán loguear a través del email','fa-envelope'),(1,3,'No necesita','Los usuarios no iniciarán sesión','fa-times-circle'),(2,1,'Subtitulo opcion 1','Descripcion opcion 1','fa-envelope'),(2,2,'Subtitulo opcion 2','Descripcion opcion 2','fa-envelope'),(2,3,'Subtitulo opcion 3','Descripcion opcion 3','fa-envelope'),(3,1,'Subtitulo opcion 1','Descripcion opcion 1','fa-envelope'),(3,2,'Subtitulo opcion 2','Descripcion opcion 2','fa-envelope'),(3,3,'Subtitulo opcion 3','Descripcion opcion 3','fa-envelope');
/*!40000 ALTER TABLE `opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido-caracteristicas`
--

DROP TABLE IF EXISTS `pedido-caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido-caracteristicas` (
  `idPedido` int(11) NOT NULL,
  `idCaracteristica` int(11) NOT NULL,
  `idOpcion` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`,`idCaracteristica`,`idOpcion`),
  KEY `ped_car_FK2_idx` (`idCaracteristica`,`idOpcion`),
  CONSTRAINT `ped_car_FK1` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`) ON UPDATE CASCADE,
  CONSTRAINT `ped_car_FK2` FOREIGN KEY (`idCaracteristica`, `idOpcion`) REFERENCES `opciones` (`idCaracteristica`, `idOpcion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido-caracteristicas`
--

LOCK TABLES `pedido-caracteristicas` WRITE;
/*!40000 ALTER TABLE `pedido-caracteristicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido-caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedidos` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPedido` datetime DEFAULT NULL,
  `fechaAprobacion` datetime DEFAULT NULL,
  `fechaCancelacion` datetime DEFAULT NULL,
  `idCliente` int(11) NOT NULL,
  `idAdmin` int(11) DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `montoTotal` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `pedido_FK1_idx` (`idCliente`),
  KEY `pedido_FK2_idx` (`idAdmin`),
  CONSTRAINT `pedido_FK1` FOREIGN KEY (`idCliente`) REFERENCES `usuarios` (`idUsuario`) ON UPDATE CASCADE,
  CONSTRAINT `pedido_FK2` FOREIGN KEY (`idAdmin`) REFERENCES `usuarios` (`idUsuario`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,NULL,NULL,NULL,10,NULL,'Pendiente',NULL);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (3,'pato','carestia','patocarestia@gmail.com',NULL,'pato','carp',1),(4,'joshua','acciarri','joshuaacciarri@gmail.com',NULL,'joshy','nob',1),(9,'joseee','lopez','jose@gmail.com','343431','josejosejose','12345',0),(10,'mario','bressano','mob@bress.com.ar','4331413','mob','mariobressano',0),(11,'jose','gimenez','jose@gmail.com','34136','josecito','12345',0),(14,'Prueba','Usuario modificado','borrar@gmail.com','4314314','probando usuario','1234',0),(15,'Nuevo ','Admin','admin@gmail.com','34431','soy admin','1234',0),(16,'Wowo','Wowo','oso@gmail.com','465454','wowowo','12345',0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-25 11:43:49
