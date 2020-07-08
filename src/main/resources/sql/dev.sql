/*
Navicat MySQL Data Transfer

Source Server         : 访客系统
Source Server Version : 50717
Source Host           : 10.190.38.241:3306
Source Database       : devfkgeely

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-07-08 09:05:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b_again_handle
-- ----------------------------
DROP TABLE IF EXISTS `b_again_handle`;
CREATE TABLE `b_again_handle` (
  `c_id` varchar(32) NOT NULL COMMENT '调用id',
  `u_id` varchar(32) NOT NULL COMMENT '用户id',
  `is_card` varchar(32) NOT NULL COMMENT '需要办理餐卡 0：否，1：是',
  `is_caliche` varchar(32) NOT NULL COMMENT '需要领用硬盘 0：否，1：是',
  `computer_type` varchar(32) DEFAULT NULL COMMENT '电脑型号',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='续办表 ';

-- ----------------------------
-- Records of b_again_handle
-- ----------------------------

-- ----------------------------
-- Table structure for b_call_position
-- ----------------------------
DROP TABLE IF EXISTS `b_call_position`;
CREATE TABLE `b_call_position` (
  `c_id` varchar(32) NOT NULL COMMENT '调用id',
  `u_id` varchar(32) NOT NULL COMMENT '用户id',
  `export_dep` varchar(128) DEFAULT NULL COMMENT '调出品牌院/中心 首次办理的服务对象',
  `entry_dep` varchar(128) NOT NULL COMMENT '调入品牌院/中心',
  `project_team` varchar(128) NOT NULL COMMENT '调入服务项目组',
  `project_name` varchar(128) NOT NULL COMMENT '调入服务项目名称',
  `bid_section` varchar(128) DEFAULT NULL COMMENT '标段 业务类型为租赁人员管理则必填',
  `eva_level` varchar(32) DEFAULT NULL COMMENT '评价等级 业务类型为租赁人员管理则必填',
  `is_card` varchar(32) NOT NULL COMMENT '需要办理餐卡 0：否，1：是',
  `is_caliche` varchar(32) NOT NULL COMMENT '需要领用硬盘 0：否，1：是',
  `computer_type` varchar(32) DEFAULT NULL COMMENT '电脑型号',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='调动表 ';

-- ----------------------------
-- Records of b_call_position
-- ----------------------------

-- ----------------------------
-- Table structure for b_first_handle
-- ----------------------------
DROP TABLE IF EXISTS `b_first_handle`;
CREATE TABLE `b_first_handle` (
  `h_id` varchar(32) NOT NULL COMMENT '办理id',
  `u_id` varchar(32) NOT NULL COMMENT '用户id',
  `department` varchar(128) NOT NULL COMMENT '服务对象',
  `project_team` varchar(128) NOT NULL COMMENT '服务项目组',
  `project_name` varchar(128) NOT NULL COMMENT '服务器项目名称',
  `is_card` varchar(32) NOT NULL COMMENT '餐卡办理',
  `is_caliche` varchar(32) NOT NULL COMMENT '硬盘应用',
  `computer_type` varchar(32) NOT NULL COMMENT '电脑型号',
  `bid_section` varchar(128) DEFAULT NULL COMMENT '标段',
  `eva_level` varchar(32) DEFAULT NULL COMMENT '评价等级 业务类型为租赁人员管理则必填',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='首次办理表 ';

-- ----------------------------
-- Records of b_first_handle
-- ----------------------------
INSERT INTO `b_first_handle` VALUES ('2007039MM915A70H', '2007039MM7MGS3C0', '研究院', 'smart项目组', 'smart工程', '0', '1', '华硕CK100-tw', '标段', 'A', null, '2020-07-03 13:32:38', null, null, null, null);

-- ----------------------------
-- Table structure for b_leave
-- ----------------------------
DROP TABLE IF EXISTS `b_leave`;
CREATE TABLE `b_leave` (
  `c_id` varchar(32) NOT NULL COMMENT '调用id',
  `u_id` varchar(32) NOT NULL COMMENT '用户id',
  `is_deposit` varchar(32) NOT NULL COMMENT '已交过押金 0：否，1：是',
  `deposit_name` varchar(32) NOT NULL COMMENT '押金单号',
  `account_name` varchar(1024) NOT NULL COMMENT '开户人姓名',
  `account_card` varchar(128) NOT NULL COMMENT '银行卡号',
  `payment_name` varchar(1024) NOT NULL COMMENT '支付名称',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='离岗表 ';

-- ----------------------------
-- Records of b_leave
-- ----------------------------

-- ----------------------------
-- Table structure for b_supplier
-- ----------------------------
DROP TABLE IF EXISTS `b_supplier`;
CREATE TABLE `b_supplier` (
  `s_id` varchar(32) NOT NULL COMMENT '供应商id',
  `s_name` varchar(128) NOT NULL COMMENT '供应商公司名称',
  `s_number` varchar(32) DEFAULT NULL COMMENT '供应商编号',
  `start_date` date NOT NULL COMMENT '预计开始时间',
  `end_date` date NOT NULL COMMENT '预计结束日期',
  `check_type` varchar(32) NOT NULL COMMENT '办理类型 1首次办理、2续办、3离岗、4调动',
  `bus_type` varchar(32) NOT NULL COMMENT '业务类型 1租赁人员管理、2供应商驻司人员管理',
  `subject_matter` varchar(3072) NOT NULL COMMENT '事由',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `counterpart_name` varchar(32) NOT NULL COMMENT '吉利对接人姓名',
  `counterpart_number` varchar(32) NOT NULL COMMENT '吉利对接人工号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='供应商表 ';

-- ----------------------------
-- Records of b_supplier
-- ----------------------------
INSERT INTO `b_supplier` VALUES ('2007039MM6XHY9YW', '杭州洛必达科技有限公司', null, '2020-01-07', '2020-07-07', '1', '1', '在开始系统化成长之初，先从整体上认知大型互联网系统架构演变历程，明确架构师需要具备哪些技术栈与核心能力，之后开始筑基-单体开发。本周首先带大家分析电商首页需求，然后实现首页轮播图功能，分类功能，商品推荐功能，搜索功能，商品评价功能，最后带大家开发电商核心功能模块-购物车。本周首先带大家完成收获地址的开发，接着开发电商核心业务功能-订单，支付（微信支付，支付宝支付），最后带大家设计一个定时任务，实现定时关闭超期未支付订单功能。', '1', '占助', '0217492', '2020-07-03 13:32:38', null, null, null, null);

-- ----------------------------
-- Table structure for b_supplier_maintain
-- ----------------------------
DROP TABLE IF EXISTS `b_supplier_maintain`;
CREATE TABLE `b_supplier_maintain` (
  `s_id` varchar(32) NOT NULL COMMENT '供应商id',
  `s_number` varchar(32) NOT NULL COMMENT '供应商编号',
  `s_name` varchar(128) NOT NULL COMMENT '供应商公司名称',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='供应商维护表 ';

-- ----------------------------
-- Records of b_supplier_maintain
-- ----------------------------
INSERT INTO `b_supplier_maintain` VALUES ('2007076A0PYX77C0', 'P0000039', '吉利集团公司&&&&', '1', '2020-07-07 08:54:32', null, null, null, null);
INSERT INTO `b_supplier_maintain` VALUES ('2007079C3STTST0H', 'P0000040', '吉利集团公司乳方', '1', '2020-07-07 13:13:04', null, null, null, null);

-- ----------------------------
-- Table structure for b_user
-- ----------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user` (
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `user_number` varchar(32) DEFAULT NULL COMMENT '人员编号',
  `s_number` varchar(32) DEFAULT NULL COMMENT '供应商id',
  `user_name` varchar(32) NOT NULL COMMENT '姓名',
  `user_account` varchar(32) DEFAULT NULL COMMENT '账号',
  `card_number` varchar(32) DEFAULT NULL COMMENT '卡号',
  `phone` varchar(32) NOT NULL COMMENT '联系方式',
  `gender` varchar(32) NOT NULL COMMENT '性别 0：女，1：男',
  `age` varchar(32) NOT NULL COMMENT '年龄',
  `native_place` varchar(32) NOT NULL COMMENT '籍贯',
  `number_id` varchar(32) NOT NULL COMMENT '身份证号码',
  `address` varchar(128) NOT NULL COMMENT '身份证地址',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `education` varchar(128) NOT NULL COMMENT '最高学历',
  `graduate` varchar(1024) NOT NULL COMMENT '毕业院校',
  `graduation_time` date NOT NULL COMMENT '毕业时间',
  `major` varchar(1024) NOT NULL COMMENT '专业',
  `work_years` varchar(32) NOT NULL COMMENT '工作年限',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表 ';

-- ----------------------------
-- Records of b_user
-- ----------------------------
INSERT INTO `b_user` VALUES ('2007039MM7MGS3C0', 'S0000001', '2007039MM6XHY9YW', '张三', null, null, '18000202000', '0', '18', '浙江', '360428199401010001', '杭州市西湖区', '1', '本科', '杭州大学', '2014-07-08', '软件工程', '5', '2020-07-03 13:32:38', null, null, null, null);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('51', 'b_user', '用户信息表 ', 'BUser', 'crud', 'com.geely.project.supplier', 'supplier', 'user', '用户信息 ', 'zhanzhu', null, 'admin', '2020-06-30 08:53:24', '', null, null);
INSERT INTO `gen_table` VALUES ('52', 'b_supplier', '供应商表 ', 'BSupplier', 'crud', 'com.geely.project.supplier', 'supplier', 'supplier', '供应商 ', 'zhanzhu', null, 'admin', '2020-06-30 16:15:07', '', null, null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=708 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('50', '6', 'c_id', '调用id', 'varchar(32)', 'String', 'cId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('51', '6', 'u_id', '用户id', 'varchar(32)', 'String', 'uId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('52', '6', 'is_card', '需要办理餐卡 0：否，1：是', 'varchar(32)', 'String', 'isCard', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('53', '6', 'is_caliche', '需要领用硬盘 0：否，1：是', 'varchar(32)', 'String', 'isCaliche', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('54', '6', 'computer_type', '电脑型号', 'varchar(32)', 'String', 'computerType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '5', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('55', '6', 'CREATED_TIME', '创建时间', 'datetime', 'Date', 'createdTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '6', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('56', '6', 'UPDATED_TIME', '更新时间', 'datetime', 'Date', 'updatedTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '7', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('57', '7', 'c_id', '调用id', 'varchar(32)', 'String', 'cId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('58', '7', 'u_id', '用户id', 'varchar(32)', 'String', 'uId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('59', '7', 'export_dep', '调出品牌院/中心 首次办理的服务对象', 'varchar(128)', 'String', 'exportDep', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('60', '7', 'entry_dep', '调入品牌院/中心', 'varchar(128)', 'String', 'entryDep', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('61', '7', 'project_team', '调入服务项目组', 'varchar(128)', 'String', 'projectTeam', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('62', '7', 'project_name', '调入服务项目名称', 'varchar(128)', 'String', 'projectName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '6', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('63', '7', 'bid_section', '标段 业务类型为租赁人员管理则必填', 'varchar(128)', 'String', 'bidSection', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('64', '7', 'eva_level', '评价等级 业务类型为租赁人员管理则必填', 'varchar(32)', 'String', 'evaLevel', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('65', '7', 'is_card', '需要办理餐卡 0：否，1：是', 'varchar(32)', 'String', 'isCard', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('66', '7', 'is_caliche', '需要领用硬盘 0：否，1：是', 'varchar(32)', 'String', 'isCaliche', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('67', '7', 'computer_type', '电脑型号', 'varchar(32)', 'String', 'computerType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '11', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('68', '7', 'CREATED_TIME', '创建时间', 'datetime', 'Date', 'createdTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '12', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('69', '7', 'UPDATED_TIME', '更新时间', 'datetime', 'Date', 'updatedTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '13', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('70', '8', 'h_id', '办理id', 'varchar(32)', 'String', 'hId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('71', '8', 'u_id', '用户id', 'varchar(32)', 'String', 'uId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('72', '8', 'department', '服务对象', 'varchar(128)', 'String', 'department', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('73', '8', 'project_team', '服务项目组', 'varchar(128)', 'String', 'projectTeam', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('74', '8', 'project_name', '服务器项目名称', 'varchar(128)', 'String', 'projectName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '5', 'admin', '2020-06-23 10:13:09', '', null);
INSERT INTO `gen_table_column` VALUES ('75', '8', 'is_card', '餐卡办理 0：否，1：是', 'varchar(32)', 'String', 'isCard', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('76', '8', 'is_caliche', '硬盘应用 0：否，1：是', 'varchar(32)', 'String', 'isCaliche', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('77', '8', 'computer_type', '电脑型号', 'varchar(32)', 'String', 'computerType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '8', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('78', '8', 'status', '状态 0：首次,：1：调动,2：续办,3：离岗', 'varchar(32)', 'String', 'status', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', '', '9', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('79', '8', 'bid_section', '标段 业务类型为租赁人员管理则必填', 'varchar(128)', 'String', 'bidSection', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('80', '8', 'eva_level', '评价等级 业务类型为租赁人员管理则必填', 'varchar(32)', 'String', 'evaLevel', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('81', '8', 'CREATED_TIME', '创建时间', 'datetime', 'Date', 'createdTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '12', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('82', '8', 'UPDATED_TIME', '更新时间', 'datetime', 'Date', 'updatedTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '13', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('83', '9', 'c_id', '调用id', 'varchar(32)', 'String', 'cId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('84', '9', 'u_id', '用户id', 'varchar(32)', 'String', 'uId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('85', '9', 'is_deposit', '已交过押金 0：否，1：是', 'varchar(32)', 'String', 'isDeposit', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('86', '9', 'deposit_name', '押金单号', 'varchar(32)', 'String', 'depositName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '4', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('87', '9', 'account_name', '开户人姓名', 'varchar(1024)', 'String', 'accountName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'textarea', '', '5', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('88', '9', 'account_card', '银行卡号', 'varchar(128)', 'String', 'accountCard', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('89', '9', 'payment_name', '支付名称', 'varchar(1024)', 'String', 'paymentName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'textarea', '', '7', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('90', '9', 'CREATED_TIME', '创建时间', 'datetime', 'Date', 'createdTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '8', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('91', '9', 'UPDATED_TIME', '更新时间', 'datetime', 'Date', 'updatedTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '9', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('92', '10', 's_id', '供应商id id', 'varchar(32)', 'String', 'sId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('93', '10', 's_number', '供应商编号 供应商编号', 'varchar(32)', 'String', 'sNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('94', '10', 's_name', '供应商公司名称 供应商公司名称', 'varchar(128)', 'String', 'sName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('95', '10', 'start_time', '开始时间 开始日期', 'date', 'Date', 'startTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '4', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('96', '10', 'end_time', '预计结束日期 预计结束日期', 'date', 'Date', 'endTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '5', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('97', '10', 'check_type', '办理类型 1首次办理、2续办、3离岗、4调动', 'varchar(32)', 'String', 'checkType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '6', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('98', '10', 'bus_type', '业务类型 1租赁人员管理、2供应商驻司人员管理', 'varchar(32)', 'String', 'busType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '7', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('99', '10', 'subject_matter', '事由 事由', 'varchar(3072)', 'String', 'subjectMatter', '0', '0', null, '1', '1', '1', '1', 'EQ', 'textarea', '', '8', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('100', '10', 'counterpart_name', '吉利对接人姓名 吉利对接人姓名', 'varchar(32)', 'String', 'counterpartName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '9', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('101', '10', 'counterpart_number', '吉利对接人工号 吉利对接人工号', 'varchar(32)', 'String', 'counterpartNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('102', '10', 'CREATED_TIME', '创建时间 创建时间', 'datetime', 'Date', 'createdTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '11', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('103', '10', 'update_time', '更新时间 更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '12', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('104', '11', 'user_id', '用户id 人员编号', 'varchar(32)', 'String', 'userId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('105', '11', 's_number', '供应商id', 'varchar(32)', 'String', 'sNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('106', '11', 'user_name', '姓名 姓名', 'varchar(32)', 'String', 'userName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('107', '11', 'phone', '联系方式 联系电话', 'varchar(32)', 'String', 'phone', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('108', '11', 'gender', '性别 0：女，1：男', 'varchar(32)', 'String', 'gender', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('109', '11', 'age', '年龄', 'varchar(32)', 'String', 'age', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('110', '11', 'native_place', '籍贯', 'varchar(32)', 'String', 'nativePlace', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('111', '11', 'number_id', '身份证号码', 'varchar(32)', 'String', 'numberId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('112', '11', 'address', '身份证地址', 'varchar(128)', 'String', 'address', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('113', '11', 'education', '最高学历', 'varchar(128)', 'String', 'education', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('114', '11', 'graduate', '毕业院校', 'varchar(1024)', 'String', 'graduate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'textarea', '', '11', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('115', '11', 'graduation_time', '毕业时间', 'date', 'Date', 'graduationTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '12', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('116', '11', 'major', '专业', 'varchar(1024)', 'String', 'major', '0', '0', null, '1', '1', '1', '1', 'EQ', 'textarea', '', '13', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('117', '11', 'work_years', '工作年限', 'varchar(32)', 'String', 'workYears', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '14', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('118', '11', 'untitled', null, 'varchar(32)', 'String', 'untitled', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '15', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('119', '11', 'CREATED_TIME', '创建时间 创建时间', 'datetime', 'Date', 'createdTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '16', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('120', '11', 'UPDATED_TIME', '更新时间', 'datetime', 'Date', 'updatedTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '17', 'admin', '2020-06-23 10:13:10', '', null);
INSERT INTO `gen_table_column` VALUES ('121', '12', 'c_id', '调用id', 'varchar(32)', 'String', 'cId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('122', '12', 'u_id', '用户id', 'varchar(32)', 'String', 'uId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('123', '12', 'is_card', '需要办理餐卡 0：否，1：是', 'varchar(32)', 'String', 'isCard', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('124', '12', 'is_caliche', '需要领用硬盘 0：否，1：是', 'varchar(32)', 'String', 'isCaliche', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('125', '12', 'computer_type', '电脑型号', 'varchar(32)', 'String', 'computerType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '5', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('126', '12', 'CREATED_TIME', '创建时间', 'datetime', 'Date', 'createdTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '6', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('127', '12', 'UPDATED_TIME', '更新时间', 'datetime', 'Date', 'updatedTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '7', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('128', '13', 'c_id', '调用id', 'varchar(32)', 'String', 'cId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('129', '13', 'u_id', '用户id', 'varchar(32)', 'String', 'uId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('130', '13', 'export_dep', '调出品牌院/中心 首次办理的服务对象', 'varchar(128)', 'String', 'exportDep', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('131', '13', 'entry_dep', '调入品牌院/中心', 'varchar(128)', 'String', 'entryDep', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('132', '13', 'project_team', '调入服务项目组', 'varchar(128)', 'String', 'projectTeam', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('133', '13', 'project_name', '调入服务项目名称', 'varchar(128)', 'String', 'projectName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '6', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('134', '13', 'bid_section', '标段 业务类型为租赁人员管理则必填', 'varchar(128)', 'String', 'bidSection', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('135', '13', 'eva_level', '评价等级 业务类型为租赁人员管理则必填', 'varchar(32)', 'String', 'evaLevel', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('136', '13', 'is_card', '需要办理餐卡 0：否，1：是', 'varchar(32)', 'String', 'isCard', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('137', '13', 'is_caliche', '需要领用硬盘 0：否，1：是', 'varchar(32)', 'String', 'isCaliche', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('138', '13', 'computer_type', '电脑型号', 'varchar(32)', 'String', 'computerType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '11', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('139', '13', 'CREATED_TIME', '创建时间', 'datetime', 'Date', 'createdTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '12', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('140', '13', 'UPDATED_TIME', '更新时间', 'datetime', 'Date', 'updatedTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '13', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('141', '14', 'h_id', '办理id', 'varchar(32)', 'String', 'hId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('142', '14', 'u_id', '用户id', 'varchar(32)', 'String', 'uId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('143', '14', 'department', '服务对象', 'varchar(128)', 'String', 'department', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('144', '14', 'project_team', '服务项目组', 'varchar(128)', 'String', 'projectTeam', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('145', '14', 'project_name', '服务器项目名称', 'varchar(128)', 'String', 'projectName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '5', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('146', '14', 'is_card', '餐卡办理 0：否，1：是', 'varchar(32)', 'String', 'isCard', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('147', '14', 'is_caliche', '硬盘应用 0：否，1：是', 'varchar(32)', 'String', 'isCaliche', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('148', '14', 'computer_type', '电脑型号', 'varchar(32)', 'String', 'computerType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '8', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('149', '14', 'status', '状态 0：首次,：1：调动,2：续办,3：离岗', 'varchar(32)', 'String', 'status', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', '', '9', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('150', '14', 'bid_section', '标段 业务类型为租赁人员管理则必填', 'varchar(128)', 'String', 'bidSection', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('151', '14', 'eva_level', '评价等级 业务类型为租赁人员管理则必填', 'varchar(32)', 'String', 'evaLevel', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('152', '14', 'CREATED_TIME', '创建时间', 'datetime', 'Date', 'createdTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '12', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('153', '14', 'UPDATED_TIME', '更新时间', 'datetime', 'Date', 'updatedTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '13', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('154', '15', 'c_id', '调用id', 'varchar(32)', 'String', 'cId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('155', '15', 'u_id', '用户id', 'varchar(32)', 'String', 'uId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('156', '15', 'is_deposit', '已交过押金 0：否，1：是', 'varchar(32)', 'String', 'isDeposit', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('157', '15', 'deposit_name', '押金单号', 'varchar(32)', 'String', 'depositName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '4', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('158', '15', 'account_name', '开户人姓名', 'varchar(1024)', 'String', 'accountName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'textarea', '', '5', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('159', '15', 'account_card', '银行卡号', 'varchar(128)', 'String', 'accountCard', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('160', '15', 'payment_name', '支付名称', 'varchar(1024)', 'String', 'paymentName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'textarea', '', '7', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('161', '15', 'CREATED_TIME', '创建时间', 'datetime', 'Date', 'createdTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '8', 'admin', '2020-06-23 10:46:23', '', null);
INSERT INTO `gen_table_column` VALUES ('162', '15', 'UPDATED_TIME', '更新时间', 'datetime', 'Date', 'updatedTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '9', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('163', '16', 's_id', '供应商id id', 'varchar(32)', 'String', 'sId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('164', '16', 's_number', '供应商编号 供应商编号', 'varchar(32)', 'String', 'sNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('165', '16', 's_name', '供应商公司名称 供应商公司名称', 'varchar(128)', 'String', 'sName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('166', '16', 'start_time', '开始时间 开始日期', 'date', 'Date', 'startTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '4', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('167', '16', 'end_time', '预计结束日期 预计结束日期', 'date', 'Date', 'endTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '5', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('168', '16', 'check_type', '办理类型 1首次办理、2续办、3离岗、4调动', 'varchar(32)', 'String', 'checkType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '6', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('169', '16', 'bus_type', '业务类型 1租赁人员管理、2供应商驻司人员管理', 'varchar(32)', 'String', 'busType', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '7', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('170', '16', 'subject_matter', '事由 事由', 'varchar(3072)', 'String', 'subjectMatter', '0', '0', null, '1', '1', '1', '1', 'EQ', 'textarea', '', '8', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('171', '16', 'counterpart_name', '吉利对接人姓名 吉利对接人姓名', 'varchar(32)', 'String', 'counterpartName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '9', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('172', '16', 'counterpart_number', '吉利对接人工号 吉利对接人工号', 'varchar(32)', 'String', 'counterpartNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('173', '16', 'CREATED_TIME', '创建时间 创建时间', 'datetime', 'Date', 'createdTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '11', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('174', '16', 'update_time', '更新时间 更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '12', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('175', '17', 'user_id', '用户id 人员编号', 'varchar(32)', 'String', 'userId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('176', '17', 's_number', '供应商id', 'varchar(32)', 'String', 'sNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('177', '17', 'user_name', '姓名 姓名', 'varchar(32)', 'String', 'userName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('178', '17', 'phone', '联系方式 联系电话', 'varchar(32)', 'String', 'phone', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('179', '17', 'gender', '性别 0：女，1：男', 'varchar(32)', 'String', 'gender', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('180', '17', 'age', '年龄', 'varchar(32)', 'String', 'age', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('181', '17', 'native_place', '籍贯', 'varchar(32)', 'String', 'nativePlace', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('182', '17', 'number_id', '身份证号码', 'varchar(32)', 'String', 'numberId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('183', '17', 'address', '身份证地址', 'varchar(128)', 'String', 'address', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('184', '17', 'education', '最高学历', 'varchar(128)', 'String', 'education', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('185', '17', 'graduate', '毕业院校', 'varchar(1024)', 'String', 'graduate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'textarea', '', '11', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('186', '17', 'graduation_time', '毕业时间', 'date', 'Date', 'graduationTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '12', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('187', '17', 'major', '专业', 'varchar(1024)', 'String', 'major', '0', '0', null, '1', '1', '1', '1', 'EQ', 'textarea', '', '13', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('188', '17', 'work_years', '工作年限', 'varchar(32)', 'String', 'workYears', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '14', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('189', '17', 'untitled', null, 'varchar(32)', 'String', 'untitled', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '15', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('190', '17', 'CREATED_TIME', '创建时间 创建时间', 'datetime', 'Date', 'createdTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '16', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('191', '17', 'UPDATED_TIME', '更新时间', 'datetime', 'Date', 'updatedTime', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '17', 'admin', '2020-06-23 10:46:24', '', null);
INSERT INTO `gen_table_column` VALUES ('669', '51', 'user_id', '用户id', 'varchar(32)', 'String', 'userId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('670', '51', 'user_number', '人员编号', 'varchar(32)', 'String', 'userNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('671', '51', 's_number', '供应商id', 'varchar(32)', 'String', 'sNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('672', '51', 'user_name', '姓名', 'varchar(32)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '4', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('673', '51', 'user_account', '账号', 'varchar(32)', 'String', 'userAccount', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('674', '51', 'card_number', '卡号', 'varchar(32)', 'String', 'cardNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('675', '51', 'phone', '联系方式', 'varchar(32)', 'String', 'phone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('676', '51', 'gender', '性别 0：女，1：男', 'varchar(32)', 'String', 'gender', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('677', '51', 'age', '年龄', 'varchar(32)', 'String', 'age', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('678', '51', 'native_place', '籍贯', 'varchar(32)', 'String', 'nativePlace', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('679', '51', 'number_id', '身份证号码', 'varchar(32)', 'String', 'numberId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('680', '51', 'address', '身份证地址', 'varchar(128)', 'String', 'address', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '12', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('681', '51', 'status', '状态', 'varchar(32)', 'String', 'status', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', '', '13', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('682', '51', 'education', '最高学历', 'varchar(128)', 'String', 'education', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '14', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('683', '51', 'graduate', '毕业院校', 'varchar(1024)', 'String', 'graduate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', '15', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('684', '51', 'graduation_time', '毕业时间', 'date', 'Date', 'graduationTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '16', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('685', '51', 'major', '专业', 'varchar(1024)', 'String', 'major', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', '17', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('686', '51', 'work_years', '工作年限', 'varchar(32)', 'String', 'workYears', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '18', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('687', '51', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '19', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('688', '51', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '20', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('689', '51', 'create_by', '创建者', 'varchar(32)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '21', 'admin', '2020-06-30 08:53:25', '', null);
INSERT INTO `gen_table_column` VALUES ('690', '51', 'update_by', '更新者', 'varchar(32)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '22', 'admin', '2020-06-30 08:53:32', '', null);
INSERT INTO `gen_table_column` VALUES ('691', '51', 'remark', '备注', 'varchar(1024)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '23', 'admin', '2020-06-30 08:53:32', '', null);
INSERT INTO `gen_table_column` VALUES ('692', '52', 's_id', '供应商id', 'varchar(32)', 'String', 'sId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2020-06-30 16:15:07', '', null);
INSERT INTO `gen_table_column` VALUES ('693', '52', 's_name', '供应商公司名称', 'varchar(128)', 'String', 'sName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2020-06-30 16:15:07', '', null);
INSERT INTO `gen_table_column` VALUES ('694', '52', 's_number', '供应商编号', 'varchar(32)', 'String', 'sNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2020-06-30 16:15:07', '', null);
INSERT INTO `gen_table_column` VALUES ('695', '52', 'start_date', '预计开始时间', 'date', 'Date', 'startDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '4', 'admin', '2020-06-30 16:15:07', '', null);
INSERT INTO `gen_table_column` VALUES ('696', '52', 'end_date', '预计结束日期', 'date', 'Date', 'endDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '5', 'admin', '2020-06-30 16:15:07', '', null);
INSERT INTO `gen_table_column` VALUES ('697', '52', 'check_type', '办理类型 1首次办理、2续办、3离岗、4调动', 'varchar(32)', 'String', 'checkType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', '6', 'admin', '2020-06-30 16:15:07', '', null);
INSERT INTO `gen_table_column` VALUES ('698', '52', 'bus_type', '业务类型 1租赁人员管理、2供应商驻司人员管理', 'varchar(32)', 'String', 'busType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', '7', 'admin', '2020-06-30 16:15:07', '', null);
INSERT INTO `gen_table_column` VALUES ('699', '52', 'subject_matter', '事由', 'varchar(3072)', 'String', 'subjectMatter', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', '8', 'admin', '2020-06-30 16:15:07', '', null);
INSERT INTO `gen_table_column` VALUES ('700', '52', 'status', '状态', 'varchar(32)', 'String', 'status', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', '', '9', 'admin', '2020-06-30 16:15:07', '', null);
INSERT INTO `gen_table_column` VALUES ('701', '52', 'counterpart_name', '吉利对接人姓名', 'varchar(32)', 'String', 'counterpartName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '10', 'admin', '2020-06-30 16:15:07', '', null);
INSERT INTO `gen_table_column` VALUES ('702', '52', 'counterpart_number', '吉利对接人工号', 'varchar(32)', 'String', 'counterpartNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2020-06-30 16:15:07', '', null);
INSERT INTO `gen_table_column` VALUES ('703', '52', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '12', 'admin', '2020-06-30 16:15:07', '', null);
INSERT INTO `gen_table_column` VALUES ('704', '52', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '13', 'admin', '2020-06-30 16:15:07', '', null);
INSERT INTO `gen_table_column` VALUES ('705', '52', 'create_by', '创建者', 'varchar(32)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '14', 'admin', '2020-06-30 16:15:07', '', null);
INSERT INTO `gen_table_column` VALUES ('706', '52', 'update_by', '更新者', 'varchar(32)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '15', 'admin', '2020-06-30 16:15:08', '', null);
INSERT INTO `gen_table_column` VALUES ('707', '52', 'remark', '备注', 'varchar(1024)', 'String', 'remark', '0', '0', null, '1', '1', '1', null, 'EQ', 'textarea', '', '16', 'admin', '2020-06-30 16:15:08', '', null);

-- ----------------------------
-- Table structure for pdman_db_version
-- ----------------------------
DROP TABLE IF EXISTS `pdman_db_version`;
CREATE TABLE `pdman_db_version` (
  `DB_VERSION` varchar(256) DEFAULT NULL,
  `VERSION_DESC` varchar(1024) DEFAULT NULL,
  `CREATED_TIME` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pdman_db_version
-- ----------------------------
INSERT INTO `pdman_db_version` VALUES ('v0.0.0', '默认版本，新增的版本不能低于此版本', '2020-06-24 14:37:00');
INSERT INTO `pdman_db_version` VALUES ('v1.0.1', '初始化版本', '2020-06-24 14:38:05');
INSERT INTO `pdman_db_version` VALUES ('v1.0.2', '新增status状态字段，新增用户id', '2020-06-24 17:19:37');
INSERT INTO `pdman_db_version` VALUES ('v1.0.3', '新增用户账号和餐卡账号', '2020-06-30 08:41:55');
INSERT INTO `pdman_db_version` VALUES ('v1.0.4', '更新供应商名称', '2020-06-30 16:10:27');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.geely.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E6765656C792E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E6765656C792E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E74697479000000000000000102000A4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787070707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.geely.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E6765656C792E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E6765656C792E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E74697479000000000000000102000A4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787070707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.geely.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E6765656C792E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E6765656C792E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E74697479000000000000000102000A4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00094C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787070707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'BJI000-L8184VFC1594168850914', '1594170345825', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1594168860000', '-1', '5', 'PAUSED', 'CRON', '1594168851000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1594168860000', '-1', '5', 'PAUSED', 'CRON', '1594168851000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1594168860000', '-1', '5', 'PAUSED', 'CRON', '1594168851000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '某某公司', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-05-20 15:55:24');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2020-06-23 11:36:24');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-16 16:17:35');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-16 16:19:58');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 08:36:20');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 09:07:35');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-05-18 09:16:21');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-05-18 09:16:31');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 09:16:39');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-05-18 09:24:25');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-18 09:24:40');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-20 15:17:10');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-20 15:35:50');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-05-22 13:27:16');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 16:44:41');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 16:46:17');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 16:46:27');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 16:55:28');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 16:56:08');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 17:16:26');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 17:16:38');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 17:18:56');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 17:19:05');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-02 17:20:01');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-06-02 17:33:56');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-06-02 17:37:34');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-06-02 17:37:37');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-02 17:44:05');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-04 10:55:06');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-04 10:56:23');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-04 13:52:42');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-04 14:06:06');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2020-06-04 14:11:09');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-06-04 14:11:25');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-06-04 14:14:47');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-05 09:22:12');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-05 09:56:08');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-09 13:54:44');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-09 14:00:06');
INSERT INTO `sys_logininfor` VALUES ('174', 'zhanzhu', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-06-09 14:00:34');
INSERT INTO `sys_logininfor` VALUES ('176', 'zhanzhu', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-06-09 14:00:44');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-09 14:00:54');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-09 14:01:02');
INSERT INTO `sys_logininfor` VALUES ('182', 'zhu.zhan', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-09 14:01:19');
INSERT INTO `sys_logininfor` VALUES ('184', 'zhu.zhan', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-06-09 14:08:24');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-06-09 14:08:36');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-09 14:08:44');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-17 09:28:03');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-17 15:08:41');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-18 09:14:25');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-23 10:12:25');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-06-23 11:35:30');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-06-23 11:35:39');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-23 11:35:50');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-23 15:49:03');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-23 17:14:17');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-24 09:52:14');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-24 10:56:38');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-24 14:39:25');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-24 16:12:55');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-24 16:48:38');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-24 17:20:30');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-28 13:48:57');
INSERT INTO `sys_logininfor` VALUES ('209', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-28 14:57:51');
INSERT INTO `sys_logininfor` VALUES ('210', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-28 16:25:45');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-30 08:49:35');
INSERT INTO `sys_logininfor` VALUES ('212', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-06-30 16:14:53');
INSERT INTO `sys_logininfor` VALUES ('213', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-01 08:38:30');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-03 13:58:26');
INSERT INTO `sys_logininfor` VALUES ('215', 'admin', '10.34.168.39', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-03 14:01:14');
INSERT INTO `sys_logininfor` VALUES ('216', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-07 16:58:56');
INSERT INTO `sys_logininfor` VALUES ('217', 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-07-07 17:05:55');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2002 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '1', 'M', '0', '0', '', 'system', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '1', 'M', '0', '0', '', 'monitor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '1', 'M', '0', '0', '', 'tool', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '1', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '1', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '1', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '1', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '1', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '1', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '1', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '1', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', 'system/log/index', '1', 'M', '0', '0', '', 'log', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '1', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '1', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '1', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '1', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', 'build', 'tool/build/index', '1', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '3', '2', 'gen', 'tool/gen/index', '1', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '1', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '1', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '1', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1001', '用户查询', '100', '1', '', '', '1', 'F', '0', '0', 'system:user:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户新增', '100', '2', '', '', '1', 'F', '0', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户修改', '100', '3', '', '', '1', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户删除', '100', '4', '', '', '1', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导出', '100', '5', '', '', '1', 'F', '0', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '用户导入', '100', '6', '', '', '1', 'F', '0', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '重置密码', '100', '7', '', '', '1', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色查询', '101', '1', '', '', '1', 'F', '0', '0', 'system:role:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色新增', '101', '2', '', '', '1', 'F', '0', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色修改', '101', '3', '', '', '1', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色删除', '101', '4', '', '', '1', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '角色导出', '101', '5', '', '', '1', 'F', '0', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单查询', '102', '1', '', '', '1', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单新增', '102', '2', '', '', '1', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单修改', '102', '3', '', '', '1', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '菜单删除', '102', '4', '', '', '1', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门查询', '103', '1', '', '', '1', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门新增', '103', '2', '', '', '1', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门修改', '103', '3', '', '', '1', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '部门删除', '103', '4', '', '', '1', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位查询', '104', '1', '', '', '1', 'F', '0', '0', 'system:post:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位新增', '104', '2', '', '', '1', 'F', '0', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位修改', '104', '3', '', '', '1', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位删除', '104', '4', '', '', '1', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '岗位导出', '104', '5', '', '', '1', 'F', '0', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典查询', '105', '1', '#', '', '1', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典新增', '105', '2', '#', '', '1', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典修改', '105', '3', '#', '', '1', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典删除', '105', '4', '#', '', '1', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '字典导出', '105', '5', '#', '', '1', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数查询', '106', '1', '#', '', '1', 'F', '0', '0', 'system:config:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数新增', '106', '2', '#', '', '1', 'F', '0', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数修改', '106', '3', '#', '', '1', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数删除', '106', '4', '#', '', '1', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '参数导出', '106', '5', '#', '', '1', 'F', '0', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告查询', '107', '1', '#', '', '1', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告新增', '107', '2', '#', '', '1', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告修改', '107', '3', '#', '', '1', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '公告删除', '107', '4', '#', '', '1', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作查询', '500', '1', '#', '', '1', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '操作删除', '500', '2', '#', '', '1', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', '1', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', '1', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', '1', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', '1', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '1', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '1', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '1', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '1', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '1', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '1', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '1', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '1', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '7', '#', '', '1', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '114', '1', '#', '', '1', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '114', '2', '#', '', '1', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '114', '3', '#', '', '1', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '114', '2', '#', '', '1', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '114', '4', '#', '', '1', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '114', '5', '#', '', '1', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2000', '搜索引擎', '0', '4', 'search', null, '1', 'M', '0', '0', '', 'select', 'admin', '2020-05-20 15:58:50', 'admin', '2020-05-20 15:59:17', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('10', 'test', '2', '<p>tete</p>', '0', 'admin', '2020-06-02 17:06:41', '', null, null);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '在线用户', '3', 'com.ruoyi.project.monitor.controller.SysUserOnlineController.forceLogout()', 'DELETE', '1', null, null, '/monitor/online/50092ae2-c9c4-4c2a-81de-4003374f0291', '127.0.0.1', '内网IP', '{tokenId=50092ae2-c9c4-4c2a-81de-4003374f0291}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-16 16:19:48');
INSERT INTO `sys_oper_log` VALUES ('102', '代码生成', '6', 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_config', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-16 16:49:35');
INSERT INTO `sys_oper_log` VALUES ('104', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-05-16 16:49:42');
INSERT INTO `sys_oper_log` VALUES ('106', '代码生成', '6', 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_dict_data', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-16 16:53:49');
INSERT INTO `sys_oper_log` VALUES ('108', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', '0', null, '2020-05-16 16:53:52');
INSERT INTO `sys_oper_log` VALUES ('110', '用户管理', '1', 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '10.34.168.39', '内网IP', '{\"phonenumber\":\"18070143291\",\"admin\":false,\"remark\":\"新入职的员工\",\"password\":\"$2a$10$OxoXrYmmkbxv76GGc.W0l.kj1Mniwrt93aRuSV8v1njgpQ0fYWXMu\",\"postIds\":[4],\"email\":\"zhu.zhan@geely.com\",\"nickName\":\"占助\",\"sex\":\"0\",\"deptId\":106,\"params\":{},\"userName\":\"zhu.zhan\",\"createBy\":\"admin\",\"roleIds\":[1],\"status\":\"0\"}', 'null', '1', 'None of the configured nodes are available: [{#transport#-1}{29EQULY8S1-NGviIzBrnqQ}{10.34.168.39}{10.34.168.39:9200}]', '2020-05-20 15:21:00');
INSERT INTO `sys_oper_log` VALUES ('112', '用户管理', '1', 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '10.34.168.39', '内网IP', '{\"phonenumber\":\"18070143291\",\"admin\":false,\"remark\":\"新入职的员工\",\"password\":\"$2a$10$Gu3J3D06lQxwpmSdEXvszeWL.6/bmgx7TDAeRWJEXjQe03rDk49W.\",\"postIds\":[4],\"email\":\"zhu.zhan@geely.com\",\"nickName\":\"占助\",\"sex\":\"0\",\"deptId\":106,\"params\":{},\"userName\":\"zhu.zhan\",\"createBy\":\"admin\",\"roleIds\":[1],\"status\":\"0\"}', 'null', '1', 'None of the configured nodes are available: [{#transport#-1}{29EQULY8S1-NGviIzBrnqQ}{10.34.168.39}{10.34.168.39:9200}]', '2020-05-20 15:24:26');
INSERT INTO `sys_oper_log` VALUES ('114', '用户管理', '1', 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '10.34.168.39', '内网IP', '{\"phonenumber\":\"18070143291\",\"admin\":false,\"remark\":\"新入职的员工\",\"password\":\"$2a$10$VZXwHydSMceiEMR8xC3ozutlNqfAybCqKEyxrnJkOmGH83TFO20By\",\"postIds\":[4],\"email\":\"zhu.zhan@geely.com\",\"nickName\":\"占助\",\"sex\":\"0\",\"deptId\":106,\"params\":{},\"userName\":\"zhu.zhan\",\"createBy\":\"admin\",\"roleIds\":[1],\"status\":\"0\"}', 'null', '1', 'None of the configured nodes are available: [{#transport#-1}{QfTRnkd3RJq22yeZGz-KLg}{127.0.0.1}{127.0.0.1:9200}]', '2020-05-20 15:29:42');
INSERT INTO `sys_oper_log` VALUES ('116', '用户管理', '1', 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '10.34.168.39', '内网IP', '{\"phonenumber\":\"18070143291\",\"admin\":false,\"remark\":\"新入职的员工\",\"password\":\"$2a$10$MbIAv1Kt.72FjxM5HmaP/eI8WMAlvf22FNHHNZnUyMQ0gpc9ceud2\",\"postIds\":[4],\"email\":\"zhu.zhan@geely.com\",\"nickName\":\"占助\",\"sex\":\"0\",\"deptId\":106,\"params\":{},\"userName\":\"zhu.zhan\",\"createBy\":\"admin\",\"roleIds\":[1],\"status\":\"0\"}', 'null', '1', 'None of the configured nodes are available: [{#transport#-1}{GR43ATbrQMy8mX4kqlSIQg}{10.34.168.39}{10.34.168.39:9200}]', '2020-05-20 15:36:02');
INSERT INTO `sys_oper_log` VALUES ('118', '用户管理', '1', 'com.ruoyi.project.system.controller.SysUserController.add()', 'POST', '1', 'admin', null, '/system/user', '10.34.168.39', '内网IP', '{\"phonenumber\":\"18070143291\",\"admin\":false,\"remark\":\"新入职的员工\",\"password\":\"$2a$10$nb7FSgT0dW8FgLhBvykgo.piz2AgDh3g64uQn0qOFvGJPzMDTAOja\",\"postIds\":[4],\"email\":\"zhu.zhan@geely.com\",\"nickName\":\"占助\",\"sex\":\"0\",\"deptId\":106,\"params\":{},\"userName\":\"zhu.zhan\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[1],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-20 15:39:51');
INSERT INTO `sys_oper_log` VALUES ('120', '部门管理', '2', 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '10.34.168.39', '内网IP', '{\"deptName\":\"吉利集团公司\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-20 15:55:06');
INSERT INTO `sys_oper_log` VALUES ('122', '部门管理', '2', 'com.ruoyi.project.system.controller.SysDeptController.edit()', 'PUT', '1', 'admin', null, '/system/dept', '10.34.168.39', '内网IP', '{\"deptName\":\"某某公司\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1521171180000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-20 15:55:24');
INSERT INTO `sys_oper_log` VALUES ('124', '菜单管理', '1', 'com.ruoyi.project.system.controller.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '10.34.168.39', '内网IP', '{\"visible\":\"0\",\"icon\":\"select\",\"orderNum\":\"6\",\"menuName\":\"搜索引擎\",\"params\":{},\"parentId\":0,\"path\":\"search\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-20 15:58:51');
INSERT INTO `sys_oper_log` VALUES ('126', '菜单管理', '2', 'com.ruoyi.project.system.controller.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '10.34.168.39', '内网IP', '{\"visible\":\"0\",\"icon\":\"select\",\"orderNum\":\"4\",\"menuName\":\"搜索引擎\",\"params\":{},\"parentId\":0,\"path\":\"search\",\"children\":[],\"createTime\":1589961530000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-05-20 15:59:17');
INSERT INTO `sys_oper_log` VALUES ('128', '用户管理', '5', 'com.ruoyi.project.system.controller.SysUserController.export()', 'GET', '1', 'admin', null, '/system/user/export', '10.34.168.39', '内网IP', '{}', '{\"msg\":\"3b4b82cc-3276-432f-b983-c30c410ab809_用户数据.xlsx\",\"code\":200}', '0', null, '2020-05-22 13:27:30');
INSERT INTO `sys_oper_log` VALUES ('130', '用户管理', '5', 'com.ruoyi.project.system.controller.SysUserController.export()', 'GET', '1', 'admin', null, '/system/user/export', '10.34.168.39', '内网IP', '{}', '{\"msg\":\"bb6f94c4-a9d0-4a6b-b17e-56b7d13b4062_用户数据.xlsx\",\"code\":200}', '0', null, '2020-05-22 13:33:30');
INSERT INTO `sys_oper_log` VALUES ('132', '用户管理', '5', 'com.ruoyi.project.system.controller.SysUserController.export()', 'GET', '1', 'admin', null, '/system/user/export', '10.34.168.39', '内网IP', '{}', '{\"msg\":\"a18d64e8-8b1d-4b1d-a095-a40939b8086a_用户数据.xlsx\",\"code\":200}', '0', null, '2020-05-22 13:35:01');
INSERT INTO `sys_oper_log` VALUES ('134', '用户管理', '5', 'com.ruoyi.project.system.controller.SysUserController.export()', 'GET', '1', 'admin', null, '/system/user/export', '10.34.168.39', '内网IP', '{}', '{\"msg\":\"50c74c7f-fab9-40d5-aec4-c27e6e53fda6_用户数据.xlsx\",\"code\":200}', '0', null, '2020-05-22 13:35:47');
INSERT INTO `sys_oper_log` VALUES ('136', '用户管理', '5', 'com.ruoyi.project.system.controller.SysUserController.export()', 'GET', '1', 'admin', null, '/system/user/export', '10.34.168.39', '内网IP', '{}', '{\"msg\":\"479fd414-efa5-41d7-9325-93b36c252b49_用户数据.xlsx\",\"code\":200}', '0', null, '2020-05-22 13:38:40');
INSERT INTO `sys_oper_log` VALUES ('138', '用户管理', '5', 'com.ruoyi.project.system.controller.SysUserController.export()', 'GET', '1', 'admin', null, '/system/user/export', '10.34.168.39', '内网IP', '{}', '{\"msg\":\"b9c14184-2d17-412c-9728-811dbed917d2_用户数据.xlsx\",\"code\":200}', '0', null, '2020-05-22 13:39:11');
INSERT INTO `sys_oper_log` VALUES ('140', '用户管理', '5', 'com.ruoyi.project.system.controller.SysUserController.export()', 'GET', '1', 'admin', null, '/system/user/export', '10.34.168.39', '内网IP', '{}', '{\"msg\":\"18492d26-ed5b-4654-95e3-bcbc93d8d523_用户数据.xlsx\",\"code\":200}', '0', null, '2020-05-22 13:40:03');
INSERT INTO `sys_oper_log` VALUES ('142', '通知公告', '1', 'com.ruoyi.project.system.controller.SysNoticeController.add()', 'POST', '1', 'admin', null, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"2\",\"params\":{},\"noticeTitle\":\"test\",\"noticeContent\":\"<p>tete</p>\",\"createBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-02 17:06:42');
INSERT INTO `sys_oper_log` VALUES ('144', '用户管理', '2', 'com.ruoyi.project.system.controller.SysUserController.edit()', 'PUT', '1', 'admin', null, '/system/user', '10.34.168.39', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"18070143291\",\"admin\":false,\"remark\":\"新入职的员工\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[4],\"loginIp\":\"\",\"email\":\"zhu.zhan@geely.com\",\"nickName\":\"占助\",\"sex\":\"0\",\"deptId\":106,\"avatar\":\"\",\"dept\":{\"deptName\":\"财务部门\",\"leader\":\"若依\",\"deptId\":106,\"orderNum\":\"4\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhu.zhan\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1589960391000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-09 13:59:41');
INSERT INTO `sys_oper_log` VALUES ('146', '用户管理', '2', 'com.ruoyi.project.system.controller.SysUserController.resetPwd()', 'PUT', '1', 'admin', null, '/system/user/resetPwd', '10.34.168.39', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$/5wkdWLHEa3tF2US.SXvF.9iKgUgcC8PncYUSTRvztFM/kGpVKK5G\",\"updateBy\":\"admin\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-09 14:00:01');
INSERT INTO `sys_oper_log` VALUES ('148', '角色管理', '1', 'com.ruoyi.project.system.controller.SysRoleController.add()', 'POST', '1', 'zhu.zhan', null, '/system/role', '10.34.168.39', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"createBy\":\"zhu.zhan\",\"roleKey\":\"user\",\"roleName\":\"用户角色\",\"deptIds\":[],\"menuIds\":[100,1001,1002,1003,1004,1005,1006,1007,1],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-09 14:05:00');
INSERT INTO `sys_oper_log` VALUES ('150', '用户管理', '2', 'com.geely.project.system.controller.SysUserController.changeStatus()', 'PUT', '1', 'admin', null, '/system/user/changeStatus', '10.34.168.39', '内网IP', '{\"admin\":true,\"params\":{},\"userId\":1,\"status\":\"1\"}', 'null', '1', '不允许操作超级管理员用户', '2020-06-18 09:15:46');
INSERT INTO `sys_oper_log` VALUES ('152', '用户管理', '3', 'com.geely.project.system.controller.SysUserController.remove()', 'DELETE', '1', 'admin', null, '/system/user/1', '10.34.168.39', '内网IP', '{userIds=1}', 'null', '1', '不允许操作超级管理员用户', '2020-06-18 09:15:51');
INSERT INTO `sys_oper_log` VALUES ('154', '代码生成', '3', 'com.geely.project.tool.gen.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/2,4', '10.34.168.39', '内网IP', '{tableIds=2,4}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-23 10:12:45');
INSERT INTO `sys_oper_log` VALUES ('155', '代码生成', '6', 'com.geely.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '10.34.168.39', '内网IP', 'b_again_handle,b_call_position,b_first_handle,b_leave,b_supplier,b_user', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-23 10:13:11');
INSERT INTO `sys_oper_log` VALUES ('156', '代码生成', '8', 'com.geely.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '10.34.168.39', '内网IP', '{}', 'null', '0', null, '2020-06-23 10:13:16');
INSERT INTO `sys_oper_log` VALUES ('157', '代码生成', '8', 'com.geely.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '10.34.168.39', '内网IP', '{}', 'null', '0', null, '2020-06-23 10:21:43');
INSERT INTO `sys_oper_log` VALUES ('158', '代码生成', '8', 'com.geely.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '10.34.168.39', '内网IP', '{}', 'null', '0', null, '2020-06-23 10:27:30');
INSERT INTO `sys_oper_log` VALUES ('159', '代码生成', '8', 'com.geely.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '10.34.168.39', '内网IP', '{}', 'null', '0', null, '2020-06-23 10:36:56');
INSERT INTO `sys_oper_log` VALUES ('160', '代码生成', '8', 'com.geely.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '10.34.168.39', '内网IP', '{}', 'null', '0', null, '2020-06-23 10:44:59');
INSERT INTO `sys_oper_log` VALUES ('161', '代码生成', '6', 'com.geely.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '10.34.168.39', '内网IP', 'b_again_handle,b_call_position,b_first_handle,b_leave,b_supplier,b_user', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-23 10:46:24');
INSERT INTO `sys_oper_log` VALUES ('162', '代码生成', '8', 'com.geely.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '10.34.168.39', '内网IP', '{}', 'null', '0', null, '2020-06-23 10:46:38');
INSERT INTO `sys_oper_log` VALUES ('163', '定时任务', '2', 'com.geely.project.monitor.controller.SysJobController.run()', 'PUT', '1', 'admin', null, '/monitor/job/run', '10.34.168.39', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"params\":{},\"jobId\":1,\"misfirePolicy\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-23 11:36:24');
INSERT INTO `sys_oper_log` VALUES ('164', '代码生成', '6', 'com.geely.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '10.34.168.39', '内网IP', 'b_again_handle,b_call_position,b_first_handle,b_leave,b_supplier,b_user', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-23 17:15:18');
INSERT INTO `sys_oper_log` VALUES ('165', '代码生成', '8', 'com.geely.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '10.34.168.39', '内网IP', '{}', 'null', '0', null, '2020-06-23 17:15:23');
INSERT INTO `sys_oper_log` VALUES ('166', '代码生成', '3', 'com.geely.project.tool.gen.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/18,19,20,21,22,23', '10.34.168.39', '内网IP', '{tableIds=18,19,20,21,22,23}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-24 09:52:27');
INSERT INTO `sys_oper_log` VALUES ('167', '代码生成', '6', 'com.geely.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '10.34.168.39', '内网IP', 'b_again_handle,b_call_position,b_first_handle,b_leave,b_supplier,b_user', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-24 09:52:40');
INSERT INTO `sys_oper_log` VALUES ('168', '代码生成', '8', 'com.geely.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '10.34.168.39', '内网IP', '{}', 'null', '0', null, '2020-06-24 09:52:49');
INSERT INTO `sys_oper_log` VALUES ('169', '代码生成', '3', 'com.geely.project.tool.gen.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/24,25,26,27,28,29', '10.34.168.39', '内网IP', '{tableIds=24,25,26,27,28,29}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-24 14:40:26');
INSERT INTO `sys_oper_log` VALUES ('170', '代码生成', '6', 'com.geely.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '10.34.168.39', '内网IP', 'b_again_handle,b_call_position,b_first_handle,b_leave,b_supplier,b_supplier_maintain,b_user', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-24 14:40:41');
INSERT INTO `sys_oper_log` VALUES ('171', '代码生成', '8', 'com.geely.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '10.34.168.39', '内网IP', '{}', 'null', '0', null, '2020-06-24 14:40:48');
INSERT INTO `sys_oper_log` VALUES ('172', '代码生成', '3', 'com.geely.project.tool.gen.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/30,31,32,33,34,35,36', '10.34.168.39', '内网IP', '{tableIds=30,31,32,33,34,35,36}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-24 17:20:36');
INSERT INTO `sys_oper_log` VALUES ('173', '代码生成', '6', 'com.geely.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '10.34.168.39', '内网IP', 'b_again_handle,b_call_position,b_first_handle,b_leave,b_supplier,b_supplier_maintain,b_user', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-24 17:20:52');
INSERT INTO `sys_oper_log` VALUES ('174', '代码生成', '8', 'com.geely.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '10.34.168.39', '内网IP', '{}', 'null', '0', null, '2020-06-24 17:21:02');
INSERT INTO `sys_oper_log` VALUES ('175', '用户管理', '5', 'com.geely.project.system.controller.SysUserController.export()', 'GET', '1', 'admin', null, '/system/user/export', '10.34.168.39', '内网IP', '{}', '{\"msg\":\"e42b7d55-406e-4fd0-853c-702673661d85_用户数据.xlsx\",\"code\":200}', '0', null, '2020-06-28 13:50:46');
INSERT INTO `sys_oper_log` VALUES ('176', '用户管理', '6', 'com.geely.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '10.34.168.39', '内网IP', 'false', 'null', '1', '', '2020-06-28 13:57:03');
INSERT INTO `sys_oper_log` VALUES ('177', '用户管理', '6', 'com.geely.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '10.34.168.39', '内网IP', 'false', 'null', '1', '', '2020-06-28 13:58:04');
INSERT INTO `sys_oper_log` VALUES ('178', '用户管理', '6', 'com.geely.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '10.34.168.39', '内网IP', 'false', 'null', '1', '', '2020-06-28 13:58:51');
INSERT INTO `sys_oper_log` VALUES ('179', '用户管理', '6', 'com.geely.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '10.34.168.39', '内网IP', 'false', 'null', '1', '', '2020-06-28 13:59:49');
INSERT INTO `sys_oper_log` VALUES ('180', '用户管理', '6', 'com.geely.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '10.34.168.39', '内网IP', 'false', 'null', '1', '', '2020-06-28 14:00:25');
INSERT INTO `sys_oper_log` VALUES ('181', '用户管理', '6', 'com.geely.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '10.34.168.39', '内网IP', 'false', 'null', '1', '', '2020-06-28 14:03:51');
INSERT INTO `sys_oper_log` VALUES ('182', '用户管理', '6', 'com.geely.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '10.34.168.39', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 admin 已存在<br/>2、账号 zhu.zhan 已存在', '2020-06-28 14:05:02');
INSERT INTO `sys_oper_log` VALUES ('183', '用户管理', '6', 'com.geely.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '10.34.168.39', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 admin 已存在<br/>2、账号 zhu.zhan 已存在', '2020-06-28 14:21:32');
INSERT INTO `sys_oper_log` VALUES ('184', '用户管理', '6', 'com.geely.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '10.34.168.39', '内网IP', 'false', 'null', '1', '', '2020-06-28 14:23:36');
INSERT INTO `sys_oper_log` VALUES ('185', '用户管理', '6', 'com.geely.project.system.controller.SysUserController.importData()', 'POST', '1', 'admin', null, '/system/user/importData', '10.34.168.39', '内网IP', 'false', 'null', '1', '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 admin 已存在<br/>2、账号 zhu.zhan 已存在', '2020-06-28 14:24:18');
INSERT INTO `sys_oper_log` VALUES ('186', '代码生成', '3', 'com.geely.project.tool.gen.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/37,38,39,40,41,42,43', '10.34.168.39', '内网IP', '{tableIds=37,38,39,40,41,42,43}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-28 16:26:07');
INSERT INTO `sys_oper_log` VALUES ('187', '代码生成', '6', 'com.geely.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '10.34.168.39', '内网IP', 'b_again_handle,b_call_position,b_first_handle,b_leave,b_supplier,b_supplier_maintain,b_user', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-28 16:26:24');
INSERT INTO `sys_oper_log` VALUES ('188', '代码生成', '8', 'com.geely.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '10.34.168.39', '内网IP', '{}', 'null', '0', null, '2020-06-28 16:26:31');
INSERT INTO `sys_oper_log` VALUES ('189', '代码生成', '3', 'com.geely.project.tool.gen.controller.GenController.remove()', 'DELETE', '1', 'admin', null, '/tool/gen/44,45,46,47,48,49,50', '10.34.168.39', '内网IP', '{tableIds=44,45,46,47,48,49,50}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-30 08:53:18');
INSERT INTO `sys_oper_log` VALUES ('190', '代码生成', '6', 'com.geely.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '10.34.168.39', '内网IP', 'b_user', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-30 08:53:33');
INSERT INTO `sys_oper_log` VALUES ('191', '代码生成', '8', 'com.geely.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '10.34.168.39', '内网IP', '{}', 'null', '0', null, '2020-06-30 08:53:45');
INSERT INTO `sys_oper_log` VALUES ('192', '代码生成', '6', 'com.geely.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '10.34.168.39', '内网IP', 'b_supplier', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2020-06-30 16:15:08');
INSERT INTO `sys_oper_log` VALUES ('193', '代码生成', '8', 'com.geely.project.tool.gen.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '10.34.168.39', '内网IP', '{}', 'null', '0', null, '2020-06-30 16:15:14');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');
INSERT INTO `sys_role` VALUES ('100', '用户角色', 'user', '3', '1', '0', '0', 'zhu.zhan', '2020-06-09 14:05:00', '', null, null);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');
INSERT INTO `sys_role_menu` VALUES ('100', '1');
INSERT INTO `sys_role_menu` VALUES ('100', '100');
INSERT INTO `sys_role_menu` VALUES ('100', '1001');
INSERT INTO `sys_role_menu` VALUES ('100', '1002');
INSERT INTO `sys_role_menu` VALUES ('100', '1003');
INSERT INTO `sys_role_menu` VALUES ('100', '1004');
INSERT INTO `sys_role_menu` VALUES ('100', '1005');
INSERT INTO `sys_role_menu` VALUES ('100', '1006');
INSERT INTO `sys_role_menu` VALUES ('100', '1007');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', 'admin', '00', 'admin@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_user` VALUES ('100', '106', 'zhu.zhan', '占助', '00', 'zhu.zhan@geely.com', '18070143291', '0', '', '$2a$10$/5wkdWLHEa3tF2US.SXvF.9iKgUgcC8PncYUSTRvztFM/kGpVKK5G', '0', '0', '', null, 'admin', '2020-05-20 15:39:51', 'admin', '2020-06-09 14:00:01', '新入职的员工');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('100', '4');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('100', '2');
