/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : mticket

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2012-09-02 15:38:23
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
  `batch_allow_redeem` enum('1','0') DEFAULT NULL,
  `batch_allow_download` enum('0','1') DEFAULT NULL,
  `batch_create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ticket_cost` float DEFAULT NULL,
  `ritrieval_reference_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `batch_event` (`batch_event_id`),
  CONSTRAINT `batch_event` FOREIGN KEY (`batch_event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of batches
-- ----------------------------
INSERT INTO `batches` VALUES ('1', 'First Batch', '1', '1', '1', '2012-08-28 16:50:20', '20', null);
INSERT INTO `batches` VALUES ('2', 'Second Batch', '1', '1', '0', '2012-08-16 16:50:50', '20', null);
INSERT INTO `batches` VALUES ('3', 'Third Batch', '2', '0', '0', '2012-08-30 16:54:49', '50', null);

-- ----------------------------
-- Table structure for `constituencies`
-- ----------------------------
DROP TABLE IF EXISTS `constituencies`;
CREATE TABLE `constituencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `const_short_name` varchar(255) DEFAULT NULL,
  `const_long_name` varchar(255) DEFAULT NULL,
  `const_region` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `const_region` (`const_region`),
  CONSTRAINT `const_fk` FOREIGN KEY (`const_region`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of constituencies
-- ----------------------------
INSERT INTO `constituencies` VALUES ('1', 'TMA', 'TEMA', '1');
INSERT INTO `constituencies` VALUES ('2', 'ASH', 'Ashaiman', '1');
INSERT INTO `constituencies` VALUES ('3', 'DANS', 'Dansoman', '1');
INSERT INTO `constituencies` VALUES ('4', 'SAK', 'Sakumono', '1');
INSERT INTO `constituencies` VALUES ('5', 'TESH', 'Teshie', '1');
INSERT INTO `constituencies` VALUES ('7', 'NM', 'Nima', '1');
INSERT INTO `constituencies` VALUES ('8', 'LBS', 'Labadi', '1');
INSERT INTO `constituencies` VALUES ('9', 'ML', 'Mallam', '1');
INSERT INTO `constituencies` VALUES ('10', 'KAN', 'Kaneshie', '1');
INSERT INTO `constituencies` VALUES ('12', 'ADN', 'Adenta', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES ('1', 'Mticket Launch', '2012-08-31 16:14:54', '2012-09-07 16:15:00', 'Ruffus Garden,Accra', null, null, null);
INSERT INTO `events` VALUES ('2', 'Mticket First Million Party', '2012-08-29 16:37:25', '2012-09-21 16:37:29', 'Lipan Hotel', null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of links
-- ----------------------------
INSERT INTO `links` VALUES ('1', 'Reception', 'view_regions', 'false', 'View Information', 'Regions');
INSERT INTO `links` VALUES ('2', 'Reception', 'view_const', 'false', 'View Information', 'Constituencies');
INSERT INTO `links` VALUES ('4', 'Reception', 'view_parties', 'false', 'View Information', 'Parties');
INSERT INTO `links` VALUES ('6', 'Reception', 'add_votes', 'false', 'Add Information', 'Add Votes');
INSERT INTO `links` VALUES ('7', 'Reception', 'view_stats', 'false', 'View Information', 'Statistics');
INSERT INTO `links` VALUES ('9', 'Reception', 'view_events', 'true', 'Events', 'View Events');
INSERT INTO `links` VALUES ('10', 'Reception', 'view_regions', 'true', 'Tracking', 'View Tickets');
INSERT INTO `links` VALUES ('11', 'Reception', 'view_regions', 'true', 'Users', 'View Users');
INSERT INTO `links` VALUES ('12', 'Reception', 'view_batches', 'true', 'Events', 'View Batches');
INSERT INTO `links` VALUES ('13', 'Reception', 'view_regions', 'true', 'Users', 'View Logs');
INSERT INTO `links` VALUES ('14', 'Reception', 'view_regions', 'true', 'Tracking', 'Verify Ticket');
INSERT INTO `links` VALUES ('15', 'Reception', 'view_regions', 'true', 'Tracking', 'View Event Ticket Sales');
INSERT INTO `links` VALUES ('16', 'Reception', 'upload_tickets', 'false', 'Events', 'Upload Tickets');
INSERT INTO `links` VALUES ('17', 'Reception', 'view_regions', 'true', 'Users', 'View Roles');
INSERT INTO `links` VALUES ('18', 'Reception', 'view_regions', 'false', 'Events', 'Create Tickets');
INSERT INTO `links` VALUES ('19', 'Recption', 'view_regions', 'true', 'Events', 'Download Tickets');
INSERT INTO `links` VALUES ('20', 'Reception', 'view_sites', 'true', 'Events', 'View Sites');

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` enum('ticket_return','ticket_delete','ticket_redeem','ticket_create','ticket_batch_create') DEFAULT NULL,
  `log_text_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for `parties`
-- ----------------------------
DROP TABLE IF EXISTS `parties`;
CREATE TABLE `parties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `party_short_name` varchar(255) DEFAULT NULL,
  `party_long_name` varchar(255) DEFAULT NULL,
  `party_image` varchar(255) DEFAULT NULL,
  `party_img` blob,
  `comment` varchar(255) NOT NULL,
  `party_img_link` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parties
