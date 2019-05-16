start transaction;

CREATE DATABASE  IF NOT EXISTS `bqk1gwcmnu4attv6iqw8` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bqk1gwcmnu4attv6iqw8`;

-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: acme-rookies
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
-- Table structure for table `actor_messages`
--

DROP TABLE IF EXISTS `actor_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_messages` (
  `actor` int(11) NOT NULL,
  `messages` int(11) NOT NULL,
  KEY `FK_b1336eo2tc3f26b38f2drhyk8` (`messages`),
  CONSTRAINT `FK_b1336eo2tc3f26b38f2drhyk8` FOREIGN KEY (`messages`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_messages`
--

LOCK TABLES `actor_messages` WRITE;
/*!40000 ALTER TABLE `actor_messages` DISABLE KEYS */;
INSERT INTO `actor_messages` VALUES (560,593),(564,591),(564,592),(566,591),(566,592),(598,589),(598,590),(598,593),(599,589),(599,590);
/*!40000 ALTER TABLE `actor_messages` ENABLE KEYS */;
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
  `address` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `is_banned` bit(1) DEFAULT NULL,
  `is_spammer` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `vat` int(11) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7ohwsa2usmvu0yxb44je2lge` (`user_account`),
  CONSTRAINT `FK_7ohwsa2usmvu0yxb44je2lge` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (560,0,'admin 18','378721273855309',NULL,NULL,'admin','+34656256697',NULL,'surname1','admin',1,551,'admin@gmail.com');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (577,0,'https://www.piensasolutions.com/','This text is the solution for any problem');
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
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
  `creation_moment` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `submit_moment` datetime DEFAULT NULL,
  `answer` int(11) DEFAULT NULL,
  `curricula` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `problem` int(11) NOT NULL,
  `rookie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_hsw5exxa4qe3jxi8xdhnn0dl5` (`curricula`),
  KEY `FK_lvkbgejfw0xfg2m80h1bjjmau` (`answer`),
  KEY `FK_cqpb54jon3yjef814oj6g6o4n` (`position`),
  KEY `FK_7gn6fojv7rim6rxyglc6n9mt2` (`problem`),
  KEY `FK_dq1om37bx4hgli24rbkjo2n7` (`rookie`),
  CONSTRAINT `FK_dq1om37bx4hgli24rbkjo2n7` FOREIGN KEY (`rookie`) REFERENCES `rookie` (`id`),
  CONSTRAINT `FK_7gn6fojv7rim6rxyglc6n9mt2` FOREIGN KEY (`problem`) REFERENCES `problem` (`id`),
  CONSTRAINT `FK_cqpb54jon3yjef814oj6g6o4n` FOREIGN KEY (`position`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_hsw5exxa4qe3jxi8xdhnn0dl5` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`),
  CONSTRAINT `FK_lvkbgejfw0xfg2m80h1bjjmau` FOREIGN KEY (`answer`) REFERENCES `answer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (612,0,'2019-03-27 00:00:00','SUBMITTED',NULL,577,603,571,578,598),(613,0,'2019-02-18 00:00:00','PENDING',NULL,NULL,604,572,579,598);
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
  `final_mode` bit(1) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `score` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bumsxo4hc038y25pbfsinc38u` (`position`),
  CONSTRAINT `FK_bumsxo4hc038y25pbfsinc38u` FOREIGN KEY (`position`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
INSERT INTO `audit` VALUES (575,0,'','2019-04-18 00:00:00',5,'This position is not correct: \'un treh!\'',571),(576,0,'\0','2019-04-18 00:00:00',5,'I have determined that I do not undertand what is an audit',572);
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
  `address` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `is_banned` bit(1) DEFAULT NULL,
  `is_spammer` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `vat` int(11) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1hfceldjralkadedlv9lg1tl8` (`user_account`),
  CONSTRAINT `FK_1hfceldjralkadedlv9lg1tl8` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor`
--

LOCK TABLES `auditor` WRITE;
/*!40000 ALTER TABLE `auditor` DISABLE KEYS */;
INSERT INTO `auditor` VALUES (569,0,'auditor1 18','4286278540050647',NULL,NULL,'auditor1','+34787876697',NULL,'auditor1','auditor1',10,558,'auditor1@gmail.com'),(570,0,'auditor2 18','4286278540050647',NULL,NULL,'auditor2','+34787876697',NULL,'auditor2','auditor2',20,559,'auditor2@gmail.com');
/*!40000 ALTER TABLE `auditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor_audits`
--

DROP TABLE IF EXISTS `auditor_audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditor_audits` (
  `auditor` int(11) NOT NULL,
  `audits` int(11) NOT NULL,
  UNIQUE KEY `UK_ld7rrqg8j8q64tvpy15gbba6p` (`audits`),
  KEY `FK_bmqgrk24lut7s90cohn81e2qa` (`auditor`),
  CONSTRAINT `FK_bmqgrk24lut7s90cohn81e2qa` FOREIGN KEY (`auditor`) REFERENCES `auditor` (`id`),
  CONSTRAINT `FK_ld7rrqg8j8q64tvpy15gbba6p` FOREIGN KEY (`audits`) REFERENCES `audit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor_audits`
--

LOCK TABLES `auditor_audits` WRITE;
/*!40000 ALTER TABLE `auditor_audits` DISABLE KEYS */;
INSERT INTO `auditor_audits` VALUES (569,575),(569,576);
/*!40000 ALTER TABLE `auditor_audits` ENABLE KEYS */;
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
  `address` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `is_banned` bit(1) DEFAULT NULL,
  `is_spammer` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `vat` int(11) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  `commercial_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pno7oguspp7fxv0y2twgplt0s` (`user_account`),
  CONSTRAINT `FK_pno7oguspp7fxv0y2twgplt0s` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (564,0,'company1 18','378721273855309',NULL,NULL,'company1','+34656256697',NULL,'company1',NULL,13,553,'company1 Co., Inc.','company1@gmail.com',NULL),(566,0,'Av Bird 18','378721273855309',NULL,NULL,'company2','+34625677697',NULL,'company2',NULL,9,555,'company2 Co., Inc.','company2@gmail.com',NULL);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `cache_time` int(11) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `english_message` varchar(255) DEFAULT NULL,
  `finder_max_result` int(11) DEFAULT NULL,
  `is_notified_rebranding` bit(1) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `spanish_message` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `vat` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` VALUES (597,0,1,'+34','Welcome to Acme Rookies! We\'re IT rookie\'s favourite job marketplace!',10,'\0','https://i.imgur.com/qAigF6Y.jpg','¡Bienvenidos a Acme Rookies! ¡Somos el mercado de trabajo favorito de los profesionales de las TICs!','Acme Rookies, Inc.',0.21);
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations_spam_words`
--

DROP TABLE IF EXISTS `configurations_spam_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations_spam_words` (
  `configurations` int(11) NOT NULL,
  `spam_words` varchar(255) DEFAULT NULL,
  KEY `FK_1mwxou3h8fn5uxuwtsbhw7g1e` (`configurations`),
  CONSTRAINT `FK_1mwxou3h8fn5uxuwtsbhw7g1e` FOREIGN KEY (`configurations`) REFERENCES `configurations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations_spam_words`
--

LOCK TABLES `configurations_spam_words` WRITE;
/*!40000 ALTER TABLE `configurations_spam_words` DISABLE KEYS */;
INSERT INTO `configurations_spam_words` VALUES (597,'sex'),(597,'viagra'),(597,'cialis'),(597,'one million'),(597,'you\'ve been selected'),(597,'Nigeria'),(597,'sexo'),(597,'un millón'),(597,'ha sido seleccionado');
/*!40000 ALTER TABLE `configurations_spam_words` ENABLE KEYS */;
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
  `applied` bit(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `personal_data` int(11) DEFAULT NULL,
  `rookie` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_67ossaqcrfgcegesi91m20iik` (`personal_data`),
  KEY `FK_lq4kfcvf5vufwsng4apko2wd` (`rookie`),
  CONSTRAINT `FK_lq4kfcvf5vufwsng4apko2wd` FOREIGN KEY (`rookie`) REFERENCES `rookie` (`id`),
  CONSTRAINT `FK_67ossaqcrfgcegesi91m20iik` FOREIGN KEY (`personal_data`) REFERENCES `personal_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula`
