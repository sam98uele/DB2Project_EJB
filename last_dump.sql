CREATE DATABASE  IF NOT EXISTS `db2_project` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db2_project`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db2_project
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_log_user_idx` (`user_id`),
  CONSTRAINT `fk_log_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (71,'2021-03-06 13:39:17',5),(72,'2021-03-06 13:39:57',5),(73,'2021-03-06 13:40:31',5),(74,'2021-03-06 13:42:57',5),(75,'2021-03-06 13:55:39',6),(76,'2021-03-06 13:56:36',6),(77,'2021-03-06 13:56:42',5),(78,'2021-03-06 13:57:11',6),(79,'2021-03-06 14:59:23',6),(80,'2021-03-06 15:31:05',6),(81,'2021-03-06 15:33:40',6),(82,'2021-03-06 15:40:39',6),(83,'2021-03-06 15:40:58',6),(84,'2021-03-06 16:55:53',7),(85,'2021-03-06 17:00:34',5),(86,'2021-03-06 20:29:41',6),(87,'2021-03-06 21:18:43',6),(88,'2021-03-06 21:21:58',6),(89,'2021-03-06 21:47:46',8),(90,'2021-03-06 21:48:51',8),(91,'2021-03-06 23:45:59',6),(92,'2021-03-06 23:52:37',6),(93,'2021-03-06 23:54:52',6),(94,'2021-03-06 23:55:24',9),(95,'2021-03-06 23:56:01',10),(96,'2021-03-06 23:57:39',6),(97,'2021-03-06 23:58:17',10),(98,'2021-03-07 00:00:15',6),(99,'2021-03-07 00:00:58',6),(100,'2021-03-07 00:04:30',6),(101,'2021-03-07 00:05:55',6),(102,'2021-03-07 00:06:48',6),(103,'2021-03-07 00:09:21',6),(104,'2021-03-07 00:26:18',6),(105,'2021-03-07 00:34:23',6),(106,'2021-03-07 00:35:21',6),(107,'2021-03-07 17:32:13',5),(108,'2021-03-07 17:35:07',6),(109,'2021-03-07 17:35:40',5),(110,'2021-03-07 17:42:00',5),(111,'2021-03-07 17:42:41',6),(112,'2021-03-07 17:43:06',7),(113,'2021-03-07 17:43:26',5),(114,'2021-03-07 18:04:59',5),(115,'2021-03-07 18:17:26',5),(116,'2021-03-07 18:19:28',5),(117,'2021-03-07 18:26:00',5),(118,'2021-03-07 18:47:14',5),(119,'2021-03-08 09:34:06',5),(120,'2021-03-08 09:41:30',5),(121,'2021-03-08 09:52:48',5),(122,'2021-03-08 09:57:53',5),(123,'2021-03-08 10:12:56',5),(124,'2021-03-08 10:15:04',5),(125,'2021-03-08 11:00:58',5),(126,'2021-03-08 11:13:12',5),(127,'2021-03-08 11:15:27',5),(128,'2021-03-08 12:45:30',5),(129,'2021-03-08 12:59:55',5),(130,'2021-03-08 13:21:17',5),(131,'2021-03-08 14:19:32',5),(132,'2021-03-08 16:38:43',5),(133,'2021-03-08 16:39:11',5),(134,'2021-03-08 16:45:20',5);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_answer`
--

DROP TABLE IF EXISTS `marketing_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `answer` text NOT NULL,
  `response_id` int NOT NULL,
  `question_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_marketing_answer_marketing_questions1_idx` (`question_id`),
  KEY `fk_marketing_answer_questionnaire_response1_idx` (`response_id`),
  CONSTRAINT `fk_marketing_answer_marketing_questions1` FOREIGN KEY (`question_id`) REFERENCES `marketing_questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_marketing_answer_questionnaire_response1` FOREIGN KEY (`response_id`) REFERENCES `questionnaire_response` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_answer`
--

