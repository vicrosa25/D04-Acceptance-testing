start transaction;

create database `Acme-Rookies`;

use `Acme-Rookies`;

create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';
create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete on `Acme-Rookies`.* to 'acme-user'@'%';

grant select, insert, update, delete, create, drop, references, index, alter, create temporary tables, lock tables, create view, create routine, alter routine, execute, trigger, show view on `Acme-Rookies`.* to 'acme-manager'@'%';

-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-HackerRank
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `vatnumber` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `banned` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `spammer` bit(1) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `credit_card` int(11) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_i7xei45auwq1f6vu25985riuh` (`user_account`),
  KEY `FK_fl7pq8veyyxgdk1s4awu0c7mo` (`credit_card`),
  CONSTRAINT `FK_i7xei45auwq1f6vu25985riuh` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_fl7pq8veyyxgdk1s4awu0c7mo` FOREIGN KEY (`credit_card`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `vatnumber` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `banned` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `spammer` bit(1) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `credit_card` int(11) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `administratorUK_i7xei45auwq1f6vu25985riuh` (`user_account`),
  KEY `UK_7ohwsa2usmvu0yxb44je2lge` (`user_account`),
  KEY `FK_b2e562x98pje1n9vu0deulcev` (`credit_card`),
  CONSTRAINT `FK_7ohwsa2usmvu0yxb44je2lge` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_b2e562x98pje1n9vu0deulcev` FOREIGN KEY (`credit_card`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (181,1,'75860389Y','Avenida Italia 12','\0','juandelaoliva@gmail.com','Juan Manuel','+34(655)123456789','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-KUF1F8Y8PcSonTUCchWrDQhFFAr3FtkTNX7tCV5G4DeCptp6_A','\0','De la Oliva Aguilar',222,161),(182,1,'658554658Z','Avenida republica argentina','\0','alfonsom@gmail.com','Alfonso','658227452','https://www.w3schools.com/howto/img_avatar.png','\0','Alarcon',224,162),(183,1,'758603890','Avenida reina mercedes','\0','system@gmail.com','system','','','\0','system',223,163);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `answer_code` varchar(255) DEFAULT NULL,
  `answer_explanation` varchar(255) DEFAULT NULL,
  `publish_moment` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `submit_moment` datetime DEFAULT NULL,
  `curricula` int(11) DEFAULT NULL,
  `hacker` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `problem` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_3hgwemcpn15ns7bi2upsq613y` (`hacker`),
  KEY `FK_hsw5exxa4qe3jxi8xdhnn0dl5` (`curricula`),
  KEY `FK_cqpb54jon3yjef814oj6g6o4n` (`position`),
  KEY `FK_7gn6fojv7rim6rxyglc6n9mt2` (`problem`),
  CONSTRAINT `FK_7gn6fojv7rim6rxyglc6n9mt2` FOREIGN KEY (`problem`) REFERENCES `problem` (`id`),
  CONSTRAINT `FK_3hgwemcpn15ns7bi2upsq613y` FOREIGN KEY (`hacker`) REFERENCES `hacker` (`id`),
  CONSTRAINT `FK_cqpb54jon3yjef814oj6g6o4n` FOREIGN KEY (`position`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_hsw5exxa4qe3jxi8xdhnn0dl5` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (217,1,'https://github.com/jirutka/validator-collection/tree/master/src/main/java/cz/jirutka/validator/collection/constraints','Quita el espacio de la linea 43','2018-06-25 15:35:00','ACCEPTED','2018-06-25 17:35:00',236,196,201,208),(218,1,'https://github.com/jirutka/validator-collection/tree/master/src/main/java/cz/jirutka/validator/collection/constraints','No Idea','2018-06-28 15:35:00','REJECTED','2018-06-25 17:35:00',237,197,202,209),(219,1,'https://github.com/jirutka/validator-collection/tree/master/src/main/java/cz/jirutka/validator/collection/constraints','Tienes que llamar al objeto no al metodo','2018-06-18 15:35:00','PENDING','2018-06-25 17:35:00',235,196,202,209),(220,1,'https://github.com/jirutka/validator-collection/tree/master/src/main/java/cz/jirutka/validator/collection/constraints','Es una sentencia vacia ','2018-09-18 15:35:00','ACCEPTED','2018-06-26 20:35:00',232,195,207,213),(221,1,'https://github.com/jirutka/validator-collection/tree/master/src/main/java/cz/jirutka/validator/collection/constraints','TEST ','2018-09-11 15:35:00','PENDING','2018-12-26 20:35:00',237,197,207,213);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `final_mode` bit(1) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `score` double NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `auditor` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3m6p53wfvy7kcl4f4fvphkh9h` (`auditor`),
  KEY `FK_bumsxo4hc038y25pbfsinc38u` (`position`),
  CONSTRAINT `FK_bumsxo4hc038y25pbfsinc38u` FOREIGN KEY (`position`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_3m6p53wfvy7kcl4f4fvphkh9h` FOREIGN KEY (`auditor`) REFERENCES `auditor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
INSERT INTO `audit` VALUES (32768,2,'','2019-04-30 00:00:00',9,'99999',184,201),(32769,0,'\0','2019-04-30 00:00:00',8,'uygygjyg',184,204);
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor`
--

DROP TABLE IF EXISTS `auditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `vatnumber` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `banned` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `spammer` bit(1) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `credit_card` int(11) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auditorUK_i7xei45auwq1f6vu25985riuh` (`user_account`),
  KEY `UK_1hfceldjralkadedlv9lg1tl8` (`user_account`),
  KEY `FK_k5yihs4tvrnhe8rndei6ypc8w` (`credit_card`),
  CONSTRAINT `FK_1hfceldjralkadedlv9lg1tl8` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_k5yihs4tvrnhe8rndei6ypc8w` FOREIGN KEY (`credit_card`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor`
--

LOCK TABLES `auditor` WRITE;
/*!40000 ALTER TABLE `auditor` DISABLE KEYS */;
INSERT INTO `auditor` VALUES (184,1,'75860389Y','Avenida Italia 12','\0','juandelaoliva@gmail.com','Juan Manuel','+34(655)123456789','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-KUF1F8Y8PcSonTUCchWrDQhFFAr3FtkTNX7tCV5G4DeCptp6_A','\0','De la Oliva Aguilar',222,170),(185,1,'658554658Z','Avenida republica argentina','\0','alfonsom@gmail.com','Alfonso','658227452','https://www.w3schools.com/howto/img_avatar.png','\0','Alarcon',224,171),(186,1,'758603890','Avenida reina mercedes','\0','pepefg@gmail.com','Pepe','','','\0','Fernández Gómez',223,172),(187,1,'758603890','Avenida false 123','\0','josehjg@gmail.com','Jose','725614293','https://www.todohostingweb.com/wp-content/uploads/2013/03/imagenes-l%C3%ADbres-de-derechos-de-autor_min.jpg','\0','Hernández Jiménez',225,173),(188,1,'758603890','Avenida de los pirralos','\0','jesusgm@gmail.com','Jesús','624192532','http://1.bp.blogspot.com/-ShwlTH_PTvk/Uf6goC1eneI/AAAAAAAALvY/gb_UBcA6GQU/s1600/bruja-escoba-luna-miedo-dibujo-sin-derechos-autor.png','\0','Gil Maestre',227,174);
/*!40000 ALTER TABLE `auditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `vatnumber` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `banned` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `spammer` bit(1) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `credit_card` int(11) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  `comercial_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyUK_i7xei45auwq1f6vu25985riuh` (`user_account`),
  KEY `UK_pno7oguspp7fxv0y2twgplt0s` (`user_account`),
  KEY `FK_cp2qc9fdm9995xdhrrd06n86c` (`credit_card`),
  CONSTRAINT `FK_pno7oguspp7fxv0y2twgplt0s` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_cp2qc9fdm9995xdhrrd06n86c` FOREIGN KEY (`credit_card`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (198,1,'45454545O','Irlanda calle google','\0','google@yahoo.com','Google ','658225696','https://sites.google.com/a/thawara.ac.th/s26510/_/rsrc/1536632792961/home/google-new-logo-2015-640x344.png','\0','Sin mas',228,167,'Google.SL'),(199,1,'P56312642O','Avenida amazon city','\0','amazon@yahoo.com','Amazon ','758695656','http://g-ec2.images-amazon.com/images/G/01/social/api-share/amazon_logo_500500._V323939215_.png','\0','Amazon sociedad cooperativa',229,168,'Co-operativo Amazon S.L'),(200,1,'J09756876','Calle En la nube','\0','clevercloud@clevercloud.com','CleverCloud ','+34(656)558985','https://www.clever-cloud.com/images/brand-assets/logos/clever-cloud-blue-600w.jpg','\0','Naide podra pararnos',230,169,'Clevercloud S.L');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `cache_finder` int(11) NOT NULL,
  `country_code` int(11) NOT NULL,
  `fail_system` bit(1) NOT NULL,
  `flat_fare` double DEFAULT NULL,
  `name_sys` varchar(255) DEFAULT NULL,
  `num_results` int(11) NOT NULL,
  `security_messageen` varchar(255) DEFAULT NULL,
  `security_messagees` varchar(255) DEFAULT NULL,
  `vat` int(11) NOT NULL,
  `welcome_messageen` varchar(255) DEFAULT NULL,
  `welcome_messagees` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (231,0,'https://i.ibb.co/GxW2K0d/Rookies.png',1,34,'\0',500,'Acme Hacker Rank',10,'A security fault has occurred! The system is in maintenance.','¡Se ha producido un fallo de seguridad! El sistema se encuentra en mantenimiento.',21,'Welcome to Acme hacker Rank! We\'re IT hacker\'s favourite job marketplace!','¡Bienvenidos a Acme Hacker Rank! ¡Somos el mercado de trabajo favorito de los profesionales de las TICs!');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_make_name`
--

DROP TABLE IF EXISTS `configuration_make_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_make_name` (
  `configuration` int(11) NOT NULL,
  `make_name` varchar(255) DEFAULT NULL,
  KEY `FK_tduglksh96ptgkxefvynhttou` (`configuration`),
  CONSTRAINT `FK_tduglksh96ptgkxefvynhttou` FOREIGN KEY (`configuration`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_make_name`
--

LOCK TABLES `configuration_make_name` WRITE;
/*!40000 ALTER TABLE `configuration_make_name` DISABLE KEYS */;
INSERT INTO `configuration_make_name` VALUES (231,'VISA'),(231,'MCARD'),(231,'DINNERS'),(231,'AMEX'),(231,'FLY');
/*!40000 ALTER TABLE `configuration_make_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_negative_wordsen`
--

DROP TABLE IF EXISTS `configuration_negative_wordsen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_negative_wordsen` (
  `configuration` int(11) NOT NULL,
  `negative_wordsen` varchar(255) DEFAULT NULL,
  KEY `FK_cy65e612th3gw11ww2lja7fd2` (`configuration`),
  CONSTRAINT `FK_cy65e612th3gw11ww2lja7fd2` FOREIGN KEY (`configuration`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_negative_wordsen`
--

LOCK TABLES `configuration_negative_wordsen` WRITE;
/*!40000 ALTER TABLE `configuration_negative_wordsen` DISABLE KEYS */;
INSERT INTO `configuration_negative_wordsen` VALUES (231,'not'),(231,'bad'),(231,'horrible'),(231,'average'),(231,'disaster');
/*!40000 ALTER TABLE `configuration_negative_wordsen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_negative_wordses`
--

DROP TABLE IF EXISTS `configuration_negative_wordses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_negative_wordses` (
  `configuration` int(11) NOT NULL,
  `negative_wordses` varchar(255) DEFAULT NULL,
  KEY `FK_avhy1khrpj78xly5mou9jic1o` (`configuration`),
  CONSTRAINT `FK_avhy1khrpj78xly5mou9jic1o` FOREIGN KEY (`configuration`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_negative_wordses`
--

LOCK TABLES `configuration_negative_wordses` WRITE;
/*!40000 ALTER TABLE `configuration_negative_wordses` DISABLE KEYS */;
INSERT INTO `configuration_negative_wordses` VALUES (231,'no'),(231,'malo'),(231,'horrible'),(231,'mediocre'),(231,'desastroso');
/*!40000 ALTER TABLE `configuration_negative_wordses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_positive_wordsen`
--

DROP TABLE IF EXISTS `configuration_positive_wordsen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_positive_wordsen` (
  `configuration` int(11) NOT NULL,
  `positive_wordsen` varchar(255) DEFAULT NULL,
  KEY `FK_io6jl1741ea10yhe12saej9by` (`configuration`),
  CONSTRAINT `FK_io6jl1741ea10yhe12saej9by` FOREIGN KEY (`configuration`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_positive_wordsen`
--

LOCK TABLES `configuration_positive_wordsen` WRITE;
/*!40000 ALTER TABLE `configuration_positive_wordsen` DISABLE KEYS */;
INSERT INTO `configuration_positive_wordsen` VALUES (231,'good'),(231,'fantastic'),(231,'excellent'),(231,'great'),(231,'amazing'),(231,'terrific');
/*!40000 ALTER TABLE `configuration_positive_wordsen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_positive_wordses`
--

DROP TABLE IF EXISTS `configuration_positive_wordses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_positive_wordses` (
  `configuration` int(11) NOT NULL,
  `positive_wordses` varchar(255) DEFAULT NULL,
  KEY `FK_2m7mgnv5vmworpa8p16mmilbg` (`configuration`),
  CONSTRAINT `FK_2m7mgnv5vmworpa8p16mmilbg` FOREIGN KEY (`configuration`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_positive_wordses`
--

LOCK TABLES `configuration_positive_wordses` WRITE;
/*!40000 ALTER TABLE `configuration_positive_wordses` DISABLE KEYS */;
INSERT INTO `configuration_positive_wordses` VALUES (231,'bueno'),(231,'fantastico'),(231,'excelente'),(231,'genial'),(231,'increible'),(231,'estupendo');
/*!40000 ALTER TABLE `configuration_positive_wordses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_spam_wordsen`
--

DROP TABLE IF EXISTS `configuration_spam_wordsen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_spam_wordsen` (
  `configuration` int(11) NOT NULL,
  `spam_wordsen` varchar(255) DEFAULT NULL,
  KEY `FK_eydc405m0j5uys5u7my1ee4at` (`configuration`),
  CONSTRAINT `FK_eydc405m0j5uys5u7my1ee4at` FOREIGN KEY (`configuration`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_spam_wordsen`
--

LOCK TABLES `configuration_spam_wordsen` WRITE;
/*!40000 ALTER TABLE `configuration_spam_wordsen` DISABLE KEYS */;
INSERT INTO `configuration_spam_wordsen` VALUES (231,'sex'),(231,'cialis'),(231,'viagra'),(231,'you\'ve been selected'),(231,'one million'),(231,'nigeria'),(231,'SEX'),(231,'CIALIS'),(231,'VIAGRA'),(231,'YOU\'VE BEEN SELECTED'),(231,'ONE MILLION'),(231,'NIGERIA');
/*!40000 ALTER TABLE `configuration_spam_wordsen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_spam_wordses`
--

DROP TABLE IF EXISTS `configuration_spam_wordses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuration_spam_wordses` (
  `configuration` int(11) NOT NULL,
  `spam_wordses` varchar(255) DEFAULT NULL,
  KEY `FK_9wp8a1mq8umqr58t5bp136rmm` (`configuration`),
  CONSTRAINT `FK_9wp8a1mq8umqr58t5bp136rmm` FOREIGN KEY (`configuration`) REFERENCES `configuration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration_spam_wordses`
--

LOCK TABLES `configuration_spam_wordses` WRITE;
/*!40000 ALTER TABLE `configuration_spam_wordses` DISABLE KEYS */;
INSERT INTO `configuration_spam_wordses` VALUES (231,'sexo'),(231,'cialis'),(231,'viagra'),(231,'has sido seleccionado'),(231,'un millon'),(231,'nigeria'),(231,'SEXO'),(231,'CIALIS'),(231,'VIAGRA'),(231,'HAS SIDO SELECCIONADO'),(231,'UN MILLON'),(231,'NIGERIA');
/*!40000 ALTER TABLE `configuration_spam_wordses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_card` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `cvvcode` int(11) NOT NULL,
  `expiration_month` int(11) NOT NULL,
  `expiration_year` int(11) NOT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make_name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
INSERT INTO `credit_card` VALUES (222,0,110,9,2020,'holderName1','VISA','4516410092471036'),(223,0,777,9,2999,'systemcustom','VISA','4516410092471036'),(224,0,525,7,2022,'Alfonso','AMEX','4516410092471036'),(225,0,525,7,2022,'Pablo','AMEX','4516410092471036'),(226,0,525,7,2022,'Julian','AMEX','4516410092471036'),(227,0,232,2,2025,'Julian','VISA','4516410092471036'),(228,0,936,1,2045,'GOOGLE','VISA','4516410092471036'),(229,0,786,10,2042,'Amazon','VISA','4516410092471036'),(230,0,222,2,2062,'CLEVER','VISA','4516410092471036');
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curricula`
--

DROP TABLE IF EXISTS `curricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curricula` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `original` bit(1) NOT NULL,
  `hacker` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cmpmwnbib50w71nx0wjlp8x79` (`hacker`),
  CONSTRAINT `FK_cmpmwnbib50w71nx0wjlp8x79` FOREIGN KEY (`hacker`) REFERENCES `hacker` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula`
--

LOCK TABLES `curricula` WRITE;
/*!40000 ALTER TABLE `curricula` DISABLE KEYS */;
INSERT INTO `curricula` VALUES (232,0,'',195),(233,0,'',195),(234,0,'',195),(235,0,'',196),(236,0,'',196),(237,0,'',197);
/*!40000 ALTER TABLE `curricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_data`
--

DROP TABLE IF EXISTS `education_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_data` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `original` bit(1) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `curricula` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_b1949439gwkx4pjayup8gn2d6` (`curricula`),
  CONSTRAINT `FK_b1949439gwkx4pjayup8gn2d6` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_data`
--

LOCK TABLES `education_data` WRITE;
/*!40000 ALTER TABLE `education_data` DISABLE KEYS */;
INSERT INTO `education_data` VALUES (246,0,'Bachillerato','2004-06-12 15:35:00','Colegio Claret','9.45','','2000-09-15 15:35:00',232),(247,0,'Grado en Filología Hispánica',NULL,'Universidad de Sevilla','A','','2004-09-15 15:35:00',232);
/*!40000 ALTER TABLE `education_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder`
--

DROP TABLE IF EXISTS `finder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `max_deadline` datetime DEFAULT NULL,
  `min_salary` double DEFAULT NULL,
  `hacker` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_41crxbc805xo41bt5dr6nxtdp` (`hacker`),
  CONSTRAINT `FK_41crxbc805xo41bt5dr6nxtdp` FOREIGN KEY (`hacker`) REFERENCES `hacker` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder`
--

LOCK TABLES `finder` WRITE;
/*!40000 ALTER TABLE `finder` DISABLE KEYS */;
/*!40000 ALTER TABLE `finder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder_positions`
--

DROP TABLE IF EXISTS `finder_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder_positions` (
  `finder` int(11) NOT NULL,
  `positions` int(11) NOT NULL,
  KEY `FK_3d46gil0nks2dhgg7cyhv2m39` (`positions`),
  KEY `FK_l0b3qg4nly59oeqhe8ig5yssc` (`finder`),
  CONSTRAINT `FK_l0b3qg4nly59oeqhe8ig5yssc` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`),
  CONSTRAINT `FK_3d46gil0nks2dhgg7cyhv2m39` FOREIGN KEY (`positions`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder_positions`
--

LOCK TABLES `finder_positions` WRITE;
/*!40000 ALTER TABLE `finder_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `finder_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hacker`
--

DROP TABLE IF EXISTS `hacker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hacker` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `vatnumber` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `banned` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `spammer` bit(1) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `credit_card` int(11) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hackerUK_i7xei45auwq1f6vu25985riuh` (`user_account`),
  KEY `FK_tb3fnr0u8r6bad61eco2pldkq` (`credit_card`),
  CONSTRAINT `FK_pechhr6iex4b7l2rymmx1xi38` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_tb3fnr0u8r6bad61eco2pldkq` FOREIGN KEY (`credit_card`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hacker`
--

LOCK TABLES `hacker` WRITE;
/*!40000 ALTER TABLE `hacker` DISABLE KEYS */;
INSERT INTO `hacker` VALUES (195,1,'44860389P','Calle internet','\0','hackerman@gmail.com','Hackerman ','+34(625)773656789','https://i.ytimg.com/vi/KEkrWRHCDQU/maxresdefault.jpg','\0','El Hacker original',225,164),(196,1,'66660389P','Calle Bosque de pinos','\0','pinoquenoabedul@gmail.com','Pablo ','+34(625)277756789','https://cdn-images-1.medium.com/max/2600/1*TYAzzTJ60x-qg5N81ElU9A.png','\0','Pino que no Abedul',226,165),(197,1,'88956529A','Calle sin nombre','\0','julilopez@gmail.com','Julian','+34(625)997756789','https://cdn-images-1.medium.com/max/2600/1*TYAzzTJ60x-qg5N81ElU9A.png','\0','Lopez Jimenez',227,166);
/*!40000 ALTER TABLE `hacker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('domain_entity',2);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `provider` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_isojc9iaj7goju6s26847atbn` (`provider`),
  CONSTRAINT `FK_isojc9iaj7goju6s26847atbn` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (248,0,'Colegio Claret','Item1',189),(249,0,'Colegio Claret','Item1',189),(250,0,'','Item2',190),(251,0,'','Item2',191),(252,0,'','Item2',192),(253,0,'','Item2',193),(254,0,'','Item2',194);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_link`
--

DROP TABLE IF EXISTS `item_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_link` (
  `item` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  KEY `FK_oxhqxiuhm045bjla6aaqkil4s` (`item`),
  CONSTRAINT `FK_oxhqxiuhm045bjla6aaqkil4s` FOREIGN KEY (`item`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_link`
--

LOCK TABLES `item_link` WRITE;
/*!40000 ALTER TABLE `item_link` DISABLE KEYS */;
INSERT INTO `item_link` VALUES (248,'https://link1.com'),(249,'https://link1.com'),(250,'https://link2.com'),(251,'https://link2.com'),(252,'https://link2.com'),(253,'https://link2.com'),(254,'https://link2.com');
/*!40000 ALTER TABLE `item_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pictures`
--

DROP TABLE IF EXISTS `item_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_pictures` (
  `item` int(11) NOT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  KEY `FK_aur62dcmq5mod3fcwl099dmxi` (`item`),
  CONSTRAINT `FK_aur62dcmq5mod3fcwl099dmxi` FOREIGN KEY (`item`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pictures`
--

LOCK TABLES `item_pictures` WRITE;
/*!40000 ALTER TABLE `item_pictures` DISABLE KEYS */;
INSERT INTO `item_pictures` VALUES (248,'http://1.bp.blogspot.com/-ShwlTH_PTvk/Uf6goC1eneI/AAAAAAAALvY/gb_UBcA6GQU/s1600/bruja-escoba-luna-miedo-dibujo-sin-derechos-autor.png'),(249,'http://1.bp.blogspot.com/-ShwlTH_PTvk/Uf6goC1eneI/AAAAAAAALvY/gb_UBcA6GQU/s1600/bruja-escoba-luna-miedo-dibujo-sin-derechos-autor.png'),(250,'http://1.bp.blogspot.com/-ShwlTH_PTvk/Uf6goC1eneI/AAAAAAAALvY/gb_UBcA6GQU/s1600/bruja-escoba-luna-miedo-dibujo-sin-derechos-autor.png'),(251,'http://1.bp.blogspot.com/-ShwlTH_PTvk/Uf6goC1eneI/AAAAAAAALvY/gb_UBcA6GQU/s1600/bruja-escoba-luna-miedo-dibujo-sin-derechos-autor.png'),(252,'http://1.bp.blogspot.com/-ShwlTH_PTvk/Uf6goC1eneI/AAAAAAAALvY/gb_UBcA6GQU/s1600/bruja-escoba-luna-miedo-dibujo-sin-derechos-autor.png'),(253,'http://1.bp.blogspot.com/-ShwlTH_PTvk/Uf6goC1eneI/AAAAAAAALvY/gb_UBcA6GQU/s1600/bruja-escoba-luna-miedo-dibujo-sin-derechos-autor.png'),(254,'http://1.bp.blogspot.com/-ShwlTH_PTvk/Uf6goC1eneI/AAAAAAAALvY/gb_UBcA6GQU/s1600/bruja-escoba-luna-miedo-dibujo-sin-derechos-autor.png');
/*!40000 ALTER TABLE `item_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `receiver` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (263,0,'Hola','2018-06-28 00:00:00','Hola',181,195),(264,0,'body','2018-06-28 00:00:00','Subject',195,181),(265,0,'body','2018-06-28 00:00:00','Subject',198,181),(266,0,'SEXO FREE ONE MILLION','2018-06-28 00:00:00','SEX SEX SEX',181,198);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_tags`
--

DROP TABLE IF EXISTS `message_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_tags` (
  `message` int(11) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  KEY `FK_suckduhsrrtot7go5ejeev57w` (`message`),
  CONSTRAINT `FK_suckduhsrrtot7go5ejeev57w` FOREIGN KEY (`message`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_tags`
--

LOCK TABLES `message_tags` WRITE;
/*!40000 ALTER TABLE `message_tags` DISABLE KEYS */;
INSERT INTO `message_tags` VALUES (263,'Tag1'),(264,'TestTag');
/*!40000 ALTER TABLE `message_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miscellaneous_data`
--

DROP TABLE IF EXISTS `miscellaneous_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscellaneous_data` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `original` bit(1) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `curricula` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h48spqfrohqicpoi2y2kmdvhb` (`curricula`),
  CONSTRAINT `FK_h48spqfrohqicpoi2y2kmdvhb` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miscellaneous_data`
--

LOCK TABLES `miscellaneous_data` WRITE;
/*!40000 ALTER TABLE `miscellaneous_data` DISABLE KEYS */;
INSERT INTO `miscellaneous_data` VALUES (262,0,'','Volunariado de la semana solidaria',232);
/*!40000 ALTER TABLE `miscellaneous_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miscellaneous_data_attachments`
--

DROP TABLE IF EXISTS `miscellaneous_data_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscellaneous_data_attachments` (
  `miscellaneous_data` int(11) NOT NULL,
  `attachments` varchar(255) DEFAULT NULL,
  KEY `FK_e1oadh6x6vsemmnrwp19vocmr` (`miscellaneous_data`),
  CONSTRAINT `FK_e1oadh6x6vsemmnrwp19vocmr` FOREIGN KEY (`miscellaneous_data`) REFERENCES `miscellaneous_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miscellaneous_data_attachments`
--

LOCK TABLES `miscellaneous_data_attachments` WRITE;
/*!40000 ALTER TABLE `miscellaneous_data_attachments` DISABLE KEYS */;
INSERT INTO `miscellaneous_data_attachments` VALUES (262,'https://www.fundacionproclade.org/'),(262,'https://www.fundacionproclade.org/'),(262,'https://www.fundacionproclade.org/');
/*!40000 ALTER TABLE `miscellaneous_data_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_data`
--

DROP TABLE IF EXISTS `personal_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_data` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `git_hub_profile` varchar(255) DEFAULT NULL,
  `linked_in_profile` varchar(255) DEFAULT NULL,
  `original` bit(1) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `statement` varchar(255) DEFAULT NULL,
  `curricula` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9cabl85nl8no5idl3srdofe4c` (`curricula`),
  CONSTRAINT `FK_9cabl85nl8no5idl3srdofe4c` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_data`
--

LOCK TABLES `personal_data` WRITE;
/*!40000 ALTER TABLE `personal_data` DISABLE KEYS */;
INSERT INTO `personal_data` VALUES (238,0,'Pablo Vidal del Pozo','https://github.com/pablovidal','https://es.linkedin.com/in/pablovidal','','654565445','Canto en una banda llamada Perdido Godot',232),(239,0,'Pablo Vidal del Pozo','https://github.com/pablovidal','https://es.linkedin.com/in/pablovidal','','654565445','Doy clases en el colegio Claret',233),(240,0,'Pablo Vidal del Pozo','https://github.com/pablovidal','https://es.linkedin.com/in/pablovidal','','654565445','Me gusta la poesía',234),(241,0,'Javier Picón Pérez','https://github.com/pikon','https://es.linkedin.com/in/pikon','','654565445','Toco la batería en una banda llamada Perdido Godot',235),(242,0,'Javier Picón Pérez','https://github.com/pikon','https://es.linkedin.com/in/pikon','','654565445','Soy el comunity manager de Perdido Godot',236),(243,0,'Javier Camuña Correa','https://github.com/camumediko','https://es.linkedin.com/in/camumediko','','654888445','Toco el piano en una banda llamada Perdido Godot',237);
/*!40000 ALTER TABLE `personal_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `cancel` bit(1) NOT NULL,
  `dead_line` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `final_mode` bit(1) NOT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `salary` double NOT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `technologies` varchar(255) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `audit` int(11) DEFAULT NULL,
  `company` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_15390c4j2aeju6ha0iwvi6mc5` (`ticker`),
  KEY `UK_7qlfn4nye234rrm4w83nms1g8` (`company`),
  KEY `FK_jsifgej5bkl9dm5yceli8emkh` (`audit`),
  CONSTRAINT `FK_7qlfn4nye234rrm4w83nms1g8` FOREIGN KEY (`company`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_jsifgej5bkl9dm5yceli8emkh` FOREIGN KEY (`audit`) REFERENCES `audit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (201,0,'\0','2019-09-22 00:00:00','hace falta un tecnico que sepa de php ,django,y sea sociable, se valorara enormemente conocimiento con CLEVERCLOUD ','','Se busca personal para cubrir dos posiciones como técnico/a de sistemas informáticos. ',14000,'Conocimiento de java,algo de CSS y mucho de clevercloud, por cierto los cafes me salen de vicio ','PHP,CSS,DJANGO','GRUP-0001','Tecnico superior de sistemas informaticos',NULL,198),(202,0,'\0','2020-06-27 00:00:00','Esto es una descripcion para rellenar el campo,tiene algunas palabras de informaticos como hardware o deep web ,tambien algo de desportes como baloncesto o petanca,para asi tener un texto medianamente largo ','\0','Se busca personal para cubrir dos posiciones como técnico/a de sistemas informáticos. Se requiere un perfil mas junior y otro mas senior. La remuneración se basa en la experiencia aportada.',28450,'Conocimiento de java,algo de CSS y mucho de clevercloud, por cierto los cafes me salen de vicio ','JAVA,PHP,CSS,DJANGO','GRUP-0002','Auxiliar de sistemas',NULL,198),(203,0,'\0','2020-06-28 00:00:00',' Necesitamos un tecnico con urgencia','\0','Buscamos personas flexibles, audaces e innovadoras que vengan a desarrollar estas y otras muchas competencias con nosotros.',18000,'Se valorara enormemente conocimientos avanzados en JavaScript,Angular y HTML5 , y positivo el CSS3','JavaScript,JAVA,PHP,CSS,DJANGO,Angular','GRUP-0003','Técnico de Sistemas Informáticos Junior/Senior   ',NULL,198),(204,2,'\0','2019-06-27 00:00:00','Esto es una descripcion para rellenar el campo,tiene algunas palabras de informaticos como hardware o deep web ,tambien algo de desportes como baloncesto o petanca,para asi tener un texto medianamente largo ','','Se busca personal para cubrir dos posiciones como técnico/a de sistemas informáticos. Se requiere un perfil mas junior y otro mas senior. La remuneración se basa en la experiencia aportada.',28450,'Conocimiento de java,algo de CSS y mucho de clevercloud, por cierto los cafes me salen de vicio ','JAVA,PHP,CSS,DJANGO','GRUP-0006','Auxiliar de sistemas',NULL,199),(205,0,'\0','2020-06-28 00:00:00',' Necesitamos un tecnico con urgencia','\0','Buscamos personas flexibles, audaces e innovadoras que vengan a desarrollar estas y otras muchas competencias con nosotros.',28000,'Se valorara enormemente conocimientos avanzados en JavaScript,Angular y HTML5 , y positivo el CSS3','JavaScript,JAVA,PHP,CSS,DJANGO,Angular','GRUP-0007','Técnico de Sistemas Informáticos Junior/Senior',NULL,199),(206,0,'','2018-07-17 00:00:00','Esto es una descripcion de una position que esta en false los dos boolean ','\0','Se busca personal para cubrir dos posiciones como técnico/a de sistemas informáticos. Se requiere un perfil mas junior y otro mas senior. La remuneración se basa en la experiencia aportada.',99999,'Conocimiento de java y  clevercloud, se tambien Ruby y dotes sociales ,ademas de nivel A2 de ingles','RUBY,JAVA','GRUP-0008','Tecnico de redes superior',NULL,199),(207,0,'\0','2019-10-25 00:00:00','Hace falta un tecnico con experiencia de front y back ,buen salario','\0','Se busca personal para cubrir una posicion como técnico/a de sistemas informáticos. Se requiere un perfil senior. La remuneración se basa en la experiencia aportada.',22500,'Conocimiento de java ,CSS3 ,HTML5 y alto nivel de ingles y frances','JAVA ,CSS3,HTML5','GRUP-0009','Tecnico Front y back',NULL,200);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_data`
--

DROP TABLE IF EXISTS `position_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_data` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `original` bit(1) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `curricula` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_50pf203n1ob4iihr5n18eeoxf` (`curricula`),
  CONSTRAINT `FK_50pf203n1ob4iihr5n18eeoxf` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_data`
--

LOCK TABLES `position_data` WRITE;
/*!40000 ALTER TABLE `position_data` DISABLE KEYS */;
INSERT INTO `position_data` VALUES (244,0,'Profesor de secundaria en el colegio Claret',NULL,'','2016-06-25 15:35:00','Profesor',232),(245,0,'Director en la escuela de teatro TECLA','2017-05-12 15:35:00','','2012-05-12 15:35:00','Director de teatro',232);
/*!40000 ALTER TABLE `position_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_finders`
--

DROP TABLE IF EXISTS `position_finders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_finders` (
  `position` int(11) NOT NULL,
  `finders` int(11) NOT NULL,
  KEY `FK_dv93v6ywe0ejpei1jmm0w7bqg` (`finders`),
  KEY `FK_axvra5m9hwhlfxtdrioj1p17o` (`position`),
  CONSTRAINT `FK_axvra5m9hwhlfxtdrioj1p17o` FOREIGN KEY (`position`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_dv93v6ywe0ejpei1jmm0w7bqg` FOREIGN KEY (`finders`) REFERENCES `finder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_finders`
--

LOCK TABLES `position_finders` WRITE;
/*!40000 ALTER TABLE `position_finders` DISABLE KEYS */;
/*!40000 ALTER TABLE `position_finders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `final_mode` bit(1) NOT NULL,
  `hint` varchar(255) DEFAULT NULL,
  `statement` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `company` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_1dla8eoii1nn6emoo4yv86pgb` (`company`),
  KEY `FK_ehy58i7iq25u9d829b76s1891` (`position`),
  CONSTRAINT `FK_ehy58i7iq25u9d829b76s1891` FOREIGN KEY (`position`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_1dla8eoii1nn6emoo4yv86pgb` FOREIGN KEY (`company`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (208,0,'\0','librerias html','Fallo de compatibilidad','1Conflicto de librerias ',198,201),(209,0,'','Ruta del certificado','Da un aviso de seguridad al entrar en la página porque no carga el certificado','2Fallo de certificado HTTPS ',198,201),(210,0,'','Ruta del certificado','Da un aviso de seguridad al entrar en la página porque no carga el certificado','7Fallo de certificado HTTPS ',198,202),(211,0,'\0','Ruta del certificado','Da un aviso de seguridad al entrar en la página porque no carga el certificado','3Fallo de certificado HTTPS ',199,204),(212,0,'','security by default','Da un aviso de seguridad por lo que pueden robar datos','4Fallo de seguridad ',199,204),(213,0,'','security by default','Da un aviso de seguridad por lo que pueden robar datos','5Fallo de seguridad ',200,207),(214,0,'','Nothing to say','Da un aviso de seguridad','6Fallo critico',198,201),(215,0,'','Ruta del certificado','Da un aviso de seguridad al entrar en la página porque no carga el certificado','8Fallo de certificado HTTPS ',198,202),(216,0,'','Ruta del certificado','Da un aviso de seguridad al entrar en la página porque no carga el certificado','9Fallo de certificado HTTPS ',199,204);
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_attachments`
--

DROP TABLE IF EXISTS `problem_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_attachments` (
  `problem` int(11) NOT NULL,
  `attachments` varchar(255) DEFAULT NULL,
  KEY `FK_mhrgqo77annlexxubmtv4qvf7` (`problem`),
  CONSTRAINT `FK_mhrgqo77annlexxubmtv4qvf7` FOREIGN KEY (`problem`) REFERENCES `problem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_attachments`
--

LOCK TABLES `problem_attachments` WRITE;
/*!40000 ALTER TABLE `problem_attachments` DISABLE KEYS */;
INSERT INTO `problem_attachments` VALUES (208,'https://github.com/unic/neba'),(208,'https://github.com/Bernardo-MG/spring-ws-security-soap-example\n				'),(208,'https://github.com/Bernardo-MG/spring-ws-security-soap-example\n				'),(209,'https://github.com/unic/neba'),(210,'https://github.com/unic/neba'),(211,'https://github.com/unic/neba'),(212,'https://github.com/apache/aries-jax-rs-whiteboard'),(213,'https://github.com/apache/aries-jax-rs-whiteboard'),(215,'https://github.com/unic/neba'),(216,'https://github.com/unic/neba');
/*!40000 ALTER TABLE `problem_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `vatnumber` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `banned` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `spammer` bit(1) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `credit_card` int(11) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `providerUK_i7xei45auwq1f6vu25985riuh` (`user_account`),
  KEY `UK_pj40m1p8m3lcs2fkdl1n3f3lq` (`user_account`),
  KEY `FK_8tfs0v3dygkxkfyijig9gv9mj` (`credit_card`),
  CONSTRAINT `FK_pj40m1p8m3lcs2fkdl1n3f3lq` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_8tfs0v3dygkxkfyijig9gv9mj` FOREIGN KEY (`credit_card`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (189,1,'75860389Y','Avenida Italia 12','\0','juandelaoliva@gmail.com','Juan Manuel','+34(655)123456789','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-KUF1F8Y8PcSonTUCchWrDQhFFAr3FtkTNX7tCV5G4DeCptp6_A','\0','De la Oliva Aguilar',222,175,'marca1'),(190,1,'658554658Z','Avenida republica argentina','\0','alfonsom@gmail.com','Alfonso','658227452','https://www.w3schools.com/howto/img_avatar.png','\0','Alarcon',224,176,'marca2'),(191,1,'758603890','Avenida reina mercedes','\0','pepefg@gmail.com','Felipe','','','\0','Fernández Gómez',223,177,'marca3'),(192,1,'758603890','Avenida false 123','\0','josehjg@gmail.com','Jose','725614293','https://www.todohostingweb.com/wp-content/uploads/2013/03/imagenes-l%C3%ADbres-de-derechos-de-autor_min.jpg','\0','Hernández Jiménez',225,178,'marca4'),(193,1,'758603890','Avenida de los pirralos','\0','jesusgm@gmail.com','Pepe','624192532','http://1.bp.blogspot.com/-ShwlTH_PTvk/Uf6goC1eneI/AAAAAAAALvY/gb_UBcA6GQU/s1600/bruja-escoba-luna-miedo-dibujo-sin-derechos-autor.png','\0','Gil Maestre',227,179,'marca5'),(194,1,'758603890','Avenida de los pirralos','\0','jesusgm@gmail.com','Jesús','624192532','http://1.bp.blogspot.com/-ShwlTH_PTvk/Uf6goC1eneI/AAAAAAAALvY/gb_UBcA6GQU/s1600/bruja-escoba-luna-miedo-dibujo-sin-derechos-autor.png','\0','Gil Maestre',227,180,'marca5');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_profile`
--

DROP TABLE IF EXISTS `social_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_profile` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `linksn` varchar(255) DEFAULT NULL,
  `namesn` varchar(255) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `actor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_sbgl75onamh648sm42gak0vok` (`actor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_profile`
--

LOCK TABLES `social_profile` WRITE;
/*!40000 ALTER TABLE `social_profile` DISABLE KEYS */;
INSERT INTO `social_profile` VALUES (267,0,'https://twitter.com/Curaneitor','Twitter','Curaneitor78',195),(268,0,' https://www.instagram.com/sickerHup','Instagram','SickerHup',198),(269,0,' https://www.tuenti.com/sickerHup','Tuenti','SickerHup',195),(270,0,' https://www.tuenti.com/sickerHup','Tuenti','SickerHup',196),(271,0,'https://twitter.com/Aprobados','Twitter','Aprobados',196),(272,0,'https://twitter.com/Appa','Twitter','ProofMaster',199);
/*!40000 ALTER TABLE `social_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsorship`
--

DROP TABLE IF EXISTS `sponsorship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsorship` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `credit_card` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `provider` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_b1c71pwhg9slb986j8kl7uul1` (`credit_card`),
  KEY `FK_jnrjojfnyyaie1n4jhsdxjbig` (`position`),
  KEY `FK_dwk5ymekhnr143u957f7gtns6` (`provider`),
  CONSTRAINT `FK_dwk5ymekhnr143u957f7gtns6` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`),
  CONSTRAINT `FK_b1c71pwhg9slb986j8kl7uul1` FOREIGN KEY (`credit_card`) REFERENCES `credit_card` (`id`),
  CONSTRAINT `FK_jnrjojfnyyaie1n4jhsdxjbig` FOREIGN KEY (`position`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsorship`
--

LOCK TABLES `sponsorship` WRITE;
/*!40000 ALTER TABLE `sponsorship` DISABLE KEYS */;
INSERT INTO `sponsorship` VALUES (255,0,'sponsorshipsito','learn a lot',222,201,189),(256,0,'BEBESITAA','lo de nosotros es un secreto',223,204,190),(257,0,'BEBESITAA','lo de nosotros es un secreto',224,201,191),(258,0,'BEBESITAA','lo de nosotros es un secreto',225,204,192),(259,0,'BEBESITAA','lo de nosotros es un secreto',226,201,193),(260,0,'BEBESITAA','lo de nosotros es un secreto',228,204,194),(261,0,'BEBESITAA','lo de nosotros es un secreto',230,204,194);
/*!40000 ALTER TABLE `sponsorship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banned` bit(1) NOT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_castjbvpeeus0r8lbpehiu0e4` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (161,0,'\0','','e00cf25ad42683b3df678c61f42c6bda','admin1'),(162,0,'\0','','c84258e9c39059a89ab77d846ddab909','admin2'),(163,0,'\0','','system','system'),(164,0,'\0','','2ba2a8ac968a7a2b0a7baa7f2fef18d2','hacker1'),(165,0,'\0','','91af68b69a50a98dbc0800942540342c','hacker2'),(166,0,'\0','','c6ae6edca1ad45f42e619ec91a32b636','hacker3'),(167,0,'\0','','df655f976f7c9d3263815bd981225cd9','company1'),(168,0,'\0','','d196a28097115067fefd73d25b0c0be8','company2'),(169,0,'\0','','e828ae3339b8d80b3902c1564578804e','company3'),(170,0,'\0','','175d2e7a63f386554a4dd66e865c3e14','auditor1'),(171,0,'\0','','04dd94ba3212ac52ad3a1f4cbfb52d4f','auditor2'),(172,0,'\0','','fc2073dbe4f65dfd71e46602f8e6a5f3','auditor3'),(173,0,'\0','','6cc8affcba51a854192a33af68c08f49','auditor4'),(174,0,'\0','','3775bf00262284e83013c9cea5f41431','auditor5'),(175,0,'\0','','cdb82d56473901641525fbbd1d5dab56','provider1'),(176,0,'\0','','ebfc815ee2cc6a16225105bb7b3e1e53','provider2'),(177,0,'\0','','a575bf1b9ca7d068cef7bbc8fa7f43e1','provider3'),(178,0,'\0','','5d35a7d891c4aae477f56ebf807fbd0a','provider4'),(179,0,'\0','','bd19ee25be71cfc77f532c4b26b4a54e','provider5'),(180,0,'\0','','85202849e05dc23e4b80f2af8be3650c','provider6');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account_authorities`
--

DROP TABLE IF EXISTS `user_account_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account_authorities` (
  `user_account` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_pao8cwh93fpccb0bx6ilq6gsl` (`user_account`),
  CONSTRAINT `FK_pao8cwh93fpccb0bx6ilq6gsl` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account_authorities`
--

LOCK TABLES `user_account_authorities` WRITE;
/*!40000 ALTER TABLE `user_account_authorities` DISABLE KEYS */;
INSERT INTO `user_account_authorities` VALUES (161,'ADMIN'),(162,'ADMIN'),(163,'ADMIN'),(164,'HACKER'),(165,'HACKER'),(166,'HACKER'),(167,'COMPANY'),(168,'COMPANY'),(169,'COMPANY'),(170,'AUDITOR'),(171,'AUDITOR'),(172,'AUDITOR'),(173,'AUDITOR'),(174,'AUDITOR'),(175,'PROVIDER'),(176,'PROVIDER'),(177,'PROVIDER'),(178,'PROVIDER'),(179,'PROVIDER'),(180,'PROVIDER');
/*!40000 ALTER TABLE `user_account_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warning`
--

DROP TABLE IF EXISTS `warning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warning` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `is_warning` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warning`
--

LOCK TABLES `warning` WRITE;
/*!40000 ALTER TABLE `warning` DISABLE KEYS */;
/*!40000 ALTER TABLE `warning` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-09 17:11:38
commit;