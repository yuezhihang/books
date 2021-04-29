/*
 Navicat Premium Data Transfer

 Source Server         : edu
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 29/04/2021 14:16:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'sys_book_base', '图书基本信息', NULL, NULL, 'SysBookBase', 'crud', 'com.ruoyi.system', 'system', 'base', '图书基本信息', 'ruoyi', '0', '/', NULL, 'admin', '2021-04-01 13:58:52', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'sys_instance', '入库申请表', NULL, NULL, 'SysInstance', 'crud', 'com.ruoyi.system', 'system', 'instance', '入库申请', 'ruoyi', '0', '/', NULL, 'admin', '2021-04-06 09:58:12', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'sys_house', '仓库表', NULL, NULL, 'SysHouse', 'crud', 'com.ruoyi.system', 'system', 'house', '仓库', 'ruoyi', '0', '/', NULL, 'admin', '2021-04-09 13:25:21', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'sys_house_book', '', NULL, NULL, 'SysHouseBook', 'crud', 'com.ruoyi.system', 'system', 'book', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2021-04-10 06:48:52', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (9, '2', 'business_id', NULL, 'int(11)', 'Long', 'businessId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-01 13:58:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, '2', 'book_id', '图书编号', 'varchar(32)', 'String', 'bookId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-04-01 13:58:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, '2', 'book_name', '图书名称', 'varchar(128)', 'String', 'bookName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-04-01 13:58:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, '2', 'book_publish', '出版社', 'varchar(64)', 'String', 'bookPublish', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-04-01 13:58:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '2', 'book_author', '图书作者', 'varchar(64)', 'String', 'bookAuthor', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-04-01 13:58:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '2', 'book_price', '图书价格', 'varchar(64)', 'String', 'bookPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-04-01 13:58:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '2', 'flag', '是否售出', 'varchar(2)', 'String', 'flag', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-04-01 13:58:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, '2', 'book_publish_date', '出版日', 'datetime', 'Date', 'bookPublishDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2021-04-01 13:58:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, '3', 'instance_id', '申请流程单子', 'int(11)', 'Long', 'instanceId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-06 09:58:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '3', 'instance_name', '流程名称', 'varchar(64)', 'String', 'instanceName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-04-06 09:58:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '3', 'instance_status', '审批状态(0：审批中，1：已完成，2：被驳回)', 'varchar(64)', 'String', 'instanceStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 3, 'admin', '2021-04-06 09:58:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, '3', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2021-04-06 09:58:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, '3', 'book_id', '书的关联business_id', 'int(11)', 'Long', 'bookId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-04-06 09:58:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, '4', 'business_id', '主键', 'int(11)', 'Long', 'businessId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-09 13:25:21', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '4', 'house_name', '仓库名称', 'varchar(64)', 'String', 'houseName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-04-09 13:25:21', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, '4', 'house_number', '仓库容量', 'int(11)', 'Long', 'houseNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-04-09 13:25:21', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, '4', 'house_books', '仓库中存书量', 'varchar(64)', 'String', 'houseBooks', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-04-09 13:25:21', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, '5', 'house_id', '仓库businessId', 'int(11)', 'Long', 'houseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2021-04-10 06:48:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '5', 'book_id', '书的businessId', 'int(11)', 'Long', 'bookId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-04-10 06:48:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, '5', 'flag', '0已通过 1 未通过', 'varchar(64)', 'String', 'flag', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2021-04-10 06:53:37', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, '5', 'business_id', NULL, 'int(11)', 'Long', 'businessId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, '', '2021-04-10 07:26:22', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001788B17342878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001788B17342878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001788B17342878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'BRQE-5Z325J1619674658500', 1619676972165, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1619674660000, -1, 5, 'PAUSED', 'CRON', 1619674658000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1619674665000, -1, 5, 'PAUSED', 'CRON', 1619674658000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1619674660000, -1, 5, 'PAUSED', 'CRON', 1619674658000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_book_base
-- ----------------------------
DROP TABLE IF EXISTS `sys_book_base`;
CREATE TABLE `sys_book_base`  (
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书编号',
  `book_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书名称',
  `book_publish` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `book_author` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书作者',
  `book_price` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书价格',
  `flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否售出',
  `book_publish_date` datetime NULL DEFAULT NULL COMMENT '出版日',
  PRIMARY KEY (`business_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图书基本信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_book_base
-- ----------------------------
INSERT INTO `sys_book_base` VALUES (18, 'A1', '孙子兵法', '', '', '100', '0', NULL);
INSERT INTO `sys_book_base` VALUES (19, 'A2', '老子', '', '', '100', '0', NULL);
INSERT INTO `sys_book_base` VALUES (20, 'A3', '庄子', '', '', '100', '0', NULL);
INSERT INTO `sys_book_base` VALUES (21, 'A4', '逍遥游', '', '', '100', '0', NULL);
INSERT INTO `sys_book_base` VALUES (22, 'A5', '诗经', '', '', '100', '0', NULL);
INSERT INTO `sys_book_base` VALUES (23, 'A6', '论语', '', '', '100', '0', NULL);
INSERT INTO `sys_book_base` VALUES (24, 'A7', '东周列国志', '', '', '100', '0', NULL);
INSERT INTO `sys_book_base` VALUES (25, 'A8', '九章', '', '', '100', '0', NULL);
INSERT INTO `sys_book_base` VALUES (41, '41', '测试啊', '啊', '测试', '1', '0', NULL);
INSERT INTO `sys_book_base` VALUES (42, '42', '1111', '11111', '11', '11', '0', NULL);
INSERT INTO `sys_book_base` VALUES (43, '43', '44', '啊啊', '11', '', '0', NULL);
INSERT INTO `sys_book_base` VALUES (44, '11', '111', '11', '11', '11', NULL, NULL);
INSERT INTO `sys_book_base` VALUES (45, 'C1', '测', '测', '侧嗯嗯', '111', '0', NULL);
INSERT INTO `sys_book_base` VALUES (46, '2', '2', '2', '2', '2', '0', NULL);
INSERT INTO `sys_book_base` VALUES (47, '3', '3', '3', '3', '3', '0', NULL);

-- ----------------------------
-- Table structure for sys_book_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_book_user`;
CREATE TABLE `sys_book_user`  (
  `business_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书编号',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工编号',
  PRIMARY KEY (`business_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图书与人员关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_book_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-04-01 09:40:57', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-04-01 09:40:57', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-04-01 09:40:57', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-04-01 09:40:57', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-04-01 09:40:57', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-04-01 09:40:57', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2021-04-01 09:40:57', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-04-01 09:40:57', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2021-04-01 09:40:57', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '书店书务信息管理系统', 0, '111', '15888888888', '11@qq.com', '0', '0', 'admin', '2021-04-01 09:40:57', 'admin', '2021-04-29 13:55:42');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '天津小书屋', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-04-01 09:40:57', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 100, '0,100', '超级管理员', 1, 'ltz', '15888888888', 'ltz@qq.com', '0', '0', 'admin', '2021-04-01 09:40:57', 'admin', '2021-04-29 13:47:13');
INSERT INTO `sys_dept` VALUES (105, 100, '0,100', '测试', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2021-04-01 09:40:57', 'admin', '2021-04-29 13:46:34');
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '仓库管理员', 0, '刘库管', '', '', '0', '0', 'admin', '2021-04-01 17:54:10', 'admin', '2021-04-29 13:50:14');
INSERT INTO `sys_dept` VALUES (201, 100, '0,100', '书务管理员', 0, '1', '', '', '0', '0', 'admin', '2021-04-06 09:49:48', 'admin', '2021-04-29 13:50:37');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 0, '审批中', '0', 'instance_status', NULL, NULL, 'N', '0', '', NULL, '', NULL, '审批中');
INSERT INTO `sys_dict_data` VALUES (31, 1, '已完成', '1', 'instance_status', NULL, NULL, 'N', '0', '', NULL, '', NULL, '已完成');
INSERT INTO `sys_dict_data` VALUES (32, 2, '已驳回', '2', 'instance_status', NULL, NULL, 'N', '0', '', NULL, '', NULL, '已驳回');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_house
-- ----------------------------
DROP TABLE IF EXISTS `sys_house`;
CREATE TABLE `sys_house`  (
  `business_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `house_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `house_number` int(11) NULL DEFAULT NULL COMMENT '仓库容量',
  `house_books` int(64) NULL DEFAULT NULL COMMENT '仓库中存书量',
  PRIMARY KEY (`business_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仓库表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_house
-- ----------------------------
INSERT INTO `sys_house` VALUES (3, '测试', 100, 6);

-- ----------------------------
-- Table structure for sys_house_book
-- ----------------------------
DROP TABLE IF EXISTS `sys_house_book`;
CREATE TABLE `sys_house_book`  (
  `house_id` int(11) NULL DEFAULT NULL COMMENT '仓库businessId',
  `book_id` int(11) NULL DEFAULT NULL COMMENT '书的businessId',
  `flag` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0已通过 1 未通过',
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`business_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_house_book
-- ----------------------------
INSERT INTO `sys_house_book` VALUES (3, 41, '0', 11);
INSERT INTO `sys_house_book` VALUES (3, 42, '0', 12);
INSERT INTO `sys_house_book` VALUES (3, 43, '0', 13);
INSERT INTO `sys_house_book` VALUES (3, 44, '1', 14);
INSERT INTO `sys_house_book` VALUES (3, 45, '0', 15);
INSERT INTO `sys_house_book` VALUES (3, 46, '0', 16);
INSERT INTO `sys_house_book` VALUES (3, 47, '0', 17);

-- ----------------------------
-- Table structure for sys_instance
-- ----------------------------
DROP TABLE IF EXISTS `sys_instance`;
CREATE TABLE `sys_instance`  (
  `instance_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请流程单子',
  `instance_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `instance_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批状态(0：审批中，1：已完成，2：被驳回)',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `book_id` int(11) NULL DEFAULT NULL COMMENT '书的关联business_id',
  PRIMARY KEY (`instance_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '入库申请表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_instance
-- ----------------------------
INSERT INTO `sys_instance` VALUES (23, NULL, '1', '2021-04-10 08:24:17', 41);
INSERT INTO `sys_instance` VALUES (24, NULL, '1', '2021-04-10 08:26:55', 42);
INSERT INTO `sys_instance` VALUES (25, NULL, '1', '2021-04-10 08:29:51', 43);
INSERT INTO `sys_instance` VALUES (26, NULL, '1', '2021-04-10 08:30:24', 44);
INSERT INTO `sys_instance` VALUES (27, NULL, '1', '2021-04-23 14:10:23', 45);
INSERT INTO `sys_instance` VALUES (28, NULL, '1', '2021-04-29 13:29:16', 46);
INSERT INTO `sys_instance` VALUES (29, NULL, '1', '2021-04-29 13:29:47', 47);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-04-01 09:40:57', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 380 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-01 09:43:03');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-01 17:57:21');
INSERT INTO `sys_logininfor` VALUES (102, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-01 17:57:42');
INSERT INTO `sys_logininfor` VALUES (103, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-01 17:57:47');
INSERT INTO `sys_logininfor` VALUES (104, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-01 17:58:08');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-01 17:58:11');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-01 17:58:15');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-01 18:00:04');
INSERT INTO `sys_logininfor` VALUES (108, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-01 18:00:12');
INSERT INTO `sys_logininfor` VALUES (109, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-04-01 18:00:15');
INSERT INTO `sys_logininfor` VALUES (110, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-01 18:00:23');
INSERT INTO `sys_logininfor` VALUES (111, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-01 18:00:26');
INSERT INTO `sys_logininfor` VALUES (112, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-01 18:00:46');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-01 18:00:49');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-01 18:00:52');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-01 18:05:45');
INSERT INTO `sys_logininfor` VALUES (116, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-01 18:05:51');
INSERT INTO `sys_logininfor` VALUES (117, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-01 18:05:59');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-01 18:06:01');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-01 18:06:06');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-01 18:36:23');
INSERT INTO `sys_logininfor` VALUES (121, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-01 18:36:28');
INSERT INTO `sys_logininfor` VALUES (122, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-01 18:36:33');
INSERT INTO `sys_logininfor` VALUES (123, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-01 18:37:08');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-01 18:37:12');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-01 18:37:15');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 16:23:34');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-02 16:33:33');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 16:39:56');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 09:30:42');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 10:06:59');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 10:31:17');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 10:34:50');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 10:37:04');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 10:37:06');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 10:39:46');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 11:27:27');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 11:27:29');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 13:02:09');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 13:03:28');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 13:04:17');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 13:49:29');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 14:01:31');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 14:20:52');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 14:20:52');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 14:20:56');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 14:25:36');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 14:27:17');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 14:40:52');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 14:41:49');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-06 14:48:05');
INSERT INTO `sys_logininfor` VALUES (151, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 14:48:09');
INSERT INTO `sys_logininfor` VALUES (152, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 14:48:12');
INSERT INTO `sys_logininfor` VALUES (153, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-06 14:48:19');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 14:48:23');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 14:48:29');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 14:48:35');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-06 14:53:04');
INSERT INTO `sys_logininfor` VALUES (158, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 14:53:07');
INSERT INTO `sys_logininfor` VALUES (159, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 14:53:11');
INSERT INTO `sys_logininfor` VALUES (160, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 14:53:13');
INSERT INTO `sys_logininfor` VALUES (161, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-06 14:53:20');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 14:53:21');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 14:53:24');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-06 14:55:31');
INSERT INTO `sys_logininfor` VALUES (165, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 14:55:33');
INSERT INTO `sys_logininfor` VALUES (166, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 14:55:35');
INSERT INTO `sys_logininfor` VALUES (167, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 14:55:38');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 14:56:25');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 14:56:28');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 15:22:18');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 15:46:31');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 15:52:55');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 15:52:58');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 15:55:16');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-06 15:57:41');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-06 15:57:43');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-07 10:12:34');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 17:53:54');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 18:52:10');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 18:56:09');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 18:59:15');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 19:14:31');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 19:17:08');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 19:21:57');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 19:28:58');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-08 19:33:54');
INSERT INTO `sys_logininfor` VALUES (187, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-08 19:34:08');
INSERT INTO `sys_logininfor` VALUES (188, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-08 19:34:12');
INSERT INTO `sys_logininfor` VALUES (189, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-08 19:34:22');
INSERT INTO `sys_logininfor` VALUES (190, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-04-08 19:34:26');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 19:34:30');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-08 19:34:45');
INSERT INTO `sys_logininfor` VALUES (193, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-08 19:34:48');
INSERT INTO `sys_logininfor` VALUES (194, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 19:34:49');
INSERT INTO `sys_logininfor` VALUES (195, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-08 19:35:05');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 19:36:54');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-08 19:37:28');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 19:37:31');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 19:39:04');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 19:40:22');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 19:41:39');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 19:44:29');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 19:46:46');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-09 13:23:53');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-09 13:34:37');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-10 05:51:11');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 05:51:16');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 06:12:22');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 06:30:37');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 06:46:09');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 06:48:44');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 06:59:23');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 07:07:49');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 07:10:06');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 07:14:47');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-10 07:26:05');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 07:26:08');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 07:40:50');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-10 07:47:50');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 07:47:52');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 07:49:30');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-10 07:55:32');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 07:55:34');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 08:23:12');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 08:26:42');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 08:35:46');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-10 09:08:07');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 09:08:11');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 10:34:24');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 11:05:57');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-10 11:20:37');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-10 11:20:41');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-10 11:20:47');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 11:20:49');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 11:42:47');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2021-04-10 14:04:31');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-10 14:04:42');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误2次', '2021-04-10 14:04:45');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 14:04:52');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 15:25:28');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 16:02:31');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 16:07:24');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-10 16:09:31');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 16:09:34');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 16:11:15');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 16:29:43');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 16:30:37');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 16:59:58');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 17:00:46');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 17:02:10');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-10 17:06:45');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 17:06:48');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 17:21:47');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 17:26:44');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 17:27:29');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 17:36:00');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 18:36:34');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-10 18:40:30');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 09:17:03');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 09:24:29');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 10:26:35');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 10:29:06');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 10:36:09');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 10:36:14');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 10:40:17');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 10:44:42');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 10:49:19');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 10:52:27');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 10:58:02');
INSERT INTO `sys_logininfor` VALUES (270, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 10:58:05');
INSERT INTO `sys_logininfor` VALUES (271, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 10:58:08');
INSERT INTO `sys_logininfor` VALUES (272, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 10:58:16');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 10:58:17');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 10:58:22');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 10:58:35');
INSERT INTO `sys_logininfor` VALUES (276, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 10:58:41');
INSERT INTO `sys_logininfor` VALUES (277, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 10:58:43');
INSERT INTO `sys_logininfor` VALUES (278, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 10:58:56');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 10:58:58');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 10:59:05');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:02:06');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 11:02:09');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 11:02:10');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 11:02:13');
INSERT INTO `sys_logininfor` VALUES (285, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:02:19');
INSERT INTO `sys_logininfor` VALUES (286, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:03:01');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:03:04');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:03:57');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:04:05');
INSERT INTO `sys_logininfor` VALUES (290, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:04:12');
INSERT INTO `sys_logininfor` VALUES (291, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:04:22');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 11:04:25');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:04:28');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:04:47');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 11:04:50');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:04:53');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:04:59');
INSERT INTO `sys_logininfor` VALUES (298, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:05:06');
INSERT INTO `sys_logininfor` VALUES (299, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:05:23');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:05:26');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 11:06:41');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:06:43');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:07:11');
INSERT INTO `sys_logininfor` VALUES (304, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:07:15');
INSERT INTO `sys_logininfor` VALUES (305, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 11:08:39');
INSERT INTO `sys_logininfor` VALUES (306, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:08:41');
INSERT INTO `sys_logininfor` VALUES (307, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:09:24');
INSERT INTO `sys_logininfor` VALUES (308, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:09:55');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 11:10:05');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:10:08');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:12:21');
INSERT INTO `sys_logininfor` VALUES (312, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 11:12:25');
INSERT INTO `sys_logininfor` VALUES (313, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:12:27');
INSERT INTO `sys_logininfor` VALUES (314, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:13:36');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:13:39');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:17:37');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:17:40');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:17:50');
INSERT INTO `sys_logininfor` VALUES (319, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:17:56');
INSERT INTO `sys_logininfor` VALUES (320, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:18:42');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:18:50');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:20:12');
INSERT INTO `sys_logininfor` VALUES (323, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:20:17');
INSERT INTO `sys_logininfor` VALUES (324, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:20:34');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:20:38');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:22:34');
INSERT INTO `sys_logininfor` VALUES (327, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:22:41');
INSERT INTO `sys_logininfor` VALUES (328, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:23:25');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:23:28');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:29:13');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:29:19');
INSERT INTO `sys_logininfor` VALUES (332, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:29:24');
INSERT INTO `sys_logininfor` VALUES (333, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:30:25');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 11:30:27');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:30:28');
INSERT INTO `sys_logininfor` VALUES (336, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:31:54');
INSERT INTO `sys_logininfor` VALUES (337, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:32:59');
INSERT INTO `sys_logininfor` VALUES (338, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 11:33:06');
INSERT INTO `sys_logininfor` VALUES (339, '刘库管', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 11:33:19');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-20 18:23:48');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-20 18:24:56');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-20 18:25:49');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-20 18:25:53');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-20 19:31:45');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-20 19:39:28');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-23 14:10:02');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-23 14:15:41');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-23 14:20:02');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-23 14:21:29');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-28 15:26:05');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-28 15:43:26');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-28 16:03:37');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-28 16:03:41');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-28 16:19:08');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-28 16:21:47');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-28 16:21:55');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-28 16:22:31');
INSERT INTO `sys_logininfor` VALUES (358, 'false', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-28 16:23:17');
INSERT INTO `sys_logininfor` VALUES (359, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-28 16:23:25');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-28 16:29:19');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-28 16:29:47');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-28 16:29:50');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-28 16:30:13');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-28 16:30:15');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-28 16:42:43');
INSERT INTO `sys_logininfor` VALUES (366, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-28 16:42:56');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-28 16:43:03');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-28 16:43:13');
INSERT INTO `sys_logininfor` VALUES (369, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-28 16:46:16');
INSERT INTO `sys_logininfor` VALUES (370, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-29 13:26:11');
INSERT INTO `sys_logininfor` VALUES (371, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-29 13:32:25');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-29 13:40:22');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-29 13:53:11');
INSERT INTO `sys_logininfor` VALUES (374, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-29 13:53:30');
INSERT INTO `sys_logininfor` VALUES (375, '刘审批', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-29 13:53:44');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-29 13:53:47');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-29 13:53:52');
INSERT INTO `sys_logininfor` VALUES (378, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-29 14:02:57');
INSERT INTO `sys_logininfor` VALUES (379, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-29 14:09:59');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2029 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-04-01 09:40:57', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 6, '#', 'menuItem', 'M', '1', '1', '', 'fa fa-video-camera', 'admin', '2021-04-01 09:40:57', 'admin', '2021-04-06 14:44:34', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', 'menuItem', 'M', '1', '1', '', 'fa fa-bars', 'admin', '2021-04-01 09:40:57', 'admin', '2021-04-12 10:54:54', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '---', 0, 4, 'http://ruoyi.vip', 'menuBlank', 'C', '1', '1', '', 'fa fa-location-arrow', 'admin', '2021-04-01 09:40:57', 'admin', '2021-04-12 10:54:35', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-04-01 09:40:57', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-04-01 09:40:57', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-04-01 09:40:57', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', 'menuItem', 'C', '1', '0', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-04-01 09:40:57', 'admin', '2021-04-29 13:55:58', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', 'menuItem', 'C', '1', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-04-01 09:40:57', 'admin', '2021-04-12 10:53:51', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-04-01 09:40:57', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', 'menuItem', 'C', '1', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-04-01 09:40:57', 'admin', '2021-04-12 10:54:06', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', 'menuItem', 'C', '1', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-04-01 09:40:57', 'admin', '2021-04-12 10:54:22', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-04-01 09:40:57', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2021-04-01 09:40:57', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2021-04-01 09:40:57', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2021-04-01 09:40:57', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2021-04-01 09:40:57', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2021-04-01 09:40:57', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2021-04-01 09:40:57', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2021-04-01 09:40:57', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', 'menuItem', 'C', '1', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2021-04-01 09:40:57', 'admin', '2021-04-06 14:45:12', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-04-01 09:40:57', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-04-01 09:40:57', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '书籍信息', 0, 0, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-book', 'admin', '2021-04-01 18:04:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '书籍基本信息', 2001, 0, '/system/base', 'menuItem', 'C', '0', '0', 'system:base:view', 'fa fa-book', 'admin', '2021-04-01 18:04:38', 'admin', '2021-04-09 13:32:35', '');
INSERT INTO `sys_menu` VALUES (2003, '书籍信息查询', 2002, 0, '#', 'menuItem', 'F', '0', '1', 'system:base:list', '#', 'admin', '2021-04-01 18:33:11', 'admin', '2021-04-01 18:34:19', '');
INSERT INTO `sys_menu` VALUES (2004, '书籍信息导出', 2002, 2, '#', 'menuItem', 'F', '0', '1', 'system:base:export', '#', 'admin', '2021-04-01 18:34:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '书籍信息新增', 2002, 1, '#', 'menuItem', 'F', '0', '1', 'system:base:add', '#', 'admin', '2021-04-01 18:35:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '书籍信息修改', 2002, 3, '#', 'menuItem', 'F', '0', '1', 'system:base:edit', '#', 'admin', '2021-04-01 18:35:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '书籍信息删除', 2002, 4, '#', 'menuItem', 'F', '0', '1', 'system:base:remove', '#', 'admin', '2021-04-01 18:36:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '入库申请', 0, 2, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-download', 'admin', '2021-04-06 09:51:21', 'admin', '2021-04-06 09:51:33', '');
INSERT INTO `sys_menu` VALUES (2009, '图书入库申请', 2008, 0, '/system/instance', 'menuItem', 'C', '0', '0', 'system:instance:view', '#', 'admin', '2021-04-06 10:07:37', 'admin', '2021-04-09 13:32:27', '');
INSERT INTO `sys_menu` VALUES (2010, '图书入库查询', 2009, 0, '#', 'menuItem', 'F', '0', '1', 'system:instance:list', '#', 'admin', '2021-04-06 14:49:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '图书入库导出', 2009, 1, '#', 'menuItem', 'F', '0', '1', 'system:instance:export', '#', 'admin', '2021-04-06 14:50:25', 'admin', '2021-04-06 14:51:04', '');
INSERT INTO `sys_menu` VALUES (2012, '图书入库新增', 2009, 2, '#', 'menuItem', 'F', '0', '1', 'system:instance:add', '#', 'admin', '2021-04-06 14:51:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '图书入库修改', 2009, 3, '#', 'menuItem', 'F', '0', '1', 'system:instance:edit', '#', 'admin', '2021-04-06 14:52:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '图书入库删除', 2009, 4, '#', 'menuItem', 'F', '0', '1', 'system:instance:remove', '#', 'admin', '2021-04-06 14:52:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '图书入库审批', 2008, 1, '/system/instancedeal', 'menuItem', 'C', '0', '0', 'system:instancedeal:view', '#', 'admin', '2021-04-06 15:45:29', 'admin', '2021-04-12 11:03:44', '');
INSERT INTO `sys_menu` VALUES (2017, '仓库管理', 0, 2, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-institution', 'admin', '2021-04-09 13:30:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '仓库管理', 2017, 1, '/system/house', 'menuItem', 'C', '0', '1', 'system:house:view', 'fa fa-bank', 'admin', '2021-04-09 13:31:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '仓库-书籍基本信息', 2017, 1, '/system/housebase', 'menuItem', 'C', '1', '1', 'system:house:views', 'fa fa-american-sign-language-interpreting', 'admin', '2021-04-10 16:06:30', 'admin', '2021-04-12 11:31:30', '');
INSERT INTO `sys_menu` VALUES (2020, '图书入库申请查询', 2016, 0, '#', 'menuItem', 'F', '0', '1', 'system:instancedeal:list', '#', 'admin', '2021-04-12 11:00:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '图书入库审批删除', 2016, 1, '#', 'menuItem', 'F', '0', '1', 'system:instancedeal:remove', '#', 'admin', '2021-04-12 11:01:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '图书入库审批-审批', 2016, 2, '#', 'menuItem', 'F', '0', '1', 'system:instancedeal:edit', '#', 'admin', '2021-04-12 11:02:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '仓库管理-查询', 2018, 0, '#', 'menuItem', 'F', '0', '1', 'system:house:list', '#', 'admin', '2021-04-12 11:15:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '仓库管理-导出', 2018, 1, '#', 'menuItem', 'F', '0', '1', 'system:house:export', '#', 'admin', '2021-04-12 11:15:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '仓库管理-新增', 2018, 1, '#', 'menuItem', 'F', '0', '1', 'system:house:add', '#', 'admin', '2021-04-12 11:16:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '仓库管理-删除', 2018, 3, '#', 'menuItem', 'F', '0', '1', 'system:house:remove', '#', 'admin', '2021-04-12 11:17:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '仓库管理修改', 2018, 4, '#', 'menuItem', 'F', '0', '1', 'system:house:edit', '#', 'admin', '2021-04-12 11:17:29', 'admin', '2021-04-12 11:19:43', '');
INSERT INTO `sys_menu` VALUES (2028, '仓库-书籍基本信息', 2019, 0, '#', 'menuItem', 'F', '0', '1', 'system:house:lists', '#', 'admin', '2021-04-12 11:22:12', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 385 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"loginName\":[\"ry\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 09:46:48');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_book_base\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 10:06:16');
INSERT INTO `sys_oper_log` VALUES (102, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"小刘同学\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 10:07:55');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/sys_book_base', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-01 10:19:13');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/sys_book_base', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-01 10:19:21');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍基本信息\"],\"url\":[\"/system/base\"],\"target\":[\"menuItem\"],\"perms\":[\"a1\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 10:28:13');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍基本信息\"],\"url\":[\"/system/base\"],\"target\":[\"menuItem\"],\"perms\":[\"system:base:view\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 10:31:48');
INSERT INTO `sys_oper_log` VALUES (107, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"111\"],\"bookName\":[\"111\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookPublish\":[\"11\"],\"bookAuthor\":[\"111\"],\"delFlag\":[\"111\"],\"flag\":[\"11\"]}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'del_flag\' at row 1\r\n### The error may exist in file [E:\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\SysBookBaseMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysBookBaseMapper.insertSysBookBase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_book_base          ( book_id,             book_name,             book_publish_date,             book_publish,             book_author,             del_flag,             flag )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'del_flag\' at row 1\n; Data truncation: Data too long for column \'del_flag\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'del_flag\' at row 1', '2021-04-01 10:32:18');
INSERT INTO `sys_oper_log` VALUES (108, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"111\"],\"bookName\":[\"111\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookPublish\":[\"11\"],\"bookAuthor\":[\"111\"],\"delFlag\":[\"111\"],\"flag\":[\"11\"]}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'del_flag\' at row 1\r\n### The error may exist in file [E:\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\SysBookBaseMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysBookBaseMapper.insertSysBookBase-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_book_base          ( book_id,             book_name,             book_publish_date,             book_publish,             book_author,             del_flag,             flag )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'del_flag\' at row 1\n; Data truncation: Data too long for column \'del_flag\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'del_flag\' at row 1', '2021-04-01 10:32:46');
INSERT INTO `sys_oper_log` VALUES (109, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"1232\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookPublish\":[\"1231\"],\"bookAuthor\":[\"3123\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 10:36:54');
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/101', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"存在下级部门,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-04-01 10:54:32');
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/103', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"部门存在用户,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-04-01 10:54:38');
INSERT INTO `sys_oper_log` VALUES (112, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/104', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 10:54:44');
INSERT INTO `sys_oper_log` VALUES (113, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/106', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 10:54:54');
INSERT INTO `sys_oper_log` VALUES (114, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/107', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 10:54:58');
INSERT INTO `sys_oper_log` VALUES (115, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/108', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 10:55:05');
INSERT INTO `sys_oper_log` VALUES (116, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/109', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 10:55:10');
INSERT INTO `sys_oper_log` VALUES (117, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/102', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 10:55:15');
INSERT INTO `sys_oper_log` VALUES (118, '图书基本信息', 3, 'com.ruoyi.web.controller.system.SysBookBaseController.remove()', 'POST', 1, 'admin', '研发部门', '/system/base/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 10:55:48');
INSERT INTO `sys_oper_log` VALUES (119, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 10:56:55');
INSERT INTO `sys_oper_log` VALUES (120, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"2\"],\"bookName\":[\"2\"],\"bookPublishDate\":[\"2021-04-02\"],\"bookPublish\":[\"2\"],\"bookAuthor\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 10:57:04');
INSERT INTO `sys_oper_log` VALUES (121, '图书基本信息', 3, 'com.ruoyi.web.controller.system.SysBookBaseController.remove()', 'POST', 1, 'admin', '研发部门', '/system/base/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 11:00:03');
INSERT INTO `sys_oper_log` VALUES (122, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"3\"],\"bookName\":[\"3\"],\"bookPublishDate\":[\"2021-04-03\"],\"bookPublish\":[\"3\"],\"bookAuthor\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 11:01:09');
INSERT INTO `sys_oper_log` VALUES (123, '图书基本信息', 3, 'com.ruoyi.web.controller.system.SysBookBaseController.remove()', 'POST', 1, 'admin', '研发部门', '/system/base/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3,4\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_book_base set del_flag = \'2\'\n            where business_id = \'4\'\' at line 4\r\n### The error may exist in file [E:\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\SysBookBaseMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysBookBaseMapper.deleteSysBookBaseByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_book_base set del_flag = \'2\'             where business_id = ?          ;              update sys_book_base set del_flag = \'2\'             where business_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_book_base set del_flag = \'2\'\n            where business_id = \'4\'\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_book_base set del_flag = \'2\'\n            where business_id = \'4\'\' at line 4', '2021-04-01 11:01:13');
INSERT INTO `sys_oper_log` VALUES (124, '图书基本信息', 3, 'com.ruoyi.web.controller.system.SysBookBaseController.remove()', 'POST', 1, 'admin', '研发部门', '/system/base/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3,4\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_book_base set del_flag = \'2\'\n            where business_id = \'4\'\' at line 4\r\n### The error may exist in file [E:\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\SysBookBaseMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysBookBaseMapper.deleteSysBookBaseByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_book_base set del_flag = \'2\'             where business_id = ?          ;              update sys_book_base set del_flag = \'2\'             where business_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_book_base set del_flag = \'2\'\n            where business_id = \'4\'\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'update sys_book_base set del_flag = \'2\'\n            where business_id = \'4\'\' at line 4', '2021-04-01 11:06:17');
INSERT INTO `sys_oper_log` VALUES (125, '图书基本信息', 3, 'com.ruoyi.web.controller.system.SysBookBaseController.remove()', 'POST', 1, 'admin', '研发部门', '/system/base/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3,4\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'; \n             \'4\'\n         )\' at line 4\r\n### The error may exist in file [E:\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\SysBookBaseMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysBookBaseMapper.deleteSysBookBaseByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_book_base set del_flag = \'2\' where business_id in           (                ?          ;               ?          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'; \n             \'4\'\n         )\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'; \n             \'4\'\n         )\' at line 4', '2021-04-01 11:08:58');
INSERT INTO `sys_oper_log` VALUES (126, '图书基本信息', 3, 'com.ruoyi.web.controller.system.SysBookBaseController.remove()', 'POST', 1, 'admin', '研发部门', '/system/base/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3,4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 11:09:45');
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 13:58:46');
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_book_base\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 13:58:52');
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/sys_book_base', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-01 13:59:07');
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/sys_book_base', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-01 14:03:35');
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/sys_book_base', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-01 14:03:38');
INSERT INTO `sys_oper_log` VALUES (132, '图书基本信息', 2, 'com.ruoyi.web.controller.system.SysBookBaseController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/base/edit', '127.0.0.1', '内网IP', '{\"businessId\":[\"2\"],\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"凄凄切切\"],\"flag\":[\"0\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 14:07:23');
INSERT INTO `sys_oper_log` VALUES (133, '图书基本信息', 2, 'com.ruoyi.web.controller.system.SysBookBaseController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/base/edit', '127.0.0.1', '内网IP', '{\"businessId\":[\"2\"],\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"flag\":[\"0\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 14:07:33');
INSERT INTO `sys_oper_log` VALUES (134, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"21\"],\"bookName\":[\"212\"],\"bookPublish\":[\"313\"],\"bookAuthor\":[\"13123\"],\"bookPrice\":[\"12312\"],\"bookPublishDate\":[\"1899-12-07\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 14:21:43');
INSERT INTO `sys_oper_log` VALUES (135, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"仓库小王子\"],\"orderNum\":[\"0\"],\"leader\":[\"刘库管\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 17:54:10');
INSERT INTO `sys_oper_log` VALUES (136, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"200\"],\"userName\":[\"刘库管\"],\"deptName\":[\"仓库小王子\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"刘库管\"],\"sex\":[\"0\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 17:55:16');
INSERT INTO `sys_oper_log` VALUES (137, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"200\"],\"userName\":[\"刘库管\"],\"dept.deptName\":[\"仓库小王子\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"刘库管\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 17:55:23');
INSERT INTO `sys_oper_log` VALUES (138, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"仓库管理员\"],\"roleKey\":[\"manager\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"仓库管理员\"],\"menuIds\":[\"2000,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 17:57:00');
INSERT INTO `sys_oper_log` VALUES (139, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"200\"],\"userName\":[\"刘库管\"],\"dept.deptName\":[\"仓库小王子\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"刘库管\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 17:57:14');
INSERT INTO `sys_oper_log` VALUES (140, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '研发', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"仓库管理员\"],\"roleKey\":[\"manager\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,200\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 17:59:22');
INSERT INTO `sys_oper_log` VALUES (141, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'POST', 1, 'admin', '研发', '/system/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:02:38');
INSERT INTO `sys_oper_log` VALUES (142, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'POST', 1, 'admin', '研发', '/system/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:02:40');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"书籍信息\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:04:01');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍基本信息\"],\"url\":[\"/system/base\"],\"target\":[\"menuItem\"],\"perms\":[\"a1\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:04:38');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发', '/system/menu/remove/2000', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"菜单已分配,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-04-01 18:04:50');
INSERT INTO `sys_oper_log` VALUES (146, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"仓库管理员\"],\"roleKey\":[\"manager\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"仓库管理员\"],\"menuIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:05:00');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发', '/system/menu/remove/2000', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:05:09');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍基本信息\"],\"url\":[\"/system/base\"],\"target\":[\"menuItem\"],\"perms\":[\"system:base:view\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:05:18');
INSERT INTO `sys_oper_log` VALUES (149, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"仓库管理员\"],\"roleKey\":[\"manager\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"仓库管理员\"],\"menuIds\":[\"2001,2002\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:05:43');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"F\"],\"menuName\":[\"书籍信息查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:base:list\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:33:11');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2003\"],\"parentId\":[\"2002\"],\"menuType\":[\"F\"],\"menuName\":[\"书籍信息查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:base:list\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:34:19');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"F\"],\"menuName\":[\"书籍信息导出\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:base:export\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:34:52');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"F\"],\"menuName\":[\"书籍信息新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:base:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:35:21');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"F\"],\"menuName\":[\"书籍信息修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:base:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:35:45');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2002\"],\"menuType\":[\"F\"],\"menuName\":[\"书籍信息删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:base:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:36:10');
INSERT INTO `sys_oper_log` VALUES (156, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"仓库管理员\"],\"roleKey\":[\"manager\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"仓库管理员\"],\"menuIds\":[\"2001,2002,2003,2005,2004,2006,2007\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-01 18:36:21');
INSERT INTO `sys_oper_log` VALUES (157, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '研发', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"200\"],\"deptName\":[\"入库审批员\"],\"orderNum\":[\"0\"],\"leader\":[\"1\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 09:49:48');
INSERT INTO `sys_oper_log` VALUES (158, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"201\"],\"parentId\":[\"100\"],\"parentName\":[\"书务系统\"],\"deptName\":[\"入库审批员\"],\"orderNum\":[\"0\"],\"leader\":[\"1\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 09:49:59');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"入库申请\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-download\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 09:51:21');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"入库申请\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-download\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 09:51:33');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 09:51:42');
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_instance\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 09:58:12');
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发', '/tool/gen/download/sys_instance', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-06 09:58:20');
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发', '/tool/gen/download/sys_instance', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-06 09:58:28');
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"图书入库申请\"],\"url\":[\"/system/instance\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 10:07:37');
INSERT INTO `sys_oper_log` VALUES (166, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'instance_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\SysInstanceMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysInstanceMapper.insertSysInstance-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_instance          ( instance_status,             create_date,             book_id )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'instance_id\' doesn\'t have a default value\n; Field \'instance_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'instance_id\' doesn\'t have a default value', '2021-04-06 10:31:33');
INSERT INTO `sys_oper_log` VALUES (167, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"createDate\":[\"2021-04-06\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 10:32:42');
INSERT INTO `sys_oper_log` VALUES (168, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"2\"],\"createDate\":[\"1899-12-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 10:35:01');
INSERT INTO `sys_oper_log` VALUES (169, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"2\"],\"createDate\":[\"2021-04-06\"]}', NULL, 1, '图书编号已存在', '2021-04-06 10:35:16');
INSERT INTO `sys_oper_log` VALUES (170, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"2\"],\"createDate\":[\"2021-04-06\"]}', NULL, 1, '图书编号已存在', '2021-04-06 10:35:39');
INSERT INTO `sys_oper_log` VALUES (171, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"createDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-06 10:37:18');
INSERT INTO `sys_oper_log` VALUES (172, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"2\"],\"createDate\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-06 10:38:09');
INSERT INTO `sys_oper_log` VALUES (173, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"createDate\":[\"2021-04-06\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-06 10:38:51');
INSERT INTO `sys_oper_log` VALUES (174, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"createDate\":[\"2021-04-02\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-06 10:39:58');
INSERT INTO `sys_oper_log` VALUES (175, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"createDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"图书编号已存在\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-04-06 10:40:13');
INSERT INTO `sys_oper_log` VALUES (176, '图书基本信息', 2, 'com.ruoyi.web.controller.system.SysBookBaseController.editSave()', 'POST', 1, 'admin', '研发', '/system/base/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"6\"],\"bookId\":[\"12\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"222\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-14\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-04-06 14:21:49');
INSERT INTO `sys_oper_log` VALUES (177, '图书基本信息', 2, 'com.ruoyi.web.controller.system.SysBookBaseController.editSave()', 'POST', 1, 'admin', '研发', '/system/base/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"6\"],\"bookId\":[\"12\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"222\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-14\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-04-06 14:22:44');
INSERT INTO `sys_oper_log` VALUES (178, '图书基本信息', 2, 'com.ruoyi.web.controller.system.SysBookBaseController.editSave()', 'POST', 1, 'admin', '研发', '/system/base/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"6\"],\"bookId\":[\"12\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"222\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-14\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-04-06 14:22:53');
INSERT INTO `sys_oper_log` VALUES (179, '图书基本信息', 2, 'com.ruoyi.web.controller.system.SysBookBaseController.editSave()', 'POST', 1, 'admin', '研发', '/system/base/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"6\"],\"bookId\":[\"12\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"222\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-14\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-04-06 14:23:56');
INSERT INTO `sys_oper_log` VALUES (180, '图书基本信息', 2, 'com.ruoyi.web.controller.system.SysBookBaseController.editSave()', 'POST', 1, 'admin', '研发', '/system/base/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"6\"],\"bookId\":[\"12\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"222\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-14\"]}', '{\r\n  \"msg\" : \"操作失败\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-04-06 14:23:59');
INSERT INTO `sys_oper_log` VALUES (181, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"6\"],\"bookId\":[\"12\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"555\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-14\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where instance_id = null\' at line 3\r\n### The error may exist in file [E:\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\SysInstanceMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysInstanceMapper.updateSysInstance-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_instance                    where instance_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where instance_id = null\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where instance_id = null\' at line 3', '2021-04-06 14:26:05');
INSERT INTO `sys_oper_log` VALUES (182, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"6\"],\"bookId\":[\"12\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"556\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-14\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where instance_id = null\' at line 3\r\n### The error may exist in file [E:\\RuoYi\\ruoyi-system\\target\\classes\\mapper\\system\\SysInstanceMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysInstanceMapper.updateSysInstance-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_instance                    where instance_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where instance_id = null\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where instance_id = null\' at line 3', '2021-04-06 14:26:54');
INSERT INTO `sys_oper_log` VALUES (183, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"6\"],\"bookId\":[\"12\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"8562152\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-14\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-06 14:27:36');
INSERT INTO `sys_oper_log` VALUES (184, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"6\"],\"bookId\":[\"12\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"856233\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-14\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-06 14:28:10');
INSERT INTO `sys_oper_log` VALUES (185, '入库申请', 3, 'com.ruoyi.web.controller.system.SysInstanceController.remove()', 'POST', 1, 'admin', '研发', '/system/instance/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:28:17');
INSERT INTO `sys_oper_log` VALUES (186, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"11\"],\"bookName\":[\"11\"],\"bookPublish\":[\"11\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"11\"],\"createDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-06 14:28:33');
INSERT INTO `sys_oper_log` VALUES (187, '入库申请', 3, 'com.ruoyi.web.controller.system.SysInstanceController.remove()', 'POST', 1, 'admin', '研发', '/system/instance/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:29:12');
INSERT INTO `sys_oper_log` VALUES (188, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"createDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-06 14:38:54');
INSERT INTO `sys_oper_log` VALUES (189, '入库申请', 3, 'com.ruoyi.web.controller.system.SysInstanceController.remove()', 'POST', 1, 'admin', '研发', '/system/instance/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:41:15');
INSERT INTO `sys_oper_log` VALUES (190, '入库申请', 3, 'com.ruoyi.web.controller.system.SysInstanceController.remove()', 'POST', 1, 'admin', '研发', '/system/instance/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:41:54');
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"若依官网\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:44:23');
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:44:34');
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"116\"],\"parentId\":[\"3\"],\"menuType\":[\"C\"],\"menuName\":[\"系统接口\"],\"url\":[\"/tool/swagger\"],\"target\":[\"menuItem\"],\"perms\":[\"tool:swagger:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-gg\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:45:12');
INSERT INTO `sys_oper_log` VALUES (194, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"仓库管理员\"],\"roleKey\":[\"manager\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"仓库管理员\"],\"menuIds\":[\"2008,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:47:55');
INSERT INTO `sys_oper_log` VALUES (195, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"仓库管理员\"],\"roleKey\":[\"manager\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"仓库管理员\"],\"menuIds\":[\"2008,2009\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:49:04');
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2009\"],\"menuType\":[\"F\"],\"menuName\":[\"图书入库查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:list\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:49:54');
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2010\"],\"menuType\":[\"F\"],\"menuName\":[\"图书入库导出\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:export\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:50:25');
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2009\"],\"menuType\":[\"F\"],\"menuName\":[\"图书入库导出\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:export\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:51:04');
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2009\"],\"menuType\":[\"F\"],\"menuName\":[\"图书入库新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:51:34');
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2009\"],\"menuType\":[\"F\"],\"menuName\":[\"图书入库修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:52:05');
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2009\"],\"menuType\":[\"F\"],\"menuName\":[\"图书入库删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:52:35');
INSERT INTO `sys_oper_log` VALUES (202, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"仓库管理员\"],\"roleKey\":[\"manager\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"仓库管理员\"],\"menuIds\":[\"2008,2009,2010,2011,2012,2013,2014\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:52:50');
INSERT INTO `sys_oper_log` VALUES (203, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"200\"],\"userName\":[\"刘库管\"],\"dept.deptName\":[\"仓库小王子\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"刘库管\"],\"sex\":[\"0\"],\"role\":[\"2\",\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2,100\"],\"postIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:53:35');
INSERT INTO `sys_oper_log` VALUES (204, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"仓库管理员\"],\"roleKey\":[\"manager\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"仓库管理员\"],\"menuIds\":[\"2001,2002,2003,2005,2004,2006,2007,2008,2009,2010,2011,2012,2013,2014\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:54:24');
INSERT INTO `sys_oper_log` VALUES (205, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"200\"],\"userName\":[\"刘库管\"],\"dept.deptName\":[\"仓库小王子\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"刘库管\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:55:29');
INSERT INTO `sys_oper_log` VALUES (206, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"200\"],\"userName\":[\"刘库管\"],\"dept.deptName\":[\"仓库小王子\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"刘库管\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:56:38');
INSERT INTO `sys_oper_log` VALUES (207, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"仓库管理员\"],\"roleKey\":[\"manager\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"仓库管理员\"],\"menuIds\":[\"2001,2002,2003,2005,2004,2006,2007,2008,2009,2010,2011,2012,2013,2014\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:56:52');
INSERT INTO `sys_oper_log` VALUES (208, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '研发', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"仓库管理员\"],\"roleKey\":[\"manager\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,200,201\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:57:08');
INSERT INTO `sys_oper_log` VALUES (209, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '研发', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"仓库管理员\"],\"roleKey\":[\"manager\"],\"dataScope\":[\"2\"],\"deptIds\":[\"100,200\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:57:17');
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"图书入库申请\"],\"url\":[\"/system/instance\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:view\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 14:58:16');
INSERT INTO `sys_oper_log` VALUES (211, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, '刘库管', '仓库小王子', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"createDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-06 14:59:26');
INSERT INTO `sys_oper_log` VALUES (212, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, '刘库管', '仓库小王子', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-06 15:02:03');
INSERT INTO `sys_oper_log` VALUES (213, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"22\"],\"bookName\":[\"22\"],\"bookPublish\":[\"22\"],\"bookAuthor\":[\"22\"],\"bookPrice\":[\"22\"],\"createDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-06 15:13:04');
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"入库审批\"],\"url\":[\"/system/instanceDeal\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-check\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 15:14:45');
INSERT INTO `sys_oper_log` VALUES (215, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"入库审批\"],\"url\":[\"/system/instanceDeal\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-check\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 15:15:05');
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"入库审批\"],\"url\":[\"/system/instanceDeal\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-check\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 15:16:48');
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"入库审批新增\"],\"url\":[\"/system/instanceDeal\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:edit\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-check\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 15:18:14');
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"入库审批新增\"],\"url\":[\"/system/instanceDeal\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-check\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 15:19:02');
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"入库审批新增\"],\"url\":[\"/system/instancedeal\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-check\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 15:19:30');
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"入库审批\"],\"url\":[\"/system/instancedeal\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-check\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 15:20:09');
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发', '/system/menu/remove/2015', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 15:30:04');
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"图书入库审批\"],\"url\":[\"/system/instancedeal\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:view\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-06 15:45:29');
INSERT INTO `sys_oper_log` VALUES (223, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"图书编号已存在\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-04-08 19:03:10');
INSERT INTO `sys_oper_log` VALUES (224, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:10:04');
INSERT INTO `sys_oper_log` VALUES (225, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:11:08');
INSERT INTO `sys_oper_log` VALUES (226, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"instanceStatus\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:11:18');
INSERT INTO `sys_oper_log` VALUES (227, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:14:20');
INSERT INTO `sys_oper_log` VALUES (228, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:14:42');
INSERT INTO `sys_oper_log` VALUES (229, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"instanceStatus\":[\"1\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:15:05');
INSERT INTO `sys_oper_log` VALUES (230, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"instanceStatus\":[\"1\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:15:24');
INSERT INTO `sys_oper_log` VALUES (231, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"instanceStatus\":[\"1\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:15:46');
INSERT INTO `sys_oper_log` VALUES (232, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"instanceStatus\":[\"1\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:15:59');
INSERT INTO `sys_oper_log` VALUES (233, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"instanceStatus\":[\"1\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:16:17');
INSERT INTO `sys_oper_log` VALUES (234, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"instanceStatus\":[\"1\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:16:36');
INSERT INTO `sys_oper_log` VALUES (235, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"instanceStatus\":[\"1\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:17:29');
INSERT INTO `sys_oper_log` VALUES (236, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"instanceStatus\":[\"0\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:18:03');
INSERT INTO `sys_oper_log` VALUES (237, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"instanceStatus\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:18:33');
INSERT INTO `sys_oper_log` VALUES (238, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"instanceStatus\":[\"0\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:18:40');
INSERT INTO `sys_oper_log` VALUES (239, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"businessId\":[\"15\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:22:43');
INSERT INTO `sys_oper_log` VALUES (240, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"instanceStatus\":[\"0\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:23:00');
INSERT INTO `sys_oper_log` VALUES (241, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"businessId\":[\"15\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:23:31');
INSERT INTO `sys_oper_log` VALUES (242, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"instanceStatus\":[\"0\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:24:00');
INSERT INTO `sys_oper_log` VALUES (243, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"businessId\":[\"15\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:26:21');
INSERT INTO `sys_oper_log` VALUES (244, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"instanceStatus\":[\"0\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:26:56');
INSERT INTO `sys_oper_log` VALUES (245, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"businessId\":[\"15\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:31:52');
INSERT INTO `sys_oper_log` VALUES (246, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceController.editSave()', 'POST', 1, 'admin', '研发', '/system/instance/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"instanceStatus\":[\"0\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"2021-04-01\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:32:09');
INSERT INTO `sys_oper_log` VALUES (247, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"9\"],\"businessId\":[\"15\"],\"bookPublishDate\":[\"2021-04-01\"],\"bookId\":[\"15\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"100\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:32:22');
INSERT INTO `sys_oper_log` VALUES (248, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"10\"],\"businessId\":[\"16\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"16\"],\"bookName\":[\"22\"],\"bookPublish\":[\"22\"],\"bookAuthor\":[\"22\"],\"bookPrice\":[\"22\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:32:27');
INSERT INTO `sys_oper_log` VALUES (249, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '研发', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"loginName\":[\"刘库管\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-08 19:34:42');
INSERT INTO `sys_oper_log` VALUES (250, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"1\"],\"bookName\":[\"吃货\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"1\"],\"createDate\":[\"2021-04-02\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-08 19:40:51');
INSERT INTO `sys_oper_log` VALUES (251, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_house\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-09 13:25:22');
INSERT INTO `sys_oper_log` VALUES (252, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发', '/tool/gen/download/sys_house', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-09 13:25:53');
INSERT INTO `sys_oper_log` VALUES (253, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发', '/tool/gen/download/sys_house', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-09 13:26:00');
INSERT INTO `sys_oper_log` VALUES (254, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"仓库管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-institution\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-09 13:30:28');
INSERT INTO `sys_oper_log` VALUES (255, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2017\"],\"menuType\":[\"C\"],\"menuName\":[\"仓库管理\"],\"url\":[\"/system/house\"],\"target\":[\"menuItem\"],\"perms\":[\"system:house:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-09 13:31:28');
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2016\"],\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"图书入库审批\"],\"url\":[\"/system/instancedeal\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-09 13:32:16');
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"图书入库申请\"],\"url\":[\"/system/instance\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instance:view\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-09 13:32:27');
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"书籍基本信息\"],\"url\":[\"/system/base\"],\"target\":[\"menuItem\"],\"perms\":[\"system:base:view\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-09 13:32:35');
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发', '/system/menu/remove/4', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"菜单已分配,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-04-09 13:32:48');
INSERT INTO `sys_oper_log` VALUES (260, '仓库', 1, 'com.ruoyi.web.controller.system.SysHouseController.addSave()', 'POST', 1, 'admin', '研发', '/system/house/add', '127.0.0.1', '内网IP', '{\"houseName\":[\"测试一库\"],\"houseNumber\":[\"100\"],\"houseBooks\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-09 13:39:20');
INSERT INTO `sys_oper_log` VALUES (261, '仓库', 1, 'com.ruoyi.web.controller.system.SysHouseController.addSave()', 'POST', 1, 'admin', '研发', '/system/house/add', '127.0.0.1', '内网IP', '{\"houseName\":[\"测试二库\"],\"houseNumber\":[\"100\"],\"houseBooks\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-09 13:45:11');
INSERT INTO `sys_oper_log` VALUES (262, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"A1\"],\"bookName\":[\"孙子兵法\"],\"bookPublish\":[\"\"],\"bookAuthor\":[\"\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 05:56:49');
INSERT INTO `sys_oper_log` VALUES (263, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"A2\"],\"bookName\":[\"老子\"],\"bookPublish\":[\"\"],\"bookAuthor\":[\"\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 05:57:07');
INSERT INTO `sys_oper_log` VALUES (264, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"A3\"],\"bookName\":[\"庄子\"],\"bookPublish\":[\"\"],\"bookAuthor\":[\"\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 05:57:25');
INSERT INTO `sys_oper_log` VALUES (265, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"A4\"],\"bookName\":[\"逍遥游\"],\"bookPublish\":[\"\"],\"bookAuthor\":[\"\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 05:57:45');
INSERT INTO `sys_oper_log` VALUES (266, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"A5\"],\"bookName\":[\"诗经\"],\"bookPublish\":[\"\"],\"bookAuthor\":[\"\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 05:58:05');
INSERT INTO `sys_oper_log` VALUES (267, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"A6\"],\"bookName\":[\"论语\"],\"bookPublish\":[\"\"],\"bookAuthor\":[\"\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 05:58:33');
INSERT INTO `sys_oper_log` VALUES (268, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"A7\"],\"bookName\":[\"\"],\"bookPublish\":[\"东周列国志\"],\"bookAuthor\":[\"\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 05:59:10');
INSERT INTO `sys_oper_log` VALUES (269, '图书基本信息', 1, 'com.ruoyi.web.controller.system.SysBookBaseController.addSave()', 'POST', 1, 'admin', '研发', '/system/base/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"A8\"],\"bookName\":[\"九章\"],\"bookPublish\":[\"\"],\"bookAuthor\":[\"\"],\"bookPrice\":[\"100\"],\"bookPublishDate\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 05:59:42');
INSERT INTO `sys_oper_log` VALUES (270, '图书基本信息', 2, 'com.ruoyi.web.controller.system.SysBookBaseController.editSave()', 'POST', 1, 'admin', '研发', '/system/base/edit', '127.0.0.1', '内网IP', '{\"businessId\":[\"24\"],\"bookId\":[\"A7\"],\"bookName\":[\"东周列国志\"],\"bookPublish\":[\"\"],\"bookAuthor\":[\"\"],\"bookPrice\":[\"100\"],\"flag\":[\"0\"],\"bookPublishDate\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 05:59:54');
INSERT INTO `sys_oper_log` VALUES (271, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_house_book\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 06:48:52');
INSERT INTO `sys_oper_log` VALUES (272, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发', '/tool/gen/download/sys_house_book', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-10 06:48:55');
INSERT INTO `sys_oper_log` VALUES (273, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发', '/tool/gen/download/sys_house_book', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-10 06:49:02');
INSERT INTO `sys_oper_log` VALUES (274, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发', '/tool/gen/synchDb/sys_house_book', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 06:53:37');
INSERT INTO `sys_oper_log` VALUES (275, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发', '/tool/gen/download/sys_house_book', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-10 06:53:47');
INSERT INTO `sys_oper_log` VALUES (276, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发', '/tool/gen/download/sys_house_book', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-10 06:53:51');
INSERT INTO `sys_oper_log` VALUES (277, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"11\"],\"businessId\":[\"17\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"17\"],\"bookName\":[\"吃货\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"1\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 06:59:36');
INSERT INTO `sys_oper_log` VALUES (278, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"测试1\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"111\"],\"createDate\":[\"2021-04-01\"],\"house\":[\"1\"]}', NULL, 1, 'null', '2021-04-10 07:00:07');
INSERT INTO `sys_oper_log` VALUES (279, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"测试1\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"111\"],\"createDate\":[\"2021-04-01\"],\"house\":[\"1\"]}', '{\r\n  \"msg\" : \"图书编号已存在\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-04-10 07:00:32');
INSERT INTO `sys_oper_log` VALUES (280, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"测试1\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"111\"],\"createDate\":[\"2021-04-01\"],\"house\":[\"1\"]}', NULL, 1, 'null', '2021-04-10 07:01:02');
INSERT INTO `sys_oper_log` VALUES (281, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"测试1\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"111\"],\"createDate\":[\"2021-04-01\"],\"house\":[\"1\"]}', NULL, 1, 'null', '2021-04-10 07:02:18');
INSERT INTO `sys_oper_log` VALUES (282, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"测试1\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"1\"],\"createDate\":[\"2021-04-09\"],\"house\":[\"1\"]}', NULL, 1, 'null', '2021-04-10 07:08:28');
INSERT INTO `sys_oper_log` VALUES (283, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"测试1\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"11\"],\"createDate\":[\"2021-04-01\"],\"house\":[\"1\"]}', '{\r\n  \"msg\" : \"图书编号已存在\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-04-10 07:10:32');
INSERT INTO `sys_oper_log` VALUES (284, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"测试1\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"11\"],\"createDate\":[\"2021-04-01\"],\"house\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:11:09');
INSERT INTO `sys_oper_log` VALUES (285, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"测试1\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"11\"],\"createDate\":[\"2021-04-01\"],\"house\":[\"1\"]}', '{\r\n  \"msg\" : \"图书编号已存在\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-04-10 07:15:04');
INSERT INTO `sys_oper_log` VALUES (286, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"bookId\":[\"测试1\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"11\"],\"createDate\":[\"2021-04-01\"],\"house\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:15:25');
INSERT INTO `sys_oper_log` VALUES (287, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发', '/tool/gen/synchDb/sys_house_book', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 07:26:22');
INSERT INTO `sys_oper_log` VALUES (288, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发', '/tool/gen/download/sys_house_book', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-10 07:26:26');
INSERT INTO `sys_oper_log` VALUES (289, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发', '/tool/gen/download/sys_house_book', '127.0.0.1', '内网IP', NULL, NULL, 0, NULL, '2021-04-10 07:26:31');
INSERT INTO `sys_oper_log` VALUES (290, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"1\"],\"bookId\":[\"测试1\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"11\"],\"createDate\":[\"2021-04-01\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"图书编号已存在\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-04-10 07:43:18');
INSERT INTO `sys_oper_log` VALUES (291, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"1\"],\"bookId\":[\"测试1\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"11\"],\"createDate\":[\"2021-04-01\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:43:30');
INSERT INTO `sys_oper_log` VALUES (292, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"14\"],\"businessId\":[\"32\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"32\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"11\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:43:52');
INSERT INTO `sys_oper_log` VALUES (293, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"1\"],\"bookId\":[\"测试2\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"11\"],\"createDate\":[\"2021-04-01\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:44:32');
INSERT INTO `sys_oper_log` VALUES (294, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"15\"],\"businessId\":[\"33\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"33\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"11\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:46:10');
INSERT INTO `sys_oper_log` VALUES (295, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"1\"],\"bookId\":[\"测试1\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"22\"],\"createDate\":[\"2021-04-01\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:48:09');
INSERT INTO `sys_oper_log` VALUES (296, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"16\"],\"businessId\":[\"34\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"34\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"22\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:48:31');
INSERT INTO `sys_oper_log` VALUES (297, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"1\"],\"bookId\":[\"测试1\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"11\"],\"createDate\":[\"2021-04-01\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:49:42');
INSERT INTO `sys_oper_log` VALUES (298, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"17\"],\"businessId\":[\"35\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"35\"],\"bookName\":[\"aaa\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"啊啊\"],\"bookPrice\":[\"11\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:49:52');
INSERT INTO `sys_oper_log` VALUES (299, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"1\"],\"bookId\":[\"测试1\"],\"bookName\":[\"11\"],\"bookPublish\":[\"111\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"11\"],\"createDate\":[\"2021-04-01\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:50:27');
INSERT INTO `sys_oper_log` VALUES (300, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"18\"],\"businessId\":[\"36\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"36\"],\"bookName\":[\"11\"],\"bookPublish\":[\"111\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"11\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:51:35');
INSERT INTO `sys_oper_log` VALUES (301, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"1\"],\"bookId\":[\"测试1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"1\"],\"createDate\":[\"2021-04-01\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:52:58');
INSERT INTO `sys_oper_log` VALUES (302, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"19\"],\"businessId\":[\"37\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"37\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"1\"],\"bookPrice\":[\"1\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:54:09');
INSERT INTO `sys_oper_log` VALUES (303, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"1\"],\"bookId\":[\"测试1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"11\"],\"createDate\":[\"1899-12-01\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:55:50');
INSERT INTO `sys_oper_log` VALUES (304, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"20\"],\"businessId\":[\"38\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"38\"],\"bookName\":[\"1\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"11\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:56:11');
INSERT INTO `sys_oper_log` VALUES (305, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"1\"],\"bookId\":[\"11\"],\"bookName\":[\"111\"],\"bookPublish\":[\"11\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"11\"],\"createDate\":[\"2021-04-01\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:57:49');
INSERT INTO `sys_oper_log` VALUES (306, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"1\"],\"bookId\":[\"11\"],\"bookName\":[\"11\"],\"bookPublish\":[\"11\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"11\"],\"createDate\":[\"2021-04-01\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"图书编号已存在\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-04-10 07:58:33');
INSERT INTO `sys_oper_log` VALUES (307, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"1\"],\"bookId\":[\"测试1\"],\"bookName\":[\"1\"],\"bookPublish\":[\"11\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"11\"],\"createDate\":[\"2021-04-01\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 07:58:48');
INSERT INTO `sys_oper_log` VALUES (308, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"1\"],\"bookId\":[\"测试1\"],\"bookName\":[\"1111\"],\"bookPublish\":[\"1\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"1\"],\"createDate\":[\"2021-04-01\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"图书编号已存在\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2021-04-10 07:59:16');
INSERT INTO `sys_oper_log` VALUES (309, '仓库', 1, 'com.ruoyi.web.controller.system.SysHouseController.addSave()', 'POST', 1, 'admin', '研发', '/system/house/add', '127.0.0.1', '内网IP', '{\"houseName\":[\"测试\"],\"houseNumber\":[\"100\"],\"houseBooks\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 08:23:39');
INSERT INTO `sys_oper_log` VALUES (310, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"3\"],\"bookId\":[\"测试1\"],\"bookName\":[\"测试啊\"],\"bookPublish\":[\"啊\"],\"bookAuthor\":[\"测试\"],\"bookPrice\":[\"1\"],\"createDate\":[\"2021-04-01\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 08:24:17');
INSERT INTO `sys_oper_log` VALUES (311, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"23\"],\"businessId\":[\"41\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"41\"],\"bookName\":[\"测试啊\"],\"bookPublish\":[\"啊\"],\"bookAuthor\":[\"测试\"],\"bookPrice\":[\"1\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 08:24:23');
INSERT INTO `sys_oper_log` VALUES (312, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"3\"],\"bookId\":[\"1\"],\"bookName\":[\"1111\"],\"bookPublish\":[\"11111\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"11\"],\"createDate\":[\"\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 08:26:55');
INSERT INTO `sys_oper_log` VALUES (313, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"24\"],\"businessId\":[\"42\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"42\"],\"bookName\":[\"1111\"],\"bookPublish\":[\"11111\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"11\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 08:27:12');
INSERT INTO `sys_oper_log` VALUES (314, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"3\"],\"bookId\":[\"测试1\"],\"bookName\":[\"44\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"\"],\"createDate\":[\"\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 08:29:56');
INSERT INTO `sys_oper_log` VALUES (315, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"3\"],\"bookId\":[\"11\"],\"bookName\":[\"111\"],\"bookPublish\":[\"11\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"11\"],\"createDate\":[\"\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 08:30:24');
INSERT INTO `sys_oper_log` VALUES (316, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"25\"],\"businessId\":[\"43\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"43\"],\"bookName\":[\"44\"],\"bookPublish\":[\"啊啊\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 08:32:11');
INSERT INTO `sys_oper_log` VALUES (317, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"26\"],\"businessId\":[\"44\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"11\"],\"bookName\":[\"111\"],\"bookPublish\":[\"11\"],\"bookAuthor\":[\"11\"],\"bookPrice\":[\"11\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-10 08:36:26');
INSERT INTO `sys_oper_log` VALUES (318, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2017\"],\"menuType\":[\"C\"],\"menuName\":[\"仓库-书籍基本信息\"],\"url\":[\"/system/housebase\"],\"target\":[\"menuItem\"],\"perms\":[\"system:house:views\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-american-sign-language-interpreting\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 16:06:30');
INSERT INTO `sys_oper_log` VALUES (319, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 18:40:55');
INSERT INTO `sys_oper_log` VALUES (320, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '研发', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"茶叶\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-10 18:41:25');
INSERT INTO `sys_oper_log` VALUES (321, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"部门管理\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-outdent\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 10:53:37');
INSERT INTO `sys_oper_log` VALUES (322, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 10:53:51');
INSERT INTO `sys_oper_log` VALUES (323, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"106\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"参数设置\"],\"url\":[\"/system/config\"],\"target\":[\"menuItem\"],\"perms\":[\"system:config:view\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-sun-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 10:54:06');
INSERT INTO `sys_oper_log` VALUES (324, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"107\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"通知公告\"],\"url\":[\"/system/notice\"],\"target\":[\"menuItem\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-bullhorn\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 10:54:22');
INSERT INTO `sys_oper_log` VALUES (325, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"---\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 10:54:35');
INSERT INTO `sys_oper_log` VALUES (326, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 10:54:54');
INSERT INTO `sys_oper_log` VALUES (327, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '研发', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"仓库审批员\"],\"roleKey\":[\"deal\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2001,2002,2003,2005,2004,2006,2007,2008,2016,2017,2018,2019\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 10:57:19');
INSERT INTO `sys_oper_log` VALUES (328, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '研发', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"201\"],\"userName\":[\"刘审批\"],\"deptName\":[\"入库审批员\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"刘审批\"],\"sex\":[\"0\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 10:57:52');
INSERT INTO `sys_oper_log` VALUES (329, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"101\"],\"deptId\":[\"201\"],\"userName\":[\"刘审批\"],\"dept.deptName\":[\"入库审批员\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"刘审批\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 10:58:33');
INSERT INTO `sys_oper_log` VALUES (330, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2016\"],\"menuType\":[\"F\"],\"menuName\":[\"图书入库申请查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instancedeal:list\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:00:40');
INSERT INTO `sys_oper_log` VALUES (331, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2016\"],\"menuType\":[\"F\"],\"menuName\":[\"图书入库审批删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instancedeal:remove\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:01:27');
INSERT INTO `sys_oper_log` VALUES (332, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2016\"],\"menuType\":[\"F\"],\"menuName\":[\"图书入库审批-审批\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instancedeal:edit\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:02:04');
INSERT INTO `sys_oper_log` VALUES (333, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2016\"],\"parentId\":[\"2008\"],\"menuType\":[\"C\"],\"menuName\":[\"图书入库审批\"],\"url\":[\"/system/instancedeal\"],\"target\":[\"menuItem\"],\"perms\":[\"system:instancedeal:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:03:44');
INSERT INTO `sys_oper_log` VALUES (334, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"仓库审批员\"],\"roleKey\":[\"deal\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2001,2002,2003,2005,2004,2006,2007,2008,2016,2020,2021,2022,2017,2018,2019\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:04:45');
INSERT INTO `sys_oper_log` VALUES (335, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"仓库审批员\"],\"roleKey\":[\"deal\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2001,2002,2003,2005,2004,2006,2007,2017,2018,2019\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:06:58');
INSERT INTO `sys_oper_log` VALUES (336, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"仓库审批员\"],\"roleKey\":[\"deal\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2001,2002,2003,2005,2004,2006,2007,2008,2016,2020,2021,2022,2017,2018,2019\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:07:08');
INSERT INTO `sys_oper_log` VALUES (337, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"仓库管理-查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:house:list\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:15:13');
INSERT INTO `sys_oper_log` VALUES (338, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"仓库管理-导出\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:house:export\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:15:58');
INSERT INTO `sys_oper_log` VALUES (339, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"仓库管理-新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:house:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:16:31');
INSERT INTO `sys_oper_log` VALUES (340, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"仓库管理-删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:house:remove\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:17:03');
INSERT INTO `sys_oper_log` VALUES (341, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2017\"],\"menuType\":[\"F\"],\"menuName\":[\"仓库管理修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:house:edit\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:17:30');
INSERT INTO `sys_oper_log` VALUES (342, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2027\"],\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"仓库管理修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:house:edit\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:19:43');
INSERT INTO `sys_oper_log` VALUES (343, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"仓库审批员\"],\"roleKey\":[\"deal\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2001,2002,2003,2005,2004,2006,2007,2008,2016,2020,2021,2022,2017,2018,2023,2024,2025,2026,2027\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:20:10');
INSERT INTO `sys_oper_log` VALUES (344, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2019\"],\"menuType\":[\"F\"],\"menuName\":[\"仓库-书籍基本信息\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:house:lists\"],\"orderNum\":[\"0\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:22:12');
INSERT INTO `sys_oper_log` VALUES (345, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"仓库审批员\"],\"roleKey\":[\"deal\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2001,2002,2003,2005,2004,2006,2007,2008,2016,2020,2021,2022,2017,2018,2023,2024,2025,2026,2027,2019,2028\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:22:31');
INSERT INTO `sys_oper_log` VALUES (346, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2018\"],\"menuType\":[\"F\"],\"menuName\":[\"仓库-书籍基本信息\"],\"url\":[\"/system/housebase\"],\"target\":[\"menuItem\"],\"perms\":[\"system:house:views\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-american-sign-language-interpreting\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:30:52');
INSERT INTO `sys_oper_log` VALUES (347, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2018\"],\"menuType\":[\"C\"],\"menuName\":[\"仓库-书籍基本信息\"],\"url\":[\"/system/housebase\"],\"target\":[\"menuItem\"],\"perms\":[\"system:house:views\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-american-sign-language-interpreting\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:31:13');
INSERT INTO `sys_oper_log` VALUES (348, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2017\"],\"menuType\":[\"C\"],\"menuName\":[\"仓库-书籍基本信息\"],\"url\":[\"/system/housebase\"],\"target\":[\"menuItem\"],\"perms\":[\"system:house:views\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-american-sign-language-interpreting\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-12 11:31:30');
INSERT INTO `sys_oper_log` VALUES (349, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"3\"],\"bookId\":[\"测试1\"],\"bookName\":[\"测\"],\"bookPublish\":[\"测\"],\"bookAuthor\":[\"侧嗯嗯\"],\"bookPrice\":[\"111\"],\"createDate\":[\"\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-23 14:10:24');
INSERT INTO `sys_oper_log` VALUES (350, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"27\"],\"businessId\":[\"45\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"测试1\"],\"bookName\":[\"测\"],\"bookPublish\":[\"测\"],\"bookAuthor\":[\"侧嗯嗯\"],\"bookPrice\":[\"111\"],\"instanceStatus\":[\"1\"]}', NULL, 1, 'For input string: \"测试1\"', '2021-04-23 14:10:53');
INSERT INTO `sys_oper_log` VALUES (351, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"27\"],\"businessId\":[\"45\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"测试1\"],\"bookName\":[\"测\"],\"bookPublish\":[\"测\"],\"bookAuthor\":[\"侧嗯嗯\"],\"bookPrice\":[\"111\"],\"instanceStatus\":[\"1\"]}', NULL, 1, 'For input string: \"测试1\"', '2021-04-23 14:10:57');
INSERT INTO `sys_oper_log` VALUES (352, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"27\"],\"businessId\":[\"45\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"测试1\"],\"bookName\":[\"测\"],\"bookPublish\":[\"测\"],\"bookAuthor\":[\"侧嗯嗯\"],\"bookPrice\":[\"111\"],\"instanceStatus\":[\"1\"]}', NULL, 1, 'For input string: \"测试1\"', '2021-04-23 14:10:59');
INSERT INTO `sys_oper_log` VALUES (353, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"27\"],\"businessId\":[\"45\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"测试1\"],\"bookName\":[\"测\"],\"bookPublish\":[\"测\"],\"bookAuthor\":[\"侧嗯嗯\"],\"bookPrice\":[\"111\"],\"instanceStatus\":[\"1\"]}', NULL, 1, 'For input string: \"测试1\"', '2021-04-23 14:14:45');
INSERT INTO `sys_oper_log` VALUES (354, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"27\"],\"businessId\":[\"45\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"测试1\"],\"bookName\":[\"测\"],\"bookPublish\":[\"测\"],\"bookAuthor\":[\"侧嗯嗯\"],\"bookPrice\":[\"111\"],\"instanceStatus\":[\"1\"]}', NULL, 1, 'For input string: \"测试1\"', '2021-04-23 14:14:51');
INSERT INTO `sys_oper_log` VALUES (355, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"27\"],\"businessId\":[\"45\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"测试1\"],\"bookName\":[\"测\"],\"bookPublish\":[\"测\"],\"bookAuthor\":[\"侧嗯嗯\"],\"bookPrice\":[\"111\"],\"instanceStatus\":[\"1\"]}', NULL, 1, 'For input string: \"测试1\"', '2021-04-23 14:17:16');
INSERT INTO `sys_oper_log` VALUES (356, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"27\"],\"businessId\":[\"45\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"C1\"],\"bookName\":[\"测\"],\"bookPublish\":[\"测\"],\"bookAuthor\":[\"侧嗯嗯\"],\"bookPrice\":[\"111\"],\"instanceStatus\":[\"1\"]}', NULL, 1, 'For input string: \"C1\"', '2021-04-23 14:17:50');
INSERT INTO `sys_oper_log` VALUES (357, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"27\"],\"businessId\":[\"45\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"C1\"],\"bookName\":[\"测\"],\"bookPublish\":[\"测\"],\"bookAuthor\":[\"侧嗯嗯\"],\"bookPrice\":[\"111\"],\"instanceStatus\":[\"1\"]}', NULL, 1, 'For input string: \"C1\"', '2021-04-23 14:19:30');
INSERT INTO `sys_oper_log` VALUES (358, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"27\"],\"businessId\":[\"45\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"C1\"],\"bookName\":[\"测\"],\"bookPublish\":[\"测\"],\"bookAuthor\":[\"侧嗯嗯\"],\"bookPrice\":[\"111\"],\"instanceStatus\":[\"1\"]}', NULL, 1, 'For input string: \"C1\"', '2021-04-23 14:19:40');
INSERT INTO `sys_oper_log` VALUES (359, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"27\"],\"businessId\":[\"45\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"C1\"],\"bookName\":[\"测\"],\"bookPublish\":[\"测\"],\"bookAuthor\":[\"侧嗯嗯\"],\"bookPrice\":[\"111\"],\"instanceStatus\":[\"1\"]}', NULL, 1, 'For input string: \"C1\"', '2021-04-23 14:20:33');
INSERT INTO `sys_oper_log` VALUES (360, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"27\"],\"businessId\":[\"45\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"C1\"],\"bookName\":[\"测\"],\"bookPublish\":[\"测\"],\"bookAuthor\":[\"侧嗯嗯\"],\"bookPrice\":[\"111\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-23 14:21:46');
INSERT INTO `sys_oper_log` VALUES (361, '账户解锁', 0, 'com.ruoyi.web.controller.monitor.SysLogininforController.unlock()', 'POST', 1, 'admin', '研发', '/monitor/logininfor/unlock', '127.0.0.1', '内网IP', '{\"loginName\":[\"admin\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-28 16:14:10');
INSERT INTO `sys_oper_log` VALUES (362, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"3\"],\"bookId\":[\"2\"],\"bookName\":[\"2\"],\"bookPublish\":[\"2\"],\"bookAuthor\":[\"2\"],\"bookPrice\":[\"2\"],\"createDate\":[\"\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-29 13:29:16');
INSERT INTO `sys_oper_log` VALUES (363, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"28\"],\"businessId\":[\"46\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"2\"],\"bookName\":[\"2\"],\"bookPublish\":[\"2\"],\"bookAuthor\":[\"2\"],\"bookPrice\":[\"2\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-29 13:29:23');
INSERT INTO `sys_oper_log` VALUES (364, '入库申请', 1, 'com.ruoyi.web.controller.system.SysInstanceController.addSave()', 'POST', 1, 'admin', '研发', '/system/instance/add', '127.0.0.1', '内网IP', '{\"house\":[\"3\"],\"bookId\":[\"3\"],\"bookName\":[\"3\"],\"bookPublish\":[\"3\"],\"bookAuthor\":[\"3\"],\"bookPrice\":[\"3\"],\"createDate\":[\"\"],\"houseFlag\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-29 13:29:47');
INSERT INTO `sys_oper_log` VALUES (365, '入库申请', 2, 'com.ruoyi.web.controller.system.SysInstanceDealController.editSave()', 'POST', 1, 'admin', '研发', '/system/instancedeal/edit', '127.0.0.1', '内网IP', '{\"instanceId\":[\"29\"],\"businessId\":[\"47\"],\"bookPublishDate\":[\"\"],\"bookId\":[\"3\"],\"bookName\":[\"3\"],\"bookPublish\":[\"3\"],\"bookAuthor\":[\"3\"],\"bookPrice\":[\"3\"],\"instanceStatus\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0,\r\n  \"data\" : 1\r\n}', 0, NULL, '2021-04-29 13:30:01');
INSERT INTO `sys_oper_log` VALUES (366, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"200\"],\"userName\":[\"茶叶\"],\"dept.deptName\":[\"仓库小王子\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', NULL, 1, '不允许操作超级管理员用户', '2021-04-29 13:41:26');
INSERT INTO `sys_oper_log` VALUES (367, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"200\"],\"userName\":[\"茶叶\"],\"dept.deptName\":[\"仓库小王子\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"1\"]}', NULL, 1, '不允许操作超级管理员用户', '2021-04-29 13:41:37');
INSERT INTO `sys_oper_log` VALUES (368, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"部门管理\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-outdent\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:45:12');
INSERT INTO `sys_oper_log` VALUES (369, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"100\"],\"parentName\":[\"书务系统\"],\"deptName\":[\"研发\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:46:14');
INSERT INTO `sys_oper_log` VALUES (370, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"105\"],\"parentId\":[\"100\"],\"parentName\":[\"书务系统\"],\"deptName\":[\"测试\"],\"orderNum\":[\"3\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:46:34');
INSERT INTO `sys_oper_log` VALUES (371, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发', '/system/dept/remove/101', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:46:39');
INSERT INTO `sys_oper_log` VALUES (372, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"100\"],\"parentName\":[\"书务系统\"],\"deptName\":[\"超级管理员\"],\"orderNum\":[\"1\"],\"leader\":[\"ltz\"],\"phone\":[\"15888888888\"],\"email\":[\"ltz@qq.com\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:47:13');
INSERT INTO `sys_oper_log` VALUES (373, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发', '/system/dept/remove/105', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"部门存在用户,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2021-04-29 13:47:33');
INSERT INTO `sys_oper_log` VALUES (374, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', '研发', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:47:41');
INSERT INTO `sys_oper_log` VALUES (375, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发', '/system/dept/remove/105', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:47:47');
INSERT INTO `sys_oper_log` VALUES (376, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"200\"],\"parentId\":[\"100\"],\"parentName\":[\"书务系统\"],\"deptName\":[\"仓库管理员\"],\"orderNum\":[\"0\"],\"leader\":[\"刘库管\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:50:14');
INSERT INTO `sys_oper_log` VALUES (377, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"201\"],\"parentId\":[\"100\"],\"parentName\":[\"书务系统\"],\"deptName\":[\"书务管理员\"],\"orderNum\":[\"0\"],\"leader\":[\"1\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:50:37');
INSERT INTO `sys_oper_log` VALUES (378, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"部门管理\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-outdent\"],\"visible\":[\"1\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:50:58');
INSERT INTO `sys_oper_log` VALUES (379, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'POST', 1, 'admin', '研发', '/system/role/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:51:31');
INSERT INTO `sys_oper_log` VALUES (380, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"书务管理员\"],\"roleKey\":[\"deal\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2008,2016,2020,2021,2022\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:52:41');
INSERT INTO `sys_oper_log` VALUES (381, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"仓库管理员\"],\"roleKey\":[\"manager\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"仓库管理员\"],\"menuIds\":[\"2001,2002,2003,2005,2004,2006,2007,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2008,2009,2010,2011,2012,2013,2014,2017,2018,2023,2024,2025,2026,2027,2019,2028\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:52:58');
INSERT INTO `sys_oper_log` VALUES (382, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"部门管理\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-outdent\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:55:20');
INSERT INTO `sys_oper_log` VALUES (383, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"书店书务信息管理系统\"],\"orderNum\":[\"0\"],\"leader\":[\"111\"],\"phone\":[\"15888888888\"],\"email\":[\"11@qq.com\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:55:42');
INSERT INTO `sys_oper_log` VALUES (384, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '超级管理员', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"部门管理\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-outdent\"],\"visible\":[\"1\"],\"isRefresh\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-04-29 13:55:58');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-04-01 09:40:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-04-01 09:40:57', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2021-04-01 09:40:57', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '2', 'admin', '2021-04-01 09:40:57', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (100, '仓库管理员', 'manager', 2, '2', '0', '0', 'admin', '2021-04-01 17:57:00', 'admin', '2021-04-29 13:52:58', '仓库管理员');
INSERT INTO `sys_role` VALUES (101, '书务管理员', 'deal', 3, '1', '0', '0', 'admin', '2021-04-12 10:57:19', 'admin', '2021-04-29 13:52:41', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (100, 100);
INSERT INTO `sys_role_dept` VALUES (100, 200);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 106);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1025);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1027);
INSERT INTO `sys_role_menu` VALUES (100, 1028);
INSERT INTO `sys_role_menu` VALUES (100, 1029);
INSERT INTO `sys_role_menu` VALUES (100, 1030);
INSERT INTO `sys_role_menu` VALUES (100, 1031);
INSERT INTO `sys_role_menu` VALUES (100, 1032);
INSERT INTO `sys_role_menu` VALUES (100, 1033);
INSERT INTO `sys_role_menu` VALUES (100, 1034);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 100);
INSERT INTO `sys_role_menu` VALUES (101, 1000);
INSERT INTO `sys_role_menu` VALUES (101, 1001);
INSERT INTO `sys_role_menu` VALUES (101, 1002);
INSERT INTO `sys_role_menu` VALUES (101, 1003);
INSERT INTO `sys_role_menu` VALUES (101, 1004);
INSERT INTO `sys_role_menu` VALUES (101, 1005);
INSERT INTO `sys_role_menu` VALUES (101, 1006);
INSERT INTO `sys_role_menu` VALUES (101, 2008);
INSERT INTO `sys_role_menu` VALUES (101, 2016);
INSERT INTO `sys_role_menu` VALUES (101, 2020);
INSERT INTO `sys_role_menu` VALUES (101, 2021);
INSERT INTO `sys_role_menu` VALUES (101, 2022);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '茶叶', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2021/04/10/7097eb89-a22f-4419-a7f5-79704b18c220.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2021-04-29 14:09:59', '2021-04-01 09:40:57', 'admin', '2021-04-01 09:40:57', '', '2021-04-29 14:09:59', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '小茗同学', '00', 'ry@qq.com', '15666666666', '1', '', '7e3a9a68c03f77e9bc67871bd3cb10b8', 'df5125', '0', '2', '127.0.0.1', '2021-04-01 09:40:57', '2021-04-01 09:40:57', 'admin', '2021-04-01 09:40:57', '', '2021-04-01 09:46:48', '测试员');
INSERT INTO `sys_user` VALUES (100, 200, '刘库管', '刘库管', '00', '', '', '0', '', 'd89c11f59cb66154c76b66a98e03bb14', 'df93ad', '0', '0', '127.0.0.1', '2021-04-12 11:33:06', NULL, 'admin', '2021-04-01 17:55:16', 'admin', '2021-04-12 11:33:06', '');
INSERT INTO `sys_user` VALUES (101, 201, '刘审批', '刘审批', '00', '', '', '0', '', 'cd15ce3a08216e88ac6538bb5a38f0b6', 'd943b7', '0', '0', '127.0.0.1', '2021-04-29 13:53:30', NULL, 'admin', '2021-04-12 10:57:52', 'admin', '2021-04-29 13:53:30', '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('42648ddd-a8f3-4a86-b2e2-8184689b5654', 'admin', '超级管理员', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2021-04-29 14:02:57', '2021-04-29 14:09:59', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 101);

SET FOREIGN_KEY_CHECKS = 1;