--

LOCK TABLES `curricula` WRITE;
/*!40000 ALTER TABLE `curricula` DISABLE KEYS */;
INSERT INTO `curricula` VALUES (603,0,'','Applied curricula 1',NULL,598),(604,0,'','Applied curricula 2',NULL,598),(605,1,'\0','first curricula of rookie 1',607,598),(606,1,'\0','first curricula of rookie 2',608,599);
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
  `mark` double DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `curricula` int(11) NOT NULL,
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
INSERT INTO `education_data` VALUES (610,0,'Engineering',NULL,'MIT',7.75,'2015-10-10 00:00:00',605);
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
  `max_salary` int(11) DEFAULT NULL,
  `min_salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder`
--

LOCK TABLES `finder` WRITE;
/*!40000 ALTER TABLE `finder` DISABLE KEYS */;
INSERT INTO `finder` VALUES (562,0,NULL,NULL,'2000-01-01 00:00:00',NULL,NULL),(563,0,NULL,NULL,'2000-01-01 00:00:00',NULL,NULL);
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
INSERT INTO `finder_positions` VALUES (563,571),(563,572);
/*!40000 ALTER TABLE `finder_positions` ENABLE KEYS */;
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
INSERT INTO `hibernate_sequences` VALUES ('domain_entity',1);
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
  `link` varchar(255) DEFAULT NULL,
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
INSERT INTO `item` VALUES (594,0,'item3 description','http://www.item3/provider2','item3',568),(595,0,'item4 description','http://www.item4/provider2','item4',568),(596,0,'item5 description','http://www.item5/provider2','item5',568),(614,0,'item1 description','http://www.item1/provider1','item1',600),(615,0,'item2 description','http://www.item2/provider1','item2',600);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pictures`
--

DROP TABLE IF EXISTS `item_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_pictures` (
  `item` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `target_id` int(11) NOT NULL,
  KEY `FK_aur62dcmq5mod3fcwl099dmxi` (`item`),
  CONSTRAINT `FK_aur62dcmq5mod3fcwl099dmxi` FOREIGN KEY (`item`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pictures`
