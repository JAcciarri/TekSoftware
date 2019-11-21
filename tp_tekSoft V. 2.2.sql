-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: tp_software
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
  `idCaracteristica` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  PRIMARY KEY (`idCaracteristica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas`
--

LOCK TABLES `caracteristicas` WRITE;
/*!40000 ALTER TABLE `caracteristicas` DISABLE KEYS */;
INSERT INTO `caracteristicas` VALUES (1,'¿Necesita sistema de login?'),(2,'Titulo pregunta numero 2'),(3,'Titulo pregunta numero 3'),(4,'Titulo Pregunta 4');
/*!40000 ALTER TABLE `caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `maximas_fechas`
--

DROP TABLE IF EXISTS `maximas_fechas`;
/*!50001 DROP VIEW IF EXISTS `maximas_fechas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `maximas_fechas` AS SELECT 
 1 AS `idCaracteristica`,
 1 AS `idOpcion`,
 1 AS `maxFecha`*/;
SET character_set_client = @saved_cs_client;

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
  CONSTRAINT `opciones_FK1` FOREIGN KEY (`idCaracteristica`) REFERENCES `caracteristicas` (`idCaracteristica`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
INSERT INTO `opciones` VALUES (1,1,'Si, con redes sociales y email','Los usuarios podran iniciar sesión a través de ellos','fa-twitter'),(1,2,'Si, con email','Los usuarios se podrán loguear a través del email','fa-envelope'),(1,3,'No necesita','Los usuarios no iniciarán sesión','fa-times-circle'),(2,1,'Subtitulo opcion 1','Descripcion opcion 1','fa-envelope'),(2,2,'Subtitulo opcion 2','Descripcion opcion 2','fa-envelope'),(2,3,'Subtitulo opcion 3','Descripcion opcion 3','fa-envelope'),(3,1,'Subtitulo opcion 1','Descripcion opcion 1','fa-envelope'),(3,2,'Subtitulo opcion 2','Descripcion opcion 2','fa-envelope'),(3,3,'Subtitulo opcion 3','Descripcion opcion 3','fa-envelope'),(4,1,'Subtitulo 1','Descripcion Random','fa-twitter'),(4,2,'Subtitulo 2','descripcion random','fa-twitter'),(4,3,'Subtitulo 3','descripcion random','fa-twitter');
/*!40000 ALTER TABLE `opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_caracteristicas`
--

DROP TABLE IF EXISTS `pedido_caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pedido_caracteristicas` (
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
-- Dumping data for table `pedido_caracteristicas`
--

LOCK TABLES `pedido_caracteristicas` WRITE;
/*!40000 ALTER TABLE `pedido_caracteristicas` DISABLE KEYS */;
INSERT INTO `pedido_caracteristicas` VALUES (9,1,1),(10,1,1),(12,1,1),(14,1,1),(7,1,2),(8,1,2),(11,1,2),(13,1,2),(16,1,2),(15,1,3),(7,2,1),(8,2,1),(11,2,1),(15,2,1),(9,2,2),(10,2,2),(12,2,2),(14,2,2),(13,2,3),(16,2,3),(10,3,1),(11,3,1),(12,3,1),(16,3,1),(7,3,2),(8,3,2),(9,3,2),(15,3,2),(13,3,3),(14,3,3);
/*!40000 ALTER TABLE `pedido_caracteristicas` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,NULL,NULL,NULL,10,NULL,'Pendiente',NULL),(2,NULL,NULL,NULL,10,NULL,'Pendiente',NULL),(6,NULL,NULL,NULL,11,NULL,'Pendiente',NULL),(7,NULL,NULL,NULL,11,NULL,'Pendiente',NULL),(8,'2019-10-28 14:56:39',NULL,NULL,10,NULL,'Aprobado',NULL),(9,'2019-11-02 14:52:35',NULL,NULL,10,NULL,'Aprobado',NULL),(10,'2019-11-02 15:58:52',NULL,NULL,10,NULL,'Pendiente',NULL),(11,'2019-11-03 17:09:02',NULL,NULL,10,NULL,'Pendiente',NULL),(12,'2019-11-03 17:13:08',NULL,NULL,10,NULL,'Aprobado',6300.00),(13,'2019-11-03 17:13:34',NULL,NULL,10,NULL,'Pendiente',5050.00),(14,'2019-11-05 13:59:54',NULL,NULL,10,NULL,'Pendiente',5800.00),(15,'2019-11-21 02:25:29',NULL,NULL,10,NULL,'Pendiente',5200.00),(16,'2019-11-21 16:34:48',NULL,NULL,10,NULL,'Pendiente',6450.00);
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

--
-- Table structure for table `valores`
--

DROP TABLE IF EXISTS `valores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `valores` (
  `idCaracteristica` int(11) NOT NULL,
  `idOpcion` int(11) NOT NULL,
  `fecha_desde` date NOT NULL,
  `valor` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`idCaracteristica`,`fecha_desde`,`idOpcion`),
  KEY `valores_FK2_idx` (`idOpcion`),
  KEY `valores_FK1_idx` (`idCaracteristica`,`idOpcion`),
  CONSTRAINT `valores_FK1` FOREIGN KEY (`idCaracteristica`, `idOpcion`) REFERENCES `opciones` (`idCaracteristica`, `idOpcion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valores`
--

LOCK TABLES `valores` WRITE;
/*!40000 ALTER TABLE `valores` DISABLE KEYS */;
INSERT INTO `valores` VALUES (1,1,'2019-02-13',1500.00),(1,2,'2019-02-13',1100.00),(1,3,'2019-02-13',900.00),(1,1,'2019-06-10',1750.00),(1,2,'2019-07-02',1750.00),(2,1,'2019-02-13',1600.00),(2,2,'2019-02-13',1300.00),(2,3,'2019-02-13',1200.00),(3,1,'2019-02-13',2900.00),(3,2,'2019-02-13',2700.00),(3,3,'2019-02-13',2600.00),(3,3,'2019-04-10',2750.00),(3,1,'2019-05-20',3500.00);
/*!40000 ALTER TABLE `valores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `maximas_fechas`
--

/*!50001 DROP VIEW IF EXISTS `maximas_fechas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sistema`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `maximas_fechas` AS select `valores`.`idCaracteristica` AS `idCaracteristica`,`valores`.`idOpcion` AS `idOpcion`,max(`valores`.`fecha_desde`) AS `maxFecha` from `valores` group by `valores`.`idCaracteristica`,`valores`.`idOpcion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-21 15:25:13
