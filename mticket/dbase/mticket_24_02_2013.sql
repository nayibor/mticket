/*
Navicat MySQL Data Transfer

Source Server         : mticket
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : mticket

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2013-02-24 22:28:07
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
  `ticketype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `batch_event` (`batch_event_id`),
  KEY `batch_category_fk` (`batch_category`),
  KEY `ticket_type` (`ticketype`),
  CONSTRAINT `batch_category_fk` FOREIGN KEY (`batch_category`) REFERENCES `categories` (`id`),
  CONSTRAINT `batch_event` FOREIGN KEY (`batch_event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `ticket_type` FOREIGN KEY (`ticketype`) REFERENCES `ticket_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of batches
-- ----------------------------
INSERT INTO `batches` VALUES ('28', 'Fresh Tester', '18', '1', null, null, null, '5', '2013-02-24 21:36:28', '1', null, null, '1', '2', '1', 'both', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'VIP', null, 'VERY IMPORTANT PERSON', '1');
INSERT INTO `categories` VALUES ('2', 'HUSTLER', null, 'SCHOOL OF HK', '1');
INSERT INTO `categories` VALUES ('3', 'WKIN', null, 'WALK IN', '1');

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
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES ('10', 'Buster', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Free', null, null);
INSERT INTO `events` VALUES ('11', 'Ghost Buster Movie', '0000-00-00 00:00:00', '2013-02-13 03:17:48', 'Accra Mall', null, null);
INSERT INTO `events` VALUES ('12', 'mp movie', '2013-02-06 00:41:49', '2013-02-21 00:42:00', 'moving pick', null, null);
INSERT INTO `events` VALUES ('13', 'FrBooty Call', '2013-02-07 00:42:08', '2013-02-13 03:17:51', 'Comm 4', null, null);
INSERT INTO `events` VALUES ('16', 'load', null, '0000-00-00 00:00:00', 'test', null, null);
INSERT INTO `events` VALUES ('17', 'further ', null, '2013-02-13 03:17:45', 'testing', null, null);
INSERT INTO `events` VALUES ('18', 'newEventTester', '2013-02-18 21:44:40', '2013-02-24 21:46:08', 'Montee Carloo', null, '1');
INSERT INTO `events` VALUES ('19', 'Final', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'asdf', null, '1');
INSERT INTO `events` VALUES ('20', 'Fresh', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'asdf', null, '1');
INSERT INTO `events` VALUES ('21', 'smoothy club f', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'smmoohties osu', null, '1');
INSERT INTO `events` VALUES ('22', 'fuckoff', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'addd', null, '1');

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
INSERT INTO `institutions` VALUES ('7', 'TESTS7777', 'TESTNEW', '1', '1380', 'TEST', '32332', 'TESTE', 'ASDFSDD', 'ASDFDS');

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
INSERT INTO `members` VALUES ('1', 'nayibor@gmail.com', 'Nuku', 'Ameyibor', '0245707630', '1', '1');
INSERT INTO `members` VALUES ('2', 'nayibor@gmail.com', 'Asare', 'Bediako', '0572143444', '1', '1');

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
  `cell_number_member` enum('') DEFAULT NULL,
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
  `site_lock` enum('0','1') NOT NULL DEFAULT '0',
  `site_desc` text,
  PRIMARY KEY (`id`),
  KEY `inst-fk` (`site_inst_id`),
  CONSTRAINT `inst-fk` FOREIGN KEY (`site_inst_id`) REFERENCES `institutions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sites
-- ----------------------------
INSERT INTO `sites` VALUES ('1', 'Testtt', 'ASDFASFASFSDFSFSF2345345QWASASDF', '1', null, 'Temat', '02457073434', '1234123', 'nayibor@gmail.com', '1', '0');
INSERT INTO `sites` VALUES ('2', 'SilverBird', 'ASDFDSAFSA', '2', null, null, null, null, null, '0', '0');
INSERT INTO `sites` VALUES ('3', 'SilverBird Nigeria', 'ADSFSAUP787564', '2', null, null, null, null, null, '0', '0');
INSERT INTO `sites` VALUES ('4', 'STRIP CLUB', 'ADSFASDFKLJPIU34123415647', '1', null, 'Accra', '900908098', '090009', 'dollar@yahoo.com', '1', '0');
INSERT INTO `sites` VALUES ('5', 'Dredd ', null, '1', null, 'Dreed City', '877880', '0878097870', 'dede@as.com', '0', null);
INSERT INTO `sites` VALUES ('6', ' Default Site', null, '4', null, null, null, null, null, '0', null);
INSERT INTO `sites` VALUES ('7', 'Defalut2 Default Site', null, '5', 'adsfdsa', 'asdf', 'asdf', '908098', 'nay@a.com', '0', null);
INSERT INTO `sites` VALUES ('8', 'TESTS7777 Default Site', null, '7', 'ASDFDS', 'TESTE', 'TEST', '32332', '1380', '0', null);
INSERT INTO `sites` VALUES ('9', 'Local-First Default Site', null, '1', 'jjj', 'fracni', '98707', '0245707630', 'fasdf@hay.com', '0', 'j');

-- ----------------------------
-- Table structure for `tickets`
-- ----------------------------
DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_value` varchar(255) DEFAULT NULL,
  `ticket_encrypted_value` varchar(255) DEFAULT NULL,
  `ticket_redeem_status` enum('0','2','1') DEFAULT '0',
  `ticket_event_id` int(11) DEFAULT NULL,
  `ticket_batch_id` int(11) DEFAULT NULL,
  `ritrieval_reference_number` int(11) DEFAULT NULL,
  `ticket_down_status` enum('1','0') DEFAULT NULL,
  `ticket_img` mediumblob COMMENT 'this is for the actual barcode ticket',
  `site_id` int(11) DEFAULT NULL,
  `ticket_md5` varchar(50) DEFAULT NULL,
  `unique_id_ticket` varchar(30) DEFAULT NULL,
  `ticket_cdate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ticket_type` int(11) DEFAULT NULL,
  `ticket_email_receiver` varchar(255) DEFAULT NULL,
  `ticket_email_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_fk` (`ticket_event_id`),
  KEY `batch_fk` (`ticket_batch_id`),
  KEY `ticket-type-fk` (`ticket_type`),
  CONSTRAINT `batch-fk` FOREIGN KEY (`ticket_batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event-fk` FOREIGN KEY (`ticket_event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket-type-fk` FOREIGN KEY (`ticket_type`) REFERENCES `ticket_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=670 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tickets
-- ----------------------------
INSERT INTO `tickets` VALUES ('661', '184921cd0b1a14451772dc6ce3c290ae15930c71', null, '2', '18', '28', null, null, 0x89504E470D0A1A0A0000000D49484452000000840000008401030000006B8A11E400000006504C5445FFFFFF00000055C2D37E000000EC494441544889CD944112C3300803F981FEFF4B7EA04A98747AAD7C099978F01E3C16C854BD2D487635D1EC4953A2BFDBECA439613B03B9E905A1CFC63D411504EF484DBD0AF8D5FE3F71B9377E7AF13F7180D2F9DD65847680A40A2A7282D128AD5BBA9414E1D41D2C5E1079495BE2F1664A701C49CB64E5A4BE82C7A231D113B103B4C7B96048FC46F4DAF4A974670264C4E938C17F4EDC3EDBB2DDC629594646A396F27043E744EA7CE4B6212733D37C3FD73F27DBB359B8964AC84C124B3D358BC98C6BCCBB7B1C95111F89B528EE88EBAE4B3E4EB820383EC0053935B7D6EECEC94E7E1F8B424EDE151FE47DCFA610C7CA5F0000000049454E44AE426082, '1', '8b3f23184f0f534f46ac4e86a1090abf', '512a7f71-0310-46c4-b864-0b2ce4', '2013-02-24 22:08:48', '1', null, null);
INSERT INTO `tickets` VALUES ('662', 'b98f6917a535a8b2acfdc63eb86e3cb27ad4e679', null, '2', '18', '28', null, null, 0x89504E470D0A1A0A0000000D49484452000000840000008401030000006B8A11E400000006504C5445FFFFFF00000055C2D37E000000F2494441544889CD95C115C3300843D940FB6FA90DA884DDD75C232E256E1FF9071530D0AA7FB3EE26AA58183726FAB0A153E4BCA5A44974898DBB220D487C4F1C1CC11DD191E3623D727F4F5CEE6B8FBB784F8EA95EF57B4B88D47C80822C27AE9565CF0D7043E44D8E384166C47E5BDAAD809CB82F95A7A3D43763226DF4ED05564EDC912066E86E8411693D33B59EBA5A106F90891237D38C48528E1EF09B69462CE7E5360D5A39E9E9EC69039E0D9911384D758107F7FE5642A6D65E8F23CE98F424E8EEE4093024B3CE5C2A4F0C16A4EFF07FFF88168477DD024BD2AE159A1B62E8C2EB1A37642A8F919D4853F25FF6015025DEA639EF8A1C0000000049454E44AE426082, '1', '17c9227c60da56cc65655f7e0143835d', '512a7f72-12dc-44fc-98e3-0b2ce4', '2013-02-24 22:08:51', '1', null, null);
INSERT INTO `tickets` VALUES ('663', '2946b1b560a48f098a1d139ad20a81575dd630ba', null, '0', '18', '28', null, null, 0x89504E470D0A1A0A0000000D49484452000000840000008401030000006B8A11E400000006504C5445FFFFFF00000055C2D37E000000F1494441544889CD94C91503310C42D501FD77A90E88404EDE5C075FE26C9E7F503046AAFAB745B2ABE77DB629994F778340B79F5242EFD03CDB0BC2B6CA6B02FDA2EE88201AA8E7D9DF13D97DD6E32EDE132DF95E7CA6E13D996A241C04003999044051906F37647C92E18B3699111975238F2ADBEB5748AA8F445DE515915DD005367232D2A6DFA86FA06F484F12DC732B33244A42B95508FE121590923A656A2E702B47C446692229E23E6948F46A03EE4943C2ED5DFF052B26F66867647DFB3F21AEBB5D37B573E2A25CBB56604868BFCA830D974443E03BBAAF082CEF9C342386DA9E011912394F9B2E9139F9AFF5016973CFE2C01911180000000049454E44AE426082, '1', '25e496a9a49f8d9190cbd6d615a6fe91', '512a7f72-bcf4-471a-b516-0b2ce4', null, '1', null, null);
INSERT INTO `tickets` VALUES ('664', '2d618f3ad09f9c813046129eb4c506aa29d76c67', null, '0', '18', '28', null, null, 0x89504E470D0A1A0A0000000D49484452000000840000008401030000006B8A11E400000006504C5445FFFFFF00000055C2D37E000000F4494441544889CD94CB0DC4400843DD01FD77E90E581B1265AFF15C8294887907C4C7007CCDBA9B2089E6B829D1A777E941CE2B257D7922E31E102557451C9372DCE2193154A1864FEDEF494FAFC6FE66F19ED8AA67867FF69EB4155086EA5A1D10D5A9E45CA4823327855E4515AFC8198107D80E2CC49858054ED12A1810123B77FFB7FD199962DB594AE4859C687670D79CE90129EF8A9450120298132BC97A580D30264ACBA1AD4F6CC342020FCEBA2AAC1242E21A316BDBBE0329B9729A3FC198CC2599257174C464CE59EFDEF65D7B42ACEBBD24B7E673A29F0FD2EE4C4E1AA304F609C1D638051F90E93CF8C83C24DFB21FD0C3BCE6CAA501170000000049454E44AE426082, '1', '03915c731708e25d9fb4c8ab23be6739', '512a7f73-b760-40cd-af5b-0b2ce4', null, '1', null, null);
INSERT INTO `tickets` VALUES ('665', '1914883bf75c6cd8578dfc34a26b74b80923ed91', null, '0', '18', '28', null, null, 0x89504E470D0A1A0A0000000D49484452000000840000008401030000006B8A11E400000006504C5445FFFFFF00000055C2D37E000000F1494441544889CD94D18DC3300C43B501F7DF921BE8443AEEF537D44F8D02555E00C5A26956FDDAEA6E16C92ABA4C894A12F3CA654EDA5D0BF3C2E582CC0FEC5A13143CED8A08AA2FBE677F4F24F7B3BECEE23DD1426B8FF72923D3AD050A5A39A1C51AF8F9544666BCB6110C19133CB604A17DC6640A697F76DA0B722C506E0BC644DB831C3093F6821023D8B495358B39116AFB9BF71023A20BD7577977CE88F4A6A45212D482E89F16ED76CEC849A2A9FBB179462C1ACBA7771C9511C5C73C39023E7727208EB3915E49720229241AD376D2A44B52372D97E4D89C8505B1F0AD74C4FFECEF499F1CA16F0C72F25BEB0F9E14B566BC3AA8870000000049454E44AE426082, '1', 'c0aa444331c562e40923a86878413397', '512a7f73-a3d0-452e-afae-0b2ce4', null, '1', null, null);

-- ----------------------------
-- Table structure for `ticket_types`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_types`;
CREATE TABLE `ticket_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `type_html` varchar(1000) DEFAULT NULL,
  `site_id` int(255) DEFAULT NULL,
  `ticket_cost` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_fk` (`event_id`),
  KEY `sites_fk` (`site_id`),
  CONSTRAINT `event_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `sites_fk` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ticket_types
-- ----------------------------
INSERT INTO `ticket_types` VALUES ('1', '18', 'VIP', '\r\nHello this is your ticket for  <b>{event}</b> \r\n <br>taking place at  <b>{event_location} </b> from  <b>{event_start}</b>  to  <b>{event_end}</b>\r\n<br> Your email  <b>{email}</b>  cell   <b>{cell} </b>\r\n<br>Hoping To See You There !!!\r\n', '1', '50');

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
  `salt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site-fk` (`site_id`),
  CONSTRAINT `site-fk` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '6848d756da66e55b42f79c0728e351ad', 'Yao', 'Ameyiborrrr', '1', 'nayibor@gmail.com', '0', '2013-02-21 11:17:41', null);
INSERT INTO `users` VALUES ('6', 'OwBPrgn2S', 'asfdstuffstuff', 'adsf', '1', 'adsf@asdf.com', '1', '2013-02-14 00:10:15', null);
INSERT INTO `users` VALUES ('7', 'skhFkF#nK', 'asfd', 'adsf', '1', 'adsf@asdf.com', '1', '2013-02-14 00:10:17', null);
INSERT INTO `users` VALUES ('8', 'F9*EfmhCn', 'asfd', 'adsf', '1', 'adsf@asdf.com', '1', '2013-02-14 00:10:18', null);
INSERT INTO `users` VALUES ('9', 'YDmgR*kSZ', 'asfd', 'adsf', '1', 'checkuself@asdf.com', '1', '2013-02-14 00:10:19', null);
INSERT INTO `users` VALUES ('10', 'QHvZO0q6t', 'asfd', 'adsf', '1', 'checkuself@nima.com', '1', '2013-02-08 03:24:23', null);
INSERT INTO `users` VALUES ('11', '04f06c2e8fbdcaad790c83a82eb7e13a', 'Francis', 'Gyamfi', '1', 'checkuself@nima.com', '0', '2013-02-13 22:17:04', null);
INSERT INTO `users` VALUES ('56', '3e9dbb992a8955532c9fa626057f80a3', 'User', 'First', '3', 'asdf', '1', '2013-02-14 00:10:20', null);
INSERT INTO `users` VALUES ('57', '5a0a32313ed7051d388c563b50a219b3', 'last ', 'don', '3', 'asdf@don.com', '1', '2013-02-14 00:10:21', null);
INSERT INTO `users` VALUES ('58', 'd4fe7b89642837964712bcdaaf45e3fd', 'pAUL', 'ASDF', '3', 'ASDF@ADSF.COM', '1', '2013-02-14 00:10:22', null);
INSERT INTO `users` VALUES ('59', '34be73e749dfde85c9cd62022f2bed23', 'Wicked', 'Rastta', '3', 'rasta@yahoo.com', '1', '2013-02-14 00:10:25', null);
INSERT INTO `users` VALUES ('60', '177a07541c40f15074c2a42d6f18989c', 'Lion Faatatokp', 'vrliontt', '4', 'vlionr@qwe.com', '0', '2013-02-11 02:16:11', null);
INSERT INTO `users` VALUES ('61', 'b6adcbf620013ddc514957f49c8af5f1', 'Gg', 'Korley', '1', 'gkorley@ecobank.com', '0', '2013-02-11 02:33:40', null);
INSERT INTO `users` VALUES ('62', '6848d756da66e55b42f79c0728e351ad', 'dick', 'tracy', '4', 'dickt@tracy.com', '0', '2013-02-11 10:50:19', null);
INSERT INTO `users` VALUES ('65', '43bae54d3710b68d382edf5f1b04a302', 'Don', 'Upper', '4', 'ruckuper@qq.com', '0', '2013-02-21 01:00:17', null);
INSERT INTO `users` VALUES ('66', '90bba2f6cf4d5f9db4ad8ef86e9d648b', 'Tester', 'tester', '1', 'test@yahoo.ocm', '0', '2013-02-21 06:11:20', null);
INSERT INTO `users` VALUES ('67', '', null, null, null, null, '1', null, null);
INSERT INTO `users` VALUES ('68', '', null, null, null, null, '1', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=latin1;

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
INSERT INTO `user_roles` VALUES ('131', '1', '66');
INSERT INTO `user_roles` VALUES ('132', '2', '66');
INSERT INTO `user_roles` VALUES ('133', '5', '66');
INSERT INTO `user_roles` VALUES ('134', '7', '66');
INSERT INTO `user_roles` VALUES ('135', '8', '66');