--

LOCK TABLES `item_pictures` WRITE;
/*!40000 ALTER TABLE `item_pictures` DISABLE KEYS */;
INSERT INTO `item_pictures` VALUES (594,'https://sevillasecreta.co/wp-content/uploads/2016/08/triana.jpg',0),(594,'https://i1.wp.com/bartapassevilla.com/wp-content/uploads/2017/10/centro-historico-de-sevilla-aerea.jpg?w=800',0),(614,'https://www.visitasevilla.es/sites/default/files/styles/card_extended_page/public/extended_page/img_card_right/altozano_triana.jpg?itok=9W4ZVUUd',0),(614,'https://ep01.epimg.net/elviajero/imagenes/2017/10/25/actualidad/1508938430_500364_1508945034_noticia_normal_recorte1.jpg',0);
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
  `is_notification` bit(1) DEFAULT NULL,
  `is_spam` bit(1) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (589,1,'body example',NULL,NULL,'2019-02-12 00:00:00','LOW','subject example',598),(590,1,'You have to use cialis',NULL,NULL,'2019-02-12 00:00:00','LOW','subject example',599),(591,0,'You have to use viagra',NULL,NULL,'2019-02-12 00:00:00','LOW','subject example',564),(592,0,'This is fantastic, amazing',NULL,NULL,'2019-02-12 00:00:00','LOW','subject example',566),(593,0,'This is bad, horrible',NULL,NULL,'2019-02-12 00:00:00','LOW','subject example',560);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_recipients`
--

DROP TABLE IF EXISTS `message_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_recipients` (
  `message` int(11) NOT NULL,
  `recipients` int(11) NOT NULL,
  KEY `FK_1odmg2n3n487tvhuxx5oyyya2` (`message`),
  CONSTRAINT `FK_1odmg2n3n487tvhuxx5oyyya2` FOREIGN KEY (`message`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_recipients`
--

