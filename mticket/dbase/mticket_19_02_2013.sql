/*
Navicat MySQL Data Transfer

Source Server         : mticket
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : mticket

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2013-02-19 16:01:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `batches`
-- ----------------------------
DROP TABLE IF EXISTS `batches`;
CREATE TABLE `batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_name` varchar(255) DEFAULT NULL,
  `batch_event_id` int(11) DEFAULT NULL,
  `batch_allow_redeem` enum('1','0') DEFAULT '0',
  `batch_allow_download` enum('0','1') DEFAULT '0',
  `batch_create_date` timestamp NULL DEFAULT NULL,
  `ticket_cost` float DEFAULT NULL,
  `rrn` int(11) DEFAULT NULL,
  `batch_ticket_number` int(11) DEFAULT NULL,
  `batch_last_update_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `site_id` int(11) DEFAULT NULL,
  `batch_verification_start` timestamp NULL DEFAULT NULL,
  `batch_verification_end` timestamp NULL DEFAULT NULL,
  `batch_status_tickets` enum('1','0','2','-1') DEFAULT '-1' COMMENT '0--inprogress,1--done,-1--disabled,2--enabled',
  `batch_status_email` enum('-1','1','2','0') DEFAULT '-1' COMMENT '0--inprogress,1--done,-1--disabled,2--enabled',
  `batch_category` int(11) DEFAULT NULL,
  `medium_del` enum('both','text','email') DEFAULT 'email',
  `allow_verify` enum('1','0') DEFAULT NULL COMMENT 'this dictates whether or not a ticket batch should be verified',
  PRIMARY KEY (`id`),
  KEY `batch_event` (`batch_event_id`),
  KEY `batch_category_fk` (`batch_category`),
  CONSTRAINT `batch_category_fk` FOREIGN KEY (`batch_category`) REFERENCES `categories` (`id`),
  CONSTRAINT `batch_event` FOREIGN KEY (`batch_event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of batches
-- ----------------------------
INSERT INTO `batches` VALUES ('25', 'invisible bonddd', '20', '1', '0', '2013-01-01 15:05:56', null, null, '10', '2013-02-17 16:42:45', '1', '2013-02-18 16:13:29', '2013-02-27 16:13:33', '1', '-1', '2', '', null);
INSERT INTO `batches` VALUES ('26', 'Will Finish', '19', '1', '0', '2012-12-10 15:06:02', null, null, '50', '2013-02-17 16:13:46', '1', '2013-02-12 16:13:38', '2013-02-28 16:13:43', '1', '-1', '2', '', null);

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(255) DEFAULT NULL,
  `lock` enum('1','0') DEFAULT NULL,
  `long_name` varchar(255) DEFAULT NULL,
  `site_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'VIP', null, 'VERY IMPORTANT PERSON', '1');
INSERT INTO `categories` VALUES ('2', 'HUSTLER', null, 'SCHOOL OF HK', '1');

-- ----------------------------
-- Table structure for `events`
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(255) DEFAULT NULL,
  `event_start` timestamp NULL DEFAULT NULL,
  `event_end` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `event_location` varchar(255) DEFAULT NULL,
  `retrieval_reference_number` int(11) DEFAULT NULL,
  `ticket_cost` double DEFAULT NULL,
  `event_ticket_redeem_end` timestamp NULL DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `event_ticket_redeem_start` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES ('10', 'Buster', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Free', null, null, null, null, null);
INSERT INTO `events` VALUES ('11', 'Ghost Buster Movie', '0000-00-00 00:00:00', '2013-02-13 03:17:48', 'Accra Mall', null, '12', null, null, null);
INSERT INTO `events` VALUES ('12', 'mp movie', '2013-02-06 00:41:49', '2013-02-21 00:42:00', 'moving pick', null, null, null, null, null);
INSERT INTO `events` VALUES ('13', 'FrBooty Call', '2013-02-07 00:42:08', '2013-02-13 03:17:51', 'Comm 4', null, '32', null, null, null);
INSERT INTO `events` VALUES ('16', 'load', null, '0000-00-00 00:00:00', 'test', null, null, null, null, null);
INSERT INTO `events` VALUES ('17', 'further ', null, '2013-02-13 03:17:45', 'testing', null, '45', null, null, null);
INSERT INTO `events` VALUES ('18', 'newEventTester', '0000-00-00 00:00:00', '2013-02-13 03:17:43', 'asd', null, '45', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00');
INSERT INTO `events` VALUES ('19', 'Final', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'asdf', null, null, '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00');
INSERT INTO `events` VALUES ('20', 'Fresh', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'asdf', null, '20000', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `institutions`
-- ----------------------------
DROP TABLE IF EXISTS `institutions`;
CREATE TABLE `institutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inst_short_name` varchar(255) DEFAULT NULL,
  `inst_long_name` varchar(255) DEFAULT NULL,
  `inst_lock` enum('1','0') DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of institutions
-- ----------------------------
INSERT INTO `institutions` VALUES ('1', 'Local-First', 'Localhost -First Guinea Pig', '1', 'fasdf@hay.com', '98707', '0245707630', 'fracni', 'fuck this shit', 'jjj');
INSERT INTO `institutions` VALUES ('2', 'SilverBird', 'Silverbird Worldwide Inc', '0', null, null, null, null, null, null);
INSERT INTO `institutions` VALUES ('3', 'EP', 'Eprcoess', '0', 'naywer@as.com', '9898', '990967', 'asdf', 'asdfsadf', null);
INSERT INTO `institutions` VALUES ('4', 'Defalut', 'adsf', '0', 'nay@a.com', 'asdf', '908098', 'asdf', 'adfasfasfd', 'adsfdsa');
INSERT INTO `institutions` VALUES ('5', 'Defalut2', 'adsf', '0', 'nay@a.com', 'asdf', '908098', 'asdf', 'adfasfasfd', 'adsfdsa');
INSERT INTO `institutions` VALUES ('6', 'TESTS', 'TESTOLD', '0', '1380', 'TEST', '32332', 'TESTE', 'ASDFSDD', 'ASDFDS');
INSERT INTO `institutions` VALUES ('7', 'TESTS7777', 'TESTNEW', '0', '1380', 'TEST', '32332', 'TESTE', 'ASDFSDD', 'ASDFDS');

-- ----------------------------
-- Table structure for `links`
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_controller` varchar(255) NOT NULL,
  `link_action` varchar(255) NOT NULL,
  `link_allow` enum('true','false') NOT NULL,
  `link_category` varchar(255) NOT NULL,
  `link_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of links
-- ----------------------------
INSERT INTO `links` VALUES ('9', 'Reception', 'view_events', 'true', 'Events', 'View Events');
INSERT INTO `links` VALUES ('10', 'Reception', 'verify_tickets', 'true', 'Tracking', 'VerifyTickets');
INSERT INTO `links` VALUES ('11', 'User', 'view_users', 'true', 'Staff', 'View Staff');
INSERT INTO `links` VALUES ('12', 'Reception', 'view_batches', 'true', 'Events', 'View Batches');
INSERT INTO `links` VALUES ('15', 'Reception', 'view_eventsales', 'true', 'Tracking', 'View Event Ticket Sales');
INSERT INTO `links` VALUES ('16', 'Reception', 'upload_tickets', 'false', 'Events', 'Upload ');
INSERT INTO `links` VALUES ('17', 'Admin', 'view_roles', 'true', 'Admin', 'View Roles');
INSERT INTO `links` VALUES ('18', 'Reception', 'view_regions', 'false', 'Events', 'Create Tickets');
INSERT INTO `links` VALUES ('19', 'Recption', 'view_regions', 'false', 'Events', 'Download Tickets');
INSERT INTO `links` VALUES ('20', 'Site', 'view_sites', 'true', 'Staff', 'View Sites');
INSERT INTO `links` VALUES ('22', 'Admin', 'view_inst', 'true', 'Admin', 'View Institutions');

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` enum('ticket_return','ticket_delete','ticket_redeem','ticket_create','ticket_batch_create') DEFAULT NULL,
  `log_text_reason` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `user_action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for `members`
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `cell_number` varchar(255) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `site_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memer-fk` (`cat_id`),
  KEY `mbmer-site-fk` (`site_id`),
  CONSTRAINT `mbmer-site-fk` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`),
  CONSTRAINT `memer-fk` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES ('1', 'nayibor@gmail.com45707630', 'Nuku', 'Ameyibor', '0245707630', '1', '1');
INSERT INTO `members` VALUES ('2', 'Asare Bediako', 'Asare', 'Bediako', '0572143444', '1', '1');

-- ----------------------------
-- Table structure for `member_ticket`
-- ----------------------------
DROP TABLE IF EXISTS `member_ticket`;
CREATE TABLE `member_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_member` varchar(255) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `event_id` varchar(255) DEFAULT NULL,
  `del_medium` enum('both','email','text') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='logs for tickets sent to customer are kept here ';

-- ----------------------------
-- Records of member_ticket
-- ----------------------------

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_short_name` varchar(255) DEFAULT NULL,
  `role_long_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'TRA', 'Tracking');
INSERT INTO `roles` VALUES ('2', 'EVE', 'Event Viewer');
INSERT INTO `roles` VALUES ('3', 'ADM', 'Administrator');
INSERT INTO `roles` VALUES ('4', 'SADM', 'Super Admin');
INSERT INTO `roles` VALUES ('5', 'VIS', 'Visitor');
INSERT INTO `roles` VALUES ('6', 'SMF', 'Stupid Mother Fucker');
INSERT INTO `roles` VALUES ('7', 'WSS', 'Wee Smoker');
INSERT INTO `roles` VALUES ('8', 'TST', 'toaster');

-- ----------------------------
-- Table structure for `role_links`
-- ----------------------------
DROP TABLE IF EXISTS `role_links`;
CREATE TABLE `role_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles-fk` (`role_id`),
  KEY `links-fk` (`link_id`),
  CONSTRAINT `links-fk` FOREIGN KEY (`link_id`) REFERENCES `links` (`id`),
  CONSTRAINT `roles-fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role_links
-- ----------------------------
INSERT INTO `role_links` VALUES ('1', '12', '2');
INSERT INTO `role_links` VALUES ('2', '9', '2');
INSERT INTO `role_links` VALUES ('3', '10', '1');
INSERT INTO `role_links` VALUES ('5', '15', '1');
INSERT INTO `role_links` VALUES ('6', '11', '3');
INSERT INTO `role_links` VALUES ('8', '20', '3');
INSERT INTO `role_links` VALUES ('9', '17', '4');
INSERT INTO `role_links` VALUES ('10', '22', '4');

-- ----------------------------
-- Table structure for `sites`
-- ----------------------------
DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) DEFAULT NULL,
  `site_key` varchar(255) DEFAULT NULL,
  `site_inst_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `site_lock` enum('0','1') DEFAULT NULL,
  `site_desc` text,
  PRIMARY KEY (`id`),
  KEY `inst-fk` (`site_inst_id`),
  CONSTRAINT `inst-fk` FOREIGN KEY (`site_inst_id`) REFERENCES `institutions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sites
-- ----------------------------
INSERT INTO `sites` VALUES ('1', 'Testtt', 'ASDFASFASFSDFSFSF2345345QWASASDF', '1', null, 'Temat', '02457073434', '1234123', 'nayibor@gmail.com', '0', '0');
INSERT INTO `sites` VALUES ('2', 'SilverBird', 'ASDFDSAFSA', '2', null, null, null, null, null, '0', '0');
INSERT INTO `sites` VALUES ('3', 'SilverBird Nigeria', 'ADSFSAUP787564', '2', null, null, null, null, null, '0', '0');
INSERT INTO `sites` VALUES ('4', 'STRIP CLUB', 'ADSFASDFKLJPIU34123415647', '1', null, 'Accra', '900908098', '090009', 'dollar@yahoo.com', '0', '0');
INSERT INTO `sites` VALUES ('5', 'Dredd ', null, '1', null, 'Dreed City', '877880', '0878097870', 'dede@as.com', '1', null);
INSERT INTO `sites` VALUES ('6', ' Default Site', null, '4', null, null, null, null, null, null, null);
INSERT INTO `sites` VALUES ('7', 'Defalut2 Default Site', null, '5', 'adsfdsa', 'asdf', 'asdf', '908098', 'nay@a.com', null, null);
INSERT INTO `sites` VALUES ('8', 'TESTS7777 Default Site', null, '7', 'ASDFDS', 'TESTE', 'TEST', '32332', '1380', null, null);
INSERT INTO `sites` VALUES ('9', 'Local-First Default Site', null, '1', 'jjj', 'fracni', '98707', '0245707630', 'fasdf@hay.com', null, null);

-- ----------------------------
-- Table structure for `tickets`
-- ----------------------------
DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_value` varchar(255) DEFAULT NULL,
  `ticket_encrypted_value` varchar(255) DEFAULT NULL,
  `ticket_verified_status` enum('0','1') DEFAULT '0',
  `ticket_redeem_status` enum('0','1') DEFAULT '0',
  `ticket_event_id` int(11) DEFAULT NULL,
  `ticket_batch_id` int(11) DEFAULT NULL,
  `ritrieval_reference_number` int(11) DEFAULT NULL,
  `ticket_down_status` enum('1','0') DEFAULT NULL,
  `ticket_img` mediumblob COMMENT 'this is for the actual barcode ticket',
  `site_id` int(11) DEFAULT NULL,
  `ticket_md5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_fk` (`ticket_event_id`),
  KEY `batch_fk` (`ticket_batch_id`),
  CONSTRAINT `batch-fk` FOREIGN KEY (`ticket_batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event-fk` FOREIGN KEY (`ticket_event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tickets
-- ----------------------------
INSERT INTO `tickets` VALUES ('390', 'koip5GGR,6^sc~,Wyu?GN,~Z%qBB!9,7f9#cdzK4s3vyaYvy,0YQX4*c!a97ywnYM%P9AsYZmEnkn4eW&@*qty8s?yqx?gNHb86we7XWx~K#huSva1gnw1!hwqj5teOvZv', null, '0', '0', '19', '26', null, null, 0x89504E470D0A1A0A0000000D49484452000000B4000000B401030000000703947100000006504C5445FFFFFF00000055C2D37E000001B7494441545885D5974152C4500844B901F7BF253740FA7532EABE379352C7BC58857CBA81547DFBB5BB53BDD3ABBB6E831CBFEFD9FB9ABBB6EF6660397EA456A85B010790E5BBD597D83D227A9CF73D5965C4CF30F7B9F57DDEA9AD4190ABCCFFAE3F7A4870D4443277EBB09F2BC12F8A842BE92AB1ABCE6937C8FB225958777CCAA9294B8CEBA01AE75D7D64BB216C8E2F8A3DF4C849DA4A722297A455B8635FDD66F84AB5F788DFE411DB3BC61B9FDDC95190ED5758298E58E5E98B580A3B9F038C703A85E236C9358FA3FC1A2A514F5F8DC9ED97103F82B2E48E536FC5B9B3187BFA638B1847A876871A87F2A32E29EE59A603D36453501D638E9F54393932627A3ECA4D712AAEF0FE0FE4EF0972352235257A46E1C14EF24B066F6B77E173DCF752BCEC05F525CF9E3FC24A709565701E99D19B26C8196AE3D936FCCD6FE34B704DE579E73E89396E8E17F5A0E92DD469A5B80ECD4B8B573AED4649DE3EB0628591479EB91CE265203768FDAD4FDD43DC73DE6BAFB78BA7EF85B8D75C55C3AD89D99CE456ADDF0BE822F3EA2DC6B53036AD8F0D7EE27C1998ABA597579024B7F530087DFBD9AB539CBA6B30F0EEC7F955927FF7F503E49574B2F5EAFD800000000049454E44AE426082, '1', '4aab3624cb42854df4aaf649af30dde8');
INSERT INTO `tickets` VALUES ('391', '$74AQGGcebmlGptpEQzCrte,c9*u0WbF*MhOGPN*A5#2.v4^@mds#Ccxyr,xqtF7xF?pp7W.!O8~u8audri~qv*CiBXBdKL^&?NLRQ*j?QRDQC&H@t^kSdcpGw^YHaAY8r', null, '0', '0', '19', '26', null, null, 0x89504E470D0A1A0A0000000D49484452000000B4000000B401030000000703947100000006504C5445FFFFFF00000055C2D37E000001B6494441545885D596D191E4400843C940F96749063A24F5DCCD7DAF7EB6CB33B65FBB8A6A40C0CC6F5F24171C2E07B37BF703457EBF85DE57FB7BCBACC7F58C25EEE5FE6050E63832101ADB6FF3F3D81D4E1BE7B936D7055D320A7EFBB3C115E6FFD6573E34F8D8F619BCE0839C0F6B7127EAC48197BA9702D96AF13377C1B8A09C51F813A76E8F4B6C772E3DD256C12697D17D31A72588A9F2D1ABA567BFFD755C8B4BD2F699E4710A4C2ED738C705E94437DABCF0C46F2DBEC388591976E8238A1677D98372C93BABB36D912BEEAAA82AAD17179F6C9A5C8296E91194EDD96DF25733A8882FAC8D261752D9B6DF6CF5E9B1C6E9D45566A56EE8B32257DE8E9BCE294EA5297955E31A2A18E1C1E385A557E38CCF360A91F85E35297138EE70EF478E872A77E3C9E0228497B72DBEEEF9EB9A1A19BE79A0C43F8D5F7B191C5F696A71552526F63E15882677D17345CA6CA4C729F20C730A8EFB8334385BE409C92436FBDC58E4D1862722570EF7A1224FD8DD8FDDF135384E91EFA431D3F30A335A37B9B356F55AFE727CEA5C1EF3E4E5FB26DF8A9CAFE7BB73EE3FBB15AE2D377B153F8D15CB264FDCDFC4AE2A85EFBCFA39FFDDEB0F04D97ACA4D8AF85A0000000049454E44AE426082, '1', '81dbc6864db2b921c7f9bab70b43e124');
INSERT INTO `tickets` VALUES ('392', 'dTeG,^ZDFW76$%d?m%cFa55#KyzO,D6gxH!he#dCA~2dqdESk4sl^%xrp6ww^gO@Qh$!YW$dqpB8oe@mO7Llr!miE7aAZ~kvaFDyn!.Z*xNpu%ji6keLQe~PFw%ckX0sgg', null, '0', '0', '19', '26', null, null, 0x89504E470D0A1A0A0000000D49484452000000B4000000B401030000000703947100000006504C5445FFFFFF00000055C2D37E000001AB494441545885D597416E84500C437303DFFF96B9811BDB504DD7F56690688707D227B1931F66BEFD20B99C05B0BB3A058AFCCEA5AEEEEE5DD0A0C9E9B540CC2D7D4B0A94390FCCDDA0A3EBF34BDB3AAECB629DEBD638B4495C1FF92C70C9FCE7F8F04383C7A4D0BAB837E05FF3FE9F9F207213C796BAC080BC4F89CB50CAD9650BD6865BE5EB6836A5EC10A1876A5CC8DA9C659D37B0CAA5C6FD767180EE20F66D8B73F0244DA734E234F92DAA86A7E5D70F6C9B8FEB4D718D9BC7A0C9ED59A6DA56D13DBAB4B80A4E11293A7590892C3DAE3200F384CB0455AE76E7CC312ED645938FB6037976F54BFFA27B8B13BF5DC2DE3A1BE70D5A3CC7C7A6F0D45D8BBBA055CC70F71EC4B72D9E9CADCB2EE591BED7E2DE702E125A113E55DDE3188B116BE99EB5EF713B69DD8E60170FA6C9B599D1D1E92FF8B4ED1A77A6243C5216EF5CD4E216241DDBD3A3F7B826F73CBA71EC5A224E91F3EDAC78A66BB2CA9F7BF048249566678B5C79B2289A8EF2F5C126F7DC2BEBC2ABEEBB6E8D275D6A18A365DFB435B9FB927587A7F8361F6F96F4681D6D8A7C321079C3CCE74795FBBBD5537BF6FC7D77E812FFEEE307CC224FAA9F8027150000000049454E44AE426082, '1', '43bee6edf262dfb274b5feab25682a48');
INSERT INTO `tickets` VALUES ('403', '$tD98.zy~Nmc!qtkPeBX07MzjrP8Lnq8', null, '0', '1', '20', '25', null, null, 0x89504E470D0A1A0A0000000D49484452000000740000007401030000006E54846400000006504C5445FFFFFF00000055C2D37E000000BB49444154388DC594C111C3400803E940FD7749078AA44B627FC10F6BE66ED87B300883ABDE16C92E54758239EBB4C4041B66B7D231C19275D80F1872B4663F15D1377F13761BA35B7F276C25D94D13A67B816A482BCED7703BBF7E86AC59229DCE3D59B06E9873AF588D2C20BE565C590755C45A703B543D7A47AFD8AD50B6B35273867D5C7EA67C664245D51F47CC24E2EF9730E6AC9106BA6BC91E45789BAEFD9EB2A71107579C6D00AEFC13F61392B5361C1FF0383537FCAE3EC1271BA6816B54400000000049454E44AE426082, '1', '5b6a0e581b421c379702ffbf399a55e8');
INSERT INTO `tickets` VALUES ('404', 'wpR*R$o7.,5k?Xf^F.Fmh.LHyTW1N!hw', null, '0', '1', '20', '25', null, null, 0x89504E470D0A1A0A0000000D49484452000000740000007401030000006E54846400000006504C5445FFFFFF00000055C2D37E000000C249444154388DC594C10D04310803E9C0FD7749079CEDEC4AAB7B1DBEC7222561F240C238A97A3B66A6813949C05C3D0427094FB7CAB59290B9A6FE601EE894DD0FBEFAFB9D25A3E3A1EF861560A53BDF32AB48D11E0009A398CDA00BE880CF2C7859979F96CC1C72531F4BED1973CDE3CC73CB144225CB7709530D78BFFADB32FBB0983C2A6119B9ACE699C792ED093B6A5001DBCF12B51FFE5EB09E111FA3EA55C4FE0F54F6F93FEC988EBEDD18714B556B12B047D26A2A62F731ED4799F0BBF101467910A2FF0386C60000000049454E44AE426082, '1', '16ce777c9f30d16a4f5b7c4be465ddde');
INSERT INTO `tickets` VALUES ('405', '2vmhC5G!9pn!TMHzz6pGGGxWLl7WN%Ht', null, '0', '1', '20', '25', null, null, 0x89504E470D0A1A0A0000000D49484452000000740000007401030000006E54846400000006504C5445FFFFFF00000055C2D37E000000C249444154388DC594C10DC4400803DD01FD7749073EEC487BC9EFF03DB25124661F2B3006E0ED43B2C1AE76B0E7F9BB083A4898DD5DF3A28290ABD17F722165D553AC477D0B968C3E377D37EC1ECEF7E8E982A98780922609D784BA69B922E076283999B1E41C5526A14A9876032627445CB6B26AAA4ED8754C51930F13562394CDC967C932E344655B050C6B3AC55C23BDE6CBCF6A6AC61AA3D6DDBC8984E951823D19B27A71FC15B0372ABEFB65C5BEA226E2D4B7E14B4F39A26FFBE5777EF77C00172D20924C7A35C40000000049454E44AE426082, '1', '5d3dc9adb6a4d1d86a071617528b8ab0');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `lock_status` int(11) DEFAULT '0',
  `dob` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `site-fk` (`site_id`),
  CONSTRAINT `site-fk` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '6848d756da66e55b42f79c0728e351ad', 'Yao', 'Ameyiborrrr', '1', 'nayibor@gmail.com', '0', '2013-02-15 03:56:52');
INSERT INTO `users` VALUES ('6', 'OwBPrgn2S', 'asfd', 'adsf', '1', 'adsf@asdf.com', '1', '2013-02-14 00:10:15');
INSERT INTO `users` VALUES ('7', 'skhFkF#nK', 'asfd', 'adsf', '1', 'adsf@asdf.com', '1', '2013-02-14 00:10:17');
INSERT INTO `users` VALUES ('8', 'F9*EfmhCn', 'asfd', 'adsf', '1', 'adsf@asdf.com', '1', '2013-02-14 00:10:18');
INSERT INTO `users` VALUES ('9', 'YDmgR*kSZ', 'asfd', 'adsf', '1', 'checkuself@asdf.com', '1', '2013-02-14 00:10:19');
INSERT INTO `users` VALUES ('10', 'QHvZO0q6t', 'asfd', 'adsf', '1', 'checkuself@nima.com', '1', '2013-02-08 03:24:23');
INSERT INTO `users` VALUES ('11', '04f06c2e8fbdcaad790c83a82eb7e13a', 'Francis', 'Gyamfi', '1', 'checkuself@nima.com', '0', '2013-02-13 22:17:04');
INSERT INTO `users` VALUES ('56', '3e9dbb992a8955532c9fa626057f80a3', 'User', 'First', '3', 'asdf', '1', '2013-02-14 00:10:20');
INSERT INTO `users` VALUES ('57', '5a0a32313ed7051d388c563b50a219b3', 'last ', 'don', '3', 'asdf@don.com', '1', '2013-02-14 00:10:21');
INSERT INTO `users` VALUES ('58', 'd4fe7b89642837964712bcdaaf45e3fd', 'pAUL', 'ASDF', '3', 'ASDF@ADSF.COM', '1', '2013-02-14 00:10:22');
INSERT INTO `users` VALUES ('59', '34be73e749dfde85c9cd62022f2bed23', 'Wicked', 'Rastta', '3', 'rasta@yahoo.com', '1', '2013-02-14 00:10:25');
INSERT INTO `users` VALUES ('60', '177a07541c40f15074c2a42d6f18989c', 'Lion Faatatokp', 'vrliontt', '4', 'vlionr@qwe.com', '0', '2013-02-11 02:16:11');
INSERT INTO `users` VALUES ('61', 'b6adcbf620013ddc514957f49c8af5f1', 'Gg', 'Korley', '1', 'gkorley@ecobank.com', '0', '2013-02-11 02:33:40');
INSERT INTO `users` VALUES ('62', '6848d756da66e55b42f79c0728e351ad', 'dick', 'tracy', '4', 'dickt@tracy.com', '0', '2013-02-11 10:50:19');
INSERT INTO `users` VALUES ('65', '6848d756da66e55b42f79c0728e351ad', 'Don', 'Upper', '4', 'ruckuper@qq.com', '5', '2013-02-13 22:16:23');

-- ----------------------------
-- Table structure for `user_roles`
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role-fk` (`role_id`),
  CONSTRAINT `role-fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('35', '1', '58');
INSERT INTO `user_roles` VALUES ('36', '3', '58');
INSERT INTO `user_roles` VALUES ('37', '5', '58');
INSERT INTO `user_roles` VALUES ('38', '1', '59');
INSERT INTO `user_roles` VALUES ('39', '2', '59');
INSERT INTO `user_roles` VALUES ('40', '4', '59');
INSERT INTO `user_roles` VALUES ('104', '1', '1');
INSERT INTO `user_roles` VALUES ('105', '2', '1');
INSERT INTO `user_roles` VALUES ('106', '4', '1');
INSERT INTO `user_roles` VALUES ('107', '5', '1');
INSERT INTO `user_roles` VALUES ('108', '6', '1');
INSERT INTO `user_roles` VALUES ('109', '1', '60');
INSERT INTO `user_roles` VALUES ('110', '4', '60');
INSERT INTO `user_roles` VALUES ('111', '5', '60');
INSERT INTO `user_roles` VALUES ('112', '2', '61');
INSERT INTO `user_roles` VALUES ('113', '3', '61');
INSERT INTO `user_roles` VALUES ('114', '4', '61');
INSERT INTO `user_roles` VALUES ('115', '6', '61');
INSERT INTO `user_roles` VALUES ('116', '6', '62');
INSERT INTO `user_roles` VALUES ('117', '3', '1');
