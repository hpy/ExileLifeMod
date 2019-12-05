CREATE DATABASE  IF NOT EXISTS `exilelife_altis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `exilelife_altis`;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `pid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(32),
  `clan_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64),
  `player_character` varchar(32) NOT NULL DEFAULT '',
  `score` int(11) NOT NULL DEFAULT '0',
  `kills` int(11) unsigned NOT NULL DEFAULT '0',
  `deaths` int(11) unsigned NOT NULL DEFAULT '0',
  `locker` int(11) NOT NULL DEFAULT '0',
  `first_connect_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_connect_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_disconnect_at` datetime DEFAULT NULL,
  `total_connections` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`pid`),
  KEY `clan_id` (`clan_id`),
  KEY `uid` (`uid`),
  KEY `player_db_id` (`pid`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`clan_id`) REFERENCES `clan` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administration`
--

DROP TABLE IF EXISTS `administration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name-reference` text,
  `player_uid` varchar(128),
  `permissionLevel` varchar(128),
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administration`
--

LOCK TABLES `administration` WRITE;
/*!40000 ALTER TABLE `administration` DISABLE KEYS */;
INSERT INTO `administration` VALUES (1,'Andrew','76561198025434405','Developer',0,'2016-08-19 19:29:16',1),(2,'HappyDayZ','76561198048317094','Developer',0,'2016-08-19 19:29:16',1),(3,'SaintZ','76561198126714278','Developer',0,'2016-10-14 13:15:35',0),(4,'Valthos','76561198036511994','Developer',0,'2016-08-19 19:29:16',1),(5,'WolfkillArcadia','76561198037177305','Developer',0,'2016-08-19 19:29:16',1),(6,'Gav','76561198144797689','HeadAdministrator',0,'2016-10-14 14:52:05',0),(7,'Steve','76561197999897976','HeadAdministrator',0,'2016-10-14 13:13:43',0),(8,'Prime','76561198015580449','HeadAdministrator',0,'2016-10-14 13:14:59',0),(9,'Shoritz','76561198067530628','Developer',0,'2016-10-14 14:52:05',0),(10,'Kyle','76561198165738597','Developer',0,'2017-02-03 17:45:39',0);
/*!40000 ALTER TABLE `administration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administration_logging`
--

DROP TABLE IF EXISTS `administration_logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administration_logging` (
  `playerUID` varchar(128),
  `player_name` varchar(64),
  `warning_counter` varchar(5),
  `last_warned_by` text,
  `last_warning_reason` text,
  `kick_counter` varchar(5),
  `last_kicked_by` text,
  `last_kicked_reason` text,
  PRIMARY KEY (`playerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administration_logging`
--

LOCK TABLES `administration_logging` WRITE;
/*!40000 ALTER TABLE `administration_logging` DISABLE KEYS */;
/*!40000 ALTER TABLE `administration_logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackmarket`
--

DROP TABLE IF EXISTS `blackmarket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackmarket` (
  `classname` varchar(128),
  `stock` varchar(20),
  PRIMARY KEY (`classname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackmarket`
--

LOCK TABLES `blackmarket` WRITE;
/*!40000 ALTER TABLE `blackmarket` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackmarket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clan`
--

DROP TABLE IF EXISTS `clan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64),
  `leader_pid` int(11) unsigned,
  `leader_uid` varchar(32),
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `leader_db_id` (`leader_pid`,`leader_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clan`
--

LOCK TABLES `clan` WRITE;
/*!40000 ALTER TABLE `clan` DISABLE KEYS */;
/*!40000 ALTER TABLE `clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clan_map_marker`
--

DROP TABLE IF EXISTS `clan_map_marker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clan_map_marker` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clan_id` int(11) unsigned,
  `markerType` tinyint(4) NOT NULL DEFAULT '-1',
  `positionArr` text,
  `color` varchar(255),
  `icon` varchar(255),
  `iconSize` float unsigned,
  `label` varchar(255),
  `labelSize` float unsigned,
  PRIMARY KEY (`id`),
  KEY `clan_id` (`clan_id`),
  CONSTRAINT `clan_map_marker_ibfk_1` FOREIGN KEY (`clan_id`) REFERENCES `clan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clan_map_marker`
