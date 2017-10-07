/*
Navicat MySQL Data Transfer

Source Server         : gwx
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : tea

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-10-07 15:56:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tea_insert
-- ----------------------------
DROP TABLE IF EXISTS `tea_insert`;
CREATE TABLE `tea_insert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shape` double unsigned NOT NULL COMMENT '形状',
  `color` double unsigned NOT NULL COMMENT '色泽',
  `neatness` double unsigned NOT NULL COMMENT '净度',
  `color_tea` double unsigned NOT NULL COMMENT '汤色',
  `aroma` double unsigned NOT NULL COMMENT '香气',
  `taste` double unsigned NOT NULL COMMENT '滋味',
  `leaves` double unsigned NOT NULL COMMENT '叶底',
  `grade` varchar(255) DEFAULT NULL,
  `grade_number` int(255) NOT NULL COMMENT '等级,0-6等级一次提高',
  `status` tinyint(255) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑状态',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tea_insert
-- ----------------------------
INSERT INTO `tea_insert` VALUES ('2', '0.9', '0.9', '0.9', '0.9', '0.9', '0.9', '0.8', '特二级', '1', '0', '2017-10-05 00:48:12', null);
INSERT INTO `tea_insert` VALUES ('3', '0.9', '0.9', '0.9', '0.9', '0.9', '0.9', '0.7', '特三级', '2', '0', '2017-10-05 01:06:15', '2017-10-05 01:06:30');
INSERT INTO `tea_insert` VALUES ('10', '0.3', '0.9', '0.9', '0.9', '0.9', '0.9', '0.9', '特二级', '1', '0', '2017-10-06 19:52:44', null);
INSERT INTO `tea_insert` VALUES ('11', '0.9', '0.9', '0.9', '0.9', '0.9', '0.9', '0.9', '特二级', '1', '0', '2017-10-06 19:54:52', null);
INSERT INTO `tea_insert` VALUES ('12', '0.4', '0.4', '0.5', '0.6', '0.5', '0.5', '0.6', '三级', '5', '0', '2017-10-06 19:55:43', null);
INSERT INTO `tea_insert` VALUES ('13', '0.5', '0.36', '0.4', '0.5', '0.1', '0.1', '0.1', '二级', '4', '0', '2017-10-06 21:59:30', null);
INSERT INTO `tea_insert` VALUES ('14', '0.1', '0.1', '0.1', '0.1', '0.1', '0.1', '0.1', '四级', '6', '0', '2017-10-06 21:59:54', null);
INSERT INTO `tea_insert` VALUES ('15', '0.7', '0.8', '0.8', '0.6', '0.2', '0.2', '0.36', '特三级', '2', '0', '2017-10-06 22:00:09', null);
INSERT INTO `tea_insert` VALUES ('16', '0.9', '1', '0.9', '0.9', '0.9', '0.9', '0.9', '特二级', '1', '0', '2017-10-06 23:41:21', null);
INSERT INTO `tea_insert` VALUES ('17', '1', '1', '1', '1', '1', '1', '0.9', '特一级', '0', '0', '2017-10-06 23:42:43', null);
INSERT INTO `tea_insert` VALUES ('20', '0.1', '0.1', '0', '0.1', '0.1', '0.1', '0.1', '四级', '6', '0', '2017-10-07 14:16:08', null);
INSERT INTO `tea_insert` VALUES ('22', '0.1', '0.1', '0.1', '0.1', '0.1', '0.1', '0.9', '四级', '6', '0', '2017-10-07 14:16:44', null);
INSERT INTO `tea_insert` VALUES ('24', '0.1', '0.1', '0.1', '0.1', '0.1', '0.1', '0.1', '四级', '6', '0', '2017-10-07 14:19:20', null);
INSERT INTO `tea_insert` VALUES ('28', '0.9', '0.9', '0.9', '1', '1', '1', '1', '特一级', '0', '0', '2017-10-07 15:51:51', null);
INSERT INTO `tea_insert` VALUES ('29', '1', '1', '1', '1', '1', '1', '1', '特一级', '0', '0', '2017-10-07 15:54:05', null);

-- ----------------------------
-- Table structure for tea_vote
-- ----------------------------
DROP TABLE IF EXISTS `tea_vote`;
CREATE TABLE `tea_vote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '茶叶的名字',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '茶叶的图片',
  `vote` int(11) NOT NULL DEFAULT '0' COMMENT '得票数',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tea_vote
-- ----------------------------
INSERT INTO `tea_vote` VALUES ('1', '安吉白茶', 'ajbc.gif', '17', '0', '2017-10-05 00:14:13', '2017-10-06 23:43:31');
INSERT INTO `tea_vote` VALUES ('2', '安化黑茶', 'ahhc.gif', '7', '0', '2017-10-05 00:14:13', '2017-10-07 15:29:10');
INSERT INTO `tea_vote` VALUES ('3', '安溪铁观音', 'axtgy.gif', '12', '0', '2017-10-05 00:14:13', '2017-10-07 15:29:11');
INSERT INTO `tea_vote` VALUES ('4', '黄山毛峰', 'hsmf.gif', '23', '0', '2017-10-05 00:14:13', '2017-10-07 15:29:11');
INSERT INTO `tea_vote` VALUES ('5', '君山银针', 'jsyz.gif', '3', '0', '2017-10-05 00:14:13', '2017-10-05 01:11:34');
INSERT INTO `tea_vote` VALUES ('6', '六安瓜片', 'lagp.gif', '2', '0', '2017-10-05 00:14:13', '2017-10-07 15:29:14');
INSERT INTO `tea_vote` VALUES ('7', '庐山云雾茶', 'lsywc.gif', '2', '0', '2017-10-05 00:14:13', '2017-10-07 15:29:13');
INSERT INTO `tea_vote` VALUES ('8', '茉莉花茶', 'mlhc.gif', '1', '0', '2017-10-05 00:14:13', '2017-10-06 23:40:04');
INSERT INTO `tea_vote` VALUES ('9', '湄潭翠叶', 'mtcy.gif', '0', '0', '2017-10-05 00:14:13', null);
INSERT INTO `tea_vote` VALUES ('10', '普洱茶', 'pec.gif', '1', '0', '2017-10-05 00:14:13', '2017-10-06 23:40:07');
INSERT INTO `tea_vote` VALUES ('11', '武夷山大红袍', 'wysdhp.gif', '2', '0', '2017-10-05 00:14:13', '2017-10-07 15:29:13');
INSERT INTO `tea_vote` VALUES ('12', '信阳毛尖', 'xymj.gif', '2', '0', '2017-10-05 00:14:13', '2017-10-07 15:29:12');
