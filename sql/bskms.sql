/*
Navicat MySQL Data Transfer

Source Server         : one
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : bskms

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2022-05-20 13:58:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for children
-- ----------------------------
DROP TABLE IF EXISTS `children`;
CREATE TABLE `children` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) NOT NULL COMMENT '学生名',
  `sex` int(11) NOT NULL COMMENT '性别:1男，0女',
  `birthday` date NOT NULL COMMENT '出生年月日',
  `class_id` int(11) NOT NULL COMMENT '班级id',
  `hobby` varchar(255) NOT NULL COMMENT '性趣爱好',
  `food` varchar(255) NOT NULL COMMENT '不爱吃的食物',
  `entrance` datetime NOT NULL COMMENT '入学时间',
  `idcard` varchar(18) NOT NULL COMMENT '身份证号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of children
-- ----------------------------
INSERT INTO `children` VALUES ('2', '赵怡然', '0', '2018-05-13', '50', '画画', '毛豆', '2021-05-10 00:00:00', '123456789012345678');
INSERT INTO `children` VALUES ('3', '谢思', '1', '2018-05-13', '50', '唱歌', '毛豆', '2021-05-10 00:00:00', '123456789012345678');
INSERT INTO `children` VALUES ('4', '庄晓宇', '1', '2018-05-13', '50', '唱歌', '毛豆', '2021-05-10 00:00:00', '123456789012345678');
INSERT INTO `children` VALUES ('5', '冯玉', '0', '2018-05-13', '50', '唱歌', '毛豆', '2021-05-10 00:00:00', '123456789012345678');
INSERT INTO `children` VALUES ('6', '木雨', '1', '2018-05-13', '50', '唱歌', '毛豆', '2021-05-10 00:00:00', '123456789012345678');
INSERT INTO `children` VALUES ('7', '舒星', '1', '2018-05-13', '50', '唱歌', '毛豆', '2021-05-10 00:00:00', '123456789012345678');
INSERT INTO `children` VALUES ('8', '左右', '0', '2018-05-13', '50', '唱歌', '毛豆', '2021-05-10 00:00:00', '123456789012345678');
INSERT INTO `children` VALUES ('9', '吴英', '1', '2018-05-13', '50', '唱歌', '毛豆', '2021-05-10 00:00:00', '123456789012345678');
INSERT INTO `children` VALUES ('10', '杨玉', '0', '2018-05-13', '50', '唱歌', '毛豆', '2021-05-10 00:00:00', '123456789012345678');
INSERT INTO `children` VALUES ('11', '陈铭', '1', '2018-05-13', '50', '唱歌', '毛豆', '2021-05-10 00:00:00', '123456789012345678');
INSERT INTO `children` VALUES ('12', '22', '1', '2022-05-18', '50', '22', '22', '2022-05-18 00:00:00', '');
INSERT INTO `children` VALUES ('13', '333', '1', '2022-05-19', '51', '33', '33', '2022-05-18 00:00:00', '333');

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(100) NOT NULL COMMENT '班级名',
  `bzr_id` varchar(20) NOT NULL COMMENT '班主任id',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `stu_count` int(11) NOT NULL COMMENT '学生数',
  `position` varchar(255) NOT NULL COMMENT '班级位置',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('50', '小班', 'dengyun', '', '40', '房间1-1', '2022-05-07 15:42:54');
INSERT INTO `classes` VALUES ('51', '中班', 'hechangfei', '', '42', '房间1-2', '2022-05-10 08:20:53');
INSERT INTO `classes` VALUES ('52', '大班', 'kegonghe', '', '50', '房间1-3', '2022-05-10 08:21:10');
INSERT INTO `classes` VALUES ('53', '学前班', 'ouletian', '', '45', '房间1-4', '2022-05-10 08:21:55');

-- ----------------------------
-- Table structure for cla_stu
-- ----------------------------
DROP TABLE IF EXISTS `cla_stu`;
CREATE TABLE `cla_stu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL COMMENT '班级id',
  `children_id` int(11) NOT NULL COMMENT '学生id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cla_stu
-- ----------------------------

-- ----------------------------
-- Table structure for cla_tea
-- ----------------------------
DROP TABLE IF EXISTS `cla_tea`;
CREATE TABLE `cla_tea` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `class_id` int(11) NOT NULL COMMENT '班级id',
  `tec_id` varchar(20) NOT NULL COMMENT '教师id',
  `subject` varchar(100) NOT NULL COMMENT '科目',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cla_tea
-- ----------------------------
INSERT INTO `cla_tea` VALUES ('1', '1', 'wangjianlin', '数学', '好好学习');
INSERT INTO `cla_tea` VALUES ('2', '2', 'laoshi', '语文', '好好学习天天向上');
INSERT INTO `cla_tea` VALUES ('3', '2', 'laoshi', '55', '');
INSERT INTO `cla_tea` VALUES ('5', '1', '', '语文', 'xxx');
INSERT INTO `cla_tea` VALUES ('6', '1', 'wangjianlin', 'xxx', 'xxxx');
INSERT INTO `cla_tea` VALUES ('7', '1', 'jiazhang', '22', '');
INSERT INTO `cla_tea` VALUES ('8', '51', 'hechangfei', '本科', '');
INSERT INTO `cla_tea` VALUES ('9', '50', 'dengyun', '本科', '');
INSERT INTO `cla_tea` VALUES ('10', '52', 'kegonghe', '本科', '');
INSERT INTO `cla_tea` VALUES ('11', '53', 'ouletian', '本科', '');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) NOT NULL COMMENT '课程名',
  `tea_name` varchar(100) NOT NULL COMMENT '老师名',
  `start` datetime NOT NULL COMMENT '上课时间',
  `end` datetime NOT NULL COMMENT '下课时间',
  `step` int(11) NOT NULL COMMENT '节次',
  `am_pm` int(11) NOT NULL COMMENT '上午下午',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `class_id` int(11) NOT NULL COMMENT '班级id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('7', '语文', '邓芸', '2022-05-10 08:00:00', '2022-05-10 08:30:00', '4', '1', '2022-05-10 08:33:27', '50');

-- ----------------------------
-- Table structure for foot
-- ----------------------------
DROP TABLE IF EXISTS `foot`;
CREATE TABLE `foot` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `breakfast_desc` varchar(255) NOT NULL COMMENT '早餐备注',
  `breakfast` varchar(100) NOT NULL COMMENT '早餐',
  `lunch_desc` varchar(255) NOT NULL COMMENT '午餐备注',
  `lunch` varchar(100) NOT NULL COMMENT '午餐',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of foot
-- ----------------------------
INSERT INTO `foot` VALUES ('10', '5.10.png', '2', '5.1.png', '1', '2022-05-19 21:16:13');

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) NOT NULL COMMENT '物资名',
  `count` int(11) NOT NULL COMMENT '数量',
  `price` decimal(5,2) NOT NULL COMMENT '单价',
  `from` varchar(255) NOT NULL COMMENT '来源',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('2', '草莓', '34', '32.00', '农场', '好吃', '2019-04-19 11:09:58');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` varchar(1000) DEFAULT NULL COMMENT '内容',
  `creat_time` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '新年放假', '本学期将于2022.1.21日后放寒假。', '2022-01-01 12:39:48');
INSERT INTO `notice` VALUES ('2', '幼儿寒假开学时间', '幼儿园将于2022.2.28日周一开学，请各位家长让孩子准时到校。教师请提前两天到校。', '2022-01-28 12:43:01');
INSERT INTO `notice` VALUES ('3', '教师寒假开学时间', '请各位教师于2022.2.26日到校提前为幼儿做开学准备，请持48小时内核酸检测报告入园，核酸检测费用可申请报销。', '2022-02-23 10:49:34');
INSERT INTO `notice` VALUES ('4', '清明节假期安排', '清明假期为4.3-4.5三天，4.6日正常上班、上课。4.2日（周六）需要调休补课，请教师、孩子们届时到校。', '2022-03-31 12:54:03');
INSERT INTO `notice` VALUES ('5', '劳动节假期安排', '五一假期为4.30-5.4五天，5.5日恢复正常教学。5.7日（周六）需要调休补课，请教师、孩子们届时到校。', '2022-04-26 12:56:25');
INSERT INTO `notice` VALUES ('6', '家长会议', '5.9日（周一）请学前班孩子的家长在下午7:20准时参与线上腾讯会议。会议时间预计半小时左右。', '2022-05-07 13:04:03');

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `parent_id` int(11) DEFAULT NULL COMMENT '父页面id',
  `name` varchar(255) DEFAULT NULL COMMENT '页面名称',
  `url` varchar(255) DEFAULT NULL COMMENT '页面地址',
  `level_type` int(11) DEFAULT NULL COMMENT '页面层级',
  `level_index` int(11) DEFAULT NULL COMMENT '页面索引',
  `delete_flag` int(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '是否删除',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`page_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES ('1', '0', '系统设置', null, '0', '10', '0', 'manager');
INSERT INTO `page` VALUES ('2', '1', '用户管理', '/sa/userPage', '1', '22', '0', 'manager');
INSERT INTO `page` VALUES ('3', '1', '页面管理', '/sa/page', '1', '23', '0', 'manager');
INSERT INTO `page` VALUES ('4', '1', '角色管理', '/sa/role', '1', '24', '0', 'manager');
INSERT INTO `page` VALUES ('38', '0', '园务管理', '', '0', '1', '0', 'left_menu_shop');
INSERT INTO `page` VALUES ('39', '38', '老师管理', 'sa/teaMG', '1', '1', '0', null);
INSERT INTO `page` VALUES ('40', '38', '工资管理', 'sa/payMG', '1', '2', '0', '');
INSERT INTO `page` VALUES ('41', '38', '物资管理', 'sa/materialMG', '1', '3', '0', '');
INSERT INTO `page` VALUES ('42', '38', '菜谱管理', 'sa/footMG', '1', '4', '0', '');
INSERT INTO `page` VALUES ('43', '0', '教学管理', '', '0', '2', '0', 'user');
INSERT INTO `page` VALUES ('45', '43', '幼儿管理', 'ls/stu', '1', '2', '0', '');
INSERT INTO `page` VALUES ('46', '43', '公告管理', 'ls/gg', '1', '3', '0', null);
INSERT INTO `page` VALUES ('47', '0', '考勤管理', '', '0', '3', '0', 'left_menu_data');
INSERT INTO `page` VALUES ('48', '47', '教师考勤统计表', 'ls/lskq', '1', '1', '0', '');
INSERT INTO `page` VALUES ('51', '47', '教师考勤统计图', 'ls/kqtj', '1', '4', '0', '');
INSERT INTO `page` VALUES ('52', '38', '班级管理', 'sa/classesPage', '1', '5', '0', '');
INSERT INTO `page` VALUES ('53', '47', '学生考勤统计', 'ls/tongJiXueSheng', '1', '5', '0', '');
INSERT INTO `page` VALUES ('54', '47', '签到签退', 'ls/qianDaoTui', '1', '6', '0', null);
INSERT INTO `page` VALUES ('55', '43', '课程管理', '/ls/course', '1', '4', '0', null);
INSERT INTO `page` VALUES ('56', '0', '家园互动', null, '0', '11', '0', null);
INSERT INTO `page` VALUES ('58', '56', '请假管理', '/sa/qingjia', '1', '12', '0', null);
INSERT INTO `page` VALUES ('59', '56', '教学资源', '/sa/teach', '1', '13', '0', null);

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(20) NOT NULL COMMENT '教师id',
  `base` double(10,2) NOT NULL COMMENT '基本工资',
  `overtime` double(10,2) DEFAULT NULL COMMENT '加班工资',
  `traffic` double(10,2) DEFAULT NULL COMMENT '交通补',
  `meal` double(10,2) DEFAULT NULL COMMENT '餐补',
  `vacation` double(10,2) DEFAULT NULL COMMENT '节假日补贴',
  `bonus` double(10,2) DEFAULT NULL COMMENT '绩效',
  `other` double(10,2) DEFAULT NULL COMMENT '其他',
  `payment_time` date DEFAULT NULL COMMENT '发放时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of pay
-- ----------------------------
INSERT INTO `pay` VALUES ('2', 'hechangfei', '1500.00', '200.00', '20.00', '20.00', '120.00', null, null, '2022-05-07');
INSERT INTO `pay` VALUES ('3', 'kegonghe', '1750.00', '90.00', '20.00', '20.00', '110.00', null, null, '2022-05-07');
INSERT INTO `pay` VALUES ('4', 'ouletian', '1800.00', '300.00', '20.00', '20.00', '100.00', null, null, '2022-05-07');
INSERT INTO `pay` VALUES ('5', 'dengyun', '2100.00', '120.00', '20.00', '20.00', null, '300.00', null, '2022-04-07');
INSERT INTO `pay` VALUES ('6', 'hechangfei', '1500.00', '200.00', '20.00', '20.00', null, '200.00', null, '2022-04-07');
INSERT INTO `pay` VALUES ('7', 'kegonghe', '1750.00', '90.00', '20.00', '20.00', null, '170.00', null, '2022-04-07');
INSERT INTO `pay` VALUES ('8', 'ouletian', '1800.00', '300.00', '20.00', '20.00', null, '150.00', null, '2022-04-07');
INSERT INTO `pay` VALUES ('9', 'dengyun', '1500.00', '120.00', '20.00', '20.00', null, null, null, '2022-03-07');
INSERT INTO `pay` VALUES ('10', 'hechangfei', '1100.00', '200.00', '20.00', '20.00', null, null, null, '2022-03-07');
INSERT INTO `pay` VALUES ('11', 'kegonghe', '1150.00', '90.00', '20.00', '20.00', null, null, null, '2022-03-07');
INSERT INTO `pay` VALUES ('12', 'ouletian', '1100.00', '300.00', '20.00', '20.00', null, null, null, '2022-03-07');
INSERT INTO `pay` VALUES ('13', 'dengyun', '1500.00', '120.00', '20.00', '20.00', '50.00', '300.00', null, '2022-02-07');
INSERT INTO `pay` VALUES ('14', 'hechangfei', '1100.00', '200.00', '20.00', '20.00', '150.00', '200.00', null, '2022-02-07');
INSERT INTO `pay` VALUES ('15', 'kegonghe', '1150.00', '90.00', '20.00', '20.00', '50.00', '170.00', null, '2022-02-07');
INSERT INTO `pay` VALUES ('16', 'ouletian', '1500.00', '300.00', '20.00', '20.00', '100.00', '150.00', null, '2022-02-07');
INSERT INTO `pay` VALUES ('17', 'dengyun', '2000.00', '11.00', null, null, null, null, null, '2022-05-10');

-- ----------------------------
-- Table structure for qingjia
-- ----------------------------
DROP TABLE IF EXISTS `qingjia`;
CREATE TABLE `qingjia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_name` varchar(255) DEFAULT NULL,
  `child_name` varchar(255) DEFAULT NULL,
  `type` bit(1) DEFAULT NULL,
  `apply_date` datetime DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qingjia
-- ----------------------------
INSERT INTO `qingjia` VALUES ('2', '12312', '赵怡然', '', '2022-05-20 00:00:00', '321312', '');
INSERT INTO `qingjia` VALUES ('3', '3123', '冯玉', '', '2022-05-20 00:00:00', '1212', '');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(50) NOT NULL COMMENT '类型名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '园长', '园长');
INSERT INTO `role` VALUES ('2', '教师', '教师');
INSERT INTO `role` VALUES ('3', '家长', '家长');

-- ----------------------------
-- Table structure for role_page
-- ----------------------------
DROP TABLE IF EXISTS `role_page`;
CREATE TABLE `role_page` (
  `rp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `page_id` int(11) DEFAULT NULL COMMENT '页面id',
  PRIMARY KEY (`rp_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=850 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of role_page
-- ----------------------------
INSERT INTO `role_page` VALUES ('1', '1', '1');
INSERT INTO `role_page` VALUES ('2', '1', '2');
INSERT INTO `role_page` VALUES ('3', '1', '3');
INSERT INTO `role_page` VALUES ('4', '1', '4');
INSERT INTO `role_page` VALUES ('753', '2', '43');
INSERT INTO `role_page` VALUES ('754', '2', '45');
INSERT INTO `role_page` VALUES ('755', '2', '46');
INSERT INTO `role_page` VALUES ('756', '2', '55');
INSERT INTO `role_page` VALUES ('757', '2', '47');
INSERT INTO `role_page` VALUES ('758', '2', '48');
INSERT INTO `role_page` VALUES ('759', '2', '51');
INSERT INTO `role_page` VALUES ('760', '2', '54');
INSERT INTO `role_page` VALUES ('825', '3', '38');
INSERT INTO `role_page` VALUES ('826', '3', '42');
INSERT INTO `role_page` VALUES ('827', '3', '43');
INSERT INTO `role_page` VALUES ('828', '3', '46');
INSERT INTO `role_page` VALUES ('829', '3', '55');
INSERT INTO `role_page` VALUES ('830', '1', '38');
INSERT INTO `role_page` VALUES ('831', '1', '40');
INSERT INTO `role_page` VALUES ('832', '1', '41');
INSERT INTO `role_page` VALUES ('833', '1', '42');
INSERT INTO `role_page` VALUES ('834', '1', '52');
INSERT INTO `role_page` VALUES ('835', '1', '43');
INSERT INTO `role_page` VALUES ('836', '1', '45');
INSERT INTO `role_page` VALUES ('837', '1', '46');
INSERT INTO `role_page` VALUES ('838', '1', '55');
INSERT INTO `role_page` VALUES ('839', '1', '47');
INSERT INTO `role_page` VALUES ('840', '1', '48');
INSERT INTO `role_page` VALUES ('841', '1', '51');
INSERT INTO `role_page` VALUES ('842', '1', '54');
INSERT INTO `role_page` VALUES ('843', '1', '56');
INSERT INTO `role_page` VALUES ('844', '1', '58');
INSERT INTO `role_page` VALUES ('845', '1', '59');
INSERT INTO `role_page` VALUES ('846', '2', '56');
INSERT INTO `role_page` VALUES ('848', '2', '58');
INSERT INTO `role_page` VALUES ('849', '2', '59');

-- ----------------------------
-- Table structure for sign
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `kqr_id` varchar(20) NOT NULL COMMENT '考勤人id',
  `state` int(11) NOT NULL COMMENT '状态1正常，2提前，3迟到，4请假，5未知',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述在校情况',
  `type` int(11) NOT NULL COMMENT '考勤类型1.签到。2签退',
  `kqr_type` int(11) NOT NULL COMMENT '考勤人类型1.老师，2.学生，3.家长',
  `sign_in` datetime DEFAULT NULL COMMENT '签到时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES ('23', 'kegonghe', '3', null, '1', '1', '2022-05-09 13:26:23');
INSERT INTO `sign` VALUES ('24', 'kegonghe', '3', null, '1', '1', '2022-05-09 07:23:46');
INSERT INTO `sign` VALUES ('25', 'kegonghe', '1', null, '2', '1', '2022-05-10 13:26:23');
INSERT INTO `sign` VALUES ('26', 'kegonghe', '2', null, '2', '1', '2022-05-10 07:23:46');
INSERT INTO `sign` VALUES ('32', 'dengyun', '1', null, '1', '1', '2022-05-09 01:00:47');
INSERT INTO `sign` VALUES ('33', 'dengyun', '3', null, '1', '1', '2022-05-09 01:00:49');
INSERT INTO `sign` VALUES ('34', 'dengyun', '2', null, '2', '1', '2022-05-10 01:00:51');
INSERT INTO `sign` VALUES ('35', 'dengyun', '1', null, '2', '1', '2022-05-10 01:00:53');
INSERT INTO `sign` VALUES ('37', 'hechangfei', '3', null, '1', '1', '2022-05-09 01:02:07');
INSERT INTO `sign` VALUES ('38', 'hechangfei', '3', null, '1', '1', '2022-05-09 01:02:09');
INSERT INTO `sign` VALUES ('39', 'hechangfei', '2', null, '2', '1', '2022-05-10 01:02:10');
INSERT INTO `sign` VALUES ('40', 'hechangfei', '2', null, '2', '1', '2022-05-10 01:02:12');
INSERT INTO `sign` VALUES ('41', 'ouletian', '1', null, '1', '1', '2022-05-09 01:02:32');
INSERT INTO `sign` VALUES ('42', 'ouletian', '1', null, '1', '1', '2022-05-09 01:02:34');
INSERT INTO `sign` VALUES ('43', 'ouletian', '2', null, '2', '1', '2022-05-10 01:02:35');
INSERT INTO `sign` VALUES ('44', 'ouletian', '2', null, '2', '1', '2022-05-10 01:02:37');
INSERT INTO `sign` VALUES ('45', 'limu', '3', null, '1', '1', '2022-05-10 09:36:06');
INSERT INTO `sign` VALUES ('46', 'limu', '3', null, '1', '1', '2022-05-10 09:36:08');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL COMMENT '主键用户id',
  `user_password` varchar(100) NOT NULL COMMENT '用户密码',
  `user_name` varchar(100) NOT NULL COMMENT '用户昵称',
  `user_tel` varchar(20) NOT NULL COMMENT '电话',
  `user_mail` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `position` varchar(50) DEFAULT NULL COMMENT '职务',
  `dept` varchar(50) DEFAULT NULL COMMENT '部门',
  `user_state` int(11) NOT NULL COMMENT '用户类型：0,超级管理员，1老师，2.家长',
  `user_birthday` date DEFAULT NULL COMMENT '出生日期',
  `user_sex` int(11) NOT NULL COMMENT '性别：1男，0女',
  `user_address` varchar(100) DEFAULT NULL COMMENT '地址',
  `user_idcard` varchar(18) NOT NULL COMMENT '身份证号',
  `account_create_time` datetime NOT NULL COMMENT '创建日期',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('111', 'e10adc3949ba59abbe56e057f20f883e', '111', '11111111111', '', '', '', '1', null, '1', '', '111111111111111145', '2022-05-19 14:29:36');
INSERT INTO `user` VALUES ('222', 'e10adc3949ba59abbe56e057f20f883e', '222', '22222222222', '', '', '', '2', null, '1', '', '222222222222222222', '2022-05-19 14:31:23');
INSERT INTO `user` VALUES ('444', 'e10adc3949ba59abbe56e057f20f883e', '444', '44444444444', '', '', '', '2', null, '1', '', '444444444444444444', '2022-05-19 04:56:23');
INSERT INTO `user` VALUES ('admin', 'e10adc3949ba59abbe56e057f20f883e', '园长', '18888888888', '888@88.com', '幼儿园园长', '', '0', '2019-04-15', '0', '南京', '123456789012345678', '2019-04-15 08:43:35');
INSERT INTO `user` VALUES ('dengyun', 'e10adc3949ba59abbe56e057f20f883e', '邓芸', '18742047722', '340656086@qq.com', '', '', '1', '1991-03-07', '0', '', '210122199103074676', '2022-05-07 06:27:02');
INSERT INTO `user` VALUES ('fengxiao', 'e10adc3949ba59abbe56e057f20f883e', '冯晓', '18742047723', '', '', '', '2', '1996-12-17', '0', '', '210122199612075064', '2022-05-07 06:28:59');
INSERT INTO `user` VALUES ('gujunyi', 'e10adc3949ba59abbe56e057f20f883e', '谷俊毅', '18742047725', '', '', '', '2', '1991-03-12', '0', '', '210122199103074672', '2022-05-07 06:27:02');
INSERT INTO `user` VALUES ('hechangfei', 'e10adc3949ba59abbe56e057f20f883e', '何长飞', '18742047727', '9603086@qq.com', '', '', '1', '1990-07-27', '1', '', '21012219900731492X', '2022-05-07 06:25:05');
INSERT INTO `user` VALUES ('kegonghe', 'e10adc3949ba59abbe56e057f20f883e', '柯功和', '18742047724', '960656086@qq.com', '', '', '1', '1992-06-14', '1', '', '210122199206140257', '2022-05-07 06:30:11');
INSERT INTO `user` VALUES ('liyinghong', 'e10adc3949ba59abbe56e057f20f883e', '李映红', '18742047228', '', '', '', '1', '1991-02-03', '1', '', '210122199103048797', '2022-05-07 15:12:19');
INSERT INTO `user` VALUES ('mufei', 'e10adc3949ba59abbe56e057f20f883e', '木飞', '18742047728', '', '', '', '2', '1999-12-03', '0', '', '210122199612075066', '2022-05-07 06:28:59');
INSERT INTO `user` VALUES ('ouletian', 'e10adc3949ba59abbe56e057f20f883e', '欧乐天', '18742047721', '96064686@qq.com', '', '', '1', '1990-07-09', '1', '', '21012219900711492X', '2022-05-07 06:25:05');
INSERT INTO `user` VALUES ('shude', 'e10adc3949ba59abbe56e057f20f883e', '舒德', '18742047728', '', '', '', '2', '1996-12-14', '0', '', '210122199612075066', '2022-05-07 06:28:59');
INSERT INTO `user` VALUES ('tanxing', 'e10adc3949ba59abbe56e057f20f883e', '谭兴', '18742047723', '', '', '', '2', '1996-12-07', '0', '', '210122199612075064', '2022-05-07 06:28:59');
INSERT INTO `user` VALUES ('wusi', 'e10adc3949ba59abbe56e057f20f883e', '吴思', '18742047726', '', '', '', '2', '1992-06-03', '1', '', '210122199206140253', '2022-05-07 06:30:11');
INSERT INTO `user` VALUES ('yufeixin', 'e10adc3949ba59abbe56e057f20f883e', '于飞新', '18742047725', '', '', '', '2', '1991-03-12', '1', '', '210122199103074672', '2022-05-07 06:27:02');
INSERT INTO `user` VALUES ('zhuangrongfan', 'e10adc3949ba59abbe56e057f20f883e', '庄荣凡', '18742047726', '', '', '', '2', '1992-06-03', '1', '', '210122199206140253', '2022-05-07 06:30:11');

-- ----------------------------
-- Table structure for user_children
-- ----------------------------
DROP TABLE IF EXISTS `user_children`;
CREATE TABLE `user_children` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `user_id` varchar(20) NOT NULL COMMENT '用户id',
  `children_id` int(11) NOT NULL COMMENT '孩子id',
  `is_fa_ma` int(10) unsigned NOT NULL COMMENT '1父亲，0母亲',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_children
-- ----------------------------
INSERT INTO `user_children` VALUES ('1', 'wusi', '1', '1');
INSERT INTO `user_children` VALUES ('2', 'zhuangrongfan ', '2', '1');
INSERT INTO `user_children` VALUES ('3', 'fengxiao', '3', '0');
INSERT INTO `user_children` VALUES ('4', 'mufei', '4', '0');
INSERT INTO `user_children` VALUES ('5', 'shude', '5', '0');
INSERT INTO `user_children` VALUES ('6', 'tanxing', '6', '0');
INSERT INTO `user_children` VALUES ('7', 'gujunyi', '7', '0');
INSERT INTO `user_children` VALUES ('8', 'yufeixin', '5', '1');
INSERT INTO `user_children` VALUES ('103', '222', '6', '1');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `ur_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` varchar(100) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`ur_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', 'admin', '1');
INSERT INTO `user_role` VALUES ('133', 'dengyun', '2');
INSERT INTO `user_role` VALUES ('134', 'kegonghe', '2');
INSERT INTO `user_role` VALUES ('135', 'hechangfei', '2');
INSERT INTO `user_role` VALUES ('136', 'ouletian', '2');
INSERT INTO `user_role` VALUES ('138', 'zhuangrongfan', '3');
INSERT INTO `user_role` VALUES ('139', 'fengxiao', '3');
INSERT INTO `user_role` VALUES ('140', 'mufei', '3');
INSERT INTO `user_role` VALUES ('141', 'shude', '3');
INSERT INTO `user_role` VALUES ('142', 'tanxing', '3');
INSERT INTO `user_role` VALUES ('143', 'gujunyi', '3');
INSERT INTO `user_role` VALUES ('255', 'liyinghong', '2');
INSERT INTO `user_role` VALUES ('268', '444', '3');
INSERT INTO `user_role` VALUES ('272', '111', '2');
INSERT INTO `user_role` VALUES ('273', '222', '3');
INSERT INTO `user_role` VALUES ('276', 'wusi', '3');
INSERT INTO `user_role` VALUES ('277', 'yufeixin', '3');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1', 'dasd', 'maomao.jpg', '2022-05-04 12:19:02', 'a1.mp4');
