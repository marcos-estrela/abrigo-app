CREATE DATABASE  IF NOT EXISTS `simplesvet` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `simplesvet`;
-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: simplesvet
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.16.04.1

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
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `numero_chip` int(15) unsigned zerofill DEFAULT NULL,
  `raca_id` int(11) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL COMMENT 'M - Macho, F - Fêmea',
  `especie` tinyint(1) NOT NULL COMMENT '1 - Cachorro, 2 - Gato',
  `data_nascimento` date DEFAULT NULL,
  `data_atualizacao` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Data e hora da última atualização do registro',
  `data_falecimento` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_chip_UNIQUE` (`numero_chip`),
  KEY `fk_raca_animal_idx` (`raca_id`),
  CONSTRAINT `fk_raca_animal` FOREIGN KEY (`raca_id`) REFERENCES `raca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (1,'Ricardo',000000000000001,3,'F',2,'2008-02-08','2019-10-20 16:03:23','2013-01-01'),(2,'Nina',000000000000002,5,'F',2,'2017-05-10','2019-10-20 16:14:54',NULL),(3,'Carol',000000000000003,2,'F',1,'2017-05-10','2019-10-20 16:14:54',NULL),(4,'JoÃ£o',000000000000005,5,'M',2,'2018-02-01','2019-10-20 16:15:25',NULL),(5,'Marcos',000000000002221,1,'F',2,'1990-01-09','2019-10-20 16:15:25','2019-02-01'),(6,'Marcelo',000000000000012,5,'M',2,'2019-09-04','2019-10-20 16:15:54',NULL),(7,'Cecilia',000000000000010,3,'F',1,'1992-01-29','2019-10-20 16:15:54',NULL),(8,'Caue',000000000000129,1,'M',1,'2017-05-10','2019-10-20 17:50:08',NULL),(9,'Chan',000000000000123,6,'M',1,'2016-05-11','2019-10-20 17:52:55',NULL),(10,'Renatinha',000000000000120,2,'F',1,'2018-02-08','2019-10-20 18:53:35',NULL),(11,'AnÃ´nimo',NULL,NULL,NULL,1,NULL,'2019-10-21 01:46:37',NULL),(12,'Mikaela',000000000023123,NULL,NULL,2,NULL,'2019-10-21 21:56:01',NULL),(13,'Camila',000000000012312,9,'M',2,'2018-02-01','2019-10-21 23:19:26',NULL);
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raca`
--

DROP TABLE IF EXISTS `raca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `situacao` char(3) DEFAULT 'ATI' COMMENT 'ATI - Ativo, INA - Inativo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raca`
--

LOCK TABLES `raca` WRITE;
/*!40000 ALTER TABLE `raca` DISABLE KEYS */;
INSERT INTO `raca` VALUES (1,'Bulldog','ATI'),(2,'Poodle','ATI'),(3,'Yorkshire','ATI'),(4,'Tiranossauro','INA'),(5,'Persa','ATI'),(6,'Pitbull','ATI'),(9,'SiamÃªs','ATI');
/*!40000 ALTER TABLE `raca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_animais`
--

DROP TABLE IF EXISTS `view_animais`;
/*!50001 DROP VIEW IF EXISTS `view_animais`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_animais` AS SELECT 
 1 AS `id`,
 1 AS `nome_animal`,
 1 AS `numero_chip`,
 1 AS `nome_raca`,
 1 AS `raca_id`,
 1 AS `sexo`,
 1 AS `especie_codigo`,
 1 AS `especie_nome`,
 1 AS `data_nascimento`,
 1 AS `data_falecimento`,
 1 AS `idade`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_racas`
--

DROP TABLE IF EXISTS `view_racas`;
/*!50001 DROP VIEW IF EXISTS `view_racas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_racas` AS SELECT 
 1 AS `value`,
 1 AS `text`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'simplesvet'
--

--
-- Dumping routines for database 'simplesvet'
--
/*!50003 DROP FUNCTION IF EXISTS `VERIFICAR_IDADE_ANIMAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `VERIFICAR_IDADE_ANIMAL`(
	id INT(11)
) RETURNS int(11)
BEGIN
	SELECT TIMESTAMPDIFF(YEAR, data_nascimento, IF(data_falecimento is not null, data_falecimento, CURDATE())) INTO @idade
    FROM animal as a
    WHERE a.id = id;
	RETURN @idade;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `atualizar_animal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_animal`(
IN animal_id INT(11),
IN nome VARCHAR(100),
IN numero_chip INT(15),
IN raca_id INT(11),
IN sexo CHAR(1),
IN especie TINYINT(1),
IN data_nascimento DATE,
IN data_falecimento DATE,
OUT status BOOLEAN,
OUT mensagem VARCHAR(100)
)
BEGIN
	UPDATE animal
    SET nome = nome,
		numero_chip = numero_chip,
        raca_id = raca_id,
        sexo = sexo,
        especie = especie,
        data_nascimento = data_nascimento,
        data_falecimento = data_falecimento
	WHERE id = animal_id;

	SELECT ROW_COUNT() INTO status;
	SELECT "Animal atualizado com sucesso." INTO mensagem;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserir_animal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserir_animal`(
IN nome VARCHAR(100),
IN numero_chip VARCHAR(20),
IN raca_id INT(11),
IN sexo CHAR(1),
IN especie TINYINT(1),
IN data_nascimento DATE,
OUT status BOOLEAN,
OUT mensagem VARCHAR(100)
)
BEGIN
	INSERT INTO animal (nome, numero_chip, raca_id, sexo, especie, data_nascimento)
    VALUES (nome, numero_chip, raca_id, sexo, especie, data_nascimento);
    
	SELECT ROW_COUNT() INTO status;
	SELECT "Animal cadastrado com sucesso." INTO mensagem;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserir_raca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserir_raca`(
IN nome VARCHAR(100),
OUT status BOOLEAN,
OUT mensagem VARCHAR(100)
)
BEGIN
	INSERT INTO raca (nome)
    VALUES (nome);
    
	SELECT ROW_COUNT() INTO status;
	SELECT IF(status = 0, "Não foi possível cadastrar a raça.", "Raça cadastrada com sucesso.") INTO mensagem;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_animais`
--

/*!50001 DROP VIEW IF EXISTS `view_animais`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_animais` AS select `a`.`id` AS `id`,`a`.`nome` AS `nome_animal`,`a`.`numero_chip` AS `numero_chip`,`r`.`nome` AS `nome_raca`,`a`.`raca_id` AS `raca_id`,`a`.`sexo` AS `sexo`,`a`.`especie` AS `especie_codigo`,if((`a`.`especie` = 1),'Cachorro',if((`a`.`especie` = 2),'Gato','Desconhecida')) AS `especie_nome`,`a`.`data_nascimento` AS `data_nascimento`,`a`.`data_falecimento` AS `data_falecimento`,if((`a`.`data_nascimento` is not null),`VERIFICAR_IDADE_ANIMAL`(`a`.`id`),NULL) AS `idade`,if(isnull(`a`.`data_falecimento`),'Vivo','Morto') AS `estado` from (`animal` `a` left join `raca` `r` on((`r`.`id` = `a`.`raca_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_racas`
--

/*!50001 DROP VIEW IF EXISTS `view_racas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_racas` AS select `raca`.`id` AS `value`,`raca`.`nome` AS `text` from `raca` where (`raca`.`situacao` = 'ATI') */;
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

-- Dump completed on 2019-10-22  0:16:46