-- ----------------------------
INSERT INTO `parties` VALUES ('1', 'NPP', 'National Patriotic Party', null, null, '', '');
INSERT INTO `parties` VALUES ('2', 'NDC', 'Natinal Democratic Congress', null, null, '', '');
INSERT INTO `parties` VALUES ('3', 'CPP', 'Convention Peoples Party', null, null, '', '');
INSERT INTO `parties` VALUES ('4', null, null, null, null, '', '');

-- ----------------------------
-- Table structure for `regions`
-- ----------------------------
DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_short_name` varchar(255) DEFAULT NULL,
  `region_char` varchar(255) DEFAULT NULL,
  `region_long_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of regions
-- ----------------------------
INSERT INTO `regions` VALUES ('1', 'G.A. Region', null, 'Greater Accra Region');
INSERT INTO `regions` VALUES ('2', 'West. Region', null, 'Western Region');
INSERT INTO `regions` VALUES ('3', 'East. Region', null, 'Eastern Region');
INSERT INTO `regions` VALUES ('4', 'Vlt. Region', null, 'Volta Region');
INSERT INTO `regions` VALUES ('5', 'Ashan. Region', null, 'Ashanti Region');
INSERT INTO `regions` VALUES ('6', 'Bron. Aha.', null, 'Brong Ahafo Region');
INSERT INTO `regions` VALUES ('7', 'Upp Est. Region', null, 'Upper East Region');
INSERT INTO `regions` VALUES ('8', 'Upp Wst Region', null, 'Upper West Region');
INSERT INTO `regions` VALUES ('9', 'Nrth Region', null, 'Northern Region');
INSERT INTO `regions` VALUES ('10', 'Cntr. Region', null, 'Central Region');

-- ----------------------------
-- Table structure for `tickets`
-- ----------------------------
DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_value` varchar(255) DEFAULT NULL,
  `ticket_encrypted_value` varchar(255) DEFAULT NULL,
  `ticket_download_status` enum('0','`1') DEFAULT NULL,
  `ticket_redeem_status` enum('0','1') DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `ticket_batch` int(11) DEFAULT NULL,
  `ticket_scanned_status` enum('0','1') DEFAULT NULL,
  `ritrieval_reference_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_fk` (`event_id`),
  KEY `batch_fk` (`ticket_batch`),
  CONSTRAINT `batch_fk` FOREIGN KEY (`ticket_batch`) REFERENCES `batches` (`id`),
  CONSTRAINT `event_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tickets
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `allow_login` enum('0','1') DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '6848d756da66e55b42f79c0728e351ad', '1', 'Nuku', 'Ameyibor');

-- ----------------------------
-- Table structure for `votes_constituencies`
-- ----------------------------
DROP TABLE IF EXISTS `votes_constituencies`;
CREATE TABLE `votes_constituencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `party_id` int(11) DEFAULT NULL,
  `const_id` int(11) DEFAULT NULL,
  `party_votes` int(11) DEFAULT NULL,
  `insert_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(255) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `const_id` (`const_id`),
  KEY `party_id` (`party_id`),
  CONSTRAINT `fk_const` FOREIGN KEY (`const_id`) REFERENCES `constituencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_party` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of votes_constituencies
-- ----------------------------