--

LOCK TABLES `clan_map_marker` WRITE;
/*!40000 ALTER TABLE `clan_map_marker` DISABLE KEYS */;
/*!40000 ALTER TABLE `clan_map_marker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construction`
--

DROP TABLE IF EXISTS `construction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `construction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(64),
  `pid` int(11) unsigned,
  `account_uid` varchar(32),
  `spawned_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `position_x` double NOT NULL DEFAULT '0',
  `position_y` double NOT NULL DEFAULT '0',
  `position_z` double NOT NULL DEFAULT '0',
  `direction_x` double NOT NULL DEFAULT '0',
  `direction_y` double NOT NULL DEFAULT '0',
  `direction_z` double NOT NULL DEFAULT '0',
  `up_x` double NOT NULL DEFAULT '0',
  `up_y` double NOT NULL DEFAULT '0',
  `up_z` double NOT NULL DEFAULT '0',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  `damage` tinyint(1) unsigned DEFAULT '0',
  `territory_id` int(11) unsigned DEFAULT NULL,
  `last_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_uid` (`account_uid`),
  KEY `territory_id` (`territory_id`),
  KEY `player_db_id` (`pid`),
  CONSTRAINT `construction_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `account` (`pid`) ON DELETE CASCADE,
  CONSTRAINT `construction_ibfk_2` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construction`
--

LOCK TABLES `construction` WRITE;
/*!40000 ALTER TABLE `construction` DISABLE KEYS */;
/*!40000 ALTER TABLE `construction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `container`
--

DROP TABLE IF EXISTS `container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `container` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(64),
  `spawned_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pid` int(11) unsigned,
  `account_uid` varchar(32) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `position_x` double NOT NULL DEFAULT '0',
  `position_y` double NOT NULL DEFAULT '0',
  `position_z` double NOT NULL DEFAULT '0',
  `direction_x` double NOT NULL DEFAULT '0',
  `direction_y` double NOT NULL DEFAULT '0',
  `direction_z` double NOT NULL DEFAULT '0',
  `up_x` double NOT NULL DEFAULT '0',
  `up_y` double NOT NULL DEFAULT '0',
  `up_z` double NOT NULL DEFAULT '1',
  `cargo_items` text,
  `cargo_magazines` text,
  `cargo_weapons` text,
  `cargo_container` text,
  `last_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  `territory_id` int(11) unsigned DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `money` int(11) unsigned NOT NULL DEFAULT '0',
  `abandoned` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `acount_uid` (`account_uid`),
  KEY `territory_id` (`territory_id`),
  KEY `container_ibfk_1_idx` (`pid`),
  CONSTRAINT `container_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `account` (`pid`) ON DELETE CASCADE,
  CONSTRAINT `container_ibfk_2` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container`
--

LOCK TABLES `container` WRITE;
/*!40000 ALTER TABLE `container` DISABLE KEYS */;
/*!40000 ALTER TABLE `container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gang`
--

DROP TABLE IF EXISTS `gang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gang` (
  `gang` varchar(20),
  `alpha_pid` int(11) unsigned,
  `alpha_uid` varchar(32) NOT NULL DEFAULT '0',
  `tax` int(11) NOT NULL DEFAULT '10',
  `wage` int(11) NOT NULL DEFAULT '10',
  `bank` int(11) NOT NULL DEFAULT '10000',
  `territoryradius` int(11) NOT NULL DEFAULT '800',
  `minrespect` int(11) NOT NULL DEFAULT '500',
  `members` int(11) NOT NULL DEFAULT '0',
  `membership_cost` int(11) NOT NULL DEFAULT '1000',
  `blacklist` text,
  `vault` text,
  PRIMARY KEY (`gang`),
  KEY `alpha_db_id` (`alpha_pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gang`
--

LOCK TABLES `gang` WRITE;
/*!40000 ALTER TABLE `gang` DISABLE KEYS */;
INSERT INTO `gang` VALUES ('Cartel',0,'0',10,10,12000,800,500,0,1000,'[]','[]'),('Guard',0,'0',10,10,1,0,500,0,1000,'[]','[[\"exilelife_item_goldore\",0],[\"Prison\",[[\"exilelife_item_exiumore\",62]]]]'),('Mafia',0,'0',10,10,14000,800,500,1,1000,'[]','[]'),('Rogue',0,'0',10,10,10000,0,500,0,1000,'[]','[]'),('Syndicate',0,'0',10,10,11000,800,500,1,1000,'[]','[]'),('Yakuza',0,'0',10,10,10074,800,500,1,1000,'[]','[]');
/*!40000 ALTER TABLE `gang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(11),
  `player_uid` varchar(45),
  `job_name` varchar(64),
  `job_board` varchar(64),
  `complete_by` datetime,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `pid` int(11) unsigned,
  `name` varchar(64),
  `account_uid` varchar(32),
  `player_character` varchar(32) NOT NULL DEFAULT '',
  `money` int(11) unsigned NOT NULL DEFAULT '0',
  `damage` double unsigned NOT NULL DEFAULT '0',
  `hunger` double unsigned NOT NULL DEFAULT '100',
  `thirst` double unsigned NOT NULL DEFAULT '100',
  `alcohol` double unsigned NOT NULL DEFAULT '0',
  `temperature` double NOT NULL DEFAULT '37',
  `wetness` double unsigned NOT NULL DEFAULT '0',
  `oxygen_remaining` double unsigned NOT NULL DEFAULT '1',
  `bleeding_remaining` double unsigned NOT NULL DEFAULT '0',
  `hitpoints` varchar(255) NOT NULL DEFAULT '[]',
  `direction` double NOT NULL DEFAULT '0',
  `position_x` double NOT NULL DEFAULT '0',
  `position_y` double NOT NULL DEFAULT '0',
  `position_z` double NOT NULL DEFAULT '0',
  `spawned_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `assigned_items` text,
  `backpack` varchar(64),
  `backpack_items` text,
  `backpack_magazines` text,
  `backpack_weapons` text,
  `current_weapon` varchar(64),
  `goggles` varchar(64),
  `handgun_items` text,
  `handgun_weapon` varchar(64),
  `headgear` varchar(64),
  `binocular` varchar(64),
  `loaded_magazines` text,
  `primary_weapon` varchar(64),
  `primary_weapon_items` text,
  `secondary_weapon` varchar(64),
  `secondary_weapon_items` text,
  `uniform` varchar(64),
  `uniform_items` text,
  `uniform_magazines` text,
  `uniform_weapons` text,
  `vest` varchar(64),
  `vest_items` text,
  `vest_magazines` text,
  `vest_weapons` text,
  `last_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pid`),
  KEY `player_uid` (`account_uid`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `account` (`pid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_exilelife`
--

DROP TABLE IF EXISTS `player_exilelife`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_exilelife` (
  `pid` int(11) unsigned,
  `account_uid` varchar(32),
  `clan_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(64),
  `player_character` varchar(32) NOT NULL DEFAULT '',
  `character_first_name` varchar(64) DEFAULT NULL,
  `character_last_name` varchar(64) DEFAULT NULL,
  `character_age` varchar(2) DEFAULT NULL,
  `blood_type` varchar(32) NOT NULL DEFAULT '',
  `gasmask_time` int(11) NOT NULL DEFAULT '0',
  `character_reason_for_exile` text,
  `exile_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `player_class` varchar(32),
  `player_rank` double unsigned NOT NULL DEFAULT '0',
  `player_gang` varchar(32),
  `lockpick_level` int(11) NOT NULL DEFAULT '1',
  `lockpick_exp` int(11) NOT NULL DEFAULT '0',
  `strength_level` int(11) NOT NULL DEFAULT '1',
  `strength_exp` int(11) NOT NULL DEFAULT '0',
  `speed_level` int(11) NOT NULL DEFAULT '1',
  `speed_exp` int(11) NOT NULL DEFAULT '0',
  `heal_level` int(11) NOT NULL DEFAULT '1',
  `heal_exp` int(11) NOT NULL DEFAULT '0',
  `repair_level` int(11) NOT NULL DEFAULT '1',
  `repair_exp` int(11) NOT NULL DEFAULT '0',
  `virt_stash` text,
  `jobs_current` text,
  `jobs_completed` text,
  `jobs_failed` text,
  `jobs_guardlastcompleted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gang_allowance` int(11) NOT NULL DEFAULT '0',
  `prison_allowance` int(11) NOT NULL DEFAULT '0',
  `crimes_committed` text,
  `message_threads` text,
  KEY `player_uid` (`account_uid`),
  KEY `player_db_id` (`pid`),
  PRIMARY KEY (`pid`),
  CONSTRAINT `player_exilelife_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `account` (`pid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_exilelife`
--

LOCK TABLES `player_exilelife` WRITE;
/*!40000 ALTER TABLE `player_exilelife` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_exilelife` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_history`
--

DROP TABLE IF EXISTS `player_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_uid` varchar(32),
  `name` varchar(64),
  `died_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `position_x` double,
  `position_y` double,
  `position_z` double,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_history`
--

LOCK TABLES `player_history` WRITE;
/*!40000 ALTER TABLE `player_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_perks`
--

DROP TABLE IF EXISTS `player_perks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_perks` (
  `account_uid` varchar(32),
  `name` varchar(64),
  `hasGuardAccess` tinyint(1) DEFAULT '0',
  `hasTwoClasses` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extra_outfit` text,
  `extra_vehskin` text,
  PRIMARY KEY (`account_uid`),
  KEY `account_uid` (`account_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_perks`
--

LOCK TABLES `player_perks` WRITE;
/*!40000 ALTER TABLE `player_perks` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_perks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `territory`
--

DROP TABLE IF EXISTS `territory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `territory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned,
  `owner_uid` varchar(32),
  `name` varchar(64),
  `territoryzone` varchar(64),
  `position_x` double,
  `position_y` double,
  `position_z` double,
  `direction_x` double NOT NULL DEFAULT '0',
  `direction_y` double NOT NULL DEFAULT '0',
  `direction_z` double NOT NULL DEFAULT '0',
  `up_x` double NOT NULL DEFAULT '0',
  `up_y` double NOT NULL DEFAULT '0',
  `up_z` double NOT NULL DEFAULT '0',
  `radius` double,
  `level` int(11),
  `flag_texture` varchar(255),
  `flag_stolen` tinyint(1) NOT NULL DEFAULT '0',
  `flag_stolen_by_uid` varchar(32) DEFAULT NULL,
  `flag_stolen_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_paid_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `xm8_protectionmoney_notified` tinyint(1) NOT NULL DEFAULT '0',
  `build_rights` varchar(640) NOT NULL DEFAULT '0',
  `moderators` varchar(320) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `doorlocks` varchar(640) NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`),
  KEY `owner_uid` (`owner_uid`),
  KEY `flag_stolen_by_uid` (`flag_stolen_by_uid`),
  KEY `player_db_id` (`pid`),
  CONSTRAINT `territory_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `account` (`pid`) ON DELETE CASCADE,
  CONSTRAINT `territory_ibfk_2` FOREIGN KEY (`flag_stolen_by_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `territory`
--

LOCK TABLES `territory` WRITE;
/*!40000 ALTER TABLE `territory` DISABLE KEYS */;
/*!40000 ALTER TABLE `territory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(64),
  `spawned_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pid` int(11) unsigned,
  `account_uid` varchar(32) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `fuel` double unsigned NOT NULL DEFAULT '0',
  `damage` double unsigned NOT NULL DEFAULT '0',
  `hitpoints` text,
  `position_x` double NOT NULL DEFAULT '0',
  `position_y` double NOT NULL DEFAULT '0',
  `position_z` double NOT NULL DEFAULT '0',
  `direction_x` double NOT NULL DEFAULT '0',
  `direction_y` double NOT NULL DEFAULT '0',
  `direction_z` double NOT NULL DEFAULT '0',
  `up_x` double NOT NULL DEFAULT '0',
  `up_y` double NOT NULL DEFAULT '0',
  `up_z` double NOT NULL DEFAULT '1',
  `cargo_items` text,
  `cargo_magazines` text,
  `cargo_weapons` text,
  `cargo_container` text,
  `last_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  `deleted_at` datetime DEFAULT NULL,
  `money` int(11) unsigned NOT NULL DEFAULT '0',
  `vehicle_texture` text,
  `territory_id` int(11) unsigned DEFAULT NULL,
  `nickname` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `account_uid` (`account_uid`),
  KEY `vehicle_ibfk_2_idx` (`territory_id`),
  KEY `player_db_id` (`pid`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `account` (`pid`) ON DELETE CASCADE,
  CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_garage`
--

DROP TABLE IF EXISTS `virtual_garage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_garage` (
  `vehicle_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `classname` varchar(64),
  `stored_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `account_uid` varchar(32) DEFAULT NULL,
  `pid` int(11) unsigned,
  `fuel` double unsigned NOT NULL DEFAULT '0',
  `damage` double unsigned NOT NULL DEFAULT '0',
  `hitpoints` text,
  `last_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  PRIMARY KEY (`vehicle_id`),
  KEY `account_id` (`pid`),
  CONSTRAINT `virtual_garage_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `account` (`pid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_garage`
--

LOCK TABLES `virtual_garage` WRITE;
/*!40000 ALTER TABLE `virtual_garage` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_garage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-23 18:51:59



DROP TABLE IF EXISTS `messaging`;
CREATE TABLE `messaging` (
  `id` varchar(8),
  `name` varchar(64),
  `recipients` text,
  `messages` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime,
  `previous_recipients` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `rewards`;
CREATE TABLE `rewards` (
  `uid` varchar(32) NOT NULL,
  `rewards_player` varchar(1024) NOT NULL DEFAULT '[]',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Records are all linked, so must be created in particular order.

DROP TABLE IF EXISTS `fines`;
DROP TABLE IF EXISTS `infractions_history`;
DROP TABLE IF EXISTS `infractions`;
DROP TABLE IF EXISTS `records`;

CREATE TABLE `records` (
  `pid` int(11) unsigned NOT NULL,
  `last_scanned` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_scanned_by` varchar(64) NOT NULL DEFAULT 'SYSTEM',
  `wanted` tinyint(1) NOT NULL DEFAULT '0',
  `armed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  CONSTRAINT `records_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `account` (`pid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `infractions` (
  `id`  int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL,
  `crime` text,
  `fine` int(11) unsigned,
  PRIMARY KEY (`id`),
  CONSTRAINT `infractions_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `records` (`pid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `fines` (
  `id`  int(11) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL,
  `infraction_id` int(11) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `amount_due` int(11) unsigned,
  `date_issued` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_due` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_paid` datetime,
  `failure_penalty` text,
  CONSTRAINT `fines_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `records` (`pid`) ON DELETE CASCADE,
  CONSTRAINT `fines_ibfk_2` FOREIGN KEY (`infraction_id`) REFERENCES `infractions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `infractions_history` (
  `id`  int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid`  int(11) unsigned NOT NULL,
  `crime` text,
  `infraction_id` int(11) unsigned NOT NULL,
  `fine_id` int(11) unsigned NOT NULL,
  `scanned_by` varchar(64) NOT NULL DEFAULT 'SYSTEM',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `wanted` tinyint(1) NOT NULL DEFAULT '0',
  `armed` tinyint(1) NOT NULL DEFAULT '0',
  `items` varchar(255) NOT NULL DEFAULT '[]',
  `notes` varchar(1000),
  PRIMARY KEY (`id`),
  CONSTRAINT `infractions_history_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `records` (`pid`) ON DELETE CASCADE,
  CONSTRAINT `infractions_history_ibfk_2` FOREIGN KEY (`infraction_id`) REFERENCES `infractions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




--
-- Schedule database EVENTS
--

SET GLOBAL event_scheduler = ON;


--
-- Update Fines Every 5 minutes
--
DROP EVENT IF EXISTS `finesDue`;
CREATE EVENT `finesDue`
ON SCHEDULE EVERY 5 MINUTE
STARTS CURRENT_TIMESTAMP
DO
  UPDATE `fines` SET `status` = 3 WHERE `date_due` <= CURRENT_TIMESTAMP AND `status` = 2;