LOCK TABLES `marketing_answer` WRITE;
/*!40000 ALTER TABLE `marketing_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_questions`
--

DROP TABLE IF EXISTS `marketing_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ordering` int NOT NULL DEFAULT '0',
  `question` varchar(200) NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_marketing_questions_product1_idx` (`product_id`),
  CONSTRAINT `fk_marketing_questions_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_questions`
--

LOCK TABLES `marketing_questions` WRITE;
/*!40000 ALTER TABLE `marketing_questions` DISABLE KEYS */;
INSERT INTO `marketing_questions` VALUES (16,0,'rew',20),(17,2,'w',20),(18,1,'rew',20);
/*!40000 ALTER TABLE `marketing_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offensive`
--

DROP TABLE IF EXISTS `offensive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offensive` (
  `id` int NOT NULL AUTO_INCREMENT,
  `word` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offensive`
--

LOCK TABLES `offensive` WRITE;
/*!40000 ALTER TABLE `offensive` DISABLE KEYS */;
INSERT INTO `offensive` VALUES (1,'cazzo');
/*!40000 ALTER TABLE `offensive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `image` mediumblob NOT NULL,
  `date` date NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (20,'sdf',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0		\n\n	\n\n\r \Z+!$2\"3*7%\"0\n\r\r\r\"	\"\r#ÿ\Â\0ô¶\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0\0\ìˆ€\00@\0\0\0\0\n€\0\0\0\ÙZD‚@Q(\0I@0\0%\0$€ L\'F\Ü”\0£Q€\0I„…\0\00f\0 DFF\0\Ó	Ñ¢\0J\çiLt\â«*’\ÚX\Ñfú1D\'\í\Ï5hš|»e¼\Åî²…ª	Ž!WI€\Ï\éK=\í¼ok4\\9Ç‹¢h@\æ¶¼\ç¨L\ä©\ê\Öe(M\æš|\ßQx\0\Ôq¤f\0I\0+0^>[a\É;\ì\Ê\ç=Kk[\ÔHùl™\ÙÅ‚pK\Ýñn\ÄG\Î#ö)\0j9i€	 G9\ÚÃ­\è<ß«ñ-©a:ÿ\0(\ÖW²>A­›g¦<¿\\\ã{r”\Õõ}@\0M04MÀ@\ç]…µ6Šš­+ž.N†M¨\Ëi\\­z\Ò%ZeÊu’¹²\Z`h°Ø²Ch#H0	 ˆ\0\0k30`\n0jP>½„\çA«\Ý>%s\Úz<\ê	@\0\0\0\ÍF`\0	À\0’]ÿ\0!\Íô—]£?Â»esÐ¦\äuüŠ¨$‘\0\0\0ÂŒ\Ì\0\0¥#\Ðx¾m\Òòý‹7\ÈH”µ,\Þ°”5\0\0\0\0Y˜\r$\0\0%)ˆ\Âó’Ow¨\ä½\ZTQ*šò‡|À¦\ÈW¨\0\0H%XÛ®¾µ&}‡\ç\×Lƒ‰\éaÔœv³8C$W \0Jm´¢\í—-Lz\Ó	)O¢ñ\à7|\ÍZ\Ö@\ÌÁ©@ \0\0¼ž\Ö~)«A²—\È-\ê\Ð a´£\Ò8nnM4\0p\È\Z\Íf£\n\0\0W6’¢N\×\íð˜›\nô…!)G¤°œø\á\Æ\0‚–kR”¥šJE£v¹Y¦\Ètû-_p\á\0Tv™ô\Î-lÀI’Vµ¸£Z–jSÖ•mªØº7µç­¤+¶»=\Ëm©\Í\éÊ…ˆþ›\Âsw9,Ô )N(\îmY¦%-Rtù\Èúù\ÚúŽ7y¨\Òù\ÝV\ÂSq!W°×§0\Ü\Å÷š™:UeZ´ýN;úLn%f§6\íèž¹\ÃsHsz:,Î·Y}\ÏpºÇ˜¯©¶ý9Š\å.ÌŸ2z)é´½‘Whó¯v\\}\Ì\äôº;j\ënsOZW=Cs#®·\ÈuÓ°\Ìtzk\Ë@Œ‰V¶²\ÝŽ*Ô¾z5;)®M\í§+\ßo\çx´\ïF\í¼u7C\Ã\Ý\ÐQLn›ô\Î7–)l6¥Í¾ƒ‘Ž\Í?†§§WS)o9\Ðy~£³r\ê\Øl\È\Üò(ý¯Ž\î\ï\ï9&g¥e\éR\ÌT7éŒŸ\'2R\ÞmgAå£¸\ì\êaÈ¤˜\èUsw\nÁºICª>K¾Ö°‰8<Nó\Ìt£\ÒÙžT©\"\åÌ˜\ÖË•‹½v]\í\îb¡?{«\ã\Å;­s\ÌdwµÒ¹;rÓ­\è™\ÊBÀ)q¢¥–\Ïr§d2%<a[~HI\é\Ü\ÖgM\Í\Ó)ö\Ü\í\Ü]‹m\Ï-\ZzÎ·Ž\åY\Ó#¯?G\Ï7ø\ÖXÁ>”§\å\ï\ÊhK™6c¬§W\Úù\ÎWP\Ì\Ð\Ê\ìœDúÿ\0.ƒ}y†-\ÏM¶\å|²7£|\ê\Þ\çiç›¬\ë%\n2\Zô•/#R\ã0ûò$¿+E\È\Ð\Ö\Þ`sªe³³;¯Ÿ®ó:\Ý]\àñBú›<¥¿LyÅ¾\Ó5€\ÚDŒ\Äˆg\ÒüŒ\Õ‡ZÝ—³\ä%\èk/¹\Õ2yy½ûÎ‡Ø¹•V›\Ñ9\ß,„}?—£\Òþrgk½\Ïsm\Ýx\Ðã¥¯I\Õñ\ãy.\\—”\í¿ /C\Ûy}Î«’\Ë\ÌôœO±ó:>\×7s„©¥ò\Ôz_\Î,\í÷y\îo»Ç¡ˆÍ†ý+Œ…1O:\â\Þqôú*\×\Ë\ÎulŽ^oóö^cS¨\Ðós\n\í5©™óŒm¿J\Ís\rþ9b´múZ/5±×–\â\í\Ôn\åOŽ\Ñ\ÛT	ÑšzÊŽ©z;:\ÈBöXH\Ìò>‹DP+!¶ß¥Z\á†\ãq\Ô\ê\å®^÷”¤\rÿ\0‘ôLn’\ã±\ÎK¹\Ãun\'\Öù•þG[’PP\Ø\ï9\Þ_šmˆ­©¿L\'ƒ)À™–	Sû:\Ò\'×¹ª\ËXŠ»\Æ\\}baM…>º!±.i·\Ñ]Z\ÚQ\é¥ðGŸTW§\Í*e\Þ-\Æµ(\Ì$\Ò\Ò6ú«‡¢A¹\Êjó,¥¸H&½6ÿ\0Ÿt\Òð®‰ie6%t©Å¨È’@€\0)7Žt\\\r\ç[\Öe¬\à\ÍncA>Ÿ\Ïo¸\Ý[V7–ëž¯Y©jY‚\Ø\0u¤œ»-–o+h%\Ñiñ\àE„ß¨eù\ÉI\Ú[\n\Ú«¥\Z–‚\ì-3eR\È w›Ì•s\Õ÷µð\å1KTJg\Õoù¦T©\Ñš\ÖP“\ÖiR¥\Ý\ïsu\Ï\Ö\á*©#™»\ê<Ss)u\0“m³\ë”ùµ÷\\©‡-im²#\0\Ö\\\ìtØŠJ\ÍoS¤…\ÏÕ \r\Å{ö˜§bN*\Ú\ãúñ¯7”\Êq)3$\'mu›Ž\'š\\iÞž\ÄfkÐ“\\ö¡ó÷\">\"À[—š2\ÝJIFº&›)w€™©\Û\é¨8¬¸#u\Õp\Üþ¥ ¥\ÛD\Ðçž¯uu\Ð\Î\Î¬‹ÍŒ &[\ÉA%	\Þ\éó\×TÜ±û>…±‰\Êt¹ˆ\Ý~Ÿ)¯l-dP”˜u±N\Ò\'«‹\Î›˜\èJ‚\Ô\ìß†|^eÕ–\Ã_Ošv\Öv/1Yˆ\É(2M|c°Gª‡+Ã°›˜øCiJVS\áÌ„nl­+\0vYü][(a†o»i.SR0v%\êqçŠ°\ì6§<i\0–¶›o¶jc\Û8©)›¢‰d]+¦6Í¥c°ñœ\â¾\Ñ^¢/?S¡³9ð–\ÛI$=$\Þy•³,a46Ëˆ\ÕUpB·½1\æ\'C—œ\Ìs¦¬}<\\Œ?	©²\Zl‰$Ä¶Ž\\«~‡iYW¹³\Ì\ÔQ\Ã\r«Ñ‘¤°~Š\n\Þ*óÓ…À)ˆlN|!¤$ƒl\ÙÉ‘\r+goÓ¨ñù;\ÝE„\Ög[\Öv:‚Èº§\×u¨¹M÷¦GŸi„ˆ‘\çIe°Ÿe?6òRfg\Ö\ÝÈ£<jn¤\ï\Î\ïkZrke=5\Óy\Éúdy\ê¤I‡t€M4\îT%6¹\å²F,\Ô	&,!\Ð7ñ\0œ \Î[\ÓF\çWž–yªbG›!M\ÞØ³™ˆ‰Ûžsª­“Gf¦e\ÒužLü¨ñ@\ì;­py•H\æù½†k4ž”/<Õ‰1\"\Î\Ñ\\»A\\˜ñIÔ¹\Ó1m‹Ø»UÎº‡)\è4\Z“\Ê\ìó™b\éÚ–üœ\Í~k(·4ž”x«$\Ú[D®KQšeƒ\ÞA©£¾\æú«ô<Û§ò½Þ–¡M7Wžj\ç¡\Ë\Ïó¼––K&I\éAçƒ°°ª¤°’¤[\ÖÆª’‚(X¹€\ãjaöI.¡À\ëñg¬\×Fhi¹–\Ñ\ì½8¥2\âÇ(\Ñ~\Ô\ê\ÍuNŽÛ ³¬\Ôó‚³š&lQšN†K”\çQ\"–´„fYi}\\´\æDbl£j¾4rI¼\êÐ«qTšy\ê%Ë¦6É†ÈŒ\Â\ÝPŠ\Ìu–‡Ñ…Á+NdXó\äH-60¹\r Œ%FJh\0$]XeCA\è\Â\à\Õg64iÏ·+)#\0Áœ¦•€€\ã§†TZ?E§E›\",f#€`€j2 \0\0A$\ê\â°\Â\ËGè¢¯&G3^\Ô8ˆ\0f’ @ $8·­ôÓ„\Íø„\ÔR\Ò\Ö\×Á„\Äv@\037aF\ë®\È}ùR\çN³·š`0\0\0\0\0\0\0m\ÚÔ·²\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0ù~<’BT\ì³4q¨35¯ª|Ÿ±obœi.–:\îX\Î\×Í»-û]¯}Ÿ\æ\Þ~©\ì2&\Ñ\î\r/ ø|/¢ó\Øy\r¯-\éfñC\\û/\Ì0\à_Ir8n-û¾g\Õ`ú®ÏŸ\Þ}\Z\Ç\Ù}±H\Ã3\0 œR‡¤‡6\ÅD-6Á\Ð\0\09\æwmeaT‹œ†=/}\ÐKÀs\Ëo\Û\\ø@bõÀ+Jè´¯\Îù_EhP\è2\Ó\í³†U\Ù:\Âù?Ezh\át¡#_*W\ÎÕºUš­MY–ó÷¤\\­%\Ô>\'\Ýl\ÇZ´\îó±7•ôWŽV\\\Û2?<þvý·Ñ«}ž3\Ëz;Á\"R·N\Å\é¡\Ã\Ü\È\ÙÇ¹5\\½ž3\Ëo_‘U+•\ïØ¡±“¡N\Þ=\ëÝ³\nùM«\ì\Í\Ê+\rÇ¥§B\æ•\È)\é\ç\ÝK0¯–Ý¿\É$L–v¯j	cµJXm¦§,\Âym½\ï\Íi5–’u–2±\é½Cöò»z²*ªô;ÁA«P\Ô\ërU¼žÆ°,:p’HÕ©\èv¼\ä]ó:º\ÒGÃ£…l%£¹±dŽ¬³q#1«­Ã±WXû-\\¼¹®o^b“‰|ÖžÁ\År¦Û«–niNte\âFy½£ŠµÃœ,B¤“H\Õ<j_÷\r\çtvŽ(\á\Èüîžœ†.…¥ùT[[\ßOóš;G¯\Ê~o;{þ—/Ä›\Ú_=õ“WùU¯¸ch\í#$y9r,lje+²y\æ\í§\Óú7ž\ÐÛ‡;k©^i©ò\ï;›_:Î•\Ïg/›z\ÙÐ¤–U‰¢yfjñ´—&«A8œ:¢tVY\0a\Édm*´‰ÀNˆ\ç_¯\×	dm.r:ð\Çi\Ä8\×\ëH\ÒI$\Ó\0\0	Gd\0\0\0?ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0\Ð5«$´’ZJ\É\'$œ•\Í\Ô5\å\Û\ÎkJõ»g2«gXpT\æ6‘û7ò¦‹ƒ\Ó`!\éù…\è<Ö¾N\Ôó•œ\È\Ð?f©“™1#g1õ®\Ð,LzNd\'[Z²J\É$–’I%£)C4\Å\ï^\É\ç»$“³’I#\é\Ðþ”\äbî³—ói%¯\Ùj\ÎI#\é\Öh1- ós\ä„	ˆ6‚NI\Ý\Ç\É8:\Ôu­l\Ð\êKF+-[G\Ô\n ~µ ¸LÖ†hlÀ\ÌÂª°\Ä}A|\Òig\\LªO¥\ï|µ\àšÖ…£\êa\â÷+Zó\Õ\ìù%¹\çõ\Z`u%\èú‹Œh÷Er\å\æ¢Ç¥ó[¸‘.\è\éÖ‘õ—\Ç] ±ž›Y\Zh6\Ä\ÜCQ˜\Ú+RŠ†š£2×•\å[_œe6C*Kh­JcÚ±yYRPƒ (Œ©¦ˆÂ·\Øý\n¹\áU\Ù\Ê©§_œù\ËZ\Ñð.\È9Z\ËÒµ#\É\Éj‘ð/QŒf¨\ëÁ \×V­KHè‚½JŽµ#Z^÷\Ë\ã\"¸\Éa\ÃKWAqR^\ìZIW½\Æœ\È\\v«r“@ ¥»\'MQ™ŸLO$ŽD\È\Ü\äx œµšƒ†]S@±Póºö0²jðA9i\ÉÁ\Û\Òy\äƒm\ÅÕ¿¢jÊ”~u\à‚rÓ”g\Ôú—q|>>·¼\'Ÿóz™´/¥“hœ´\ÖôÛ«•®‡\Ð\Ð\ÜG\Ëv¡<\ëÁ\Ö\Ú\Ðq<k¤®üó\Ä\ç¤ò«\ÕTB7‰¥¤õ\ì`•¦C\ÔODR_IšªŽNŽÝ˜£.^ð\ê¢\è\í^‹…u\Ç\ætv\ì\ÅZp„!xÁh1Œa\Â\×™\ïLózN0ÁBXcB5\×UT”¨$’I:I\ÙJòI$’I?ÿ\Ä\04\0\0\0\0\0\0!124 \"3A#0B@Q%CPRaq$5ÿ\Ú\0\0s¬µ\n\Ô+P­Bµ\n\Ô+P­Bµ\n\Ô+P­Bµ\n\Ô+P­Bµ\n\Ô+P­Bµ\n\Ô+Qj¨V¡Z…j¨V¡Z…g+9Y\Ê\ÎVr³•œ­Bµ\n\Ô+P­Bµ\n\Ô+P¬\åj¨V¡Z…j•ªS™·Rsþ\æq‹¡I\Ïû™\Æ.…\'?³%CrŽ1Ë‹r\âßƒª\ÞB‚–fEÏŒr\ã¸Ç¨œ_\\Tò\é\0…[®3y\'\Ñ8\Æ=qM¬žÏ¤@lu%\Ò»	fd\\ø\Ç.1ËŒzw¥¤¦U¹\Îh\ÂZ\ÇelS\É+¶òb\èO·\Øq\Ê\ÇÁ™\à.\Z\Ã@¸x0Øœ&7™\å2š,ƒ7\rN¸jt\0k@Àd~¬—RG¦ì®¦~x­ä¬¶²§†\'\Çwp\Ð)Z\ÖH\æˆ=†\'¸1…\Çy$OnG–¨Ÿ©vÒ¼¦SEf\á \\4\noa\ê\0\ÌUvG&RšÖµ¹[\ä8\Çl›I\ÏÉ²\Ùl¶S‘ õN»\É\î\Ê\Çò9\í\Ö\Ê\äÆŒ\í[#bV\Öd\ê©6‚«{b\r¿4•/‚@2\Ó<2U²\ÙlªlgrŽ£M«ŒG\ÖôÀ\ZÖµT\Èü¢˜\ÂË¹\Õ\ZR89”¤5Å‹d@%m`¶[*’8w&@\Éqv\é\ä6[-–\ËdmŒ]\nN~]–\ËeQ¼Q<Fð\å\ÅÆ¤©c\ã-T\áº\íR\ÛI\ê\ÍVa`\n\ãó\Æ5zIR\È\Ø\ãÌš5eÁ…Á„ö†<´\Ã |@­–\Êr\Ó3\Ó)\à,i<5:dq3¦¢Q6Š=Ge \\C+]t\\\ÐEš\n\â\ÛóÅ±GP\Ù”U‘¤¨\íªUL }FA0ˆ«·˜\Ùl¶[#Œ]\nNd\Ò\ÄN\Ü#	\ZŽF\ìÁ\íaie<lxpO†)\r\Ï	\á\"B– AR\Â\ÙH\Í,ˆ’\Ü$‚9™\ÑD\"¾\\K‰$l\0>H\ìÎŽ6\Än¦‰\î.1°FÜ­|HnxH—	ŽFü\ÂXÄ Eb$µ\ZH\É\Ú(ô…¼§ºtòDöq•Œ¨\\eB\â\êWR¸º•\ÅÔ®.¥qU+Š©\\UJ\âªWR¸š•\ÄÔ®&¥q5K‰©\\EJ\â*WR¸Š•\ÄT®\"¥q+ˆ©\\EJ\â*WR¸Š•\ÄT®\"¥q+ˆ©\\EJ\âjWR¸š•\ÄÔ®&¥q5+Š©\\UJ\âªWR¸º•\ÅÔ®.¥q•+Œ©\\eB\â\ê:£{¤§w‰û±\âTPM/\'\Ñ\ä`O™#\0/1\È\Ö¸\Ç(`ydnfhÏ©¦Ÿñ·3ô¦‰\Ôò\Âö\í\Z¼OÝ©¤‘¥\Ê(4«\"U\rh¼üÔŒ†V67\Î\Ö\Ôh´9ôÓ‡\Â\Øô\Å<1É¨\rD­<4\å\àK­K.hT’N\ã’O\ìþ\Ú1xŸ»IN\Ö5«^\ÕZÌ¥y’\0÷x‘´,AYYe*Ê²…”,‹\"È´Öš\Ó+\"\Ê?°\ÐvŒ^\'\îÇ‰T£W‰ûLAG<\r…¬:ô—iv½>l\è\ÔDlÇ¶ª=767qP\Ý	\ã¼µ¾³0J×®*/R\âc³W)\ÒÇ¢bc¹}ö\Ç3ºE%a\\%Z0Nþ\íg\Zñ/v<J§“,\r\n­ù\â&\ÃJr\æÒ‚ì±Žšþ‡2•±9\Í\ËIœ\æ\ZhtB\0]hu¤\ÊÁOùž\Z\Ç/óûŒ†G­\ZXí›ˆk=£UP™W7\"Ú‡ü¹¬¨ºh\ÜXÿ\0¤þ©#||þ\Ýi\Zñ?r<Jd‘†\0\é\Ç6\Í\n\á\\+…p®e™fY–e™fWWûbžC¹úL\ésþI$ùTnU1kG™ª9,FSo·G\ÚD¼OÜú¸XÖ»\Õ<\å\ÆÉ½\Þ÷Ÿ+\é…F\å[GjµZ\â\ßhª^\Ö%\â]q\ád\àG\é\íŒQ¸»+fpgÓŽ(ŒŽ°\àœ¬ó0¦f\Écœ\Ç2C¯\ê\Ùã“‡’\Ç\ÈU7mñ.¨ü™A\äAÿ\0Bœ]˜\Ê\Û:\â6þJ6\é19…Ó\'p‚=y\ã;\Ù50ª\æl\'\n?S] ƒQÿ\0x•O\ÛD¼Kœ~K/úc¤‚9ù\Û\ï\é\á*‘¥©‡7«\È	\ã\éÎœ\Ç0\Ù\ÖAº”ªØµ9°1\ÏO$º\ç\Î67LQÜ”rH\Â\ÄZX÷4ƒ•À©Yõ.ÀÀ¶ùõl8•M\ÛD¼OúX\\b˜o\ÐAñ‚šI·LŠž³\ë!j\ãÚ…s>[$=._T^X\äd£$Æœ´¨š{Œ€¡ûªœ\ÎrxòF\Üò5‹øxF‚O\ÅÔµ,\Â\r\ÂÍ¶VÆ¼A–•²¼;úˆ^œõ-7mñ?\éy3þà´­\Ðu¹]¥lvs¡ùb¥‡ZM\ç¨d#+_$’R}9Šó KM\ÛI>£ljcÍ·(\ßh\Îx¥k†£µ\Â2†HÒ¦a#gA1F\'Ž¬)û˜\ÕdŽ\Í³\Úñù×±™Š\ë²ùMrª\à8RŸ«e$Ž\ÌA¹ó\Òö\Ñ/\å˜9Ã~BÇ§þÿ\0\Âº™–š”Is³9PGšC!ñ+\æ‹\Z3i\Õwôü®<™þj©`O\Å\Ê\'÷%\Â¤tŽiòS‡kÆ¼C\Ú;’©Þˆ l\àp	 ¹9¹\æ¦;#\Ú\áZ\ÛO˜5w-+u}1È“\ä¥\íb^\'\Ê/²$xM‘¨n¼D\ÚŒ|<\æUp\ëE·#gl¨aw¸ú‰5%\Û”Û“³Z2\å|\ÑINû:ÿ\0µ,‘ùœV›s‹\\0/p\åœjcUþ\ØÁÜ”¿üñ„^¨Á@Ò«EªNsxXž\ã3\Ï-þ|´¬K\Äú#ò\Ýl²«b\Ë\ê1xŸLX\Ðv­ÁñE\'[i©˜n\ÙX÷‹I\ç¡L2Ó¦Fšr’9#Nò‹»-ù\è@\rÅ—ú.ƒ3î´¡ùÓ¦N¥¦zmIZöWô%XúV5æŠ˜òm3£mše]¾Gaª‚_9T¬KÄ½¶a`²¢\×+.³ \æ|\äŒô†#‰ôÅ‹g•‚Í§–Y#©s…UE—2¢{Ÿ›4òH*d;\Ög,\ÎM–F¨j3l\à,\âQ–Q$kÊ¢–GO&\Ãs5Q½£2Hy\Ý\ÈI T²\Ï,¶Uý#IV¤Š\Z×´\ÚI\Z×³QŠ¬}…ñ\Î\Ä18•I\ÚÄ¼G\Úf#á•…i5hŸ9fa#ŠtG\ä£ø§(a\á\ÜÞª{¹pÿ\0Ž0D\r\Ô\Ï)þô¸S÷ª\×\åm‚&\Â\èRT¹¡\È\Ó\Ö_*§ˆC`ñM\Ä\Å(f||6K±Ñ—z^BŸx‚ ÷\ÚøŸ%\'k¯öZ®®Ú½\é+Dƒ´\Â\Ó+M\Ë#óµx§DX\Ó\ÑÁ,M{Ÿ\"¥‘¬xo7ª¾\îEuúU¢ô¯WWTñ)úò«ªSÿ\0¥‹\Ä.%jºº†±Í°‘’\Æþ•\â?†S‹\Ò\Æ	\ê8xwrª=â¤¶“\ÐT&Ó§´gr³V\È\âU\'kña¾B·[«¹gzÔ‘kH™3óµx§DX\Ðö¬Sû!‡†sz¬\î\ä\Â?uª³´“\r\èzŸ¸—\nNåŠ¦\rx\ìž\Ù#vY0swm-^k2Oü1¦\í£N\ë8xtª}\ä\î— ¨ý\ä\æ?;–G,¥U°*“µ‰x‡°<‡Íº`vv/\è\Z.ÕŠbL|3óU½\Ûð‹\Ýj¬\í$\Ç\Ã:ª;™p£\îYƒ\ØÇ‹>_aödc\â~W¡±^!¼qi»h\Óú\Î\Ý*õS›\ér\nƒy\Êt²gr\Ôz\Îå˜«•|);X•o–U•¨65ô–h–£¨BGfjñNˆñ¢\íX§ö$\Ç\Ã?5[Ý¿ýÖª\Î\Ò\\|3¡ê£¹—\n>\é‹\Ä^\æº,­®˜sþ\"TÒºg\ærcK\äk‰mcM\ÛF\Ôpð\î\éTªžN›T\Ïy_$«y©;X•l|‡\ËuršNv¯\è\Z.ÕŠbD0ð\Ï\ÍWw\Â/uŠ³´—\èz¨\îeÂ‹¹bñ?užArl\Ú*]/\\ž\'øcM\ÛFŸ\Öpðþ\éMî©¬!~¢\Ôó=Y\Ø-\'k­\í_\ä8\Û\È:Ú§\á\ì5¿—/\åÉ³R±¹Zg¦\"\Çùrþ\\™%w\È\ç\Ð<\æwò\åº3Ò¸\ëør¿‡&KFÎ‚\êno\á\È:¦ã‰¦<\Ýü9\Ü\Ì^„^\Z$¢£‰>J)-©ü¹[Ã“g¦h\0[Ã•¼9D(ÄŸJAõX´8\è\ÑFµÖ«J.‹li;X•gk\'ù7Y$Zeiºñôš|´€\Z–£Ÿ\êk\Æ\Ð\é¦sj„-©\r¿(gM¥‰•4\ê^)´YJ\×*§\æ\Ê\ÞB§\Ì)\ÄS‹\ÔFk¥s	Ø•Mœbò3NG10Z‚S†Â€ù¨þ‚Ÿ}B«d.\rjQ\Îö†\å>z^\Ö%W\ÛI\ä±Y\njôœü\\žj\É\Í×¥³x:•ÁÔ®¥pu*:z¸Ý™¼J\á*oqü\Å\ZJ¢I1\Ã[òG\rlMpgR£Žº6\ål°\ÖKl\í§«`p\n\ÇF#s)ª˜ð\æÿ\00B’¤S\à®{®d‚®SwGtM\Ê\Ù`«•\×tl®¹[%=\\Ž\Ì\î©pu+ƒ©\\J¤ñg2>LÊ«\Ü\n\Ý÷YšV\ËtQòRö\Ñ*ž\ÚLB8,U\ão37ø—¼¨¥ž=¢\â+>xŠ¥\ÄTŽ|]Bâª—T¸š•\ÄÔ®&¥q5+‰©\\MJ\âªWR¸ª•\ÅT®*¥qU+Š©\\UJ\âªTUO>™QW¿[3œ\Ð\æ9Ó§TÕµ\Ö<]B\ãeN­©<¸º£`\â\ç]JN¢f^\Ö\ÒpV+utq*›¶‰Tvò!\ä±W`Z¿\â\\\ãƒb¡\ÊQ\È\ÞfCñúH\æºs4\ÉHs2ñ\Ì\ÌñJ\Ë\ì¿\Ò\ËûÙª\Ë\à)z\Óý1\Ä\Ô³-‘J§\í\âS{/C\r‘w\ìIÁ¬{ºD\0{ƒ#z9ót¬o\'H÷~’\ß&ø±ï¥—Í©GÔª¨rú\Ú,ƒ	\ä[—˜ ´)\ÕU’ÿ\0Ik\Û\ÏŽ%A\ÛÄ¤öÞ‡“M\ß-lmYŠ\å\ÍÒ\Ò\ç9\Üþ\ëE\Ó\ØF\é=\ËJõh\Ä\î‰!{™|¡»¼\Ý\Þ_ù˜LE\à—\\¦4\îd…:b}1iz3>0\\ì­«sMDnU&õ-\È9\æ…\Ü\Ìcñs\\Ä¨½¦\'ô9b¬ß›þ\Ê\às\Ôÿ\0s\Ï\î\î€MjnA2µÆ¢÷\Î\Æl\Ö2)»b\Ê,dh£&\åá£¨»öò±\Å\ÙQ“Z•Ë’¦`“ªK±Å¬\Þ\âò–\ç\Þ\Çñ\Ù\Ì\ÎD­°<“yzJ’qý.˜\Zy¶6¯“\Ö\ØC’$^â©ªrl\íX‹n %\ì7‘’ž—S‘\Ô\æ\ç‚]ó*˜ò\ÉqNü²*±\êºv\â\é\Øfÿ\0+ƒþñ8òUð(ù¶ùô/Bô/Jô¯Jô­–É­L`McBjªú\Ò=X]U®\Ö§\'²\éñµ0%¤´°±R}H.›û#‰D£…®¾F\'©Ø”~\ÔrJ3;†qª0´ø~ÞŠzw\Î\â´%Œ.Ç°&L\Ô\ÇfS[\Ö\êE¥YZ\Ë\Ã\Ûy\Ü\äT¥\é\î*\ç\Ï\Ë\n“¬\ÚzKS¶r<°O´zÙ‹º\Ý÷¨\æ”\ÊÈ”_ý\Õ{:ƒ¦­xo±21®qô\Ç[\Ö™™Û˜d¼ýÇ²±q³aB\'¸§HSþ\É70Ø§ó_”q>\ÈL÷c\ÆOuøüb>\Åv\ÕÄ¥žñTK#©“Š\r¦…ô\ÐKª·\È{“_þ15\Çuck-0\ë®.\ZöA¬‹f¸\ídô\ä~\Ýü…w\ÒQ{ñc7¿&?ý H7nbMÉšW9§)»#\ä~O\ÛM\ê\ÏQec3£4…jl›Q~–\ÊIF[ \æ‚‰\Éð;ñ|r‘\ë#\ÖR­\æŠ¥\èo‡\í\ê>A;d)\ç\\<\éì‘½G\è…q3÷\ãðŽ\Ér9fr\Ìå˜¬\Åo†\ËÐ½Ù±¹\0`, \î,Zw´[OÃ£qA™p\Ì\ÈO¥ò\Ãg”cYZZ,Þ¹®\Z,\Ì\åfz\Ù\Ãr2\ìˆR\Ã”‘¹‡tO\Ò§\îbÆ§¹“„pk*\ÊßŸ¢«GN¬¨½\ß4ž°A,syžÁb\á«-\Óg‘zð2\Ê+ºfÞ ‡JU•Š7òQ@u^\\Iôÿ\0ÏŒ.›\ê-<\Â#dõ`MŒŒ\Èò\Ô\\\â,i»¨±ª\î¤\Ç\áÚº±V\nÿ\0¶IU£jd®c³(fŠn6”ö‚¬Ý¬j¢\çm\Û˜#»‰ztNŽ\Ê\å_\0	 \0ÀÈš\Æò+˜V\Û\ì\í\ßf\Ê)\å~J©¾\ì){¨±©\îd\Ç\á\Ú\Ù\îÙš {¹š\ßl’y\ám\î\Ø+mé©¸,»_OKš\æ\Þ\â÷)‘\ÈehRJ\Ê\Ä\à‹¢~\Ïu9\çn\ÎTL\ÏRº”®p1\ÈN´k*&¼G\Ñ\Ó\Ä\ã\éQ2/\èB\èn\ì\Ïu\ÑC©=¹\ØF½\ÜX\Ôw2b9#€óì®›\Ï\ÝS³›¤u¬<\Ûq¾h\râ‚®¶S&§\Ê\Æ\'9\ï\ëò\æò\ßit “Ú¢†X§v•#$.\Ñ\äq•¯sc\ËG¤Œ>Ö˜¹@M…¼A™i6›¢‡V k*N\î,j;™1‘Àyš×¼ú8k{Ú\Ç\ì¾I\Ôß´Z\nÖ©\Ë<\Å\0òò\ÑH\ã&W:÷\Ç÷[#²e\ï¼\Ïô¹\Ê	öqC©>V3™%\Î$\Ñ÷qc?q.#’8\ãi¦v\î\ËI\ZuCÈ³ûÀ&Ò—C™]M‹XSFbÖ©\â\ÑxnFf“ lEÓ˜D¬t/\Ê÷\Â\æD\Ù\nt\ä U\Õ\Õ\Ñ>X’V¹;÷À!…þ\ÎQa9\ÌC»JÏ·RI“\Z>\î<g\î%\ÄrG\0™\Ï\å¡=\Ýv³\Ù{\Þ\î¬0G©(j\Í7\ZªÙ’wµx‡ô‚‡ÞVûøPwSo_!U-mDO\ÉWµ$#\nM4…7’ c^d\Ìø]\ÅhŠ\æ²8XH\Ø\ã‹RZ†jNL‘V±3}°¤¨¿\Ó{šB\ä0 \ÝX7r\ç‚\äø¾C\ãô®|ŒÛ“s…w3÷\â9!\Ï\éñ·\Þ\Ã²\ée?)\Æ	¡†..­U¾	tž\ÙE\Äf\ÉsÃ§$0Jü\Æv29r²ƒÜ‘P÷2•\ÚU’\â\'h°¦Ú\èrT‡,Fht8•Qi¸fª\â\È&0\Ô\Å“\êY	c)\êM;ž,\n†¼·iY<\r‰¼ä­¼¥«šN‘pnQ wœ\ì\ë#\Æ4}\Üx\Í\ÜJ„2¥zÄ‘´}7\Ë#°FÀKZ\äød`{£1\Éfµ\ÏvV§\"\í\Èñ{ÿ\0¼6^”2«5mñ±[-•°°\ÃeµÕ›†\Øú¯e’R\â\Ð\Æ>Ch\ÝKP2\ÝÔ’±¥\Î\áœµ\ÒÓˆ\âl¶6Á²=¥jF\î½8]\ÑK›W\ÆYš@\Ò\çhrG\ä}V\ã#¤‚XZÙ›4.{ÊŒE$\ÊÖ˜aú9ø#k\ä0¾‘\â\Z&\\…\Ù\Ý,l:ñJ\àÈŸ,;¶\'66—¹\rJƒTÀÜ±\ä’(žcf”\0\æš\Ñ\Ô@\È\éNP\Ébdl•…ŒÐ¸\Ë|¦#L±œ\Ú\Â6\Æ\è\Øi­I²	#ŸSV[¡‘\Î\Z\Éõ\é\â~šf„Œ†–9x(ò¯Nø\ÞÙ¥‘¯\È\Öcò’Œž*<f÷\ä\ÄrG\ä8\ì¬†p\é\Ï/\ËKšnÆ’\Óv¶I™|¯šw·+„’µ¡­uEKÛ•\Ü]Rk\ÞÀC,\Ì4\ÕUd\Ç:3š7\Í<¢\Òq5VE\Ï9n_)\Ív¹\í\ès¤^ü°°Vv“»ýù1‘Àb~\ØýYò\Òwq\ãQ\ÜI‹y#€þ\Ò|´}\ÜX\Ô÷2b\ÞH\à08\ì¥%y&8É¹Ò…iB.	ô_\à\êj†«9½WWWþ\Ëu’Wt¶Ž©Éž?©ü:ü:Q\È>Ë¡\Ü\ÝENQðö|\Z	>\rJ\á*‘‚¤-9–W­ü—WWò\Ù\ë,‹,‹$«$«Ne§:ÒhT.©pµk„ª\\J\à\'_\Ã\ä_\Ãÿ\0qAÈ¡¦R\ÓzS`²±db\É\Z\É\Z\É\Z\ÈÅ•ª\Ãõ¿ÿ\Ä\0.\0\0\0\0\0\0\0!12\"3A #0Q4@Bqÿ\Ú\0\0\Ï\âUdZˆ\Ü[4;¾t\îù°ql\Ù\Ýs!â¹°ñl\Øx\Æl\ïÓ¼gNó;\Ît\ï9Ó½fÁ\Æ3`\âÙ³º\æ\ÃÅ³¡\â\ÙÓ»\çN\ï;¾t_:wl\è¼[;bwLÉˆ\ìôR\ï\Äÿ\0Ú¾7±\çM6Zzk7*_m=¥ø¶\Ò¬¯‡\ä\Ü:Ó´f\ÇVFtj¸nM©\ê§*¸^U¨¶\'j\ÌQ²\\,†¯\ÔY^EÃ­;V\\«ûƒºSE—·EwQe-\Ñf\âü‡,/õ\èœP\ï&\ØÀ•3¡§CN\rt_d[²˜.£\'®µ·‰M\n¼B\Ûj®”ª…Ï¼°L|Ko¸!õ»j¥8Ž#Usô\Þ5Y„\ÇÁ«2³cdÑŽr2\Õô†V+Wk(\Í{*®”¨ß—8jñ¯óþ!(=d’z\Z*¶\Äó0\Îñ\èœOý«£kF}3\Ä\ÂË¢ºÞ«•¸j\Ë}õ[un3/K\nY“…r¯¯VVý,l¼|z¬\è\îys/*ŒŠ«Bdñô©¯ò¯°tµTc\ÐV¡\Ä2&UôZµ²¾NÊ¾µ£†ô7EyT¦#S1ó\êzM9n+B}1zz„ñ0¿×¢/\rÂµE–vž\r\á@ô‘\Ã8oˆ8o\rüvþ\äA\Ãÿ\0\0ŽÝ…;v\í\Ø3·`\ÎÝƒ;v\í\ØS·`\ÎÝƒ;~\í\ØS·`\ÎÛ…;^\í\\:vž;GŸ‡N\Ñ\Ã\á¬!(”}µŸ¸\Å\ÄEúÂ›­¥HVõñô9\ÞI9X\í®¡\Äq‡Ü±\çrÇ\Ë`\èYóiG\Û^B£\êõLú\Ök\ê›}ÀXh\r¹\Ú\Â\îž\0½\æfë”·\é\'^ýDüH»ñ\×bü¼Àwú+>M(ûiË¤or\Ì*lb\í\Ûè»v\ìy\Ûq§mÅ·SU Šÿ\0Af-¥\0o›‰[t·A\×\çô\ê?É¦?\ÛI©¯\á$y¿ K¬\éð7 Š \049Ú¿‘[õ¨nzþ\Ï\'ùŽm`3\Ç\ä¡÷™•F\Û\×vû{\Ê÷‹7\Óg#\Õ_‘eË \Êö«7P x\ê0HÉ¤À\Ê\ÞVÀ}…\'¥\ÊC\î !<Ÿ\ä\Ó\í¯-˜\Z“\îWúUõ™¬qZ˜\å:\ÚúÃ£\î†-Z“\ÕGœ\Ûa\Ó\ë\Ù\à\Ìvr£C—ø<Ç©\Z°Z\ÄZì¨£1€R\Z#Â·Rƒ\Èò“L¶³pjtÿ\0Z\"ù˜Ÿnf\Û(\Ô:M¹ž \èUÉ­T*ÿ\0–\'ù(\ßJ\äV®LL`\ÕS…\ßP\É\äVU\Ä\Ä´³/\é5495°\Ð`L¯\â\"hu‰¸y?É¦7\ÛBt‰­N¶\×Gx\ÇU‰\ÔƒPRöÌ”_Eˆ\Ç\éW !M\Ø\ÕÚ¤4ý\×W¶º\ÂXF*°XöQPYwRWIŠuJBT˜\è¬4\Ê\n³VköŠ>»\'ˆy?É¦7\Âno–šiôf?\ÛYÌµ\íqI!É¸þÕ‚TúJ\Ä\Êm½z†Vu}\Æ;\í, t–tX4ö\âh]U ™G\Âý\Ã÷¢E­Œ\Ô ò“L„\Ü	\æ\è\Ì¶&WÛ˜ž\Ï.ûvJþ)2>Tò_¿l³\âñ1™•]j[‡‹	\ÖÌ«\í¤\ÊöNM¿[\Âo\Î\×}vM´$\îl\Çù4\Æørny‡\ÚW™]j®Í©×¤S—U`‚ù\Õ2²…Ï¤*‰neN\ÈGp¦Êƒ»\Ã\Ä* ‰VuJ¡OpÇ–\ç+‚«^uJª¦\ìÊ¬\0\ãIÙ‚\å±úÖ£µ\ÜC³a\åù\äÿ\0&˜¿\È4?ý\ÚÌš_\ÔmzDªÀ\ÊK£¹S-Ga \èDp\ì\Í\Ðþ§\\tvtir3ôj\ÊÙ”*µ,Utô¹¯B\Ù\è\Û0‘”h®•|*\0\0My\äÿ\0&˜¿\ä!3sÑ­I\Ùô«ž•sÒ®zU\ÏJ¹\éU=*\ç¥\\ôjž•Q©Q²\n„ Á]DOF¹Ò«\ì|\èO\Ìß™¸ÿ\0#1=žnl\Í\Ò?;þ¿WPÞ£^‹\î·#{u95`\ï_Ugs«‚ $ô`ù<¹˜¾\ÖM@@„Ÿ\àg\ÔÈ¿CÃ»±;ª\Õ\Ð\Ýu\0b°<\ÈÜ¬,³\Ï^‰\æ=\Ï<C÷9y2õ\' #Vª6\Ä \ÖÊ¨=$\ÒÑ‘Ä°ye\Óy(¤jR4%`\êl7\ä0ð<\Ç\æ\ï\Ë\ÝùŸ\Ñhd€@¤\Çeˆ¾\Ò\Ä\Ñ \×Yb\0©\0Š\0þ?–/Í¹žMÕ£\Ñ\Õ|\ë¾n\ß-nö}[=}Z*~´\Ñ0\"kÀ¨ˆbK+ò•®\ã\ÌT\ãñ[œ‘[ñ\Ü\Ôr¯Gü‰ô]U©b‡¯ÿ\0/\Ë\æyŸ\Ô™c\ÓP\ê²\Þ%Y!+\\¯ª¦*?ó\Ò“vmU\ÜWuv\r§ˆH\0“\Äò®²Ñ§R\n•a*\Ô\ÛmU3\\*ö^–\ÕÞ•ð¯\Ë\æyŸÑ©ne5{\Ý\Ä\ìo³³¦•d²x4\ä~R»I]œœÄ¯\ÃYcX\å\Ù]”\íi\âV¯‹.Ì©\é~œ7\r\æ\Ê_*Ta—²E¹´ú6:ù,t«tuª\ßV…³–/É¹žL\ê£mo­|%¹—[\à˜\È\Ê,¬§¤²•:!€B­ŠN“\'!Ôª’w&ö$d\rX\ÆVA+®°w°›jñ\æM	_Ö¸<$^}[ˆ\n…Vbü›‘!|µ™Ô¯g±¼#\Ø\ÎvÜ«P\Ì6\ål¦\ÊØº¼º¶\Û<¯\ãPŒT­Œ1½Ì§Ëújô²¯OB¹ú[¤y–\âu¨RØ Ò˜ûbk¯T4©[õ¡]}/ðnK£³>\æök¼·$	ä°­	‹H#É§Ü…¤°\r\r\Zx&–S\å\éec¸:‹K`¡¡¨‚¢\nŽ‰\"ºzH\ï\ç\ÇYŒ\ë;‰‘húy]\ì?ƒfa\í³\âz­OZÀ5\r®H$]`\Z\Ü\rQÏ¿Sos©¾\Ï\é—\Ür»\Ør?õ‡%÷µ4!­O¹ ~;~\r.!G…O\ê\éš3¤Î“:\éh\ç¦ðUd<È¤~…üºôÿ\Ä\0,\0\0\0\0\0\0!12A \"Q#03Ba@ÿ\Ú\0\0DR ž\ÒN\ÊN\ÚN\ÒN\ÚN\ÒN\ÊN\ÊN\ÊN\ÊN\ÒN\ÒN\ÒN\ÒN\ÊN\ÊN\ÒN\ÒN\ÚN\ÒN\ÒN\ÒN\ÒN\ÚN\ÚN\ÚFQ³+ø¯ðJ\Þ\Ã\Å>\Ç\"[M•k›\ÓeaK×uƒ’ýŽDe*Jšñ\î±y¯DÄ¹\Ô:¶\ào Çµ—¸%x\×X9/\Ù\ß+¦\Ç\Ë]ocqK+jÛ‹õ“Jþ#¦\æ\æ!U\Ï÷´X-™\Î	¬›MiB%g\"\ÒBT†\×;¥,®¥Ê¬Wi\Ö\Ä+aÇ©j\Æ[Ô±ºº\ÅÖ™\ÞÕ½±z\nÝ”eXkJR¾ý“Í²\ÖÕ„¨ž¯ò2¿ˆþ×¢+W`8JAÚ¶Z®2-[lŒkBwS#®]ºr+¦·\ã÷\Ù#&»«M\ËsJ–¦¶\Æ\Zjò+¦¢+û\Û\å÷\×hB\Zü{BwX\âi¸%È´5r¬”d5^À!z¿\È\Ãe€;¶Ae§\Ì\î\Û;–\Îå³½ƒ\ßq\çq\çq\çq\ç7œ\Þsy\Í\ç7œ\Þwww,\Û\'v\ÉÞ²wmûgz\È	 þ\Ìð5	ñ¹V5\Î9¯\Ùd˜02`úvW\ëñyF~\'.~\'&~\'*~ÿ\0øÐ\ìô\'ú\Ê8öj\ä;Bj’#-Gl\ÄR¥ZWNF\É?O¢g:\ãPÊ›››››\éµù¬O­æ¾„g¦üjW›mj#‘?%“?)•?+—?/›\Õóeùw^TÛ¹¹¹¹°£gdù+\Ðx0\Í\èÿ\0!\èFöŽ\æ\æ\æ\æ\æ\æ÷\ës~	•.ü’6K7’vD\ÜoR³hÁ\ë¦úB?³·\ár|X0>‰€t\n¢üùQ\ê5~9&\áŠCø5\ÒÄELƒF\Óý´ ó\âv\Þ?õ¼®\æ\È\ÃhÞ€W? \0õÐ\ìô\×øz·\í•\Ôîµ¼ú{¶ -jlp³$ª0­h°«®®]€\ÜEf>>™†—TÄŸ¥\Ö6\r\áC<Eù	‘k-¤\nm¬Oˆô*¦ô]Ð\ìô;Ú£\ÞÕ½5`ú\Éùja\îfF2Ý£)\Ãe¨±‰fûy\Øuþ\Ç.\Ìqµ¿\ê¬\ëýKkF¡;L31µq˜‡’°‚’=¯M\îF\Õ}þ\Ìóƒ\íª¨Ž68\\œ˜\ÎÌµO¸¹f3÷œªöë™uL&m§°¯^=÷k\rŸš\è{u\ÓNMû)…z1kr×•\Í\n(…NÔ€\ÐÁ\é‚úþP®\áY¨B\Í&\Äf(ÝŠ\r€x¶•0»=Œ\Ó\Z°\åh#WÎŠÐ®(FF™8aœ¼ª—¨î´¹†…Xk¥j\ÄO‚\Âtˆ\Ì‰\ÜO\Øu>}ÿ\0.†3N^cû1?\åYg±Ê¨}™_»&„Oø\Ö?¡\Z\Ò	²’8°\Ø\"o÷+ø,\Ö\Ð\Â5è¢•»UÀˆ=hEô#û\èa„8ˆ1nì«ƒ1|<†Ö¾\Æý¡‡ ’b\á^¥Œû,ˆ0²A\ádl‘öY1p¯g\ìoÛ˜¸w©\Ù\\…c\ÔõŽ,\Û\Ëþºß½\Í\Åô#û\èÎ£Ù¸Õ¬³ô{‡\ß\Ó3hJ\Ùù,9~~3\Õj&=\Ø\Ô\×h˜™T\á\í^l\Õ\ä]Ž\ÔUUG&ƒ‹\Ù_Mt_Y\ÂÈªŽ\á||”®Ö²\Ês\ëG·•\Õ#\Úò8“ò8“\êW%·;);ðyù}G¡Ø†6„\Ñ>»_äª\'»ú^V|žsy\Í\àg€¼\ÛÍ¼\Û\ÎO\ÆôA\ä&\ßzœ\Ìf\å5\àh\ä?~5\â/¡,ö&¡ÐœÀ…¾=ù~ z\Ô\Ô\Ô\"\Ò\Íñj™|¬+\ëSA†§û\Ô[\Ö\Èö0ôÿ\0PÂ¤\Å@=ô\Ô\"jjf==\ÇD•\à!>2ñ­­\Ùeµ”b¥„MAÎ‰ýl,ó\Ðõ³õ\ÔtV\âCO¹0_¹\Þ\Üx\Ü¬,ª‚u[ò¤i,µ[‘\Ì \Ù\à\Ã5\Óõó¨¿!\Ôõ\×QüØšò ý ˆ\åqVJ0R-Í­T\íØ³&\àv\Z~÷\Ô\Ïñ\Ñý£¢ñ\Ø\ç\Çp¢kŽ|N\Ý:ð\ÚPHå¸®#°‚\ã¿\ì0\Ø\"Š¥…\Ä\Z>2.¹}½:\Zl-£©SÅ¿c£úGòkb‹\Z\ëúE¡\Ø\Ôÿ\0Vn$“\ãFc\á\ÙelUê²³¦\Û~\æ=jFod\Ë7\ï&°\èZc£úGð\ÙýU‡u\Çú\ãý\"±\æ\Ú\êJ\Ç\Ô\Éúz[¶\\ŒFC\Æ\Î\È‹„öŸP´¨D4%€†¿\é#É¬\ã[[Vôô®¶1$v\ß^R·\æ¢2\êhh‚\ËÁ\ÊôC¨\è>X¿“GÓªM Ð¢\ê\ì./G^\â\Ô\ëb‡C}J]Y\ß\ZÅ¬=ø˜xÌ¦Àˆ\âw\èB\ÒúÅˆ\âVvo\ÜÑŒüU\ì˜\Ù\r`\à÷\äö¿ª\ì–Ù\èt\0ŸU\â\\þb`(ù\×Miñ/©—aJ\Ï\ZV\Ú«!V–¨\àd\×ÆºFIÿ\0W4Ê«±-Å­¾¨­&v\×\02lw º[h·»m!»‰\Üf\ÐÜ´…r\è,ÿ\0;$i­Xwv#W\Øö=Ž‰I´\è&\rc\å]H§Á\écZ8Šþ\æõ_:\Å:Aœv Ùœ\ÊžƒVb|ÀÏ©À+Fm6±\Ó}J—^B\Üô6~¡Pó9m`Ùª\rj¯ž\Ì-f\'ª\è<vÝ#\"‰\ÚB<Ù‹^‹	‹òn‹\ì\Ã\ÑYÀ|Z†š\Ø\íHy1)$1û<ry\Ã\Ç”61<‹cR\ä;.-*v;\0T\n‘F‡¸\ê\Ð\Çõ©gÁºbü\ÏEöa‚,A@ \èz†a†þ¢ú–| $z\ä\Ñ.±=\Öÿ\0²f\×ÿ\0e\Ì\Ç1rh>…\ÕAú°›X^¸l®j†ê¡¾˜ri‡*f8‡:˜\Ù\éúl\×>»ö\Ãu„hÿ\0µ³94\äÓ“BOûÿ\0ÿ\Ä\0?\0\0\0\0\0\0!1AQ \"02Raq‘¡±\Ñð@BÁ\ábr#3P‚’\ÂñCS`“²ÿ\Ú\0\0	?AAAA	‚ ‚\Z!ò?ó‘HÞ˜\Z˜&h¨\Í[É5©­UFj\Ül	¢\ä€bšZ›\r\âqzh\0\ÏY7&Æ¦pŠ`®aHÞ˜!{¾F\àŽ±Q@ f¼ÍŒI)©ªÁb°Z£]M«[VEÁÖš¬r­\Ï*Ö®|f\Æ\n$”\na1ý\ÎU4Z\åP#„÷*û\Å`óLôz~f?¹:\ËvpF§Tr\n‚hU¹\Ê\ás[\å;:\ä\ê\ì(\ëV&6œ\ÞQ®\n\ËÖ­\Úx¨¨¨ª\àš\äŒ\Ø#|Ö„Ò˜U\årQ.u¥<ôO=b¢¢±@Ä„›\r\ëY\Ö(\ï)ý“û#Ò¯V„ÒšSJª5>±÷Q mõU‚¢¢£¢ ‚9¨¹*QVJ!\Úñ\nš¦©\ÕZ¥U€ bqAJ;•*ñANº\Ê ‚¤®\ÒPARµD\èWˆT\Õ%J*\"\n&(*Cr$‹AÈ…bõG¢£\ÑQ\è¨ôE½‡D\î\ÉÝ“û\'§§§©E)ï¢”=½¡÷\ÉJ(T¡R…J9J9J9J9J9J9J9J9J(T¡R…J(}òR‡\ß%(žžžžŸ\Ù;²wd\á\Ñ8tDtE½ŠEG¢¢­­l\ä0\Ãi“p™¥¡\Ö\Ò\Z\ë\ni692-6\ÃO\Ø\Ü\ÇXT+\ÃûFÿ\0+fa›·yÁWI±\çøšù¾\×(P\Öw\íO…A=\Í8´ÁA†Œ$\ÌT¸tœs…+¹§]\0.\äS\éQþÑ¿\ÊÙ˜:\Ô5\à\àU¥mLQÉŠŠŠŠA\È;rŒ1þÅ¿\Ê\Ù\ÈÞ¶¦´\n\êª\Úú(Å…\ÄU‰Q1\ral01Š&Q„\Zn‡1\ÑD8ÆŒ; M=woM6ÛºJW:”]öT÷½Cd\è(:»:Bº\Ðvo¤1TÍ• !šƒ¡T	\ã“y\ä¤ûT\Î\é½Çªi·ù+g&\ã5DÑ¿u#\Õ5…‡Yô«\ájdÀZs| \Ã\Â&\Þ\êƒ[ª\ØbE¼“d\ãS<,\ê¨}Tã­º\n„\0þ]-X¯…J\ájøTs¿tn‡\Èæ¢œ\éS€±II·¹OGœÙŽ¹\áZ1B\ÄX«i±\ÃI‡\Ýl\äZ4A4ùŒ\Ú(Gõ;\ìxG\ì,\Ëþ£,\Þ0š¶:\å\ËG‚\Ã\ç…7\\Ë†÷+º-Q\Ü\á¡\Õ~·\ÌÖ‹4{!`~wX\ÚpüyV}ET\ÆYë¡±\Ê\Ð`®V;Î‹a¾ÿ\0—¶öúdXñH+¬âµ¬U\åZ¨tvŒ\×z\Í}m\ã‘^V\Ã|-ù5®š7{\âš:¦G‚¼rj*\r•\ìP„\ÖÉž\Ë\ÝþøM®lWè¹•aV´Á\\µ_œ«+ U­†ø[ò\ëò\É\Íf>ˆ\âm˜|\ÐP*\Ë\Ù\é•m\ÎUŒU†{!“õEJžŸ”öž)´¸Od\ß]GŒ\ßB\Ínƒ`x_«\í‘Z0œQ8…Z¯tÚ\ÖôV\à%\Ñ8\Ô\É1÷˜À«UŽ¬eXU¤\Ô0j¿X}\æc”9ö§j¶\ÎJù\í\Âo©ZÚ´~¬¢‡0Œ\ãšý\ÜÊ´\ÍôT\Þ+|÷­ù\0¨(\Æ\Ï#\"£D\'~F\r9?I‚¸«%\0rÁW“²\'CZ©V¯t÷¸Ÿ²\×mm÷½f¸Z\Â\î¬mC ¨’«E¨E¿K¦`\Æùª\áR¯ˆˆ7 ôP÷#~F\Ë~\Ù?Us\nDf*²öB\ÇG´<¬Lûü\ÌÖ¹I¶)\ÔEø¢â¼ \Ô\Zª\àµ/†·5iU\î*M³uFº\rC¢}@\Ør,-\n#N¤\'\á7\Ðc \ÙkDþ«hyX™\Ì	\Ç5¹½\ÑEj«\ÂqD¢Qšô\ë`Š5Fn©\ÅœQ\Ìf±ß†CŠqY\Í\î¸òš\çM{t+k\×*(¢‚\ÚV\'\"øø\È\Ý\âvFÌ³6*ù\ÜÁ¥I\ÛõF¥þG~@\Í7\Ïô\Ö8Mî¹¯nƒem}ŒÁ	\Ê)\È\Ì/X™\éD¡E\Þ27x›uc#lÍŠ\Âz\Æ(\ä\Þ\É\ïiûM„\Û(ß—²¶Çƒ£\ÚV&}þV\Éñ‘»\ÄØ¬\'\Åm±U8VÂ…9†NÈŸdÍ„\Ø mC+em¾ˆ!õ+>ÿ\0+dø\È\Ý\âlV\î[FlfhpÞGq±\ï\ì‰öL\ØM²‰µ­•´2N@A\Ö3\ïò¶OŒ\Þ&\Åa>\å´g0\"*´\ß}gµ\Æ\"}“6l«òöV#GˆXÏ¿\Ê\Ù>27x›„û–Ñž\ÈdI¸-{†\"}“6[`C/enó£\Ä(nŠh1\0¹8@Ú„šk:*-°A¤\ã$ú Ê·\'\r¡6O¢lŸEE±¶0“mI¬\èƒ\' \ÎHž¨Çš¢\ÔõEÐ²)²h18\0,1 \Ú{¦¼‰µ¥~\è!•²\ï#@š\åŽNô$¾ÓŠ°¸š\Ê1\n•¬upV1ô_Áj³4\"\Æ\Z\Ü\ä\æ<[¨FE|:GútV)\ÒNý®fD\Êk\î\n\ë8-¡ö˜Zÿ\0¾U\ÍôšÉµd\Û\r\ÈXh*FxG\î¨3¯\áP\ê¨uBN<UªŒE•þÁT\"m¯ð¾{\Õ\í\ê‡_\Âød]$\ê²\n„Q­|2†5ªÐ’\âƒ\rõ”@\àPdlµ	8[ZÂ¢„”7 \È\ÙQA½PoT\ÕõP‰ð¬X+œf9{a¡(\"©Hr‰ý‡¢”\ì=»Dþ\Ã\Ñ?°ôO\ì=ûDþ\Ã\Ñ?°ôO\íøO\ì=ûDþ\Ã\Ñ?°ôO\ì=ûDþ\Ã\Ñ?°ôO\ì=ûD\èGU\è\Òg\á: \ØS\á\È)N\Ã\ÑJv‰\Äòˆ†òOªú‡¤õCEW \Øo…²rŒPFj†õœª\á5_*)\É÷ó‡v\íF![—…>¿ñ¡\Øo…²|e„\îA4q3Vª1a\Öi°£E\ß\\ûb³%¬\\\ç3ý ! \Øo…²rjB”õ£ò/j{Lü›–hKI\\re[h\Åj[S{”\è.ª±TUhA;+dxX\ëU|®¨½fH·þ˜´þ\ä\ÐÐš\n4…Ñ¹W‚¬£\Èe˜J7úRŸ\í(Aö=»\æ+6a\ÍVª\Ë\Ã*¯’X\Ü\çqV“5ˆ«#›ÁTŽƒXJ~¦cÅ«U\Ó\Ý=hüœTTTTt6G&\ÊÎŠÐ¸³Ó”\×hl\Åc>:l\Æ]Š:µ—¦p\ÅfT\ã¿úp´LQ(M\Ç&Æ%õ\è½ö[C\Ìø1\Ì[!oò¿\î={« ×‚«r…­Å«9†\Ç#þ3\ë\ZÝ¤»EŠ\Úg\Ú:l\núš!\Ù\ÑužQ\Ö{ˆ\àoPÆ®\æ…\Öj•öŒN*®@Ê­øü¸ª6þ\Û|Ï´t\ÆM-«\Ó\ß)\Îa\Ä)bF9ª&\Ä\ÜhÝ“hUSJ\ZÕŠ}{“\ÓcÁ NF+lyŸhé ¨ª*\n4¡]j¢‡;‘†\äB3ÿ\0«\Ñ_zrr9V\\\ÏT.È³\Ä!V1›’\Ú\ãò&f¨\åb¬MupFŽ\äQš¹\ÎV«uD\×\Ït\×Obä®±mOî¯”\Í\ÖqÞº#]\ì6«UœOY‚«*\ÓR»\"\Ù\Ëkß‘t\ÛS\ãò\")\Ð\Üa¿ \Ñp°…ÿ\0°}Ñˆ6,Ò„õ\Ì\Î!½:–\ä!7Ó1t¥|-FœK¸:T\Òþ©oh\';>”¤©¾\"hÅŒ`\Þ\ëU²RŽøÄ…$\r7“ñItÈ¾m©ñÓŠ#i\ÈüC\ÙfŒ€\æ\Þ\Ãb\Ì~ÁûO[¶WúrJhpN¢p(UF£5²9®Þ‹b$\Ë`#¬S„hÑ¥\Æôú.“e\nPˆ!8“O\â¹\Æ÷-g\n$]\Å:R0œÜ›\Ö?iö´.O\rý\"\Ô\Êö¨\éHoF\rUd\ß5\Ê\ëNó=gz\Ç\í>Ö†µ	1‹½e]\ÙAÀd’D@˜Æ\Ë\ê0F”Df0ª1DDFµ\ÄD\n¸\Ì\çz+yU\Íuª¢5­tþ\êŸh\å¶¥)~–¦5»\ÑÊ²\×&…G[õZ¯\Î\Öÿ\0²\ÚW6m¸_¯\Ê×’\'þ9¯\Ó\âm¢{	€0…¼\Õ\ç7ö\Û\Ù\03­\ä¡ü\Â\ZÈª¾¶,\Ç4Áÿ\0qèª“e»\Ï\â{~“5ój5ÞŒ1@z\äûª}£\ÓÄ©Oñj“¸ÚŽ„\ÆTý>-<“\Û`\á|?\nU¹¶AÁ>5˜×¹>¾(\ÄQŒz¬\ß\åj=\î\ëQX™¿\\\Æt*\èCžS…u¼\Çr’–¹Tž\É7A5\Âõ1¿\Ô>\ïN»Y¿|Kõ\áÁ£HþŸpYƒº$PM‚	ý\Õ>\ÑUqOŽ\à˜8£”ö¶ž¨*eGð‡õ5¤SBk„5·!V?(-±/M4…¡6‘M\Ö09‚F´\æ\n ¸\Ø#r{^aV[ «‰À\È\èd\Ù\êS…(X\ài>«Jx“ƒ~Œú÷‚–“s\Ý0\Ç}”«^\ì^\ê‡\0ŸQþwñû{Á\ÈB\nº55FŽ³\é‡\å9®.0…¦óZøN~«Y\ìL¤$Z‹÷öR,’½\Ï&\Ñ%ô<OEü;_FªGˆHÒµô„\Ð#`qC9¤g^nû©¼‘G•S)xµH0IÉƒ\nü)½\äE\ïr\ß\r”l«\ê\á4\ÊÊ»Ç½\ÈYÁ-‘¤ò|*$I¾ª6,ùiL\Ùÿ\0¹JFTŸ\æ»qÜ¥¤\ä\ÜeL~˜©H\Ê?\Ü\ãi\åRu8>›\å(\×W,W\Ä\Ï}#G²d\äõA·Ž„Ïµò.sx\'¾±nÁ\Z\'ª\"ôó]n\âŸU\é\ÕHqO¨\îN…+M\é\ÕiW\å? F?7\0¥;ã™©¹=\ÙúûÓœ\Ø\Û÷8`J³¾C\ÝS\ít÷Tøÿ\0t\Æ|ºc;ZJcz&7¢h\äŸ\ÉÉ±\à´±Ç’ho(cú)òžù\'\Ê{\äœò[üh˜\Ô\à}S\ÜÂ }ðL1\ê¤Ü¤\å:\×t@\è‚k“\Ñ1ý\ÑI¿¢“”\èTœ§B¤Ÿ\ÑI½I•\'\Üz¦Žª‡_\Âs=òRƒ¢”\ìžò©jM¼ÿ\0)­Í€š\Ô\ÖôLoD\ÖôMj\ç¿ÿ\Ä\0*\0\0\0\0\0\0\0!1AQaq‘¡ð ±Á\Ññ\á0@Pÿ\Ú\0\0?!{¨S?\î\0\0\0\0\0lzÀ\0\r‚ZÁ°lÁ±€\Ú6£h\Ú6£`\Ø6°„l#a\ÚF\Â6°†•a²6\Ã$(,pÿ\0Ó³q–8\éÙ¸\Ë¿Sû\Ée´Ÿª\Ï\Üee›»°=1\'/&\çv“hR¶E÷c\ÉO\Ïž3Ô²®˜&2W&š²ž.\êS)k\é‰x—\'Ž\ÏŽ´£\ë|i5T\êžú£\Éõl­qD¶¥ùD{³õú,}Þy¥2EH²UóE±]sœ.\×ôÛ¼\Ëwœ±~\áYV\ÓqÕ‘dû\Éú„m;U¸Kû’…¢\å»Ó‚¡=T\ÒÜ›Ž¬\Üue8\è \Ï8D°\Æ=M±Y!\ÒZJ%œ\Õð\Ë\ÐÌŠ]w™´;P\ßuc`rP\ÌyØµz>ôO(‰¹/\ìÐŒÙ¨÷…q-[½8*˜Ä·\'\ï´\ìV\ã\Ã^µðDSy”›\'\Ùy+²“_,§¢™MÎ¥%\Úñ,p(Pm¨D\ê\'P…[\Ã\àf¥œö\'P„­JJ›Z´8Ncc¦\Í\ì6˜\Ú]q~(\"l·ˆº)´ªª:´§ˆ\ÔoŸ\Ùy±I‹Mž¼‡:[tºþÍ“óQ½D\ë\'Y¶‰.\ÂÖªJ³Î„·¸’s–Í’Ì”³Aö ÿ\0?c4ò¢E—ô…\Ú!ö~l<J\×Qù\ìq¯ö1Ad‘:‰\Ô^·‡`\ÛMt¼l-e¹Ò¯STXN¢u¨D\ê\Z)‡¸\Ë§Qµ¹+r	%bvÑ¦\"\é\æ,)z™)\Ö\ÛRû1\ÖfÒšž\Å\Î%òR·\èQœ¦\ÕnŠY\Ãþ«ü7$ô×²\êÇ¥	÷,eA\rý™Sm÷W\Éü	ür|¶†\Ï%™ž\Ù/« ,\ì\í\ÜD\êEOz7\"K6\èztZ2I6\Ój·B†\ã8xzb–ó\"Ó¹~J²g ²¬\"-µ–›Ä¤¨Møøø» \ê3\'‰\Ô÷c\È\ä9Ñ“¸®¢X—¨©vr\'NŒñ\â\"¿PŠˆI«°Oš\Ênš\Ä\á,\ì¯3À\×\Ñ\àk\èI*d•\\tg\n8Œ¡,­±/Q]DHHEJ¢4™W¯±]D½ERŽ\ê+\ßA\'HH\\Š\ê+¨¾M’MB[P¯–*WQ;‰ˆ+D\èP¤r¥b`\Öv{›H\Ü\ëEU¡\àŒ¦…,T\íwC«‚ú5r3Ë…Iz‰zŠ\ê%‡¥\Ç#‘c‰G‹Û†ø\Ó=U=\ã\Í:œÏ ó¡\æCÄ—\Ñ\âK\èó¥ôoú/£}\Ñ}®ˆ~\0~\"š¾=}zú<õôy\Ë\èó—\Ñ\ç/£\Î_Gœ¾9}rú<\åôy\ë\èó\×\Ñç¯£óW\Ñù‹\èüD?\r÷Eôoú/£\Ñ}þ‹\èñ%ômº>:~ƒñ\â1ò7	¶øU\çDc\É\Ù\Ä\îø´\\\åf\Ô]Ç¸\å %\Æy½8÷³+jg\æw‰a)œÀ«Õ‹@\ÓÁ¬Ø§\ßw)û\r„ÿ\0…B_\ëZ\ÏGÿ\0Ž\Îä»‡¾l§m)\ÑTüˆñcLE5I5µ\Ó³CSP\æ¹UGn\äðJª«\"œÆœd°”h\Ú\'õL\\¦aµ¬‰—‹v\åZ§Å“•\'3wÓ˜\ì<\Í(Xð\äL¼)þ_ÿ\0\Øðw\Ã\ÜdS®5\Û\Õ\ä4b5w~Xn\Æ:ˆ$Óš£ŒGQ¸\Èf\ÝnEÒ¬\ÞdÂ‹Ä²b:\äWi·d&nZº\á(š98þ3ô_…f;N¦û=¿\ïv<\í\çp÷\Â\ç\Üx\Û	FX¬EÜ¯$\Ê	Ê›*Õ¯Á	(\Ó\ÙRw#+ \ê\ÒRZ—r\ËˆZ5d=E\éd…œn¥£.\"o²«Ä°\ê©;ýf\Z[j\íðÄ‚3¦9­2­^#R«”\ÔÖ·²¾\Ú3šIuEr\ÒBÃš;\Ìq\Z!¯ú\É:^SñAjºtu\ä\ÎÃ»\âÿ\0Wc±x÷ô*Î¯¹\â[122¸ft¼³6\ÝJ¹:	Ší†¨6\ê¦R’\î2DÎ“]D¢k¦\ä™)\ËQ¶¾js ±%nóP¯]µ#Q¨¢è´­]Éª(å—¢\î*W#)›\îE\èiô ‚ô\Õ\ÒY¶G9\Ñ\ë#\Æò\Ð7™N‰j\Ú\ê\ÔG\ì\×;\Å\Ðú\æ\ê©=\Ä\Ý\ãB5òý3\êv)\ã½\Ç|ô\ØT\æe\ÈÑ©\Ä6°m3iÑÐ€€€\à8³ ‚ ‚#q(tú	Y›NþŒj¯›@>«o\ÉcŽÐŸœšQÍ²z¯7Û–mWù;`)Ô‘]Œ\á?\ãÁ\á\Z&Û²œ\ÝQcPPFž¥gCi\ç¾À¯e’¢kƒh‰Mj4\Âm\Æ_Qz\ã0—„\×;QŒ*½Sþ1\è‚ Rp®\ìAbTRûy}¤\ï:·\ä,•\ÉKQ;-.»¸\Õ:L¶:õT=·=\Í3G\Ìl¥À\ä)=G\Ã2ô§p!-\Øð°ð\Ú\ß\á‚jõC¿\ÃÐ³ŸûA\n„¥ˆhQ¦®„&\Ä\ç]rd\í²œŸw/v„\ê\Ôø¹\îlFkü#~¿xC\á.ñ\'\Ê“\èÿ\0h\ã|,–\ÔB´°‰]\É]¬5…‡‡\Òxü0Dv\Ùh\\ðõ\r\áZ\Æ=7\àžmB\ëi<…\î-\Éü!ö‰øAšL=ñ©Z\âÁ	®Ž?;–·\ç\îû”+\nŸœ‡¦6\êo\×A iE)YrcRó—£=\r\ÚG¸\Ô òSt,ó\Ò\ZK\åùK4\ÒB^«4(†\É,<6ƒ\Ç\ÈM¡2ò†¦\Ð\ÉkC/Ao\n«Â´ýžþï„±{¨i	§\ß\Ø\Â\ë._¤%\ÆòuDg]+¡¹Uô.s¨ƒ\æó+}¢’T9 \á¸Y\Ã]AzjhŒe\ç€y\\\Ï\ä%\Ù\r{H²\\Z¼ÿ\0F®ši«¦4i¸Š6Sa›qêŒ¼\'#ö½°C”›k-•2ð\Ô\æ\à6c\Å\Û–˜Ê«H›\"B\Å&ŒI8j£Û¡šnC\Ðnš—\\\Æ]‡Q\r8i¦Yùû˜¦¨I–\Ä\éñ¦Ã¥“m\Ñ%\Û\ÑÅ«×²…¸ˆ\Â3F\è×šŽŠv5\æ¤ŠÔ–4¼\Í\èª4C!eå¥¾º›\èNVZzt\ÜTj\ÛRºŠ¨\ÎE­\ÅE\ÚF£52s\\’~n&ªr\Z‡LÒ»jWd³Š,#±«û\'ðV#£1ˆz•¾\Ø\Ýi \Ýv<!»&5Á\Øñº\Ç\Ã‡…\ä\à5\âr\ÂöÌ¦HbM\\*½\Ü-\Û\n[\Øø˜\Þ\×i\Önù/r÷kx\Ó!-\ägWñ\è¿\îD©u\îE4Y¥n\ÂÊ«\ß\r\î\éS\Þ*2V³A¼grŒ\çp°ºW´öDU“aŽ,†¨\è\Æ5\Í\ï&+,\'±px™\Ë\Ø7d\ÛQ­Ç—\Ðñ:,r\Z Œo\Z1»\×\Øjb%š \\µ$\ß\Ö1«Ö¼ð,¯®ž4±N‚‰¥\Ús2\ì)Í¦µ®¯ô\'\ÍÔ…H\ÆJ¤Û“+R±4¨ÀólÙ¯²-T…æ›\Í³)ÙT<Ä¼»\\õ^\ìL¶¤\Í(øH÷\Ø]*(\ì\'Ž‚J—Â–«*øüaô-¼ƒ/.\Ãl\êo<°{\ÅXlI˜¦l¾„:@\ÚŠ\Ó\ï\ßÃ¯\ãU\êD,\Ý}Ê×¥V\×P,\î\Ë\èYdøÿ\0Dg)\æ\Í÷#\"D³/qýf’\Ñ\r%8»À\×A@\àq\Ó$Yô,\í®<Œñ—õˆ|9M+\è\ï†^3µ;!ˆ\ã#UE)5Uö4^ù¡\"*q¾X$,Ò½Tö\Å\ãfð¶!\nš4h¤kºgQ2³b|\Æ-|Œ˜ž‹Ô™Ä®ª«4<V˜H³µ_eª98yC	O²\ß\Ø\é\Ø\á!Gx8.K\rŸaúBþÚŽø‹Ë½HM»iÀKÙ¤\å’\ÓZJ´³£Y’„öOc÷\Ë2¾\ã\äq² \æ\Þ\rÝ´©\ì%Ø—¸¦N\Z‹N•,\ÂØ²;ÈŠû\Í4%¡a\Ùò\è EŒlM«Nò\äf:%š\Zc\ÔRk\éBI$fÎ«‘z!š÷g“°’^Iy!yN©\í+¡.V°\ç\È\ÞM\Ô\ÞÀ†6D\ài2ž\í!H*¡*GvU\Å\ßU\îü\Ð|Ä‰b•–$Œû¥e\×\Ü\á7A\àð}˜%¼J‰£hLll]Ž\ØSÁ‚Ú…¤Î„›Q83eB!G’Ð‘\"[\ï\è\Õ\âl¤\év´Ø‚³K›Q¨&v+Ý{0I\Ã”²ñ¥	\à™Á,ˆ™’x¬\Æ\Ð\Ý<ž%Âº.‰¯E*\Zå‡µò65,JBkh0§Z.\ìAn%\ì3#~	N\"¬\Í÷\"\Ôh\Ã\Ù\è§rZ²u	\ë³3´Àeo4b\Ó<]\çŸ\ÔY‡b½\ØþM\Ñ\èN„<\'\È\Þ^džv\ÌUT¿¢öd\Éö^\é’HòCk‡D\Ë9½ðv<6‡{‡›À¹Áó\ç\Æ9\æCM\ÙH†Xv\Ã\Íi‰`‘2I%\èÄŸ1q\ã´Ážnó\Ï\ê°¿…{žv\Ì;1\á\î„\èI\Ýü®v\Ï\r\"IVcñú®4Fk³Z¬¡¡›‡íƒ±\áô\Äy<	_‚:“\np%S\Ïqº\ìÇ¬=|)\r¸;a\æñ\Âû[B\Î]Š\"NHI°\ÐršUO¹\Ýý°g“¼óú…l=¥\îy\Û0\íGd÷°\î¾Gƒ\×ó\áZ\Ë\ì‹K\Ç†½\×\Ð\Î4BZ-0³ˆO²(«%ƒ±\áô\Çx<\'\Í2Áš8i=A¼\r\rb\ìvA<¼ñD°B8\'„\ÍWýŽ\ï\ìJG“¼óú†PJ#Ð½\Æ^,„¡—(x;¡5¡\Õ-~C/ä¡—;\áŽ\ì¸_”\É(¦½³\"X\Í}Fƒì¿…’†\Ô?AJŸ›S$+(\ÑðD!z3›lU\Ç9¦0\Þ.\Çl:g\íŠ\Ø,I`‚A×r\Ãu/ŒGñt)Yòu\ZŸ\"fR¾\"Jk.Z÷a\"$£Ku&/´!Q\â-k8‚$|j%®o	,\ÛPÐ…4îš ž\Ú5\ì5•Á†\×ñ1E\å•z›!\ÅK GòŽ\"¼B2G3Ùž{\"²qTÁ#ðB’Aûü\r\ÉGh[x]Dù¨\î•dMb2<°2–VÁ_%\nva9L’\ÔM»	\ÒI¦øˆD\"8©„Ý…„<];”šštWXq>\âI\nJ\Ú\Âù(\Åó\ï\éªR¢¤gö\îDÔ¬;g\ÔY\âð&j\Ôe’$F“\Î\ÑvJ²ƒi;”JuM5ƒSs÷ ª‡u\Ì	¨†\Ôh@óµ\è8N|«7ûÔªV…Ô¤ I•\ÑNv}	(!ˆD\"v\êûŠšp”{S¹{‰¸8-ù[\æl5t\Æ<]°²y5B¶\ndo.Ä®Ä²m\\b2q’\âE±•(o…\çkÃ†\0møp6|8^\"´{\r\í·9s\â´‚\ÉmB\ËKYþ6l°-]\Ì\æ\ÕP¡¦\ÝI\ÚU<‚`E\Ålo\áGgð]ñj\äÚ›Š¦\ï\Ð\çr\Ë\Ï&ƒNšIo#©5RzF\ïZ[hô—!v<ªY/Z•\Â\í(h_\äKtŽj#\ç\n(GC\Ê}\ë*’‘¥\'‰±E*/²-k/yW[m\ÙTO¶\å7VCY9q´ƒ±\ãtx±*	!\Ìm\æ\Îf.BÎ¢\ÜyÁ\èn_X”a\ZZ„\ë\Í2%\Ó>\ÍÅƒ\â`y8A\ÒFA•\Óüƒ ‚ ‚Sö©Q\î¢ BRy¤¶¢BNkJ!8“\Ã!\âg“ñA\ì\Øoº$È»P‚V”„g\r¤®UNg,\Ú”&ª¤z’ƒq–6@´<\à³3„–\â¹mˆp°‹ûz²«Xjµ]_K\ÑUŒZ“¹3L“„\á$ÿ\0ƒ†HClü\ÐOùñ`«`º\Íl\Ñ[\n,\ÇF\à\åQ¡>d¶8\Ã\Ó\"«5Eþ\â\Çn-\Ý\Ã£dó¨\Û\äd\Æ\Ã\Ï\éÀ«‰KÔ†Ä†\îØ‹Š÷À‚-71:¾6(\ÕtV3Í…\êœdŸðUÁQa{Ž\\	Á\ã’zËŒ„Vb\îe{]\Å\ÍFj¿/(O‚¶û“b\í“ÐŠ2¡@&\nž½ž4®„\Ébp°§Ç¤ó\Z\rB^\r6\è›¯K¹bf\ÕØ•E–ˆ¢K$·,\ÆÚ»z4\Ëü\çH‹<‹9\èÌ¶e/Iú3!¤\Ô\ËQ;ý\r+q.ÝŽô&\ÓMšj©«¡´\åR‰´†{™\r-&¨”¨¼”SGj\Ât\ÑT\Ê\ÌÝ’\ÔU¡I.\\\Ã Éˆ\èŠ}=\Ì\îú¡›Of\\ô,¢û(,„«ž\Ä8Øƒ—yfl–\Ã|‰nÆ¸oý$«±™¢q!¸e°Ù\ØQ\â°\Ó\ØÄ„W5ž}E5•¹\Ï\Ù9¡|T²d;\ÊÌ¾\Ùe¤¤±%\êjÏ¶t\è2¬ENÆ…\rR\Éf\ÊP[Pp\Î&8òYB^Â‚¤ºgÐ®\é°\Ó_A£7\ÌCºDdda$+D]ŽÑ”`„·µû¶j™xOWD–\Ù{%\É{‹¥pþ<\â7—mº: 0ÅŠP\Ó\ÖDªHjVÈ²÷/M\ÆT¬+Áðuª¦@hÈ‘s8€y‡²&E+\ì\Æ\ÏiÜš°x\Õ\Ïn#À\Ûe˜½{hô«qŽ&q3‰16Hy\Õ!†PÚ¯\áB¾à²—“_!)\ÌUÍ£X)a¯N¹b\'%\Â×™\î‡%\è2^asa)\ÃœV\ä8a<š\×O|{¾6`Bõ²LI~m\ÒÐ¨zN\\û+\ê\ä%9Å†\ÉÊ}¤Rª\ËVJð\Óbz‰~hª£	±2œ[t¿\ê)mƒ\É&Ct3;³kR)$¼\ÆË¿]kýõ^\ÈD²9•FbJU!\àx\Õê¿¿<ÎŒW\Î\Ïaˆ^¸*7v“{Wbw³•ñC8›n´“`Š\0\ÙWDN•4‰\ÅkZº\ãšh)\ÖZ=ˆó¸\r#v\Z…6\Ý(!w\ÔwþfkØ›’\ä?T’o*9`\ÕHY\"\Ì‰\äôb¾f~ƒø¼.ƒn‡\ÐSyÀm´\Ì\Þ\ê’w@šõ\ÍL—!ag±\n[Vy\Ï1n9\ÜSÙ¦\É\î]—e¨Yq\Zš¼®ž\ÏNcu¡3Sš^T[E–oƒ”R¯Rp’I$©	\ãfðn)M\Ï£\Z|úúD/ð—Y(\Ç+U\î&¾÷A+P\Ð:S±]\ß3B\\•whYök†dCD0St\ê\Çd%a‰;7Q­GF\'Y5fN*³1«\rk\0õ\æ²#¼usCâ°œXõ›º\ìw‘[¯Š\'\Z¶a¬œLj\Ì\à\Ë;Z\å\Ød\Ìðm=¯¾ÿ\0‘\Ñþ\Z¤®&ù¼ŽCg øCñF\îÃ…t\î9\rg\rs]L‡ž¼ŸV/d«\r@Ž÷)\Øi\Ôv2a¯\æ7\nTqb\×\'Ÿ\Ð1U•:ˆ$úˆA¢\È@:b\ÜRÜ¿b\Ô(EÁØ¢\êö3{¦&½)¿(2\nž\ßbWqŒW\ç4Ý».‡\×Ç¬\è?T6)g†\'vX¬’kB5}–9Jg\ë\"zuBsª\r—2¢ƒ°œ¹!Î­ù	+¹{²[°ûòc”Œt¡´=a%ž\"×©fõ|\éBVD)”Ü»Š\'iLKQ´¨¢HC\'\ÖW‡€€Š£d„\Ù9F–_„Jd¯b‡cÇ¸^\ÌVôý26Õ“!&ìŠ¢\ÔU¬ºÎ‚¶ORÎ‚²U+\ëB[°}š¨Ô‰.²W‘n.#gWJ*jj\\N4B\Û\Ñ,;m\ÔÊ¢J\Õ\Û1—&\ZRs,fŠš\êR†Z‘c/bI¦–!§\"]S—a¥\ÃJŒ\ê+\ZhvlZž\ä—\ä!2Y\áðxvl|\í±X\ÐcôDE\ÉF%QÀ*\Ôóo©dÊ¾£\n›\ÂGI\í\0\Z\é[/‹ò8p­J©\Í\n¿À+ú\×\ÈV61W… ´0«³-ÁamtÐ½¶µ	5\\q!÷Â³²¿‚\Z[j!Ó‘&Yªn‰zTõÁž\Â\rH$ªI4öU¹CŒ\ÝK1+\Ãb\ß\r\r¸¤‰ºŒ\ÛjQ>\Ê\Ç9\Ñ\Ì$p¡6t³¾y–\æ{Ù©\Ç\"\Zm4\ÓThò¶\á\ázO(‘\Z¹+±ýn™j*\à…\Ýg\Ñ$\"Ù”\Ý~Ž³s~d\Òr\\\â\n\ÚO‘Œµ2Kqn\ê4—!	¸«\è‘’¡³©-\Ê\×zÖ“‚S*m\È\ä¥\ÌI×ª´,dª™Y\Ìbü¨U2ž\êE¢B\ß®Š\ÝNõ(YsB\Õv\ìi\ÈzÀ A\ã\"o‰\ã\îÇ¹csô˜\Èó­¾X–¾zýKtóa„µ\ì \Ý\Ä5\é“oy1Na[?[‘bï˜´_6\'87ú\nŽ’™N\ÅS+rDõ#®bQNƒ²ñcÜ•÷Z2¥Ð„Z7VBO@°\rµh­ù—\ãiþ\ÓÝ|\Æ\æ\èKn¶ˆ]2üŒ\ì-~ŠYÇ°\í¹f\Þ\ãÂ„->’]“\ãò:%®(¨7º¤%\Ó>.1Î±¼aO)´P¾I 4yh_µ Ù¡µ´\É|È›F¡¤ú$E jñ$®Ž5\Ã\"—@\èÄ˜Z¦ª[‰ýš\åKtÈ!VB‡}Dª\ãþ»»”R­Ý›‰œU•,–\Ûm¶\Ý[Ã¿~\ïV¯`\ÌdT\ÙÀ\×qT9¹H\ß]Fõ^‰u½5—2©\'“S´s ‹t¿\Ôô\"ŠY\á¾\Ê\ã£\î\Æ-]Ç‘Í\ì\ZÕ¯Œ\å_s½øD\r\Ù(_£	¾\îÎ®\Ú7Á\ì>IDbWbuta“p£ù\Z\Ô->\Ç\à\Ê@+Çˆs\n§u‘’\ÛB\Õ>šj-8Œ%U	»\Z$±b¸H\Þ\È1$Bè™¾4°\Æ\Õ\ZRÚŸqAr\ï?l1¶\îØ°\ïß»®/Q•®\êÊºüs3¡\Ä\êeÃ1c$j`‡M\îÇ•$ˆýu\È(uVM\r\Ê\à\î\Ç,\Ù ¨\á¶­(\Ø:ª™%DŠ‰\å5m\"œ;‘Ln!U\âþˆ½¤L‚ø6«\èüŠjN\î\íý\ÂM\Óû¯‚ÁA\ë\'/qenY\ËI\Õd“\ÖJýˆ8\Ö\Ö\'Ö©pj$r ê©¬­\Ïw!\Þ|W\Æy6š³B4ü8œ\Ñ5sVº\år©\Ì?²Ÿ²U\ÜH.7\ì&\Ù©^rAºA”£Fý\ím~ý\ØÍ©&Ý¥Ä½¤º\Ð+‰ø=\Ç(Ûªû—\è­wY~ƒ\æ\îð\ß3DLÜ™7n>BF\r¤\ä«/\ÌÑ™cE°”\è³Hth¥š¹\Ù2T\ÉM\'ˆ\Ü\Ð$\Ù!t*Ž;!$¤®\ä4\êE‘H+N\r®·Á§r\âQ(Rl*”TY\r]P•($\é\rÀ¿‰Ql\Õ\Üýk˜ê¸’xŠ¸Ë‹¢f,\Ós4‹Y\Ìl·)\äs¸¤\çöˆp·\ÕTù`¢\â!\ÒJA§³2\ç<\àÑ”$†ê¸±®€K.fð¯A\ï1™$™i5AiŸÁc»º\'JŠ\ÜV\Þ\Ü8ÀŒ/L”²]r¸Š\Ç*û^Ü¡\Ävúx´	¸¹)…K\Ï1\èS£JZy´˜\Ï&yVZ¯ \î\'¶¢\é!eð*Ù˜·^k~	®%z%ª½ú›5\ÒZ­\nŠ\âUŒT’sQ_71Hg_3\æ)¢x“¬.KNCNKq`JŸbpô\ÝV›—Àƒ\Z ¶¹==ˆ÷TšZ%œZ\î„$=H¦w1(Ï§”ŸtDýû––+S5v\î\ÙŸE—u_\'\È2JSSWd¼\ÈMU\ÎR»²¤\ÖOló\r)È‹)5“N!¶\É,ù¹;Vp… RN?„¡\éZ#¶¨\í«’-Yf­ú´… ’RU^V\íb²tK º\Ñxy·š\ãÀW\Æ(mÓ“Ç¿c\nôu!24#mapm\'tø‰\Ú\Ærk\Ølš©.\\|©E(º\éo:\Í\ëC–Î¤¡·±$›\æª>\n®*\×Ì„O[”aô\å?´E\Øò&*ô\Ó012©\Í	òb<\rDÞ›\ÉX\Ì\ÈJxÁa\ÕS¬\n•‹÷¯<J«P¶“ó2_}1\"H¹¤5Ð¡Tó\×v±b5–õe…\Â!b…‹¸\Å|{\×\îÇºc\Ä\Æù]‹ô\Î3\éŸZ7WÇ½~\ïR\ÝÀ±1Œ\âœ\n«ÿ\0*\Æ\áŠø÷OgŒ‚Ä¢P\Êx&©#šmX™ÿ\0™\Ñ+\ã\Ü=ž-Œ‹¶”Ÿ’ú?-ôA\Z·¡ö\'¼¶>WÑ“\×WŸ\èûG@\Ðh?ü4‰¢\í}Œ„\êÿ\0\nY]\ÙI.\é<|¤j?„¡\Zeþ([OºPú¢\Ç\ã5ó’BWüS_bV|\ï°\Óñ\é\ËS\ì<õyh4\Ý|Xð\"vdñ% @”O“+« frg\ì\Ü¤ú?wôx\×Á\å_ÿ\0l—\ê¿ŸÙ¼\Z\Ôøg\r\Ç\èjz…™\Éa.o/\èþ .‹ô‚\Þ\î¯s;n‹\ÛþˆD#m–\ÌG\å\Í”?1ž”BÐ„B!¿\èÿ\Ä\0)\0\0\0\0\0\0\0!1AQaq‘¡±Á\Ñð \áñ0@ÿ\Ú\0\0?$\Â_?iúv\é\'\ì¹\ÛO\Ùsö\\ý—;	\ØN\Ã\æv°„\ì~geó;	\Ù|\Î\Âv²ùŒýc;YúFv³ôŒý#;Y\Øü\Î\Âv³öŒ\ígk;y\Û\Î\Þv3³ùŸ\ë³ýv®\Ïõ\Ùþ»?\×gû\ìÿ\0]Ÿ\ë³ýv^õgú\ìÿ\0]€•(Ÿ5õñ‰\à\Öÿ\0•øù>¿ƒ©®5õñ‰ü\Ù_\Ã?÷¯þ¿_Á\Ô\×—·\ßþ\0V\ÌlŒ*n¯Àýº÷´\àó\Z–e…Œ®ýb\n1\êhPh‡\ï\×Q\Ñ/\â¸û?Ó‡û˜\àV\êE^|Ÿ©\Ø\è\Ïb8\Ï¬\ZE²‹\Ãc‘\í+Â¥ÀýšU4J÷\ï\Çú1q¦\ÐwP5\äÁA\0\"9T­ß½C‹ÕŠ*\í‹[\ÆX”Ô¨H^ýuN_\Ä\ájü‡\rÀ*´\Â7\Ø\rQ‹cCÀ´¡R\Øœÿ\0ýF\èA¶-\Ý[\Êj5\Çðú¾¦˜f¾½5]\îbbS¬\Ç_‰GYŽ¿`Œ¶[\ä/X$	“\Ôõ 0Zm;gúXZ–Ì‘º\Ë\nKm®:¼û\Â:A\ìTetÁi*, ´º\â~‰÷x…š>Ek/c\Ì\à30U²ƒ;\ë\ÞP\0Á†xDŽ#o2·(\ë(\ëû\ï\0½\Æ:GUz\Ê¦\ÇCPý[\ën•A–Ë«™\ÞT §‡=\"y‡¸šl9žIœ\Ä@½@•uœŽv@“¨V†0\îÀ\"1ª`´µ\Ê67]\Ò?\Ú00¹=™!°K¹]|\Ð\Å:\Å]\ë\r¨k«\Þú±\ÝÙ“gœ¹~’¥:€\Û\Êr²º¥YGVQÕn\Ý?¹\æöqª\ß\ë\Ö	\Ù+º3?W\Ö_T¾©\É~\'W\à\Ï\Ü3õŒýc4GbžRX3±\ÑF\×\ìeÑŒC—U‹\ï\Z z¨yôŒEm\ÝtL°\á®\çy\Ôbº÷º\ën½\ââ§€\"M?m\Ê4([X†\Í\Z°-qŠP¢{ý\Ö\\F›\ë\Õ\ë©Oa…vf´ƒ\n\\z“\Û8`*?~Ñ…ßƒ¥>.\Ýb\Åt•Z\nch8+O¡K—®p\à\Ì\ÐÓ”ú°\înÔ»Ö¤\n&L¾1Ì´\r`’\Íä®©)\èL†yM\ë\Ú+²u\Çs¯y\èÀ\0ø˜ÿ\0€ouw¡mWIœº€A¢+`-\æ=\Êð–»{\Üý\Ã?P\Ï\Ô3õýC.’ú¾#U¹Z\Ôyï¬²,ÿ\0 öNßµüN×½ø¯{ñ;^÷\âµJqÐ™\ãAqbSMoÁJ@§Qaš«§j ´E5p²hA\å\ä–é‰v\ç\ÒZ½]\r&œu!B\Ð2\Z^\×	\\ö\Â»\éó|»\Ë\çD·FMb¶š3W•Æˆÿ\0s‡÷8\á\Zf–lq\ÉL\â\à±7Žcµ\ï~!q{ñm\í\ìˆ\Æ+b…¥°\îõ‹¶\ã\ržNDô‹A»#œ\Î\rJÈƒR\èêœ«?\Ýþa–­¬\n-÷€èª±28\íQ\Ê7Ày>Ñ­z¡¤\È\ã©)´ú}¬÷\ä:·D\0·	]ûu\ÉoW\ê&Zö`­.\â\ç}õú¢½\Îb°@2ˆ\äF§k\ÞüN×½ø¯{ñ;^÷\âQ\ã~Œ§OdR£\\/Œ¼¾³1˜_Ú–þ\ï\î_ö\Ì\î}ÿ\0¹þ—÷/FÃ„R‘\Ø\æ4UZw\ÓeCž#“Ý€,$FU;qTEÐŽ/\Ê\"·”[TKnþO\î_¾\á—\È}Hõ£÷\ã\\a­D4\'tG0Q¨œAš Uó?\Ò?2ÿ\0´~`± \Ó\0\ëc\ç„ð]¬Ü¿\í˜Yxü\Í(®ÊªNk\Ò\èQrÿ\0´~eÿ\0hü\Ç\ïxtQøñ\\•‚_ö\Ì\ß\É\æ¨Eª–‘\Üq)\ÙA+™qû†_ûG†$9JEiNT«2\Õf\áX \î`\ÅF\Û\"\";\Ä5\r\'`©\Z¶n™~\ë\á\é?\Òþ\çú_Ü¿\í™\Üûÿ\0q){:\Ì\Ãue·F\Èz2\ï\Ét,tÀ\ÚvOñÖ‹\0žáªƒÁN\Þ=—‹ûý÷ð\ï\×\îa†:g?ó\'þdÿ\0ÄŸø“ÿ\0\"?\àGüð#þÄŸø“?¤™ý$\Ïùsö\ër÷\ïóþ·þŽH@‡ô\Â\Ç>	\íh¢ŸÀ²¤­\Å\Õ\ëK w´–\Ö8{?($\â—øMÂ‡%Ý–%\\¯õ\ÝT™*,Õ’ÿ\0Z\Òiª]‘Pµ^{\î\â\Ë\ê°Å·Ia– Z[m&\Ö5PW\î@{˜þ\êÅ…’\Éd²Y1\àøh\Ã]Ï¬ð-jU\Æ>\Ý@A«o,|\Ä\é¹’R‘#FDÑ’·¥›€`\Ç\Ð#\Ì´Jl\r\àLûC¨÷¤gcP®\"…\ÔwVhÁL\ÆÄ”)(VmW`µ²XÞ­ômþQH$ê† ½!pÁPt\"\ZWƒ<ÿ\0‰+Â¿\äCÆ¿…Jð©R¥J”JˆxlŸ7Áj\Æ\â`–ª	Ñ»#ƒŠó®j…u¨É‚\ïa *¢K\Úú\ã\Ù\Ã\Ã\Ôx”ºo5¼|\Ë/Í®þñBÝ›¬\ã™}š,hµY1©\Åy\ËÓ¥Ê”\êô\å\×\Å\Ð)¢Ê·ƒPºÀn¸WVª\0\Èju\n\Éi”\éaŒ°X±O“¼LM8«~L}L\ÃK«Â·ˆ\ìi6\Ùø[^Kÿ\0™\à?\È\ÔIR¼33*TX¾%Ž\é\ãI\Ê:¡ª\Ë\Ö~\ïªUó?Tj\ë.TR\ë¯4n¢Ì©)“Â³x’\ÙOgkVb@\Ò:»	!\n%`u\nh@\Ù+\Ú\Çm&H\\+\ÕðpZ½ô\É\Ä/“A´3|W$§NL\r\É\à0Ð€MŽ.rf’z¨ mXŠœ\n\"Å¼Œ\ÑP£gXÕ¶9M±ü‚ð‹ET¨\ÃÓ™R¥J•*T©R¥xP\Ü\n\ÖOC0k\èõPKO\×f\Ð\Ûô1²\Ì6!\ì·\ÄB¼\Ø>°D‰*\'1Bn>;¼lWR¡úF\Ç8<\ÔB­\Òû¨\Ñ\Ñ)ñ\ØS\Ò@9pÀà°ªPF\0-R\ØMwúY~HŒ\ãd…\à\Ç@”\â\è::«\Ê4˜°¶y¡+V\Ø\0›IW)D¶56‹`5‹:”\â¦I\n¼R k;ð|,žR¥Jþ!R¢FˆGX .\Ã\Õ_/”;$=`´ÞÀ\Ú\Ëb$’‡\n£¼2\íŒ€¦D\Ó \ê\Ë;ŽOUôˆU\ëñ?G\ÇW…G\Ãt÷\ÝüR¡\É\å\ä\áV§\à\"\Ò\Ý\0of]!\ÈF\ÎI\Þ@[\Õ\âMž\ï~shw–h¢~÷-þ\å\ß\í@«\çþ@\ÑË€…Dðo  r°Û¤r\íõ\é;A¨†að>Dt¹\Ýð¸‚#I¦R^\çx\Åf\Ä7½_Y¡’“\ìy˜\Z\Û\r®–zC\ä\ê\Z`Fˆ·\áR¢F0\å\rk,ý\\‘[BhòðR\\-©½ÿ\0\0 %x•*T©R¥K( P¯@%cÕ°u\Ê\"6\Í!“›ºufFM®¾\çhŠŠ\àh8&_Â•k\ê”QPÃ¬«¿lˆ\ÞGº•o¨ŠËŒ©R¥FYÎ‰A6\Ã^k?S\Ñ»\'?\Øu8[\ãÂ¥x‹O€@Š•*\r\È\Ä€wžJy#\ÙoXbü7ôz¸i¯’ý;[Ñ¨&»ŸOiƒ·ª\Þz‹Ž\ÙR¥J™2l\É3÷*r‚ŸYp;ŽH@ü{‡±¤ŒÞ”[\Ùö‡CC÷òxT¯\ÅWS\ãÌw¶\nóvŸ¢\ë!\ê)G™\î]D(!*T¨@ B\"\ê\È@\Úð7\Ô\"Š%&\ÇÀ\Ý\È\Ì\Ì3ô\ïPi„¶\î÷\Ó÷\ÍP‡iI|¶¬!ø2\ìxT©R¥J’\æT\ÆA\\¤\ámy\à¬ó¨ô¯x…\ä0\Ã>+©¨µ‡9ý­hWA*\Û\é\"ó8\Å2b(…\Îa°\Ï\Ìd\ê\Üz\×Ú—bõu\ï\à€X5µ\ÐB\\^¼”1e¨\è\Ì%@\ë\Þ\Å\çyÒŸ° \\ Q0¦\ÝHÉ‰hÀw\n9GTa\î<\Ë\Æ\äwf=\ç0€\ÛÈ¬÷ü\ä\Â6	v_\í°—Š\ÆÕ•*T©R¼	×™ò\æPA¢\äm¬\Ï(‡D¯~f4ûµM©˜“Ð‡£8ú+£h˜ÿ\0„~ƒ^Q=Ý³»\ÅPk1L\ß3™¿\Þgº&*\ÇS$Ql{~ ‰\Â\ÇBž¼û\ÊÀ\ç\r2zÁœ\í»}´«†	€·R¹.…}”‚¹þö×¥Ó¥¯k“Œ¾_œ8oø1Õ±WòkÖ£žEk(Ú›C£*\Ó*T‘ \Ø\Ã AI‡°º\Ê\ê³WNŒ\ä®\Õž¤v	`sµ+˜°@\Ú<\ì‚z•x)ˆ6K¥C¬dhsaŽ“‡N%ûÌ½RÒ\Â~Ø–\0\n‘\èŒL õ˜\ÕR€u\åò»¼Á e+÷\ï\\•²\'¸ž\ç1o\â×®&\Ínbê—”4t#ŠF¹XøoŸ±\è•y«Ä¹{@ã¬œ>\ä\ÇûC\ïº¾£\'¹.–]›]•c(\ß\Èü\Ûg£\n\é·\Úw<zEa-‰L¾[sÑ…\ÉŒ\0`\n=¢KSb ó\ê÷e\0\"Z0µ˜f\è\Í}™Pò¸ay\ä\ÍE™+\Ñ\êD\ç\ÞÁ+°Ô¥AUÒ´G\ä ð*d“’\'BŒ\ï&w²40-[o~1B<`”³®ü\æ0\à~B\\T\Ú[\Ù5î¼±Vyfø\ï£HŒˆ\"ò	*=\Ýû¥\ZP*„\r\ÒÌ‚(y,¡˜¼™|§+‹‰Cs˜¶\Ü\Ûú´vHÁRS&0Iµ,	(N†t3¡¡\Ú3|ý\ÇO†5*%A*5ˆzi€©ò=\Ô\Íw¶=Œ-Ž\á»<¥V\ÇrVwH¸ˆ¡^ùð¿õFô/Ì•S\á~/Mˆ\'…zŒ	Q\n\îb¯yE\Ø$û]Ã¢ûx™Ÿ”¹\Ðh\â\ãq+°c°t#u ³	\Ã;\Z€\åm\ï‚E\Õ\ÉV!§\Â\\M\ÎBý§[±	±\é\Ï\ÄnF6yJ’¹Šq\Í#„›§i\ëHS3\rI¾\Ô\ä¾\ç*^l©\ÔQƒ¹˜Ž²j\\dNw\á¾~‹¦mtfH)Lli\êCB»\ì\î&g\ï{ \0‰€—¼q4øH~\Ý \ÕG™óðŸD™R\ßÑ¥-\à‚K\å=	Ù€X£VÂƒVa\È@°\Z\ÚCa\Ô]B e\rªz\ÍýP)³¯b_}\Ê #\rYž€S\0\äfs#¦\á\Ø\"§¥;Y€ð%pŽ ™U\"8»ƒ}\áB Õªû˜µ›¼ŸºS¾œ^š&\Ã\É\Ýng\ä\åA\ì±\\zðGe=O<¤\"‹²‚*½MW‡$~Jò]ß¤]<2\ä¯U¸\Ñ^ü\nü]‘	ÀC¡¦Y\ÊP{‹Œ\Íƒ±·œ\Þ\Óqp\Ïw\áµW†!\Ð\Â:ð”y]©Ž÷V \ì5˜+\Ô‰Ü¸\ë\Éý\å>ð\ÅoÝž\ÔJ¹Í®ò™OghÁ ³¶\Ò÷aÃ¤ö±P¨.F»úD*ˆ \rQX\ÄT2Ž­ú\Æ\Ì^8ZNsA\Ù.pü	§õ0ø\'b¢{„+2(©\Ú_†‚|(\Þø‹I±\Ø}\'ð„\É\ë\Ö	Ù…$l`0˜G¹\0\Ä\Ñ8w\Ú‘·`\ÞH¾RÐ©m\Ç^\Ão‚Eùó\ÝÁ6C‘R\çò µ\èg\é\Âô€›…\à\Ù\Zª\Ï*Ÿ’R¾¦Ÿ@—\íY\'AI1ý¼e\Êjqv\âr´sr\Ë\ë\Äû^L\Ñn\Òl|\â¾\Ú´eÐ¬$ö[‹dµ\Ô\Ûz(úT³k\êüÀd²üÀ\rg–þc\âšE÷y ¨g\ÃlžwA¦M‚¡x‡´^ö;F\'© 9\\žD\ÃK—Â§\Ñ(\Ñ>o\Ì_Û¯\É*)j»¼«\Ö*«·=™¸ \Â(\0ll_¾\ã>³N\ã\Õ9–D\'‚ù¿0\Ì\"\\\ØUÇ°\ÍL\ÈMqyÒ«p\Ão…\îýº@\Êh„8³É‡ûÙš¯O¤5½X\ïpOˆü,\Ù:\Ø\ê®UqSd~ö>F»†^¼ˆ¾£Xb¯;ÁBÍ£Â®\0Š˜Â²º./´¸ˆ\ä¿>§¬K\×mU/¢J¿C$\Ú]\æ\ä¿\ÖU „\ÎÀ.ŽzªdMÐ–À%Z\Ä¦Ê‹\åWÌ©o\Ð\ì%A\0[¨\Öqm¡¾/¼x{\Æ\Ä~\îÁ½ñôD‡iýO‰ØŠ½dÎJOŠ@ßdÌ¦þjŽ—¼Ã–œ˜4n\éˆf“]I÷e?>Blú\Å\ì\ÇF¯£Á$Z.-o\ÃE\î¢Â¶,ª¨ª•VT`\Å~!^ ?k#x(gC$†4F\Ý1‚u§r!zD|óü\èKCaµ¸\í0\Ç@F\Z‹	t±Ÿ$Qð~\åôxo)\ÚURTú>½{tAõÙ¯AZ<\Â\ãÁ.µv#,{Å¦Ú‡\Ñ\Ñ\ZŒ\Ù\âw\àÀz\ÌaH@-F‚4¬Týf“\Z\Ï<S¤ù>\æŸ\ã•x_pþ\ÖOŒ–$a;/£~¶^pXûÓ \éöV+,\Ò\èè°žS=1Ÿ! \áó4\Æ.˜{\èFžOÐ–¾\ïza¯«ÂœYuúL8 T\'ôŽau{@½\èHN n\ÈôcÐ·\ÅöþŸÈŒ\Ä\\¤vÁ4ž“Dþ’\Ý]%\×dýO†“\æøšü?Q\Õ\áý\Ï\Óu\'\ÅI©Q\ß\í\â~†RØ®JÁ-\Ñ(ñ=E\ä{’\ÓwŒúZI\\`\no¨x!T˜²oK\Õ[C\Âý÷LV½ü5\Ée›\rÑ¾¡½\ê\à\Â\Ú÷\Æ\ã!›‹9Šóó\àóa\è\ß\Z F^F :R\Ô9&”\Í#zN[ô˜*f\0H«W§ŽúO•\à^kð\Ûöe\ãÿ\0ïº“ô]Tu?}\Òa\×\ãg\ÅÀl‹{øÎ\0¼‚ƒ\r -\å]ø{B¡m+°Z\ÂH\'\ïºg\Éð\Ó!Þ“:û,I\'\Âð|Œþ\Ç\"±\á1\ã¿\Â÷/H\r\Ø\Û\ßu1[ß \è@4N›Ró£?²Tý¼grP\Üc\ç\Â\êyC™Þ?³(þüi^þ·€•™{ˆ\ÖI?S)ßˆ!“%¼ù\É\\Y\Ö:œ§\ì˜lzkô\×A\ïKŒ\Ï\ÛtÀó\à)p\ÛñB…OšFx\Î\\§\Ö\Ú=@Á}%:^!Kð\ß\àsiúNhð\ßÂ\Æa\ÔÀÀ8€!rš7²µ\nU\áÊ}¾®j«X\æ4Ñ¤)rJÄ—ª>j03K!*7Š\ÑEµ,‘¡‘`#±\Z†C)$;•1\n-Xô%…¡q\è“}…Z™\Õ\ÊnÛ¢°„k\É>¡*0¥^~\Ã&ƒ·”Böm!\Üe{[\êøm\Ìº5\á•w0À1-(—ªÚ­aþL/HðVYkü%ƒ‘†VGh#$ºnÞ•\'”ÿ\0B|`s_I‘¬i‚a\ÏÁy\Ùf\0¸\î \Û:Yƒ=%\Ñ\×\ï†\Ü\0ônI\Ã\Õ0£S±;±€P¥–8#\×ùiu_fnj«D\ÐÕŽ÷!*\r\âJ	\Z\rd\ÊÁ%	«\ÝV\Ã|«@*\'’ ,«\Ù\Ãj‡<Mµr´\Ökqˆ\ÔC\Ô7FZ\ÓF\ÊTŠ-PYr7³mJŠ*aŠó’¨¬f«7ˆW\ÍðR¯´\ÌZ\ìo\É\Ô\Z[¼\æ=˜·³œE\ê#…!S>\è€\Ô\ìN\Ä\íN\ÔL{\Öe\Ñ\0µ£÷.Ox\0/b8œ^\æ¦Ù³v\nöQ\Õ\å4C\Ç5\á¿\ÃvygÙ¦¯…Œ\ç\Ñ2zÊŠ¡\Ú]ðÞ®/v=\Û`¾¨«P:\á_–Q`…¦¬¸)/ø^\Å\Þqª\Í#¶Enkÿ\0\ÅvÄŠ]³_\Û-£pW’­æ¨†®2®Ô–zÒ•\ï`+!Wj\ÛA¬Ae¹&\ë¾f*.	—j”™›$_z\ÆòdfP¬SÜ”\ÖúZD²q +\r\Ô\çx(r\ÅN­Z¶Á$¸PQr)\æ›«lhE\n\ëþ2¾s\êL‚\ÅV±~\r·ºŒ®€Sºb¥K@+\Öi¨<­¸|\ç\Ða_%\ÊÚ§f\ç2“4%3|ý\ÇLªH©¸¢pÊ‰bˆE;c‹=\ÇG´3\á“ó°N­û³C‚Š£¼,Æ†\0°Ì†Gd>f]²0´\æ%@\ëø‡%À\r)»»»»»»»»¸^&ûyµ9™\ß-—\Å0{nP*0dÏ¬Ø˜¼\ÒögÛ«\ËF0®§«4Â¤ˆI°»O4Æªô)8†tŠ„‚ú	\è³\Ô øNºj1Sƒ\Ãl5\çž\í2\í¿S4B¥\ì¨m«·¡\ÊuN¦\Ê<‚R£zó\ïq:NÓƒ,\ÞQM\â]˜{\à…Ï«\Z\\-\Ñ.\Î\Âû¥•«yX0`Á‡~ñ.\\¹r\åÁRø9ˆ14>Åž;n\Ä\n[¡ø¡’“ œ\í	8¦\ï\Æ\Ì\Ñ°N±%ƒ\Ç/b\0s|ƒó	/1œ\ÅeÀüJ”\Ã\Å_¹7\äQ$_4;4c6ŽJ@–ÅŸƒ“g\×\ë&ˆž^pP«t#X\î\Æns »(÷•OË¾W0	ÿ\0q™€\éµPô\Ô\rÀ©–\æWo\Ý\Ü;\å\ë0—\ái‰r\åË—,¨õÄ«Ê§>Is\Z<ñ	\éô©˜lH¥f\æ\í},v\Õñlm½X{À%§¡¨)–\Ø\í)Ø\'$½¾¡\ÖGCp\â[\Å[YÁ‚Ü£%ª¬PQsX‰<\ë4<6\ÌGI\"Ã¯\Õ\ÊME9œÜ¨1Ð™\Þ\æg\Ú4$Q\nc\Ò\Æ|G¼	U--^ƒl{#Ç²\0K—.0e\Ëð\\²\Ã$Ù³§³(°–ž\Íõ\Ë\Õ\Çd©\æZ\ÜlƒL¡VGLBh¬ƒž\Ðd2\ç‘\ï\ÐD¸Æ¸BYu\ëF\Í\î\\¸¥ZÈ‰‘€«†\Ú\á-!\ã¶,\Ôä· \Ê>Q®!i\Þ\\HY$\ï>ÙŠ\ïr¸;¨Ï‹[W1bõ•5#0tM\ÎFü˜\r—\ä1—\×<xoŸ\ád_X)¦jJ:¸&y ÷ˆ(\î\Æ}\âKI|>Ð…z\äú\Z‹Û½\åDñ¹r\åÁƒ/ÀG”ŠyÜ˜µ™JþIWÕ½LV5«ž†\0\Ð\Ïv­”0bP§pRz2­\ÔÝ—<ý¹ÿ\0K\ç¼$ô‡G™\Ê\Z\Ð@\Ã\æR\åË—\Êeµ!cK\Ñ]¾n» -Â¬e9¥1ƒ‘OQ\":\Çò: )PÛ‘\Ýs}\åC¨_9»õ´=lp\Ì÷+\àóYƒa\È:{3(¯¼\rW2šüõ\"ŸIŠ&\È_°>¥ðÀ$ŠA]·/-º™`zMûÌ›rõ|i$|.\\¸0eË‚\Þ7-€§G?X\0X„`H\ì(H\å\Ý\Ò-\Z¤]=‹†«– R¦\á%iY¥—ºIó”W£óeR\ÒË“&&†û¯±w\è—.\\¸\áL9Dn^“¿õ‘\àˆk¯\ÉkMU8\În\åD»×»Ð¨\Û\ZIR…ô{‰œ\Í\åú1²d\ï+Çˆ u¿€²\ê\'\ÄhoY˜h›\'&/þ\Z‰n«\îW\Ü{=\Ç\â\'O\Ãñô\'Ÿ\ã;>ûB~’~\Ò5†ü\à\Ó?¬1Dó‚oX\"±\íK²„…\ê\Û\ë0,šŒ\Äö‰¾zY!\"\é\Ò±·w\Î>\Ú\ÌY~º{8zQ0\ÊÇ–>Aò\àò•£¥B6B˜ºˆÁ;\Ä\Zf\Ä)ò2–¸Ë£¨‰¹M·\ÚSn—\r—G\î<MAùx\èòðoá¨‘‰*$ [¨J½½‡²ÀV8¦%¡\Ëd…§\Ú\âz&³‹\é%b´\å¼AüÐ¹))`0\èÁ\í˜ÁzpA‡œY’!\Ö\à4¼…	\ä„A9\éû2 ”¹:#¤–\"{E9ž\ÏvF#C…\Ì\êÓ©‹† ¾™C&‡z¯¢’¾×§—\Ö\nžµxfVý ¦+I¬Y›Å¨€´\ËU\Èo,º‡¿‰Qôú\ï~Sy¼\Ö\"DŒbža½\0\ãB\âqý|J¶½ˆ/$\ÜuH\Âlm\Zo\Z–>\"œ¼°%u¬¾õ(‡@ß©\à\ÆÞ“\Ù^l-\ÚáŒ™\é\ZF<\Ó^ý\ßmK\ÇE=oQ5¸vºñ\â˜/—Àô‘+\é@\Ù\è9ú\ÆV÷\\?¨%@\ár„•‡ˆ\êz™=¢\n5W˜\í/H&ñB\ÌØŒ@7w‰¥ÛB.§\ï\ãP}>»\Å\Òo7šB1ŒbJœ¿\ÑÀ5\æûôG\Ú6ð¦\å!zòqŽ“Y–©¬)c²\Ô\Ä#¾Sl\Â\åùt”\éV_º\Ø\Ç sk„\ÂiQ\Å\å;=c\ÒXKJ*²¦B\ï\â\â\×Ô·“\"\Ë\ÅWD\ÂvÖž¥s\ZÙ¾‰›ƒ1%J•Eˆ˜KWœ(\Ës+\Ìio¬\nl‹H²\Ò1…„¦V\èZ®jM‡_z}G	´\Þk‘\".‹òFYlQC\É3\n› K#•\Å\áJµI\Ñ\ëœQ)®l/¡\Ì$\êP}` aõ•h}‡\ï4¸\â¿³¬\Þ)·R†»¬J\Òaº\Ð\ç\Þjfr2ù«œ+i\ÞÄ›,¤¼‡<ó*—I¶VJ\í,Ã…d‚®ÆœžQ\éÓšX\Ü\×\æTC‡\Í#°>‰\È÷\åtAN#nfe†\\@+·\éyô¹z\0ba\Ê\Æ\ÂGÐº‘\ëu^³u\Û\r\Ãlò\ì\ZÁn—\î±(Œ°€¡\È^[Ú¿~°\ß\ë\äñ\ç>\íøŸ\\\Úo4†\"D\â_÷Hÿ\0„üNªz\Íú%\ØøR\íûX\É\ìG|¿Á‚\Î\í	\î!&?U¯¼«\ÖÍ”T\å8†Sô\ÔT¤a¡<=!g÷G\"F½«\î)H­›ŽuV\ÞwDlJ¹\è/I‡\Ë\î3%º…ÀÅ¹Å²ø>³ioY I¬72T[ðlaög÷  Õ©€\r5,\Ç*Z«µ\Þ:¥\Â\ì\à½D\ãp\çºoè®“Á\rZŽŽ(¯i¾\á†r°Ö§áŒºv\æYVÂ¨c¼úXx\ÐS\îÕ›M¦’¼Lc\â`¶¤£0˜e<)c\ÛØŠèˆ¼ƒ¹\ÖJ\â^´<¡;\Ò}\ÆX\r­.ƒ‹ƒ.CC·xm¹\åO´Ä¤u@ù|¨m/\ë	}\îŠ*ÁU¬(F¨]Dd­\ë	”\'XôAq\é•\Z‡/X—‹\'FÃ–TÀužJIRZž·.µ^\ßV+\\9Ú°\í¥a~A\í\Ï[rõ\ì\â!r\ìžqû¸e”M1·q\å\ë\ÛR«\ì™\Ôü–\Æÿ\09´\Úi\à>,±¦!\Ä>:³)wh»%j‹a\Ã*‘\Ø\ç\Þ1f½wm%v©\Ð+Q«¿b~r]=:÷‹cŸ6Èœ+\å\ï\nŽn%œgkñô\Îhw«lWön\Å*¶¹‡¾¢~7qY™’¸™‡\î€ú\ÃrŒmH2¼\×,¨¬ƒD\ä`\r\ß>\È\Õ÷\âM®‡5™X‹N\Ò\à6®a€\ÝUJ¶‚\é¾*\"S«¦\Z+’R“\ë\Ì\à)nÚ³³2ô²f\Ïô\Ò+ý;üü;M!<UŸ`˜¨P°\å=f¸<\Ý\Ö)J°@¾\ïŸT³(õƒ\ÏJµX|\É\Ñþ/\íä”¡Á`BaÜ»l:7ó8‚•\ë	\à©\È\ë¶\"ipWUbt¶ìµ£³ÁmýME²\Þ\Û\îE\\@÷˜e-\Î{<ÁK6\Â\çO\ìýfÓ£ú\ÆôhU;FÙ´“ròõ’\\*|Žý+Ö•\Ó+\ì\Ý-fVmõµ?|U´ÿ\0\Ævñ «v\\®c½¨h\àò‹\æûBk—F~QYV\Ä\ÂO„ñ>g\èx\íóð\í4ñH3Q*	\ÛD|\Æ1Œ:,·*b\î|d …\à²|Œ¾¬n,`@{L¢’ò\ÃQ)\í˜@¥\Èó.•\'¹*r\å®«R\Äk\à&S»©|Öƒ\Î\0¢sŽ{½}\ØcXð¸Y‘^a…gGÿ\0v\Ïòd´\Ô&Ò¬P\â\Ûw\æ\\\Ô\ËT7q\n£\êh=¸.\â9ò²ZRõH@SC\äJ8“ˆjP„ÖŒL+6Žð½\ÙS5j\\\ÊÃµ\×sö«ó}IC|\Æ^—õÏð\ï\Å>t\Þm4„I™•±\ÙPƒuPøV\ÛK}±¿™»ÛƒÐˆ­]X„MN\Ñc6X\\|	pŠ‡NGõ\Ö\ÔX4ùË…´{•Ib‹Y\\«\Ýð„!\ßÁ6> \Ä_’ÁfÄ–c¡\Åbðe”\ç:/-º	ˆ­,G¤Hj¦±NþR\Å5‚ÿ\0N¢¨­˜\á5‚\åu´<\Ü@Š„£À:=Hj¸®±t·ÔŽE[q\ØFJÜŽ\Ø1öüþù\Óy´\Ò€8	W\È%\Ø|©T\ì$\Ë|Fù=YD\0ò¤³•µ\\e¾E\ÐE\r1ƒ¢ù\r_H£—\ØM’\î\Ä—¦ÛŠ¢…p³\åw\rÚ iE¨–\Í2°«EA£ª!\é1õµ9ŠH½\á)y±\Ã7}­,¬ŠiCÝ¨Q\â“\é9n-¯+\Äw†W˜ƒœœ@¼¸\â]–f\ìab\Ï!k\ßR®_\í%0ôŒq@F%¯\Ðt?17\Ô2;ñ7ž¯>òÀ@ñû\é,ª\ÅK\ç¥rB¸e\îñ™g	¼\ç¥\í(»A^ûz@\Z¬²kÔŽ× E5Wø8?‚~T\Þ\rZ³¸p—\ä\Ýy>„\Ð7È»X¨WX\Û;¬\Ä\Íÿ\0‰@Æ‘sÙ´¯—\ä÷y\èˆñJy(mt¤ÒŠpü\Û#$\ç\èD\Ù³?ôVÌ»£žòy\ÞG&òoûB\Ý`•Ù£¤u\Ì#\núHW’F£J@\nm€\Ù˜\Öv°¨\ÖÜ¤\Ð\æªHz\í=-0b\Ö@\Õ[k®²ª‹ò`AUú9®2ò\Ê+Å‡cŒø#›•±2œ\Ó:‚¨¶V\Ó\Þ‚\éˆ-¹\Ü~–˜<v?0„†Š6´\Ìv\ëi1vu\é,E\äOv8ÆŠ‚ ‚Ã‹s2°l…a\âðþ[o^“!\Òóðß¤ª»7•ò\\2Žt~¶DŽ9n\r/.^¬f\ÑSQW49|-x•\çtgÝ¸•¸´SD³ ‰\rtx\Ùò y^¤›\åBá¥²\Ø(_\Ì\n\Ð-cW*c­T7	-(el4¬\ê5ºÄ–¦Yy™ñ\0zˆ±„‡LM@ú¨Lh»J\ïb\ê†zÃ´U\×\ã¥\à\å\'vð´m<;[ 3[m\îY$TC*ž|&ÞªŠ\ç˜dl^4Á|÷s‚ @´R&‘ Ð°8½V†\å8\ÝÑ˜\n¬\Ùý\Õ\0i\Ú/œœ°˜£p\ä(¼¦\å >\nS›¬>\Ó\rYA\\Ò‰F.œù\Å&o,zM4”ô‹Á I-Û‚gº«ú2\Ì\á\Î*yZ\Ù|\Ñ\î—id<\ìi\Õ\Ì‡†ñ,g7\Ù4w.A\éJ\í¸Ê•°\nb\'E&\àõ¶kfÖªZGó\Â\rY]\ÈuB\ÙPSŸiu\Ç*ýa‹aJÜ™²h½˜Q\n\Æq/¸ñ¨:\0r\Ôz°@1§iC¦Uv™\î\Ö[ö¹e\×2\Ê;¦Ë„…hcyÉ»\ï0<œÁ6€\àD‹K\æ7Rò+°Yô\Ã>‘ª…š,]·\0º‚\Ò!\Õ\ÙŠ:!«JY›dQV\0\\C…9œe8\Zø%©\Z…¨yš.“a¸\Ã	ŒgIB*\Ä\Òö\rS“]w,Â¶²10\ÝM\Øñj\"·µŠeö¹S\æNSy¤<°aº\æ»ÊµÒ°ƒ6J!T\Å#ªI©bj1\r\Ì\ê\ê”k­&F¥Ð¹¸e|XL¿/aE\ëN¥\Ú8i/\é•Uå†µf•«®põkS.\é)\éq\ÑU5¼ i·xNô\ÒóRÅ›]X;%«U\Z¸\Ðm½A\ÂÍ¨T Æ ¤`=-\ì\Ì\á.R–~q²¡]róc(À£E	‹®\Ðôƒu\é\ìñ´a«b-e\Z2\"¹h\êCý+m\Ú\ä–\n\è´i\ßT8 \ê\Ö-ÔŠEs¢×µ+©t\ê¥6U\Ò\Â{(*\Ìó·MRñerz]\Ì&¡‹8\"Æ¹=rŒ\âZ\Êkž\0T\ä,\Ìî•j\"\Ä}PS_†ñ¨Š40ï°¥ŽÚ€XX»1+\ã$Ú¬\â\å+6\\k[­-+@te7Þ²\Õ4lº\Æ\"@o™²o7ùxWL@\í·\â±ñ¿™\à\Úi\ÌU\0XE˜\ì3z\Z™/\â›1…´\áó…‚`\Æ\0\Z\0\Ó\ë\Z(6½\év.*Ö‡\"¬¢»s*ö¡PÌŽ\ãÿ\0U*QmÈ\Üp\Ï@\Ì/hýu$\Ê\ß¬Ldsµ\ÛS-Ãˆ(\ÈKBR\Ä\rL\×6>m|D(Bõ\"Rš0b\ÒZ0¼[†÷\ç-ò\á[,EºŽ\×U_\Ø0nÎŒ\nP.\Æ\ØóDeQH0‚xh²0]]t¶4L°4©«%Q¶½\Ç>õÚ˜UŠ‡A\\\à\Ä\×ÀQ‰AAƒ‰A\Äb¸¥N&3™7ù-†¦ž2o6šB:%X76¶;ÿ\0Ž“¬\Éø9ñ\Ô\êb\Ë\é¨¶ßˆ\Ôz?žrü4\Îso—ò\ØkÍ°ðùœ\ÚiG˜\í_\Í\Ç?ð±|Àƒ\Ë4\îeÿ\0•\Ã\ÃD\ç6ù-L%\àû†w§z2§Ÿ\ÓIÄ¢À1¸¶\ßüµQJüÿ\0\"ð\Z›\r¾R\åÿ\0	[J—R1\Ã\Ã\Ú_\Z½k\ÏLýŸ¾,´n…½\Z–©Ã©õ\æ\á2¹ˆ\Ýs\ßþ¢LF–cÿ\0`¹†»‰ÖšõR²ÿ\0Q°N\Ò\Í|ˆ\Çûòÿ\0VM¤®±\à¿ñP¤C²\Û;À³;V¯L$-;1ô\Æ4óÙÀMY~\ÙÛ»X]Y~Ô˜l}_‰n}–y=ž1\Ýñ/\'²Z\ë\Ùfz_W\â|7ÐŸ»ý§\íÿ\0iv£\Ç\ÒFu)zs¦‡ª?R\Z^´\é=TýLDud\á¯?¾Áöy¿Ü‰ú\Ï\âŒ×ƒöû\ÞGöˆý\îü±“õ„\Ï\Þx\è%ù¨‚/\ÄSo\æˆ¶\Û\ÏñKwû]§\ïŸiû\Ú~ùö”\ëö»@ô^_Š£òtS°NÁ;\ì‰D£ÿ\0/ÿ\Ä\0;\0\n\0\0\0\0\0\0!1AQ‘\Ñ \"2Raq’Á0b¡±\áð@Br²\Ò3\Â#‚ñÿ\Ú\0	?\0´-h4\"\á˜V§AÁ[jU©\ÐpV\ÇAÁZjt©V¥Z•jU±V\Å[9Z•jU©\ÐpV§AÁ[l\íl\íl\ílt³´©\ÐpV¥qlŸŸ°\æ4¹\Ù|¹’nM\ZŽ(½uB\0uj%¦\âH\êš\ÝB\ë4Áñ˜)²\ÃuDéµ µ\×dÙŒ$N˜\ìgF&dN\îq~\ÆKM\Æ@[\ÓG¨qM¬\ë	\Å7y\Ñ\å’TD‘ \ël\Ïg`&ÿ\0![\Ð\r(\r(\0\ì4§ù+C$\æo\Õó…pžô&K)_&Š\Ôôo\éiBk/t\á‰VGøA°\çE¢•ý\ë 7Q\î\nC\àzbMe8\în\ÐL\×<bü{òL\á2šaA°”Ñºj\ß\rpD¶žq’­¯\åCKœD\á¦t}§~ê„“yšÎ¨\r)¢üÿ\0(\0\è²‹ý‚…¸·“\åtŸô«Á‘}è´°\n™3|˜µÀñÞ”%\Ã\n\Ä\ãPº%Â·ù#6\î\Òp\ë9Z1ü\ÃMëˆœ\ësRŸh‡_Õ…hH\ÄoDõŽ\Þ8ý)\ÌE¦Ñ·Œ#*7†ø\Ô!ÓŽñ½‚p‡\n\Å\ãA\r?.a9Žh=$\ß»ª\ÝP»X±\ï=gb¹=žr{)\Ët.Md2\è…\É\ì}#¬¬,}!XXV\îˆ\ëh¬,H\Ïtp\\ž\Ë\Ð8.Mc\è&°ô“XzÉ¬=‚\ä\Ö>Árk@\à¹5‡ p\\ž\Ç\Ð8.Oe\è\'²ôŽ“YzG\É\ì½#‚\ä\Ö>¹5—¤.Me\é“YzB\ä\Öz+4Z(Ü²÷Tc\ì*³‚žZ\æ÷Õ£©Õ¦32žk\ÜzÒ­\"\è¢\áä‹–ö‹yRp\Çù\Ö^û.\ÞQú\ÝýT[_ññE´~ö“˜ý½eF‹ª\Ñ\\»‡=¤÷\Ü\çÔ #5QŸ??uû]¡\Òo­v©§Ršu)‡R˜u<S§Šn\ì\ßS\ï\Í\ÅÊ±y\æc\Õ\á\Ï\Í~\×\áÝž\ÌnWûþ]\Øü¸“Í¼+\î?\Ý\Î\Í~\×ev˜¦3)=ß¥4±\Øe´o3\â\Ó ý\Ñs¯ðÀl¸\'}\n «\Õ\Îÿ\0-”UÛšý¯4\Ï\ÝU0\ÑóbP ¸|\È\É\'\ËÁ^‚¯„u\ç\Å\Z\à ®\ÎÏ²h(nÉ®\ÊB\ÄQb.\æf»þü\ìJ\í{!¼ßª\è\Öw\Ë\àq\0&?EG\r\È\É\àŒŒ‘€Bi*ZHÙƒ‘ ÷˜ƒ¿?ö\æf³\æT,—\íP”N]\È\0c\Ü \'u@&\à€Š\0ÀM\0\î\åÜ„öF\n7[®q\Æ0_µQ8 ú\ë‚3Sò¬\Ö0~‘\Ì\Íg²Q)ÈƒE\ßþHÁÞ¿º\n©&¥e\î^\Ë?û\r™{\Ùö]a‡Ëšh?\"Œ\Çô\â²÷+µ³±\ï³ ‚3YóF¿\î»C\ìVk/p²öYû™°]Ÿd\è\'<\ÑE\ÖV#÷+?m}—@E™®\×u\âû‘³xD9„D‘˜\ÎQ¸ftÉ¨\îÿ\0]„C…„oŒ¡Ld\'}¸§\0\r\æD£P3\Êps\îÛ±û\îGnkµ\ì6@\ØI\âšSUf`w‰M&³p\Êõfj!\×y&\Z®©¤­\Þ)†÷MòSM\rOË©L\":·uqM2DRü\å4\ÈD{\ÊiM(x\ê¨9¹¬ù\Ílø	Ln1º\Æ\è Ln1º\Æ\è Ln1ºÀA½°\'\Ä \Ãq¡È¦7@˜\Ý\0y+§ó°ó3\æTøy—›òó\nwGY½ÙƒˆU\ïÁ¯(Dƒ?\ÝO\ä¯Á8•\ÑpF%\æP#\Ü+ˆ§\Ä$N3]S\í5*\Ö\ÐÂ¶´)\á†\n\Ú\Ð/¼+[MG\ç;M—~4y—…x<ü¹\â`Hñ…‹.±-Ž\Ê#\âµ@ø\áñ²\æ€]€&š€Sö<“}_…b\Ú]\Òs‘*\Ì\ê8¦Äš‰\à„w&ªw#\Ø(‘\Û.q\ê·\ÇË´­\0¹­<Jys€\ê8Ž\ç!Y±¹ˆ?yVe¿0\àSƒšn;r÷ø%8\0˜wf¯\à{\×H ;\×\á·ù\äˆ#Æºl0I\î\Å8µ¦óŽ\îý“:%¦¸]>H\ìMo¼	\Ñ0¹\àÃ„Wv)>\n7‡\Ùƒ\Ä†þe³/€\à]\Ù¡¸3\Å\âq\'e[õNñü„*Žó°j¼é»€D‚.3T\Æx\ê4\Ý\Æ	¡·\ÔÝ¿&‰\Öo#­Q$“\à(ž\Â\Þ\ÄW|›«F\îµ\ÙùL’B(Ã›ù„oY\É4Wf^ü\Ò\Z.9\àºÜ°\Ø\"nB§BL\î@‚/N€/U8žeH¸c3 }\è¸\È8Bsœ#÷yt]0\Þ\Þkõ«°\Þ\Ê{“z$Ý„©m˜\êŒI@\0\0a»2÷\Ø@\Ê;\Ç\éª£\ê‰;n(\ÉD1ª\Ù\Íb\å|A]•&\ï\Â\ì÷±Q½ý[sA‘˜8ˆ\Äh\Ý\Ñx28ôbjš\çihD4w€jOe;|ž³±\ÞÄ¦µÌš‰x\" \\;¼0Y{lnô\Ð\"\Z<=\Ñ$\í4À#CuT„p¦rŒMÁ?÷T\é&\áT\è\ã^²t—­fS¢—\×D\à \ÄýÓ«\èÔŸþ\èŒv~(\ãôG\êˆ\æ\éñùÙŸÀ%¸\ÈñN0œSª.N(\r\é\Å!?=™ÿ\05ž\ÐD„AA4 tø\0 t@\èštM)¥5@D\"J=ÿ\Ä\0:\0\0\0\0\0\0!1AQ‘a \"2qÁ\Ñ0Rbr¡\áð@’±B¢\âS‚²\Òñÿ\Ú\0	?\0\0€@ hMT\ÑõMT\0šššššššš‡I¤”Ñ¨B&\ÕH@6M\ê›IM\Z…p`üÉ²\ß\ë{e¦\Õ	“\â	\Ósz±˜ž\íÍ–\àdy¦Bs!#\åÌ¨\ÊG—±5\ÃI	\î’s(’pF\Ã\Ñ8·=-£©z”nzÇ–%5ß¤E\'\n\Æ\ä»&£\Ìn\'Š$\Ö)jœxb•\Ç\ÉvK¥\Ç\àŸ4\Ò6a°S‹KGUZ\íùO¥“‹s\î	\îÔ§pñœ,*—_iúû¨\É78ô\åJ\â\áq¿„¸¤º$´D˜­\ä\Ñ@Œeq\Ã\Ä	¿•Ê“µvœ„òO:E\Åú­ÓT¢æ–ˆvž\ç¦ŠN\Õ\×8~ó ôE\Üb\ã\ÄO\"¸¸‡\á‚uo\ÚÁ\Æ\ì0¾h’01&=Gø¢\\\Ü\ÃÜ§ \â\0Á8§99Ú”\ã©N:”\çjS©Ov¥=Ú”÷jSÝ©Ov¥=Ú”ó©Ov¥=Ú”÷jSÝ©Ov¥<\êSÝ©Nrsµ)\îN)\ç¢\Ð\æ›T&\nÞ¡¨Aº…Ã¨\\\Z…Ã¨\\:ªó\Ãöy \è\ßÿ\0$6µ\æ#†m\É3k\0ÿ\0°½tþ)›S\'<L\ÔüS6¤ˆ#\æ‰\Û|.L\Ú0´\0$\ÇT²\â9×š\'hiZ\ÌTô\Êu=™-J¢\Ý#@œ4‰\ãA\èž4‰ÿ\0@Ÿ\Ä@\ê\Ðx\Ðto€X\Øt<Uì¯–\ì¼—dxÒ·°¢\ë±\ÕKN_}\âS\ã’q‡®þ«°8!qo\é\Z-óg¼!°\Ý.q°û£\Â=\Üu\éQ	\çŠtrBx.\ÑOÂ¼OÂ‡\Z8Á\nÓ¸‡ñ@<€®¼H\Ò…&1\Ãvi\ÄQ\"-º»©\Ï\î«\ÒŒ(*‹%’<.(—¸vGÄ‹A<\ÓÛª¨!\0\Ü&–º ºu€‚p*¢VKª7\ÖGH\î\nZ\ìÿ\0(ž›n¢&@º$‚|Šqm4R@¹Ÿ$\â\æ\â9\"[$A”÷\\$I\Í?\ä\ìQ&.gHÍšNkòŠ@\î1öFlU&\ã\âö%\0SSH\ÝQ\Ãl.¡^|ŠÄ«G®\ì™X;\Ì+\âÙ¸\ÃD#\âÁg\ä!d½\íÎŠ§„\àQ\è‚SJ»\Ýó%\ïyš\Ë\×vgû+\Þ\ØM\âºt)¤g”,BÀù–\ï{p\ÊhMnË¤\Ç›%l\ßAn\ÉlÝ¡LuG/ºc¯‘LuFGó\ÇhSC‘\Í1\×\È\ç)ŽÐ¦;C\è¶o9fêœŽAl\ßot¦<À¿	ô@´“hõX&\ÍJ~[Šký qO\r \Ðr0V\Ð-«x‹`|Ð¶\í.{iB\0t@ V¾ò{\Z8L8™|\Éq …·h\Ä\ì…bÚša\Å\Ô[Võ\\&·gsZ§µ¯7Ë·$\Ðµo§‡Ý´\ÉmP!³=a2l\"VÝŽA\×:\â&\àvpOac\Þ\\&b\0‚>ýŸž\\&p¶[F§Kl\Ó\àªJÀ\"£½|hœG)N:”\çjS©Nv¥8\êSŽ¥8\êS©Nv¥8‚,f\Åˆ”\çjœw^.€pú¦‘\ìŠ2„tÁ(z«\àUº6þöö4\Ôü*\ZÁÙ®§œ©s	¡¸U#£…\ÕÁö€:0ŠhS6\Ål¶g\Ã\î¶;=ª\Øl´>«c³\àú¦†òu—\×h>EIh5•W\æ’zXoV\ßp‰i\ã1®h‡z¹¿\ì‰\rÄ]-£\Çý£ÿ\0eµwñû­±þ\'È­·ú•µ”Dgœz£(\Â2P‘šñ\èxœA9ŸL`f/¡¢. \Ø\Êtòû„ Œ=¥NX¦G…~\É\Ýh£|²\n‡$*Q1º*¤xy 7	8eÌ£Yñº² %¹q}÷v…,G²	¤ŒðF~\ÐÑ»ªüðL¦Ð£D!¸¹X\\\ãÅ‰@Œrû\ÚU¸\Å	¶y\0>Q„\×1\ÙÎ»¬h{•a\×\é‰C„f‡\Ï dŒ–\Ýh¹‚-te¦\Çÿ\0©À9­—\nösE®k\èÏ›\Éq³bB\"@\è\n\Å>eqO\Õ¡\Ö\"1\ïF^1\ÆbpU$\É=\n¦À\Í:y&\Ïó\Ä\ê7\×Á6\Z\æ{\î	A\Üd)ªž8Ê™š¯ú`jB«\'ºIErû\ãÂŒ\Z	R³¿\Ì’š\ï\Ó\ÚH9p\á¢ý)\'d\r¦q\Ü\"{MÃ¿’a“¦ªƒ/\Ý\É\n\roÂb®+=\Æ\"\ê\\š7‰&\ç–UM\ëZ\á°õ@ \Þ*y&‰.‚k\0Z|S8¢\æq‰0 ­„\ÎKe\0v È­—Œñ6“\Â1$ÿ\0ª\Ùðµž3f_\Ö0\Úv@’\êÛ´¶eò\Ð\â\ÚQ¤Àº\Ø\È64›\Þ<:Œó€\0ŠJÄŽ·º‰[91[\ß\0šA\'½6Fpu„ “Løp‘¼!\r\ÙyôÀ\Ñ4A¸€˜\ÒM\ÌU$A?I‚E–Í¤\Ï\ÕlÀ´+\Þ\ÌÀ˜…øp¢Ù´&44\ÜE9&4	´\æ€e\Ó\Ë\Ëv^º÷|·Qœ{“AAÁ:<\n\Ú7Q\æž\Ó\âEQNjp\Õ8j›¨Of¡m¨[VjÑ©ó\à}qðõM\'D\Ð“³%‰\Õ‰öÿ\0ÿ\Ù','2021-03-07','fsd');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_response`
