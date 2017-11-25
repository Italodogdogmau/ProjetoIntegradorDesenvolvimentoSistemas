CREATE DATABASE  IF NOT EXISTS `modeloteste` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `modeloteste`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: modeloteste
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursos` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(15) DEFAULT NULL,
  `carga` int(3) DEFAULT NULL,
  `fk_idorient` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcurso`),
  KEY `fk_idorient` (`fk_idorient`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`fk_idorient`) REFERENCES `orientador` (`idori`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Sistemas de Inf',80,1),(2,'Ciencia da Comp',80,2),(3,'Engenharia de S',80,3),(11,'sistemannns',NULL,NULL);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudante`
--

DROP TABLE IF EXISTS `estudante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudante` (
  `idestudante` int(2) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(45) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `semestre` int(2) DEFAULT NULL,
  `telefone` int(9) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `matricula` int(9) NOT NULL,
  PRIMARY KEY (`idestudante`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudante`
--

LOCK TABLES `estudante` WRITE;
/*!40000 ALTER TABLE `estudante` DISABLE KEYS */;
INSERT INTO `estudante` VALUES (1,'998732123','ITALO JOSE',5,33096543,'italojose@gmail.com',20030304),(2,'113338763','Marcos Valenio',5,64213213,'markin@gmail.com',19931107),(4,'224321123','nathalia peres',4,12312313,'nath@gmail.com',12312344),(5,'432359872','Lucas Woai',3,33093333,'lukinhas@gmail.com',20050202),(6,'453453331','Wilton Mota',8,33098888,'wiltonzas@gmail.com',20020304),(7,'842321235','maria cristina',2,12345678,'abcds@hotmail.com',21119998),(8,'983872837','Fernanda Maia ',5,33094534,'fefe@gmail.com',20040302),(9,'987765679','jose roxha',6,12333232,'email@gmail.com',12334245),(10,'132321123','jonh stik',2,12345678,'abcds@hotmail.com',98765441),(11,'998888333','lucas eduardo',4,23344455,'asv@gmail.com',44444442),(12,'999999999','jose marcos',5,23323232,'asbc@gmail.com',33212345),(19,'66862222','maiku junio',5,33314585,'xixidegato@gmail.com',1456987);
/*!40000 ALTER TABLE `estudante` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modeloteste`.`estudante_	AFTER_INSERT` AFTER INSERT ON `estudante` FOR EACH ROW
BEGIN
INSERT INTO Log_estudante
SET acao = 'INSERT',
idestudante = NEW.idestudante,
cpf = NEW.cpf,
nome = NEW.nome,
semestre = NEW.semestre,
telefone = NEW.telefone,
email = NEW.email,
matricula = NEW.matricula,
data_modificaçao = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modeloteste`.`estudante_BEFORE_UPDATE` BEFORE UPDATE ON `estudante` FOR EACH ROW
BEGIN
INSERT INTO Log_estudante
SET acao = 'update',
idestudante = OLD.idestudante,
cpf = OLD.cpf,
nome = OLD.nome,
semestre = OLD.semestre,
telefone = OLD.telefone,
email = OLD.email,
matricula = OLD.matricula,
data_modificaçao = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modeloteste`.`estudante_	AFTER_DELETE` AFTER DELETE ON `estudante` FOR EACH ROW
BEGIN
INSERT INTO Log_estudante
SET acao = 'DELETE',
idestudante = OLD.idestudante,
cpf = OLD.cpf,
nome = OLD.nome,
semestre = OLD.semestre,
telefone = OLD.telefone,
email = OLD.email,
matricula = OLD.matricula,
data_modificaçao = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estudante_cursos`
--

DROP TABLE IF EXISTS `estudante_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudante_cursos` (
  `id_aluno` int(11) DEFAULT NULL,
  `fk_idcurso` int(11) DEFAULT NULL,
  KEY `id_aluno` (`id_aluno`),
  KEY `fk_idcurso` (`fk_idcurso`),
  CONSTRAINT `estudante_cursos_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `estudante` (`idestudante`) ON DELETE CASCADE,
  CONSTRAINT `estudante_cursos_ibfk_2` FOREIGN KEY (`fk_idcurso`) REFERENCES `cursos` (`idcurso`)ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudante_cursos`
--

LOCK TABLES `estudante_cursos` WRITE;
/*!40000 ALTER TABLE `estudante_cursos` DISABLE KEYS */;
INSERT INTO `estudante_cursos` VALUES (1,1),(2,1),(3,2),(4,2),(5,2),(6,3),(7,3),(8,3),(9,1),(10,2),(11,3);
/*!40000 ALTER TABLE `estudante_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudante_materias`
--

DROP TABLE IF EXISTS `estudante_materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudante_materias` (
  `fk_id_estudante` int(11) DEFAULT NULL,
  `fk_idmateria` int(11) DEFAULT NULL,
  notas int(11) default null,
  KEY `fk_id_estudante` (`fk_id_estudante`),
  KEY `fk_idmateria` (`fk_idmateria`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudante_materias`
--

LOCK TABLES `estudante_materias` WRITE;
/*!40000 ALTER TABLE `estudante_materias` DISABLE KEYS */;
INSERT INTO `estudante_materias` VALUES (1,1),(1,3),(2,2),(2,4),(12,5),(12,1),(4,6),(4,7),(5,8),(5,9),(6,9),(7,2),(8,5),(9,6),(10,7),(11,2);
/*!40000 ALTER TABLE `estudante_materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudante_projetos`
--

DROP TABLE IF EXISTS `estudante_projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudante_projetos` (
  `fk_id_est` int(11) DEFAULT NULL,
  `fk_cod` int(11) DEFAULT NULL,
  KEY `fk_cpf_est` (`fk_id_est`),
  KEY `fk_cod` (`fk_cod`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudante_projetos`
--

LOCK TABLES `estudante_projetos` WRITE;
/*!40000 ALTER TABLE `estudante_projetos` DISABLE KEYS */;
INSERT INTO `estudante_projetos` VALUES (1,1),(2,1),(4,2),(5,2),(6,3),(7,3),(8,4),(9,4),(10,5),(11,5),(12,5);
/*!40000 ALTER TABLE `estudante_projetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_estudante`
--

DROP TABLE IF EXISTS `log_estudante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_estudante` (
  `idestudante` int(2) NOT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `semestre` int(2) DEFAULT NULL,
  `telefone` int(9) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `matricula` int(9) DEFAULT NULL,
  `data_modificaçao` date DEFAULT NULL,
  `acao` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_estudante`
--

LOCK TABLES `log_estudante` WRITE;
/*!40000 ALTER TABLE `log_estudante` DISABLE KEYS */;
INSERT INTO `log_estudante` VALUES (12,'999999999','jose marcos',5,23323232,'asbc@gmail.com',33212345,'2017-09-25','INSERT'),(3,'22343214','Arthur Dias',1,40028922,'arthursub10@gmail.com',24242424,'2017-09-25','DELETE'),(1,'9987321','ITALO JOSE',3,33096543,'',20030304,'2017-09-25','update'),(13,'1234568977','Wilson Marcelo',4,91466278,'wilson@yahoo.com',20170202,'2017-11-13','DELETE'),(14,'123321222','Pamela Marques',5,40028696,'pam@gmail.com',20013204,'2017-11-13','DELETE'),(17,'333123122','Nathalia Rodrigues',7,32222132,'Nathy@gmail.com',20022304,'2017-11-13','DELETE'),(18,'333123122','Nathalia Rodrigues',7,32222132,'Nathy@gmail.com',20022304,'2017-11-13','INSERT'),(18,'333123122','Nathalia Rodrigues',7,32222132,'Nathy@gmail.com',20022304,'2017-11-13','update'),(17,'333123128','Nathalia Rodrigues',7,32222132,'Nathy@gmail.com',20022304,'2017-11-13','DELETE'),(1,'9987321','ITALO JOSE',5,33096543,'',20030304,'2017-11-13','update'),(2,'11333876','Marcos Valenio',5,6,'',19931107,'2017-11-13','update'),(4,'22432112','nathalia peres',4,12312313,'nath@gmail.com',12312344,'2017-11-13','update'),(5,'43235987','Lucas Woai',3,33093333,'',20050202,'2017-11-13','update'),(6,'45345333','Wilton Mota',8,33098888,'',20020304,'2017-11-13','update'),(7,'84232123','maria cristina',2,12345678,'abcds@hotmail.com',21119998,'2017-11-13','update'),(8,'98387283','Fernanda Maia ',5,33094534,'',20040302,'2017-11-13','update'),(9,'98776567','jose roxha',6,12333232,'email@gmail.com',12334245,'2017-11-13','update'),(19,'66862222','maiku junio',5,33314585,'xixidegato@gmail.com',1456987,'2017-11-13','INSERT');
/*!40000 ALTER TABLE `log_estudante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_orientador`
--

DROP TABLE IF EXISTS `log_orientador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_orientador` (
  `idori` int(11) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `titulaçao` varchar(10) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `campus` varchar(50) DEFAULT NULL,
  `data_modificaçao` date DEFAULT NULL,
  `acao` varchar(10) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_orientador`
--

LOCK TABLES `log_orientador` WRITE;
/*!40000 ALTER TABLE `log_orientador` DISABLE KEYS */;
INSERT INTO `log_orientador` VALUES (1,'1234567892','doutor','Antonio da Silva','anttns@yahoo.com.br',33456789,'Asa Sul','2017-11-13','update'),(2,'987896758','mestre','Vicente Carvalho','viccar@gmail.com',33099999,'Asa Norte','2017-11-13','update'),(3,'2147483647','doutor','Fernanda de Paula','nanda02@hotmail.com',33458765,'Aguas Claras','2017-11-13','update'),(7,'2147483647','doutor','Italo Rocha','italo1466@hotmail.com',985786543,'Asa Norte','2017-11-13','DELETE'),(7,'2147483647','doutor','Italo Rocha','italo1466@hotmail.com',985786543,'Asa Norte','2017-11-13','DELETE');
/*!40000 ALTER TABLE `log_orientador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materias` (
  `idmateria` int(8) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `carga` int(4) DEFAULT NULL,
  `fk_orientador` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmateria`),
  KEY `fk_orientador` (`fk_orientador`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,'LPOO',80,5),(2,'HTML5',80,5),(3,'PYTHON',80,1),(4,'MYSQL',60,2),(5,'C++',80,3),(6,'POO',80,2),(7,'TESTE DE SOFTWARE',80,3),(8,'ENGENHARIA DE REQUISITOS',80,1),(9,'HARDWARE',60,4);
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orientador`
--

DROP TABLE IF EXISTS `orientador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orientador` (
  `idori` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(45) NOT NULL,
  `titulaçao` varchar(10) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `campus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idori`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orientador`
--

LOCK TABLES `orientador` WRITE;
/*!40000 ALTER TABLE `orientador` DISABLE KEYS */;
INSERT INTO `orientador` VALUES (1,'1234567892','doutor','Thales Antonio','thales@gmail.com',33456789,'Asa Sul'),(2,'987896758','mestre','Patricia Nicole ','PatyEduc@hotmail.com',33099999,'Asa Norte'),(3,'2147483647','doutor','Wesley Marino','MarinoUSP@icloud.com',33458765,'Aguas Claras'),(4,'2147483647','doutor','Italo Rocha','italo1466@hotmail.com',985786543,'Asa Norte'),(5,'2147483647','mestre','Joaquim Santana','jojo32@gmail.com',33094567,'Asa Sul');
/*!40000 ALTER TABLE `orientador` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modeloteste`.`orientador_AFTER_INSERT` AFTER INSERT ON `orientador` FOR EACH ROW
BEGIN
INSERT INTO Log_orientador
SET acao = 'DELETE',
idori = NEW.idori,
cpf= NEW.cpf ,
titulaçao = NEW.titulaçao ,
nome= NEW.nome ,
email= NEW.email ,
telefone= NEW.telefone ,
campus = NEW.campus,
data_modificaçao = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modeloteste`.`orientador_BEFORE_UPDATE` BEFORE UPDATE ON `orientador` FOR EACH ROW
BEGIN
INSERT INTO Log_orientador
SET acao = 'update',
idori = OLD.idori,
cpf= OLD.cpf ,
titulaçao = OLD.titulaçao ,
nome= OLD.nome ,
email= OLD.email ,
telefone= OLD.telefone ,
campus = OLD.campus,
data_modificaçao = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modeloteste`.`orientador_BEFORE_DELETE` BEFORE DELETE ON `orientador` FOR EACH ROW
BEGIN
INSERT INTO Log_orientador
SET acao = 'DELETE',
idori = OLD.idori,
cpf= OLD.cpf ,
titulaçao = OLD.titulaçao ,
nome= OLD.nome ,
email= OLD.email ,
telefone= OLD.telefone ,
campus = OLD.campus,
data_modificaçao = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `projetos`
--

DROP TABLE IF EXISTS `projetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projetos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_projeto` varchar(100) DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `fk_idori` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_idori` (`fk_idori`),
  CONSTRAINT `projetos_ibfk_1` FOREIGN KEY (`fk_idori`) REFERENCES `orientador` (`idori`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projetos`
--

LOCK TABLES `projetos` WRITE;
/*!40000 ALTER TABLE `projetos` DISABLE KEYS */;
INSERT INTO `projetos` VALUES (1,'Cloud',10,2),(2,'Redes',10,3),(3,'Programaçao orientada a objeto',8,1),(4,'Html5',8,4),(5,'Programaçao mobile',8,5);
/*!40000 ALTER TABLE `projetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `txt_formulário`
--

DROP TABLE IF EXISTS `txt_formulário`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `txt_formulário` (
  `idformulario` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `formulario` mediumblob
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `txt_formulário`
--

LOCK TABLES `txt_formulário` WRITE;
/*!40000 ALTER TABLE `txt_formulário` DISABLE KEYS */;
INSERT INTO `txt_formulário` VALUES (1,'PDF',NULL),(1,'PDF',NULL),(1,'PDF',NULL);
/*!40000 ALTER TABLE `txt_formulário` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_cursos`
--

DROP TABLE IF EXISTS `vw_cursos`;
/*!50001 DROP VIEW IF EXISTS `vw_cursos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_cursos` AS SELECT 
 1 AS `idcurso`,
 1 AS `nome_curso`,
 1 AS `carga`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_estudante`
--

DROP TABLE IF EXISTS `vw_estudante`;
/*!50001 DROP VIEW IF EXISTS `vw_estudante`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_estudante` AS SELECT 
 1 AS `cpf`,
 1 AS `nome`,
 1 AS `telefone`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_log_est`
--

DROP TABLE IF EXISTS `vw_log_est`;
/*!50001 DROP VIEW IF EXISTS `vw_log_est`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_log_est` AS SELECT 
 1 AS `idestudante`,
 1 AS `nome`,
 1 AS `data_modificaçao`,
 1 AS `acao`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_materias`
--

DROP TABLE IF EXISTS `vw_materias`;
/*!50001 DROP VIEW IF EXISTS `vw_materias`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_materias` AS SELECT 
 1 AS `nome`,
 1 AS `fk_orientador`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_orientador`
--

DROP TABLE IF EXISTS `vw_orientador`;
/*!50001 DROP VIEW IF EXISTS `vw_orientador`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_orientador` AS SELECT 
 1 AS `idori`,
 1 AS `nome`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_projetos`
--

DROP TABLE IF EXISTS `vw_projetos`;
/*!50001 DROP VIEW IF EXISTS `vw_projetos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_projetos` AS SELECT 
 1 AS `titulo_projeto`,
 1 AS `fk_idori`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'modeloteste'
--

--
-- Dumping routines for database 'modeloteste'
--
/*!50003 DROP PROCEDURE IF EXISTS `verificar_qntd_cursos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verificar_qntd_cursos`(OUT idcurso INT)
BEGIN
				SELECT count(*) INTO idcurso FROM cursos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verificar_qntd_estudante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verificar_qntd_estudante`(OUT cpf INT)
BEGIN
				SELECT count(*) INTO cpf FROM estudante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verificar_qntd_orientador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verificar_qntd_orientador`(OUT idori INT)
BEGIN
				SELECT count(*) INTO idori FROM orientador;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_cursos`
--

/*!50001 DROP VIEW IF EXISTS `vw_cursos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cursos` AS select `cursos`.`idcurso` AS `idcurso`,`cursos`.`nome_curso` AS `nome_curso`,`cursos`.`carga` AS `carga` from `cursos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_estudante`
--

/*!50001 DROP VIEW IF EXISTS `vw_estudante`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_estudante` AS select `estudante`.`cpf` AS `cpf`,`estudante`.`nome` AS `nome`,`estudante`.`telefone` AS `telefone` from `estudante` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_log_est`
--

/*!50001 DROP VIEW IF EXISTS `vw_log_est`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_log_est` AS select `log_estudante`.`idestudante` AS `idestudante`,`log_estudante`.`nome` AS `nome`,`log_estudante`.`data_modificaçao` AS `data_modificaçao`,`log_estudante`.`acao` AS `acao` from `log_estudante` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_materias`
--

/*!50001 DROP VIEW IF EXISTS `vw_materias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_materias` AS select `materias`.`nome` AS `nome`,`materias`.`fk_orientador` AS `fk_orientador` from `materias` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_orientador`
--

/*!50001 DROP VIEW IF EXISTS `vw_orientador`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_orientador` AS select `orientador`.`idori` AS `idori`,`orientador`.`nome` AS `nome` from `orientador` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_projetos`
--

/*!50001 DROP VIEW IF EXISTS `vw_projetos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_projetos` AS select `projetos`.`titulo_projeto` AS `titulo_projeto`,`projetos`.`fk_idori` AS `fk_idori` from `projetos` */;
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

-- Dump completed on 2017-11-13 21:12:24