LOCK TABLES `message_recipients` WRITE;
/*!40000 ALTER TABLE `message_recipients` DISABLE KEYS */;
INSERT INTO `message_recipients` VALUES (589,599),(590,598),(591,566),(592,564),(593,598);
/*!40000 ALTER TABLE `message_recipients` ENABLE KEYS */;
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
INSERT INTO `message_tags` VALUES (589,'WORK'),(589,'IMPORTAN');
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
  `text` varchar(255) DEFAULT NULL,
  `curricula` int(11) NOT NULL,
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
INSERT INTO `miscellaneous_data` VALUES (611,0,'I have several experience with some things',605);
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
  `link` varchar(255) DEFAULT NULL,
  `target_id` int(11) NOT NULL,
  KEY `FK_e1oadh6x6vsemmnrwp19vocmr` (`miscellaneous_data`),
  CONSTRAINT `FK_e1oadh6x6vsemmnrwp19vocmr` FOREIGN KEY (`miscellaneous_data`) REFERENCES `miscellaneous_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miscellaneous_data_attachments`
--

LOCK TABLES `miscellaneous_data_attachments` WRITE;
/*!40000 ALTER TABLE `miscellaneous_data_attachments` DISABLE KEYS */;
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
  `git_hub` varchar(255) DEFAULT NULL,
  `linked_in` varchar(255) DEFAULT NULL,
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
INSERT INTO `personal_data` VALUES (607,0,'Rookie 1','https://www.google.com/','https://www.google.com/','632587412','statement',605),(608,0,'Rookie 2','https://www.google.com/','https://www.google.com/','632888412','statement',606);
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
  `cancelled` bit(1) DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `final_mode` bit(1) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `technologies` varchar(255) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `auditor` int(11) DEFAULT NULL,
  `company` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_15390c4j2aeju6ha0iwvi6mc5` (`ticker`),
  KEY `FK_dvslehbjl7styqrm2tfvqg4d2` (`auditor`),
  KEY `FK_7qlfn4nye234rrm4w83nms1g8` (`company`),
  CONSTRAINT `FK_7qlfn4nye234rrm4w83nms1g8` FOREIGN KEY (`company`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_dvslehbjl7styqrm2tfvqg4d2` FOREIGN KEY (`auditor`) REFERENCES `auditor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (571,0,NULL,'2019-06-12 00:00:00','Se busca programador en javascript','','Programador',20000,'skill1, skill2, skill3','tech1, tech2, tech3','comp-1234','Programador en  javascript',569,564),(572,0,NULL,'2019-07-12 00:00:00','Puesto de trabajo para consultor en seguridad','','Consultor',34000,'skill1, skill2, skill3','tech1, tech2, tech3','posi-4239','Consultor de seguridad',569,564),(573,0,NULL,'2019-06-20 00:00:00','Se busca analista de sistemas web','','Programador',17000,'skill1, skill2, skill3','tech1, tech2, tech3','abcd-4739','Analista de sistemas web',NULL,566),(574,0,'\0','2019-07-18 00:00:00','Puesto de trabajo para especialistas en big data','\0','Consultor',24000,'skill1, skill2, skill3','tech1, tech2, tech3','posi-4999','Especialista en Big Data',NULL,564);
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
  `start_date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `curricula` int(11) NOT NULL,
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
INSERT INTO `position_data` VALUES (609,0,'I was CEO of sony',NULL,'2015-10-10 00:00:00','CEO',605);
/*!40000 ALTER TABLE `position_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_problems`
--

DROP TABLE IF EXISTS `position_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_problems` (
  `position` int(11) NOT NULL,
  `problems` int(11) NOT NULL,
  KEY `FK_7pe330ganri24wsftsajlm4l9` (`problems`),
  KEY `FK_iji6l3ytrjgytbgo6oi061elj` (`position`),
  CONSTRAINT `FK_iji6l3ytrjgytbgo6oi061elj` FOREIGN KEY (`position`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_7pe330ganri24wsftsajlm4l9` FOREIGN KEY (`problems`) REFERENCES `problem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_problems`
--

LOCK TABLES `position_problems` WRITE;
/*!40000 ALTER TABLE `position_problems` DISABLE KEYS */;
INSERT INTO `position_problems` VALUES (571,578),(571,579),(571,580),(572,584),(572,585),(572,586),(573,581),(573,582),(573,583),(574,581),(574,582),(574,583);
/*!40000 ALTER TABLE `position_problems` ENABLE KEYS */;
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
  `final_mode` bit(1) DEFAULT NULL,
  `hint` varchar(255) DEFAULT NULL,
  `statement` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `company` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1dla8eoii1nn6emoo4yv86pgb` (`company`),
  CONSTRAINT `FK_1dla8eoii1nn6emoo4yv86pgb` FOREIGN KEY (`company`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (578,0,'',NULL,'Creación de codigo en javascript','Bugs en codigo javascript en Aplicacion web',564),(579,0,'',NULL,'Realizacion de pruebas en javascript','validacion de codigo javascript en Aplicacion web',564),(580,0,'\0',NULL,'Se han de implementar funciones diversas al producto','Implementacion de nuevas funciones',564),(581,0,'',NULL,'Creación de codigo en php','Bugs en codigo php en Aplicacion web',566),(582,0,'',NULL,'Realizacion de pruebas en C#','validacion de codigo C# en Aplicacion web',566),(583,0,'','Hinst for problem 6','Statement problem 6','problem6',564),(584,0,'','Hinst for problem 7','Statement problem 7','problem7',564),(585,0,'','Hinst for problem 8','Statement problem 8','problem8',564),(586,0,'','Hinst for problem 9','Statement problem 9','problem9',564);
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
  `link` varchar(255) DEFAULT NULL,
  `target_id` int(11) NOT NULL,
  KEY `FK_mhrgqo77annlexxubmtv4qvf7` (`problem`),
  CONSTRAINT `FK_mhrgqo77annlexxubmtv4qvf7` FOREIGN KEY (`problem`) REFERENCES `problem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_attachments`
--

LOCK TABLES `problem_attachments` WRITE;
/*!40000 ALTER TABLE `problem_attachments` DISABLE KEYS */;
INSERT INTO `problem_attachments` VALUES (578,'http://www.attachments.com/1',0),(578,'http://www.attachments.com/2',0),(583,'http://www.attachments.com/1',0),(583,'http://www.attachments.com/2',0),(583,'http://www.attachments.com/3',0),(584,'http://www.attachments.com/1',0),(584,'http://www.attachments.com/2',0),(584,'http://www.attachments.com/3',0),(585,'http://www.attachments.com/1',0),(585,'http://www.attachments.com/2',0),(585,'http://www.attachments.com/3',0),(586,'http://www.attachments.com/1',0),(586,'http://www.attachments.com/2',0),(586,'http://www.attachments.com/3',0);
/*!40000 ALTER TABLE `problem_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_positions`
--

DROP TABLE IF EXISTS `problem_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_positions` (
  `problem` int(11) NOT NULL,
  `positions` int(11) NOT NULL,
  KEY `FK_ivrsr904uy11k43g8v0lnbtyg` (`positions`),
  KEY `FK_1bxlrdbreiq1fcldwcihp2hpx` (`problem`),
  CONSTRAINT `FK_1bxlrdbreiq1fcldwcihp2hpx` FOREIGN KEY (`problem`) REFERENCES `problem` (`id`),
  CONSTRAINT `FK_ivrsr904uy11k43g8v0lnbtyg` FOREIGN KEY (`positions`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_positions`
