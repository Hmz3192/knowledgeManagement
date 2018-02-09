/*
Navicat MySQL Data Transfer

Source Server         : 阿里云
Source Server Version : 50716
Source Host           : 101.201.234.133:3306
Source Database       : knowledgeManagement

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-02-09 21:04:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kl_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `kl_knowledge`;
CREATE TABLE `kl_knowledge` (
  `kl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '知识的id',
  `user_id` int(11) DEFAULT NULL,
  `kl_kind` int(11) DEFAULT NULL COMMENT '知识的类别（1，2，3）',
  `kl_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `kl_introduction` varchar(255) DEFAULT NULL COMMENT '介绍',
  `kl_content` varchar(10000) DEFAULT NULL COMMENT '博文',
  `kl_tags` varchar(255) DEFAULT NULL COMMENT '标签（tag1，tag2，tag3）',
  `kl_appendix` varchar(255) DEFAULT NULL COMMENT '附录，用逗号分割（/appendix/file1，/appendix/file2）',
  `kl_appendix_number` int(11) DEFAULT NULL COMMENT '附件数量',
  `kl_video` varchar(255) DEFAULT NULL COMMENT '视屏路径，逗号分隔',
  `kl_video_number` int(11) DEFAULT NULL COMMENT '视屏数量',
  `kl_hints` int(11) DEFAULT NULL COMMENT '点击量',
  `kl_collection_number` int(11) DEFAULT NULL COMMENT '收藏量',
  `kl_connect_ids` varchar(255) DEFAULT NULL COMMENT '关联的知识id，逗号分隔',
  `kl_parent_file_id` int(11) DEFAULT NULL COMMENT '知识点所在的父类文件夹id',
  PRIMARY KEY (`kl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20912615 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for kl_rating_comment
-- ----------------------------
DROP TABLE IF EXISTS `kl_rating_comment`;
CREATE TABLE `kl_rating_comment` (
  `user_id` int(11) NOT NULL,
  `kl_id` int(11) DEFAULT NULL COMMENT '博客id',
  `kl_rating` int(11) DEFAULT NULL COMMENT '其他人对博客的评分',
  `kl_comment` varchar(255) DEFAULT NULL COMMENT '评论',
  `kl_comment_time` datetime DEFAULT NULL COMMENT '评论时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for kl_tree
-- ----------------------------
DROP TABLE IF EXISTS `kl_tree`;
CREATE TABLE `kl_tree` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for kl_user
-- ----------------------------
DROP TABLE IF EXISTS `kl_user`;
CREATE TABLE `kl_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_avatar` varchar(255) DEFAULT NULL COMMENT '头像url',
  `user_phone` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_vip` int(11) DEFAULT NULL COMMENT '是否是vip账户',
  `user_point` int(11) DEFAULT NULL COMMENT '用户积分',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
