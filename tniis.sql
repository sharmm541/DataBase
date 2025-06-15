CREATE DATABASE  IF NOT EXISTS `tniis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tniis`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: tniis
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `building` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `fk_address_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,'Ростовская область','Таганрог',''),(2,2,'Ростовская область','Таганрог','г. Таганрог, ул. Адмирала Крюйса, д. 33'),(3,3,'Ростовская область','Таганрог','Таганрог, Поляковское шоссе, 20'),(4,4,'Ростовская область','Таганрог','Таганрог, ул. 1я Котельная, 79а'),(5,5,'Ростовская область','Таганрог','Таганрог, Поляковское шоссе, 14'),(6,6,'Ростовская область','Таганрог','г. Таганрог, ул. Котлостроительная, д. 37/8'),(7,7,'Ростовская область','Таганрог','Таганрог, Поляковское ш., 16, оф.'),(8,8,'Ростовская область','Таганрог','Таганрог, ул. Харьковская, д. 22'),(9,9,'Ростовская область','Таганрог','Таганрог, Николаевское шоссе, д. 16/18'),(10,10,'Ростовская область','Таганрог','ул. Инструментальная 2'),(11,11,'Ростовская область','Таганрог','д. 78'),(12,12,'Ростовская область','Таганрог','Ростовская область, город Таганрог, улица Фрунзе, дом 83-1'),(13,13,'Ростовская область','Таганрог','ул. Петровская, 116'),(14,14,'Ростовская область','Таганрог','Ростовская область, г Таганрог, ул Сергея Шило, д. 241, помещ. 1а'),(15,15,'Ростовская область','Таганрог','г. Таганрог Мариупольское Шоссе 14 СНТ Связист уч 40.'),(16,16,'Ростовская область','Таганрог','г Таганрог, ул.Александровская, 20'),(17,17,'Ростовская область','Таганрог','ул.Котлостроительная, д.27/1'),(18,18,'Ростовская область','Таганрог','Ростовская обл. г.Таганрог, ул.Петровская д.85'),(19,19,'Ростовская область','Таганрог',''),(20,20,'Ростовская область','Таганрог','Ростовская область, город Таганрог, ул. Сергея Лазо, д. 9, ком. 37'),(21,21,'Ростовская область','Таганрог','ул. Петровская, 99'),(22,22,'Ростовская область','Таганрог','ул. Маршала Жукова, 2и'),(23,23,'Ростовская область','Таганрог','г.Таганрог, ул.Большая Бульварная, 13-6, а/я 13'),(24,24,'Ростовская область','Таганрог','ул. Мариупольское шоссе, д. 54'),(25,25,'Ростовская область','Таганрог','г. Таганрог, Поляковское шоссе, 15-В, офис 4'),(26,26,'Ростовская область','Таганрог','Николаевское шоссе 16/1'),(27,27,'Ростовская область','Таганрог','Ростовская обл., г. Таганрог, ул. Лесная Биржа, 6-К'),(28,28,'Ростовская область','Таганрог','Ростовская область, г. Таганрог, Поляковское Шоссе, дом № 16, офис 305'),(29,29,'Ростовская область','Таганрог','Поляковское шоссе, 15 Г');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Авианормали','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/logo_130.png?itok=YVv3_PkS','Производство авиационных крепежных изделий.'),(2,'ДонМаф','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/company-4888_0.jpg?itok=008oGs2w','Предприятие производит и реализует игровые площадки, спортивное оборудование, спортивные комплексы, детские площадки, теневые навесы.'),(3,'Мимакс','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/company-2460_0.png?itok=pG6xi6-s','Компания занимается выпуском автоматических газогорелочных устройств (АГУ).'),(4,'Швейная фабрика Pride','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/qydbjp9vyua_5.jpg?itok=-5MeFB-H','Фабрика шьет оптом и продает одежду на заказ.'),(5,'Таганрогская кондитерская фабрика (ТКФ)','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/factory-1193_0.png?itok=ocDcu-tT','Компания производит зефирно-пастильной группы, мармелад, вафли, драже, песочное отсадное и сахарное печенье.'),(6,'Станкотехцентр','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/company-1314_0.png?itok=m5A1_0Oc','Изготовление канатных, цепных и текстильных стропов, стяжных ремней, крепежных цепей грузоподъемностью до 100 тонн.'),(7,'ПКП БАК','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/company-12370_0.png?itok=451QkB2I','Компания производит оборудование для пекарни по всей России.'),(8,'ТЗН','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/company-11747_0.jpg?itok=mtC42bYS','Компания производит метизы (нормалей), крепежные детали с термообработкой до необходимого класса прочности и гальваническим покрытием.'),(9,'Радомир-композит','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/company-7899_0.png?itok=CPAaacOA','Компания производит стеклопластиковую арматуру.'),(10,'ХозАгро','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/logo-1292_0.png?itok=duiC3R-Z','Компания производит и продает продукцию для сельского хозяйства и дач, включая теплицы и сопутствующие комплектующие, а также предлагает услуги по монтажу и эксплуатации тепличных комплексов'),(11,'Rutico','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/logo-1041_0.png?itok=gKpqzmEt','Кондитерский цех специализируется на производстве конфет с шоколадной глазурью, содержащих орехи и фрукты'),(12,'ТехСтрой','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/logo_tehstroy.jpg?itok=A8S659QR','Производим колесотокарные и колесорасточные станки, а также вспомогательное оборудование для точной обточки колесных пар.'),(13,'Уличная мебель.ру','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/um_logo.jpg?itok=FtTT27Ko','Мы специализируемся на производстве высококачественной уличной мебели, предназначенной для придания уюта и стиля любым внешним пространствам, будь то парки, скверы, жилищные комплексы, кафе, рестораны или частные загородные участки'),(14,'Егоза','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/dp.jpg?itok=xiEG5OE-','Мы специализируемся на производстве детских игровых комплексов, МАФ, уличной мебели и спортивного оборудования.'),(15,'Аквадон Эко','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/286a6a0e-a410-fb24-6caa-3e510aaf1308_0.png?itok=awhowNh1','\"Аквадон Эко\" - ведущий производитель профессиональных аквасистем для бизнеса. Создаем специализированное оборудование любой сложности: торговые аквасистемы для магазинов, промышленные системы для ресторанов, пресноводные аквариумные комплексы, морские системы для морепродуктов'),(16,'КрепежРоссии.рф','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/imgonline-com-ua-resize-gtuee5ta2bx7y_0.png?itok=hMJfZReI','О Компании «КрепежРоссии», поставщик и изготовитель крепежных изделий и метизов в Ростовской области и России'),(17,'Компас','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/cropped-kompas.png?itok=BXTTXaW5','Производство и прямые поставки российских газовых котлов внутреннего и наружного размещения в любую точку РФ. Официальный производитель котлов «Компас».'),(18,'Полипак-Дон','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/polipak-don_logo_2_2.jpg?itok=wDktZr_u','Компания Полипак-Дон - производитель и поставщик полимерной упаковки из полиэтилена и полипропилена.'),(19,'Лазер-КМ','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/logo_cvetnoe_1.jpg?itok=WBi6qSim','Завод ООО «Лазер-КМ» занимается всеми видами металлообработки, а Также в рамках реализации проекта по импортозамещению и обеспечения России технологической независимости наладил выпуск селскохозяйственных запчастей.'),(20,'Производственная компания ТОТ','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/dizayn_bez_nazvaniya5_5.png?itok=XmDvkRTw','Производственная компания ТОТ основана в 2015 году в Таганроге.'),(21,'ОКБ Ритм','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/screenshot_1_39.png?itok=4k08sYr5','Компания производит медицинские изделия, лечебное одеяло, стабилографические комплексы, аудиометры, рефлексодиагностические комплексы и другое.'),(22,'Территория благоустройства','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/logo-1638738228_2.jpg?itok=5foE462P','Производство оборудования для детских игровых и спортивных площадок.'),(23,'Таганрогский кабельный завод Энерго','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/logo-na-sayt.png?itok=zT6lIWq2','Завод производит кабельно-проводниковую продукцию.'),(24,'StreetAtlet','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/combo_paket3_4.png?itok=fdSEvhSI','Проектирование и производство воркаут, кроссфит и фитнес оборудования.'),(25,'ТаганрогСтальМост','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/logotip_2_0.jpg?itok=sPvh6Equ','Завод занимается производством металлоизделий и металлоконструкций.'),(26,'СовТехМаш','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/logo_stm.png?itok=VLJeKZWt','Завод занимается изготовлением ангаров, металлических ферм, силосов, водонапорных башен.'),(27,'РусСпецКрепёж','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/logo_kvadratnyy_300h300_2_0.jpg?itok=_r2V2SFg','Компания занимается изготовлением специализированного крепежа, различных металлоизделий по ГОСТ, ОСТ и ТУ.'),(28,'Рядъ','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/675a72230120c1f3ae0678dbdc28cbcf_6.png?itok=Ce9i60dN','Производство и капитальный ремонт полимерного оборудования.'),(29,'Оникс -Юг','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/3.jpg?itok=mVeZV9Ht','Компания производит и продает оптом профнастил, металлочерепицу, вёдра, оцинкованный лист.'),(30,'Р СпецКрепеж','https://fabricators.ru/sites/default/files/styles/logocompany/public/logo_company/rsk_ro1.jpg?itok=tWbXjswe','Компания занимается изготовлением крепежных изделий (крепежа) по ГОСТ, ОСТ, нормалям, а также чертежам для нужд промышленных предприятий.');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyproduct`
--

