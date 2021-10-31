/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : techeco

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2021-10-31 22:39:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_detail
-- ----------------------------
DROP TABLE IF EXISTS `blog_detail`;
CREATE TABLE `blog_detail` (
  `blog_id` int(100) NOT NULL,
  `user_id` int(20) NOT NULL,
  `blog_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `blog_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `blog_content_id` int(20) NOT NULL,
  `blog_likes` int(20) DEFAULT NULL,
  `blog_dislikes` int(20) DEFAULT NULL,
  `blog_replynumber` int(100) DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `user_id3` (`user_id`),
  CONSTRAINT `user_id3` FOREIGN KEY (`user_id`) REFERENCES `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blog_detail
-- ----------------------------

-- ----------------------------
-- Table structure for blog_detail_like
-- ----------------------------
DROP TABLE IF EXISTS `blog_detail_like`;
CREATE TABLE `blog_detail_like` (
  `blog_id` int(100) NOT NULL,
  `blog_likes_number` int(20) DEFAULT NULL,
  `blog_dislikes_number` int(20) DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  CONSTRAINT `blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog_detail` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blog_detail_like
-- ----------------------------

-- ----------------------------
-- Table structure for blog_reply
-- ----------------------------
DROP TABLE IF EXISTS `blog_reply`;
CREATE TABLE `blog_reply` (
  `blog_reply_id` int(20) NOT NULL,
  `blog_reply_comment` varchar(255) NOT NULL,
  PRIMARY KEY (`blog_reply_id`),
  CONSTRAINT `blog_reply_id` FOREIGN KEY (`blog_reply_id`) REFERENCES `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of blog_reply
-- ----------------------------

-- ----------------------------
-- Table structure for donate_brief
-- ----------------------------
DROP TABLE IF EXISTS `donate_brief`;
CREATE TABLE `donate_brief` (
  `coll_id` int(100) NOT NULL,
  `coll_name` varchar(255) NOT NULL,
  `coll_content` varchar(255) NOT NULL,
  `coll_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `coll_companyid` int(100) NOT NULL,
  `user_id` int(20) NOT NULL,
  PRIMARY KEY (`coll_id`),
  KEY `coll_companyid` (`coll_companyid`),
  KEY `user_id4` (`user_id`),
  CONSTRAINT `user_id4` FOREIGN KEY (`user_id`) REFERENCES `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of donate_brief
-- ----------------------------

-- ----------------------------
-- Table structure for donate_detail
-- ----------------------------
DROP TABLE IF EXISTS `donate_detail`;
CREATE TABLE `donate_detail` (
  `coll_companyid` int(100) NOT NULL,
  `coll_companyname` varchar(255) NOT NULL,
  `coll_company_details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`coll_companyid`),
  CONSTRAINT `coll_companyid` FOREIGN KEY (`coll_companyid`) REFERENCES `donate_brief` (`coll_companyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of donate_detail
-- ----------------------------

-- ----------------------------
-- Table structure for elearn_elearn
-- ----------------------------
DROP TABLE IF EXISTS `elearn_elearn`;
CREATE TABLE `elearn_elearn` (
  `elearn_id` int(100) NOT NULL,
  `elearn_title` varchar(255) NOT NULL,
  `elearn_content` varchar(255) NOT NULL,
  `user_id` int(100) NOT NULL,
  PRIMARY KEY (`elearn_id`),
  KEY `user_id6` (`user_id`),
  CONSTRAINT `user_id6` FOREIGN KEY (`user_id`) REFERENCES `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of elearn_elearn
-- ----------------------------

-- ----------------------------
-- Table structure for news_news
-- ----------------------------
DROP TABLE IF EXISTS `news_news`;
CREATE TABLE `news_news` (
  `news_number` int(100) NOT NULL,
  `news_title` varchar(255) NOT NULL,
  `news_content` varchar(255) NOT NULL,
  `news_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`news_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of news_news
-- ----------------------------

-- ----------------------------
-- Table structure for product_product
-- ----------------------------
DROP TABLE IF EXISTS `product_product`;
CREATE TABLE `product_product` (
  `product_id` int(100) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_details` varchar(255) NOT NULL,
  `product_price` int(200) NOT NULL,
  `product_number` int(200) NOT NULL,
  `user_id` int(100) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `user_id5` (`user_id`),
  CONSTRAINT `user_id5` FOREIGN KEY (`user_id`) REFERENCES `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of product_product
-- ----------------------------

-- ----------------------------
-- Table structure for quiz_brief
-- ----------------------------
DROP TABLE IF EXISTS `quiz_brief`;
CREATE TABLE `quiz_brief` (
  `quiz_num` int(100) NOT NULL,
  `quiz_title` varchar(100) NOT NULL,
  `quiz_intro` varchar(255) NOT NULL,
  `quiz_state` int(10) NOT NULL,
  PRIMARY KEY (`quiz_num`),
  KEY `quiz_title` (`quiz_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of quiz_brief
-- ----------------------------

-- ----------------------------
-- Table structure for quiz_detail
-- ----------------------------
DROP TABLE IF EXISTS `quiz_detail`;
CREATE TABLE `quiz_detail` (
  `user_id` int(20) NOT NULL,
  `quiz_title` varchar(255) NOT NULL,
  `quiz_id` int(100) NOT NULL,
  `quiz_content` varchar(255) NOT NULL,
  `quiz_option1` varchar(255) NOT NULL,
  `quiz_option2` varchar(255) NOT NULL,
  `quiz_option3` varchar(255) NOT NULL,
  `quiz_answer` varchar(255) NOT NULL,
  `quiz_explain` varchar(255) NOT NULL,
  `quiz_grade` int(10) NOT NULL,
  `is_learnt` int(10) NOT NULL,
  PRIMARY KEY (`quiz_title`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `quiz_title` FOREIGN KEY (`quiz_title`) REFERENCES `quiz_brief` (`quiz_title`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of quiz_detail
-- ----------------------------

-- ----------------------------
-- Table structure for quiz_grade
-- ----------------------------
DROP TABLE IF EXISTS `quiz_grade`;
CREATE TABLE `quiz_grade` (
  `user_id` int(20) NOT NULL,
  `quiz_number` int(100) DEFAULT NULL,
  `quiz_sum_grade` int(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_id2` FOREIGN KEY (`user_id`) REFERENCES `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of quiz_grade
-- ----------------------------

-- ----------------------------
-- Table structure for user_id
-- ----------------------------
DROP TABLE IF EXISTS `user_id`;
CREATE TABLE `user_id` (
  `user_id` int(20) NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_superuser` int(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `is_superuser` (`is_superuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_id
-- ----------------------------

-- ----------------------------
-- Table structure for user_permission
-- ----------------------------
DROP TABLE IF EXISTS `user_permission`;
CREATE TABLE `user_permission` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(20) NOT NULL,
  `code_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_permission
-- ----------------------------

-- ----------------------------
-- Table structure for user_profile
-- ----------------------------
DROP TABLE IF EXISTS `user_profile`;
CREATE TABLE `user_profile` (
  `user_id` int(20) NOT NULL,
  `is_superuser` int(10) NOT NULL,
  `user_nickname` varchar(255) NOT NULL,
  `user_age` int(20) DEFAULT NULL,
  `user_sex` varchar(20) DEFAULT NULL,
  `user_bio` varchar(255) DEFAULT NULL,
  `user_phone` int(20) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  KEY `user_id1` (`user_id`),
  KEY `is_superuser` (`is_superuser`),
  CONSTRAINT `is_superuser` FOREIGN KEY (`is_superuser`) REFERENCES `user_id` (`is_superuser`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_id1` FOREIGN KEY (`user_id`) REFERENCES `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_profile
-- ----------------------------
