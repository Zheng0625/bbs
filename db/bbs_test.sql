/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : bbs_test

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 08/10/2019 12:49:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `aname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员姓名',
  `apassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码',
  `atime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '2018-04-12 01:33:06');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  `titles` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帖子标题',
  `fcontent` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子内容',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帖子图片',
  `bname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属板块名字',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发帖时间',
  `userid` int(11) NOT NULL COMMENT '发帖人id',
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发帖人姓名',
  `status` int(11) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000000000 COMMENT '帖子审核状态(0为待审核，1为通过审核，2为未通过审核，默认为0)',
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发帖表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (67, '发帖测试', 'zzz发帖测试第一', 'photo', '许愿墙', '2019-09-24 09:33:23', 30, 'zzz', 00000000001);
INSERT INTO `article` VALUES (68, 'ccc测试', '测试', 'photo', '闲聊', '2019-09-19 10:35:16', 32, 'ccc', 00000000001);
INSERT INTO `article` VALUES (69, 'ttest测试', 'ttest测试', 'photo', '视频', '2019-09-24 18:58:51', 31, 'aa', 00000000001);

-- ----------------------------
-- Table structure for attention
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention`  (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注表id',
  `userid` int(11) NOT NULL COMMENT '主动关注者的id',
  `beuserid` int(11) NOT NULL COMMENT '被动关注者的id',
  PRIMARY KEY (`gid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `beuserid`(`beuserid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关注表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of attention
-- ----------------------------
INSERT INTO `attention` VALUES (113, 31, 30);
INSERT INTO `attention` VALUES (114, 32, 30);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏表id',
  `userid` int(11) NOT NULL COMMENT '收藏者id',
  `fid` int(11) NOT NULL COMMENT '被收藏帖子id',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `fid`(`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (78, 32, 67);
INSERT INTO `collect` VALUES (79, 31, 68);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `pcontent` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `userid` int(11) NOT NULL COMMENT '评论者',
  `fid` int(11) NOT NULL COMMENT '被评论帖子id',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '评论时间',
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `fid`(`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (176, 'aaaaaaaa', 30, 67, '2019-09-18 16:56:48');
INSERT INTO `comment` VALUES (177, 'aaaaaaaaaces', 31, 67, '2019-09-18 16:58:30');
INSERT INTO `comment` VALUES (178, 'ccccccccccc', 32, 67, '2019-09-18 20:16:07');
INSERT INTO `comment` VALUES (179, '111', 32, 68, '2019-09-24 16:39:07');
INSERT INTO `comment` VALUES (180, '用户aa来测试评论功能', 31, 68, '2019-09-24 19:06:42');
INSERT INTO `comment` VALUES (181, '测试成功', 31, 68, '2019-09-24 19:06:49');
INSERT INTO `comment` VALUES (182, 'aaa', 31, 69, '2019-09-24 19:13:10');
INSERT INTO `comment` VALUES (183, 'ccc', 31, 69, '2019-09-24 19:13:18');

-- ----------------------------
-- Table structure for plate
-- ----------------------------
DROP TABLE IF EXISTS `plate`;
CREATE TABLE `plate`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT '板块id',
  `bname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '板块名字',
  `btime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '板块创建时间',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '板块表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of plate
-- ----------------------------
INSERT INTO `plate` VALUES (27, '许愿墙', '2019-09-18 16:55:59');
INSERT INTO `plate` VALUES (28, '闲聊', '2019-09-18 17:12:57');
INSERT INTO `plate` VALUES (29, '交友', '2019-09-23 19:57:06');
INSERT INTO `plate` VALUES (30, '游戏', '2019-09-23 19:57:19');
INSERT INTO `plate` VALUES (31, '视频', '2019-09-23 19:57:25');
INSERT INTO `plate` VALUES (32, '测试修改', '2019-09-24 19:23:01');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户email',
  `family` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户住址',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '个人简介',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (30, 'zzz', NULL, NULL, '123456', '123456@qq.com', NULL, NULL, '2019-09-19 09:22:24');
INSERT INTO `user` VALUES (31, 'aa', 18, '男', '123456', '11@qq.com', 'CCIT', '无', '2019-09-24 19:01:42');
INSERT INTO `user` VALUES (32, 'ccc', 22, '男', '123456', '11@qq.com', 'CCIT', '无meide', '2019-09-18 20:33:36');
INSERT INTO `user` VALUES (33, 'ces111', NULL, NULL, '123456', '123@qq.com', NULL, NULL, '2019-09-24 19:27:07');

-- ----------------------------
-- Table structure for via
-- ----------------------------
DROP TABLE IF EXISTS `via`;
CREATE TABLE `via`  (
  `userid` int(11) NOT NULL COMMENT '用户id',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '头像表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for visit
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit`  (
  `VisitID` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问记录编号',
  `VisitURL` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问页地址',
  `VisitIP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者ip',
  `VisitCountry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者所在国家',
  `VisitProvince` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者省份',
  `VisitCity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者城市',
  `VisitHostName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主机名',
  `VisitOS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者操作系统',
  `VisitTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '访问时间',
  PRIMARY KEY (`VisitID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 613 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访问记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of visit
-- ----------------------------
INSERT INTO `visit` VALUES (578, '', '1.1.1.1', '中国', '四川', '成都', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (579, '', '1.1.1.1', '中国', '广东', '广州', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (580, '', '1.1.1.1', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (581, '', '1.1.1.1', '中国', '四川', '成都', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (582, '', '1.1.1.1', '中国', '湖北', '武汉', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (583, '', '1.1.1.1', '中国', '四川', '成都', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (584, '', '1.1.1.1', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (585, '', '1.1.1.1', '中国', '山东', '枣庄', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (586, '', '1.1.1.1', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (587, '', '1.1.1.1', '中国', '山东', '淄博', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (588, '', '1.1.1.1', '中国', '天津', '天津', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (589, '', '1.1.1.1', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (590, '', '1.1.1.1', '中国', '上海', '普陀', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (591, '', '1.1.1.1', '中国', '广东', '广州', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (592, '', '1.1.1.1', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (593, '', '1.1.1.1', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (594, '', '1.1.1.1', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (595, '', '1.1.1.1', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (596, '', '1.1.1.1', '中国', '广东', '揭阳', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (597, '', '1.1.1.1', '中国', '山东', '淄博', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (598, '', '1.1.1.1', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (599, '', '1.1.1.1', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (600, '', '1.1.1.1', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (601, '', '1.1.1.1', '中国', '北京', '北京', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (602, '', '1.1.1.1', '中国', '四川', '成都', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (603, '', '1.1.1.1', '中国', '山东', '滨州', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (604, '', '1.1.1.1', '中国', '北京', '海淀', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (605, '', '1.1.1.1', '中国', '北京', '海淀', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (606, '', '1.1.1.1', '中国', '浙江', '宁波', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (607, '', '1.1.1.1', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (608, '', '1.1.1.1', '中国', '广东', '深圳', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (609, '', '1.1.1.1', '中国', '四川', '成都', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (610, '', '1.1.1.1', '中国', '福建', '福州', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (611, '', '1.1.1.1', '中国', '天津', '天津', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');
INSERT INTO `visit` VALUES (612, '', '1.1.1.1', '中国', '福建', '福州', 'instance-sznooi4f', 'Linux', '2019-09-23 20:09:22');

SET FOREIGN_KEY_CHECKS = 1;
