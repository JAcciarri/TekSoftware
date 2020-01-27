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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas`
--

LOCK TABLES `caracteristicas` WRITE;
/*!40000 ALTER TABLE `caracteristicas` DISABLE KEYS */;
INSERT INTO `caracteristicas` VALUES (1,'¿Necesita sistema de login?'),(2,'Titulo pregunta numero 2'),(3,'Titulo pregunta numero 3'),(4,'Titulo pregunta numero 4'),(17,'Titulo pregunta numero 5'),(18,'Super caracteristica');
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
  CONSTRAINT `opciones_fk1` FOREIGN KEY (`idCaracteristica`) REFERENCES `caracteristicas` (`idCaracteristica`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
INSERT INTO `opciones` VALUES (1,1,'Si, con redes sociales y email','Los usuarios podran iniciar sesión a través de ellos','fa-twitter'),(1,2,'Si, con email','Los usuarios se podrán loguear a través del email','fa-envelope'),(1,3,'No necesita','Los usuarios no iniciarán sesión','fa-times-circle'),(2,1,'Subtitulo opcion 1','Descripcion opcion 1','fa-envelope'),(2,2,'Subtitulo opcion 2','Descripcion opcion 2','fa-envelope'),(2,3,'Subtitulo opcion 3','Descripcion opcion 3','fa-envelope'),(3,1,'Subtitulo opcion 1','Descripcion opcion 1','fa-envelope'),(3,2,'Subtitulo opcion 2','Descripcion opcion 2','fa-envelope'),(3,3,'Subtitulo opcion 3','Descripcion opcion 3','fa-envelope'),(4,1,'Subtitulo 1','Descripcion Random','fa-twitter'),(4,2,'Subtitulo 2','descripcion random','fa-twitter'),(4,3,'Subtitulo 3','descripcion random','fa-twitter'),(17,1,'Subtitulo 1 je','Random','fa-twitter'),(17,2,'Subtitulo 2 ja','Aleatory','fa-twitter'),(17,3,'Subtitulo 3 jo','That does not exist','fa-twitter'),(18,1,'asd','asd','fa-twitter'),(18,2,'asd','asd','fa-twitter'),(18,3,'asd','asd','fa-twitter');
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
INSERT INTO `pedido_caracteristicas` VALUES (35,1,1),(43,1,1),(44,1,1),(36,1,2),(45,1,2),(38,1,3),(39,1,3),(35,2,1),(38,2,1),(39,2,1),(43,2,2),(44,2,2),(45,2,2),(36,2,3),(35,3,1),(39,3,1),(36,3,2),(38,3,2),(45,3,2),(43,3,3),(44,3,3),(35,4,1),(36,4,1),(39,4,1),(43,4,1),(44,4,1),(38,4,3),(45,4,3),(35,17,1),(36,17,2),(38,17,2),(39,17,2),(43,17,2),(44,17,2),(45,17,3),(39,18,2),(43,18,2),(44,18,2),(45,18,2),(38,18,3);
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
  `fechaRechazo` datetime DEFAULT NULL,
  `idCliente` int(11) NOT NULL,
  `idAdmin` int(11) DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `montoTotal` decimal(9,2) DEFAULT NULL,
  `motivoRechazo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `pedido_FK1_idx` (`idCliente`),
  KEY `pedido_FK2_idx` (`idAdmin`),
  CONSTRAINT `pedido_FK1` FOREIGN KEY (`idCliente`) REFERENCES `usuarios` (`idUsuario`) ON UPDATE CASCADE,
  CONSTRAINT `pedido_FK2` FOREIGN KEY (`idAdmin`) REFERENCES `usuarios` (`idUsuario`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (35,'2020-01-23 21:00:29',NULL,'2020-01-23 21:24:29',10,NULL,'Rechazado',7361.00,NULL),(36,'2020-01-23 21:31:00',NULL,'2020-01-27 14:51:08',10,NULL,'Rechazado',6211.00,NULL),(38,'2020-01-27 15:09:14',NULL,'2020-01-27 15:11:12',22,NULL,'Rechazado',5978.00,NULL),(39,'2020-01-27 15:11:34',NULL,'2020-01-27 15:55:43',22,NULL,'Rechazado',6792.00,NULL),(43,'2020-01-27 16:58:46','2020-01-27 17:17:25',NULL,19,NULL,'Aprobado',6592.00,NULL),(44,'2020-01-27 17:24:21',NULL,'2020-01-27 17:29:49',19,NULL,'Rechazado',6592.00,'sorry bro'),(45,'2020-01-27 17:32:22',NULL,NULL,19,NULL,'Pendiente',7227.00,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (3,'pato','carestia','patocarestia@gmail.com',NULL,'pato','carp',1),(4,'joshua','acciarri','joshuaacciarri@gmail.com',NULL,'joshy','nob',1),(10,'mario','bressano','mob@bress.com.ar','4331413','mob','mariobressano',0),(11,'jose','gimenez','jose@gmail.com','34136','josecito','12345',0),(14,'Prueba','Usuario modificado','borrar@gmail.com','4314314','probando usuario','1234',0),(15,'Nuevo ','Admin','admin@gmail.com','34431','soy admin','1234',0),(16,'Wowo','Wowo','oso@gmail.com','465454','wowowo','12345',0),(17,'Tomas','Giuntoli','tomasgiuntoli@gmail.com','12312323123','tomascarp','123456',0),(18,'Adrian','Suar','adriansuar@gmail.com','434313444','','123',0),(19,'Jose','Gomez','jose@gmail.com','123123','josejose','1234',0),(20,'Nuevo','Usuario','nuevo@gmail.com','123123','nuevouser','123',0),(21,'Nadie','Sabe','nadiesabe@gmail.com','123','nadiesabe','123',0),(22,'Ricardo','Gareca','usuario@gmail.com','343431','ricar','123',0);
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
  `fecha_desde` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
INSERT INTO `valores` VALUES (1,1,'2019-02-13 00:00:00',1500.00),(1,2,'2019-02-13 00:00:00',1100.00),(1,3,'2019-02-13 00:00:00',900.00),(1,1,'2019-06-10 00:00:00',1750.00),(1,2,'2019-07-02 00:00:00',1750.00),(2,1,'2019-02-13 00:00:00',1600.00),(2,2,'2019-02-13 00:00:00',1300.00),(2,3,'2019-02-13 00:00:00',1200.00),(3,1,'2019-02-13 00:00:00',2900.00),(3,2,'2019-02-13 00:00:00',2700.00),(3,3,'2019-02-13 00:00:00',2600.00),(3,3,'2019-04-10 00:00:00',2750.00),(3,1,'2019-05-20 00:00:00',3500.00),(4,1,'2020-01-23 15:54:33',11.00),(4,2,'2020-01-23 15:54:33',23.00),(4,3,'2020-01-23 15:54:33',15.00),(17,1,'2020-01-23 20:22:49',500.00),(17,2,'2020-01-23 20:22:49',550.00),(17,3,'2020-01-23 20:22:49',1231.00),(18,1,'2020-01-27 15:02:26',123.00),(18,2,'2020-01-27 15:02:26',231.00),(18,3,'2020-01-27 15:02:26',213.00);
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

-- Dump completed on 2020-01-27 14:49:01