--

LOCK TABLES `problem_positions` WRITE;
/*!40000 ALTER TABLE `problem_positions` DISABLE KEYS */;
INSERT INTO `problem_positions` VALUES (578,571),(579,571),(581,573),(581,574),(582,573),(582,574),(583,573),(583,574),(584,572),(585,572),(586,572);
/*!40000 ALTER TABLE `problem_positions` ENABLE KEYS */;
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
  `address` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `is_banned` bit(1) DEFAULT NULL,
  `is_spammer` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `vat` int(11) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pj40m1p8m3lcs2fkdl1n3f3lq` (`user_account`),
  CONSTRAINT `FK_pj40m1p8m3lcs2fkdl1n3f3lq` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (568,0,'provider2 18','378721273855309',NULL,NULL,'provider2','+34656256697',NULL,'provider2','provider2',13,557,'provider1@gmail.com','provider2 provider2'),(600,0,'provider1 18','378721273855309',NULL,NULL,'provider1','+34656256697',NULL,'provider1','provider1',13,556,'provider1@gmail.com','provider1 provider1');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rookie`
--

DROP TABLE IF EXISTS `rookie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rookie` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `is_banned` bit(1) DEFAULT NULL,
  `is_spammer` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `vat` int(11) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `finder` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_n7rveqfq9lm0cwcxhwyvtyi1g` (`finder`),
  UNIQUE KEY `UK_2n8nv9qsl5pnxhnosngfkkm4i` (`user_account`),
  CONSTRAINT `FK_2n8nv9qsl5pnxhnosngfkkm4i` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_n7rveqfq9lm0cwcxhwyvtyi1g` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rookie`
--

LOCK TABLES `rookie` WRITE;
/*!40000 ALTER TABLE `rookie` DISABLE KEYS */;
INSERT INTO `rookie` VALUES (598,0,'rookie1 18','378721273855309',NULL,NULL,'rookie1','+34656256697',NULL,'rookie1','rookie1',13,552,'rookie1@gmail.com',562),(599,0,'rookie2 18','378721273855309',NULL,'','rookie2','+34656256697',NULL,'rookie2','rookie2',13,554,'rookie2@gmail.com',563);
/*!40000 ALTER TABLE `rookie` ENABLE KEYS */;
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
  `link` varchar(255) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `social_network` varchar(255) DEFAULT NULL,
  `actor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_profile`
--

LOCK TABLES `social_profile` WRITE;
/*!40000 ALTER TABLE `social_profile` DISABLE KEYS */;
INSERT INTO `social_profile` VALUES (561,0,'http://www.facebook/admin','admin','facebook',560),(565,0,'http://www.facebook/member1','company1','facebook',564),(567,0,'http://www.facebook/member2','company2','facebook',566),(587,1,'http://www.facebook/brotherhood1','rookie1','facebook',598),(588,1,'http://www.facebook/brotherhood2','rookie2','facebook',599);
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
  `charge` double NOT NULL,
  `credit_card` varchar(255) DEFAULT NULL,
  `target_page` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `provider` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jnrjojfnyyaie1n4jhsdxjbig` (`position`),
  KEY `FK_dwk5ymekhnr143u957f7gtns6` (`provider`),
  CONSTRAINT `FK_dwk5ymekhnr143u957f7gtns6` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`),
  CONSTRAINT `FK_jnrjojfnyyaie1n4jhsdxjbig` FOREIGN KEY (`position`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsorship`
