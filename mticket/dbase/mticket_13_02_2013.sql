/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : mticket

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2013-02-13 04:58:52
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
  `ritrieval_reference_number` int(11) DEFAULT NULL,
  `batch_ticket_number` int(11) DEFAULT NULL,
  `batch_last_update_dt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `site_id` int(11) DEFAULT NULL,
  `batch_creation_status` enum('2','1','0') DEFAULT NULL COMMENT '0 means batch hasn been created,1 started but not finised,2 means done',
  `batch_verification_start` timestamp NULL DEFAULT NULL,
  `batch_verifaction_end` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `batch_event` (`batch_event_id`),
  CONSTRAINT `batch_event` FOREIGN KEY (`batch_event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of batches
-- ----------------------------
INSERT INTO `batches` VALUES ('22', 'Fr Batch', '13', '1', '1', null, '23', null, '5', null, null, null, null, null);
INSERT INTO `batches` VALUES ('23', 'New Batch', '10', '1', '1', null, '24', null, '10', null, null, null, null, null);
INSERT INTO `batches` VALUES ('24', 'frbatch2', '13', '0', '0', null, '100', null, '10', null, null, null, null, null);
INSERT INTO `batches` VALUES ('25', 'invisible bonddd', '19', '0', '0', null, null, null, '120', '2013-02-13 03:41:42', '1', null, null, null);

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categories
-- ----------------------------

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
  `inst_lock` enum('1','0') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of institutions
-- ----------------------------
INSERT INTO `institutions` VALUES ('1', 'Local-First', 'Localhost -First Guinea Pig', '1');
INSERT INTO `institutions` VALUES ('2', 'SilverBird', 'Silverbird Worldwide Inc', '0');

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
INSERT INTO `links` VALUES ('10', 'Reception', 'view_regions', 'true', 'Tracking', 'View Tickets');
INSERT INTO `links` VALUES ('11', 'User', 'view_users', 'true', 'Users', 'View Users');
INSERT INTO `links` VALUES ('12', 'Reception', 'view_batches', 'true', 'Events', 'View Batches');
INSERT INTO `links` VALUES ('14', 'Reception', 'view_regions', 'true', 'Tracking', 'Verify Ticket');
INSERT INTO `links` VALUES ('15', 'Reception', 'view_eventsales', 'true', 'Tracking', 'View Event Ticket Sales');
INSERT INTO `links` VALUES ('16', 'Reception', 'upload_tickets', 'false', 'Events', 'Upload ');
INSERT INTO `links` VALUES ('17', 'Admin', 'view_roles', 'true', 'Admin', 'View Roles');
INSERT INTO `links` VALUES ('18', 'Reception', 'view_regions', 'false', 'Events', 'Create Tickets');
INSERT INTO `links` VALUES ('19', 'Recption', 'view_regions', 'false', 'Events', 'Download Tickets');
INSERT INTO `links` VALUES ('20', 'Reception', 'view_sites', 'true', 'Users', 'View Sites');
INSERT INTO `links` VALUES ('21', 'Institution', 'view_inst', 'false', 'Companies', 'View Companies');
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
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_short_name` varchar(255) DEFAULT NULL,
  `role_long_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'TRA', 'Tracking');