DROP TABLE IF EXISTS `companyproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companyproduct` (
  `company_product_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`company_product_id`),
  KEY `company_id` (`company_id`),
  KEY `fk_companyproduct_productcategory` (`category_id`),
  CONSTRAINT `companyproduct_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `companyproduct_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `productcategory` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyproduct`
--

LOCK TABLES `companyproduct` WRITE;
/*!40000 ALTER TABLE `companyproduct` DISABLE KEYS */;
INSERT INTO `companyproduct` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30);
/*!40000 ALTER TABLE `companyproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyservice`
--

DROP TABLE IF EXISTS `companyservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companyservice` (
  `company_service_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `service_id` int NOT NULL,
  PRIMARY KEY (`company_service_id`),
  KEY `fk_companyservice_company` (`company_id`),
  KEY `fk_companyservice_servicecategory` (`service_id`),
  CONSTRAINT `fk_companyservice_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_companyservice_servicecategory` FOREIGN KEY (`service_id`) REFERENCES `servicecategory` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyservice`
--

LOCK TABLES `companyservice` WRITE;
/*!40000 ALTER TABLE `companyservice` DISABLE KEYS */;
INSERT INTO `companyservice` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30);
/*!40000 ALTER TABLE `companyservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactperson`
--

DROP TABLE IF EXISTS `contactperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactperson` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'null',
  `phone` varchar(50) NOT NULL DEFAULT 'null',
  `email` varchar(100) NOT NULL DEFAULT 'null',
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `fk_contactperson_company` (`company_id`),
  CONSTRAINT `fk_contactperson_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactperson`
--

LOCK TABLES `contactperson` WRITE;
/*!40000 ALTER TABLE `contactperson` DISABLE KEYS */;
INSERT INTO `contactperson` VALUES (1,1,'Авианормали, ООО','+79381484040','avianormali@mail.ru','https://fabricators.ru/flag/flag/favorite/39357?destination=node/39357&token=df865221740d4a372e4121d0f757115f&has_js=1'),(2,2,'Беспалов Михаил Владимирович, ИП','79282966357','89381674107@donmaf.ru','https://fabricators.ru/flag/flag/favorite/10153?destination=node/10153&token=e75623fdfadabdbd764dc419fc4ae354&has_js=1'),(3,3,'Мимакс, ООО','+78003336580','contact@mimaks.su','https://fabricators.ru/flag/flag/favorite/4069?destination=node/4069&token=4bc5ceba154034f44f5df9fd43cec554&has_js=1'),(4,4,'Цедов Владимир Владимирович, ИП','+79094333158','pride_fabrik@mail.ru','https://fabricators.ru/flag/flag/favorite/35118?destination=node/35118&token=2ab9b9e0bbc011bb0293a95df226e8db&has_js=1'),(5,5,'Таганрогская Кондитерская Фабрика, ООО','8634367616','tacond@gmail.com','https://fabricators.ru/flag/flag/favorite/14194?destination=node/14194&token=0b2b656a069d9b518ccef0dfaae297ec&has_js=1'),(6,6,'Станкотехцентр, ООО','+78633033660','strop@stankov.ru','https://fabricators.ru/flag/flag/favorite/10145?destination=node/10145&token=c25ca06ceafda54d2291dc215d6eecc6&has_js=1'),(7,7,'ПКП \"Бак\", ООО','+88634398511','poisk240@yandex.ru','https://fabricators.ru/flag/flag/favorite/6550?destination=node/6550&token=e23544d2a3a6cd56057567791c760919&has_js=1'),(8,8,'ТЗН, ООО','+78634431002','info@tzn1.ru','https://fabricators.ru/flag/flag/favorite/624?destination=node/624&token=99c7d9d601d55c5a0a33442e1205fca0&has_js=1'),(9,9,'РК, ООО','88002009761','sale@radomir-composite.ru','https://fabricators.ru/flag/flag/favorite/360?destination=node/360&token=d93d99d093b953c437029328a8f325c1&has_js=1'),(10,10,'ООО \"ХОЗАГРО\"','88002508304','sales@hoz-agro.ru','https://fabricators.ru/flag/flag/favorite/69576?destination=node/69576&token=7c79efaa7e6fa5006ba1cc7e44fabc70&has_js=1'),(11,11,'ИП Носовская Анастасия Юрьевна','79289883030','rutico.ru@mail.ru','https://fabricators.ru/flag/flag/favorite/69395?destination=node/69395&token=98f625755baccbf0b278f8cf961e5456&has_js=1'),(12,12,'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ \"НАУЧНО-ПРОИЗВОДСТВЕННОЕ ОБЪЕДИНЕНИЕ \"ТЕХСТРОЙ\"','+78634314846','info@tehstroy-group.ru','https://fabricators.ru/flag/flag/favorite/68836?destination=node/68836&token=ab2919dfb9a538e79b4cfef29161577a&has_js=1'),(13,13,'ООО Егоза','88002008750','ulichnaya-mebel@yandex.ru','https://fabricators.ru/flag/flag/favorite/68536?destination=node/68536&token=759ec0eba482bc5cf5c7460314034289&has_js=1'),(14,14,'ООО Егоза','+79001235113','detskaya-ploshadka.ru@yandex.ru','https://fabricators.ru/flag/flag/favorite/67010?destination=node/67010&token=1b1ab23aeafc97b0ef4bde164c293f4e&has_js=1'),(15,15,'ИП Воронов Е.Л.','+79281065866','Raven_1982@bk.ru','https://fabricators.ru/flag/flag/favorite/65105?destination=node/65105&token=a8b922cf615140368033df573fc9b989&has_js=1'),(16,16,'ИП Иманов А.Д','88001016815','imanovad@mail.ru','https://fabricators.ru/flag/flag/favorite/61331?destination=node/61331&token=fb6ee36dcfc2509f5bcfe14223b7dc50&has_js=1'),(17,17,'Общество с ограниченной ответственностью «КОМПАС»','+78633103380','','https://fabricators.ru/flag/flag/favorite/59926?destination=node/59926&token=0c0d140451c485ac357574058d149ff6&has_js=1'),(18,18,'ООО «ПОЛИПАК-ДОН»','89885641301','poliupak@list.ru','https://fabricators.ru/flag/flag/favorite/58163?destination=node/58163&token=1a237594549649624d9e575c30b9d9d4&has_js=1'),(19,19,'ООО \"Лазер-КМ\"','89956155000','sale@laserkm.ru','https://fabricators.ru/flag/flag/favorite/57371?destination=node/57371&token=0084801936cb4cd9b8bea9efd1e00207&has_js=1'),(20,20,'ООО ПРОИЗВОДСТВЕННАЯ КОМПАНИЯ \"ТОТ\"','88002343294','mail@totflex.ru','https://fabricators.ru/flag/flag/favorite/55848?destination=node/55848&token=60d43f57c7e74033a2881d80b0625b6c&has_js=1'),(21,21,'ЗАО «ОКБ «РИТМ»','','','https://fabricators.ru/flag/flag/favorite/54111?destination=node/54111&token=4a28f623e34b75a1bf9c7564b48c432d&has_js=1'),(22,22,'ИП Турский Вячеслав Анатольевич','89885854980','sales@ter-blag.ru','https://fabricators.ru/flag/flag/favorite/52358?destination=node/52358&token=e12e46d9243f4c76f3e38636e6c119f1&has_js=1'),(23,23,'ООО «ТАГАНРОГСКИЙ КАБЕЛЬНЫЙ ЗАВОД ЭНЕРГО»','+79081808131','tkzenergosales@gmail.com','https://fabricators.ru/flag/flag/favorite/50085?destination=node/50085&token=47b779244d31f0e0c147c32e419a0bf0&has_js=1'),(24,24,'Андреев Александр Владимирович, ИП','+78001000451','streetatlet@yandex.ru','https://fabricators.ru/flag/flag/favorite/44304?destination=node/44304&token=711fd345149fead7c9f8a544c565f546&has_js=1'),(25,25,'ТСМ, ООО','+79381020251','zakaz@tagmost.ru','https://fabricators.ru/flag/flag/favorite/39476?destination=node/39476&token=2f8603e0bc7dd2776b7184cf0a21e183&has_js=1'),(26,26,'Таганрог (Ростовская область)','88003507446','zakaz@sovtehmash.ru','https://fabricators.ru/flag/flag/favorite/39316?destination=node/39316&token=b700c99397b876b24721c7a6dcf1269a&has_js=1'),(27,27,'Русспецкрепеж ПК, ООО','88634377380','metizniky@mail.ru','https://fabricators.ru/flag/flag/favorite/38739?destination=node/38739&token=6d71df306092661176c6b1bc08c087ba&has_js=1'),(28,28,'Рядъ, ООО','+79614073399','ivan@sheyko.org','https://fabricators.ru/flag/flag/favorite/38665?destination=node/38665&token=f48a0f069618d48470b167487201f317&has_js=1'),(29,29,'Оникс-ЮГ, ООО','88634647331','creator2creator@mail.ru','https://fabricators.ru/flag/flag/favorite/37071?destination=node/37071&token=5875f797d44719c5dbaeae2f7757fd90&has_js=1'),(30,30,'РСК, ООО','88634431137','rskmetiz@gmail.com','https://fabricators.ru/flag/flag/favorite/37005?destination=node/37005&token=6b8db84a0ea081427ea936acc33e0a98&has_js=1');
/*!40000 ALTER TABLE `contactperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcategory` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `company_id` int NOT NULL,
  PRIMARY KEY (`category_id`),
  CONSTRAINT `fk_productcategory_companyproduct` FOREIGN KEY (`category_id`) REFERENCES `companyproduct` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategory`
--

LOCK TABLES `productcategory` WRITE;
/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` VALUES (1,'Болты, Шайбы, Гайки, Винты, Металлоконструкции, Уголки, Строительные профили, Металлоизделия, Кольца и втулки, Тройники, Переходы, Метрический крепеж, Сооружения и конструкции, Металлопрокат, Детали для оборудования, Фитинги',1),(2,'Котлы отопления, Газогорелочные устройства, Климатическая техника, Промышленные печи и котлы',2),(3,'Женская одежда, Мужская одежда, Детская одежда, Спецодежда',3),(4,'Зефир, Пастила, Мармелад, Восточные сладости, Вафли, Кондитерские изделия',4),(5,'Текстильные стропы, Стяжные ремни, Цепи противоскольжения, Якори, Ручные лебедки, Электрические лебедки, Тали, Гидравлические краны, Трелевочные захваты, Траверсы, Стреппинг ленты, Рукава высокого давления, Фитинги, Трубогибы, Крюки, Грузозахватные приспособления, Автоаксессуары, Судовое оборудование, Гидравлическое оборудование, Сантехника, Слесарно-монтажные инструменты, Инструменты',5),(6,'Ферментаторы, Хлебопекарные печи, Расстоечные шкафы и камеры, Пищевые контейнеры, Тележки-шпильки, Чиллеры, Охладители молока, Посудомоечные ванны, Пищевое оборудование, Хлебопекарное оборудование, Оборудование для общепита, Пищевое холодильное оборудование, Молочное оборудование, Посудомоечное оборудование',6),(7,'Болты, Гайки, Шайбы, Винты, Заклепки, Оси, Анкерная техника, Метрический крепеж, Крепежные изделия, Детали для оборудования, Резинотехнические изделия',7),(8,'Композитная арматура, Строительные изделия',8),(9,'Теплицы и парники, Промышленные теплицы, Сельскохозяйственное оборудование',9),(10,'Конфеты',10),(11,'Колесотокарные станки, Расточные станки, Токарные станки по металлу, Токарные станки с ЧПУ',11),(12,'Дачная и садовая мебель',12),(13,'Дачная и садовая мебель, Детские игровые площадки, Спортивное оборудование',13),(14,'Аквариумы',14),(15,'Крепежные изделия, Уличные тренажеры',15),(16,'Котлы наружного размещения, Котлы отопления',16),(17,'Тара и упаковка, Гибкая упаковка, Пленкообразующие материалы, Пакеты, Стрейч-пленка, Вакуумные пакеты, Пленка ПНД, Пленка ПВД',17),(18,'Комплектующие для сельскохозяйственной техники, Металлоконструкции, Запчасти для спецтехники, Защитные покрытия',18),(19,'Абразивные инструменты и материалы, Абразивные материалы, Отрезные диски и круги, Шлифовальные круги',19),(20,'Аудиометры, Медицинское оборудование',20),(21,'Спортивное оборудование, Детские игровые площадки',21),(22,'Силовые кабели, Провода, Кабели',22),(23,'Турники, Уличные тренажеры, Уличные спортивные комплексы, Детские тренажеры, Спортивные товары для ОФП, Тренажеры, Спортивный инвентарь, Спортивное оборудование',23),(24,'Металлоконструкции, Сварные балки, Автодорожные мосты, Сооружения и конструкции',24),(25,'Резервуары, Металлоконструкции, Емкости и резервуары для топлива, Каркасы, Цементные силосы, Киоски и павильоны, Гастроемкости, Нестандартное емкостное оборудование, Емкостное оборудование, Оборудование для АЗС, Сооружения и конструкции, Цементное оборудование, Оборудование для общепита',25),(26,'Болты, Гайки, Винты, Заклепки, Метрический крепеж, Метизы',26),(27,'Линии полимерного покрытия металлов, Экструдеры, Грануляторы, Экструзионно-выдувные машины, Системы контроля экструзии, Вакуум-формовочные машины, Термопластавтоматы, Пласткомпакторы, Агломераторы, Компаундеры, ПЭТ-преформы, Пакетоделательные машины, Станки для резки полимеров, Центрифуги для полимеров, Линии по переработке полимерных отходов, Оборудование для покрытия металлов, Полимерное оборудование',27),(28,'Оцинкованные ведра, Водосточные системы, Металлочерепица, Доборные элементы для кровли и фасада, Профнастил, Износостойкая сталь, Листовой прокат, Строительные профили, Сортовой прокат, Саморезы, Хозяйственно-бытовые товары, Кровельные материалы, Фасадные материалы, Металлопрокат, Крепежные изделия',28),(29,'Болты, Шайбы, Гайки, Винты, Заклепки, Шплинты, Метрический крепеж, Крепежные изделия, Метизы',29);
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `price` text,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `productcategory` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'15–50 руб./шт, 5–20 руб./шт, 10–40 руб./шт, 10–60 руб./шт, 5000–20000 руб./т, 100–500 руб./м, 200–1000 руб./м, 50–5000 руб., 100–1000 руб./шт, 300–1500 руб./шт, 300–2000 руб./шт, 10–100 руб./шт, от 100000 руб., 40000–70000 руб./т, 500–5000 руб./шт, 200–2000 руб./шт'),(2,2,'15000–150000 руб., 5000–50000 руб., 10000–100000 руб., 30000–300000 руб.'),(3,3,'500–5000 руб. за единицу, 700–7000 руб., 300–3000 руб., 1000–10000 руб.'),(4,4,'150–400 руб./кг, 200–450 руб./кг, 150–400 руб./кг, 300–800 руб./кг, 100–300 руб./кг, 200–1000 руб./кг'),(5,5,'500–3000 руб./шт, 400–2500 руб./шт, 2000–10000 руб./комплект, 1500–7000 руб./шт, 3000–25000 руб., 15000–100000 руб., 5000–50000 руб., 50000–300000 руб., 3000–20000 руб., 2000–15000 руб., 100–500 руб./рулон, 1000–10000 руб./м, 200–2000 руб./шт, 20000–150000 руб., 500–3000 руб./шт, 10000–100000 руб., 500–20000 руб., 50000–500000 руб., 20000–200000 руб., 1000–50000 руб., 500–10000 руб., 300–20000 руб.'),(6,6,'50000–500000 руб., 100000–700000 руб., 50000–300000 руб., 500–5000 руб., 10000–70000 руб., 50000–300000 руб., 30000–200000 руб., 20000–150000 руб., 50000–700000 руб., 100000–700000 руб., 50000–1000000 руб., 50000–500000 руб., 50000–400000 руб., 20000–150000 руб.'),(7,7,'15–50 руб./шт, 10–40 руб./шт, 5–20 руб./шт, 10–60 руб./шт, 5–30 руб./шт, 200–2000 руб./шт, 500–5000 руб./шт, 10–100 руб./шт, 50–500 руб./шт, 500–5000 руб./шт, 100–2000 руб./шт'),(8,8,'40000–80000 руб./т, 1000–50000 руб.'),(9,9,'5000–100000 руб., 100000–1000000 руб., 20000–2000000 руб.'),(10,10,'300–1500 руб./кг'),(11,11,'500000–3000000 руб., 700000–4000000 руб., 300000–3000000 руб., 1000000–10000000 руб.'),(12,12,'3000–50000 руб./комплект'),(13,13,'3000–50000 руб./комплект, 50000–500000 руб., 10000–1000000 руб.'),(14,14,'1000–500000 руб.'),(15,15,'50–500 руб./шт'),(16,16,'20000–200000 руб., 15000–150000 руб.'),(17,17,'100–5000 руб., 50–1000 руб., 2000–10000 руб./т, 1–20 руб./шт, 100–500 руб./рулон, 10–100 руб./шт, 100–500 руб./кг, 100–500 руб./кг'),(18,18,'1000–100000 руб., 5000–20000 руб./т, 5000–200000 руб., 100–1000 руб./м2'),(19,19,'100–5000 руб., 50–1000 руб., 100–2000 руб., 100–1500 руб.'),(20,20,'30000–150000 руб., 50000–5000000 руб.'),(21,21,'10000–1000000 руб., 50000–500000 руб.'),(22,22,'100–1000 руб./м, 50–500 руб./м, 100–1500 руб./м'),(23,23,'5000–30000 руб., 50000–1000000 руб., 100000–2000000 руб., 5000–50000 руб., 500–50000 руб., 10000–1000000 руб., 500–50000 руб., 10000–1000000 руб.'),(24,24,'5000–20000 руб./т, 10000–40000 руб./т, миллионы рублей, от 100000 руб.'),(25,25,'50000–500000 руб., 5000–20000 руб./т, 50000–500000 руб., 10000–100000 руб., 100000–700000 руб., 100000–1000000 руб., 50000–300000 руб., от 100000 руб., 50000–500000 руб., 200000–2000000 руб., от 100000 руб., 50000–500000 руб., 50000–1000000 руб.'),(26,26,'15–50 руб./шт, 10–40 руб./шт, 10–60 руб./шт, 5–30 руб./шт, 10–100 руб./шт, 10–100 руб./шт'),(27,27,'1000000–10000000 руб., 500000–5000000 руб., 300000–3000000 руб., 1000000–10000000 руб., 500000–5000000 руб., 500000–5000000 руб., 1000000–10000000 руб., 300000–3000000 руб., 300000–3000000 руб., 500000–5000000 руб., 100–500 руб./шт, 500000–5000000 руб., 300000–3000000 руб., 300000–3000000 руб., 1000000–10000000 руб., 500000–5000000 руб., 300000–10000000 руб.'),(28,28,'300–1500 руб./шт, 1000–15000 руб./комплект, 300–1000 руб./м2, 200–1000 руб./м, 300–1000 руб./м2, 60000–90000 руб./т, 40000–70000 руб./т, 200–1000 руб./м, 30000–60000 руб./т, 5–20 руб./шт, 100–5000 руб., 300–1500 руб./м2, 300–1500 руб./м2, 40000–70000 руб./т, 50–500 руб./шт'),(29,29,'15–50 руб./шт, 5–20 руб./шт, 10–40 руб./шт, 10–60 руб./шт, 5–30 руб./шт, 5–50 руб./шт, 10–100 руб./шт, 50–500 руб./шт, 10–100 руб./шт');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicecategory`
--

DROP TABLE IF EXISTS `servicecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicecategory` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicecategory`
--

LOCK TABLES `servicecategory` WRITE;
/*!40000 ALTER TABLE `servicecategory` DISABLE KEYS */;
INSERT INTO `servicecategory` VALUES (1,'Авиационные крепежные изделия, Крепеж для авиационной промышленности, Металлические детали и соединения'),(3,'Автоматические газогорелочные устройства (АГУ), Котлы отопления, Климатическая техника, Промышленные печи и котлы'),(2,'Игровые площадки, Спортивное оборудование, Спортивные комплексы, Детские площадки, Теневые навесы'),(26,'Изготовление ангаров, Изготовление металлических ферм, Изготовление силосов, Изготовление водонапорных башен'),(6,'Изготовление канатных стропов, Цепные стропы, Текстильные стропы, Стяжные ремни, Крепежные цепи грузоподъемностью до 100 тонн'),(30,'Изготовление крепежных изделий по ГОСТ, ОСТ и нормалям, Изготовление крепежа по чертежам для промышленных предприятий'),(27,'Изготовление специализированного крепежа, Производство металлоизделий по ГОСТ, ОСТ и ТУ'),(12,'Колесотокарные станки, Колесорасточные станки, Вспомогательное оборудование для точной обточки колесных пар'),(19,'Металлообработка, Производство сельскохозяйственных запчастей, Импортозамещение и технологическая независимость России'),(7,'Оборудование для пекарни, Производство и поставка пекарного оборудования'),(4,'Оптовое шитьё одежды, Пошив одежды на заказ, Текстильное производство'),(16,'Поставка и изготовление крепежных изделий, Метизы для Ростовской области и России'),(10,'Продукция для сельского хозяйства и дач, Теплицы и комплектующие, Монтаж и эксплуатация тепличных комплексов'),(24,'Проектирование и производство воркаут оборудования, Производство кроссфит оборудования, Производство фитнес оборудования'),(17,'Производство газовых котлов, Поставка газовых котлов по РФ'),(14,'Производство детских игровых комплексов, МАФ (малые архитектурные формы), Уличная мебель, Спортивное оборудование'),(5,'Производство зефирно-пастильной группы, Производство мармелада, Вафли, Драже, Песочное отсадное печенье, Сахарное печенье'),(29,'Производство и оптовая продажа профнастила, Металлочерепица, Вёдра, Оцинкованный лист'),(23,'Производство кабельно-проводниковой продукции'),(11,'Производство конфет с шоколадной глазурью, Конфеты с орехами и фруктами'),(21,'Производство медицинских изделий, Лечебные одеяла, Стабилографические комплексы, Аудиометры, Рефлексодиагностические комплексы'),(25,'Производство металлоизделий, Производство металлоконструкций'),(8,'Производство метизов (нормалей), Крепежные детали с термообработкой, Гальваническое покрытие крепежа'),(22,'Производство оборудования для детских игровых площадок, Производство спортивного оборудования'),(28,'Производство полимерного оборудования, Капитальный ремонт полимерного оборудования'),(18,'Производство полимерной упаковки, Упаковка из полиэтилена и полипропилена'),(20,'Производство промышленного оборудования'),(9,'Производство стеклопластиковой арматуры'),(13,'Производство уличной мебели, Мебель для парков, скверов, жилых комплексов, кафе и ресторанов'),(15,'Профессиональные аквасистемы для бизнеса, Торговые аквасистемы для магазинов, Промышленные системы для ресторанов, Пресноводные аквариумные комплексы, Морские системы для морепродуктов');
/*!40000 ALTER TABLE `servicecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `fk_services_servicecategory` (`category_name`),
  CONSTRAINT `fk_services_servicecategory` FOREIGN KEY (`category_name`) REFERENCES `servicecategory` (`category_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,32.50,NULL),(2,55000.00,NULL),(3,175000.00,NULL),(4,27500.00,NULL),(5,900.00,NULL),(6,600.00,NULL),(7,125000.00,NULL),(8,35.00,NULL),(9,55000.00,NULL),(10,175000.00,NULL),(11,900.00,NULL),(12,1750000.00,NULL),(13,27500.00,NULL),(14,82500.00,NULL),(15,400000.00,NULL),(16,55.00,NULL),(17,175000.00,NULL),(18,600.00,NULL),(19,275000.00,NULL),(20,2750000.00,NULL),(21,550000.00,NULL),(22,55000.00,NULL),(23,5500.00,NULL),(24,82500.00,NULL),(25,400000.00,NULL),(26,1750000.00,NULL),(27,35.00,NULL),(28,85000.00,NULL),(29,27500.00,NULL),(30,32.50,NULL);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-15 22:46:58