--

LOCK TABLES `sponsorship` WRITE;
/*!40000 ALTER TABLE `sponsorship` DISABLE KEYS */;
INSERT INTO `sponsorship` VALUES (601,0,'https://goo.gl/mR1tJ6',0,'5145928616769391','http://www.targetPage.com',571,600),(602,0,'https://goo.gl/mR1tJ6',0,'5145928616769391','http://www.targetPage.com',572,600);
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
INSERT INTO `user_account` VALUES (551,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(552,0,'9701eb1802a4c63f51e1501512fbdd30','rookie1'),(553,0,'df655f976f7c9d3263815bd981225cd9','company1'),(554,0,'124be4fa2a59341a1d7e965ac49b2923','rookie2'),(555,0,'d196a28097115067fefd73d25b0c0be8','company2'),(556,0,'cdb82d56473901641525fbbd1d5dab56','provider1'),(557,0,'ebfc815ee2cc6a16225105bb7b3e1e53','provider2'),(558,0,'175d2e7a63f386554a4dd66e865c3e14','auditor1'),(559,0,'04dd94ba3212ac52ad3a1f4cbfb52d4f','auditor2');
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
INSERT INTO `user_account_authorities` VALUES (551,'ADMIN'),(552,'HACKER'),(553,'COMPANY'),(554,'HACKER'),(555,'COMPANY'),(556,'PROVIDER'),(557,'PROVIDER'),(558,'AUDITOR'),(559,'AUDITOR');
/*!40000 ALTER TABLE `user_account_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-15 12:07:47
commit;