INSERT INTO `roles` VALUES ('2', 'EVE', 'Event Viewer');
INSERT INTO `roles` VALUES ('3', 'ADM', 'Administrator');
INSERT INTO `roles` VALUES ('4', 'SADM', 'Super Admin');
INSERT INTO `roles` VALUES ('5', 'VIS', 'Visitor');
INSERT INTO `roles` VALUES ('6', 'SMF', 'Stupid Mother Fucker');

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
  `site_enabled` enum('0','1') DEFAULT '0',
  `site_key` varchar(255) DEFAULT NULL,
  `site_inst_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `site_lock` enum('0','1') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sites
-- ----------------------------
INSERT INTO `sites` VALUES ('1', 'Test', '1', 'ASDFASFASFSDFSFSF2345345QWASASDF', '1', null, 'Tema', '02457073434', '1234123', 'nayibor@gmail.com', null);
INSERT INTO `sites` VALUES ('2', 'SilverBird', '1', 'ASDFDSAFSA', '2', null, null, null, null, null, null);
INSERT INTO `sites` VALUES ('3', 'SilverBird Nigeria', '1', 'ADSFSAUP787564', '2', null, null, null, null, null, null);
INSERT INTO `sites` VALUES ('4', 'STRIP CLUB', '1', 'ADSFASDFKLJPIU34123415647', '1', null, 'Accra', '900908098', '090009', 'dollar@yahoo.com', null);

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
  `ticket_scanned_status` enum('0','1') DEFAULT '0',
  `ritrieval_reference_number` int(11) DEFAULT NULL,
  `ticket_down_status` enum('1','0') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_fk` (`ticket_event_id`),
  KEY `batch_fk` (`ticket_batch_id`),
  CONSTRAINT `batch-fk` FOREIGN KEY (`ticket_batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event-fk` FOREIGN KEY (`ticket_event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tickets
-- ----------------------------
INSERT INTO `tickets` VALUES ('19', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '13', '22', '0', null, null);
INSERT INTO `tickets` VALUES ('20', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '13', '22', '0', null, null);
INSERT INTO `tickets` VALUES ('21', 'test', 'QWERASDFZXC12347890UYIOPHJK', '1', '1', '13', '22', '0', null, null);
INSERT INTO `tickets` VALUES ('22', 'test', 'QWERASDFZXC12347890UYIOPHJK', '1', '1', '13', '22', '0', null, null);
INSERT INTO `tickets` VALUES ('23', 'test', 'QWERASDFZXC12347890UYIOPHJK', '1', '1', '13', '22', '0', null, null);
INSERT INTO `tickets` VALUES ('24', 'test', 'QWERASDFZXC12347890UYIOPHJK', '1', '1', '13', '22', '0', null, null);
INSERT INTO `tickets` VALUES ('25', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '10', '23', '0', null, null);
INSERT INTO `tickets` VALUES ('26', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '10', '23', '0', null, null);
INSERT INTO `tickets` VALUES ('27', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '10', '23', '0', null, null);
INSERT INTO `tickets` VALUES ('28', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '10', '23', '0', null, null);
INSERT INTO `tickets` VALUES ('29', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '10', '23', '0', null, null);
INSERT INTO `tickets` VALUES ('30', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '10', '23', '0', null, null);
INSERT INTO `tickets` VALUES ('31', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '10', '23', '0', null, null);
INSERT INTO `tickets` VALUES ('32', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '10', '23', '0', null, null);
INSERT INTO `tickets` VALUES ('33', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '10', '23', '0', null, null);
INSERT INTO `tickets` VALUES ('34', 'test', 'QWERASDFZXC12347890UYIOPHJK', '1', '1', '10', '23', '0', null, null);
INSERT INTO `tickets` VALUES ('35', 'test', 'QWERASDFZXC12347890UYIOPHJK', '1', '1', '10', '23', '0', null, null);
INSERT INTO `tickets` VALUES ('36', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '13', '24', '0', null, null);
INSERT INTO `tickets` VALUES ('37', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '13', '24', '0', null, null);
INSERT INTO `tickets` VALUES ('38', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '13', '24', '0', null, null);
INSERT INTO `tickets` VALUES ('39', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '13', '24', '0', null, null);
INSERT INTO `tickets` VALUES ('40', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '13', '24', '0', null, null);
INSERT INTO `tickets` VALUES ('41', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '13', '24', '0', null, null);
INSERT INTO `tickets` VALUES ('42', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '13', '24', '0', null, null);
INSERT INTO `tickets` VALUES ('43', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '13', '24', '0', null, null);
INSERT INTO `tickets` VALUES ('44', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '13', '24', '0', null, null);
INSERT INTO `tickets` VALUES ('45', 'test', 'QWERASDFZXC12347890UYIOPHJK', '1', '1', '13', '24', '0', null, null);
INSERT INTO `tickets` VALUES ('46', 'test', 'QWERASDFZXC12347890UYIOPHJK', '1', '1', '13', '24', '0', null, null);
INSERT INTO `tickets` VALUES ('47', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('48', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('49', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('50', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('51', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('52', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('53', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('54', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('55', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('56', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('57', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('58', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('59', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('60', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('61', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('62', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('63', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('64', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('65', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('66', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('67', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('68', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('69', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('70', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('71', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('72', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('73', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('74', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('75', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('76', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('77', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('78', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('79', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('80', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('81', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('82', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('83', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('84', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('85', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('86', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('87', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('88', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('89', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('90', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('91', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('92', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('93', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('94', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('95', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('96', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('97', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('98', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('99', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('100', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('101', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('102', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('103', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('104', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('105', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('106', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('107', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('108', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('109', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('110', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('111', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('112', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('113', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('114', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('115', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('116', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('117', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('118', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('119', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('120', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('121', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('122', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('123', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('124', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('125', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('126', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('127', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('128', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('129', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('130', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('131', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('132', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('133', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('134', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('135', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('136', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('137', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('138', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('139', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('140', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('141', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('142', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('143', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('144', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('145', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('146', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('147', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('148', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('149', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('150', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('151', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('152', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('153', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('154', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('155', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('156', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('157', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('158', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('159', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('160', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('161', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('162', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('163', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('164', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('165', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('166', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);
INSERT INTO `tickets` VALUES ('167', 'test', 'QWERASDFZXC12347890UYIOPHJK', '0', '0', '19', '25', '0', null, null);

-- ----------------------------
-- Table structure for `ticket_img_data`
-- ----------------------------
DROP TABLE IF EXISTS `ticket_img_data`;
CREATE TABLE `ticket_img_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `ticket_aztec_image` mediumblob,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ticket_img_data
-- ----------------------------

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
INSERT INTO `users` VALUES ('1', '6848d756da66e55b42f79c0728e351ad', 'Yao', 'Ameyiborrrr', '4', 'nayibor@gmail.com', '0', '2013-02-11 23:29:53');
INSERT INTO `users` VALUES ('6', 'OwBPrgn2S', 'asfd', 'adsf', '1', 'adsf@asdf.com', '3', '2013-02-08 03:24:11');
INSERT INTO `users` VALUES ('7', 'skhFkF#nK', 'asfd', 'adsf', '1', 'adsf@asdf.com', '3', '2013-02-08 03:24:16');
INSERT INTO `users` VALUES ('8', 'F9*EfmhCn', 'asfd', 'adsf', '1', 'adsf@asdf.com', '2', '2013-02-08 03:24:18');
INSERT INTO `users` VALUES ('9', 'YDmgR*kSZ', 'asfd', 'adsf', '1', 'checkuself@asdf.com', '2', '2013-02-08 03:24:19');
INSERT INTO `users` VALUES ('10', 'QHvZO0q6t', 'asfd', 'adsf', '1', 'checkuself@nima.com', '1', '2013-02-08 03:24:23');
INSERT INTO `users` VALUES ('11', '04f06c2e8fbdcaad790c83a82eb7e13a', 'Francis', 'Gyamfi', '1', 'checkuself@nima.com', '3', '2013-02-08 03:26:33');
INSERT INTO `users` VALUES ('56', '3e9dbb992a8955532c9fa626057f80a3', 'User', 'First', '3', 'asdf', '3', '2013-02-07 04:58:46');
INSERT INTO `users` VALUES ('57', '5a0a32313ed7051d388c563b50a219b3', 'last ', 'don', '3', 'asdf@don.com', '3', '2013-02-07 05:04:24');
INSERT INTO `users` VALUES ('58', 'd4fe7b89642837964712bcdaaf45e3fd', 'pAUL', 'ASDF', '3', 'ASDF@ADSF.COM', '3', '2013-02-07 05:08:21');
INSERT INTO `users` VALUES ('59', '34be73e749dfde85c9cd62022f2bed23', 'Wicked', 'Rastta', '3', 'rasta@yahoo.com', '5', '2013-02-07 20:39:04');
INSERT INTO `users` VALUES ('60', '177a07541c40f15074c2a42d6f18989c', 'Lion Faatatokp', 'vrliontt', '4', 'vlion@qwe.com', '0', '2013-02-11 02:16:11');
INSERT INTO `users` VALUES ('61', 'b6adcbf620013ddc514957f49c8af5f1', 'Gg', 'Korley', '1', 'gkorley@ecobank.com', '0', '2013-02-11 02:33:40');
INSERT INTO `users` VALUES ('62', '6848d756da66e55b42f79c0728e351ad', 'dick', 'tracy', '4', 'dick@tracy.com', '0', '2013-02-11 10:50:19');
INSERT INTO `users` VALUES ('65', '79dcbaa1d8cef387c1bde887965ec338', 'Fuck', 'Upper', '4', 'ruckuper@qq.com', '0', '2013-02-13 04:51:36');

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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

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
INSERT INTO `user_roles` VALUES ('118', '1', '65');
INSERT INTO `user_roles` VALUES ('119', '2', '65');
INSERT INTO `user_roles` VALUES ('120', '5', '65');