--

DROP TABLE IF EXISTS `questionnaire_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_response` (
  `id` int NOT NULL AUTO_INCREMENT,
  `submitted` tinyint NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_questionnaire_response_product1_idx` (`product_id`),
  KEY `fk_questionnaire_response_user1_idx` (`user_id`),
  CONSTRAINT `fk_questionnaire_response_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_questionnaire_response_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_response`
--

LOCK TABLES `questionnaire_response` WRITE;
/*!40000 ALTER TABLE `questionnaire_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionnaire_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistical_answer`
--

DROP TABLE IF EXISTS `statistical_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistical_answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `q1` int DEFAULT NULL,
  `q2` int DEFAULT NULL,
  `q3` int DEFAULT NULL,
  `response_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fixed_questions_answer_questionnaire_response1_idx` (`response_id`),
  CONSTRAINT `fk_fixed_questions_answer_questionnaire_response1` FOREIGN KEY (`response_id`) REFERENCES `questionnaire_response` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistical_answer`
--

LOCK TABLES `statistical_answer` WRITE;
/*!40000 ALTER TABLE `statistical_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistical_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(300) NOT NULL,
  `salt` varchar(300) NOT NULL,
  `isAdmin` tinyint NOT NULL DEFAULT '0',
  `blocked` tinyint NOT NULL DEFAULT '0',
  `points` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'admin','admin@admin.admin','76Gx2CuOOqM5dZFG78LF1KAwJiI=','yHxgBOi3kD8=',1,0,0),(6,'user','user@user.user','cfYoSZjavIP0llVsuXVOQTrrPmI=','Ued2bek/BMY=',0,0,0),(7,'user2','admin@admin.admin','Rlq5oJZ4cYAsR9VvXALobM+vJoI=','QCK/cMuV25Q=',0,0,0),(8,'ff','ff','eN0rmIxbTQfmzN+bPZcNzYZP9L8=','kBA78rl0M4U=',0,0,0),(9,'user3','f','RKpBcbdd605DW/XOdaFFEYmK7L0=','VwakjDYMGWo=',0,0,0),(10,'vv','c','r+efQ/xHiU/fS4j/9NRKXYaGs10=','CeetDK+CAHU=',0,0,0);
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

-- Dump completed on 2021-03-08 18:00:23
