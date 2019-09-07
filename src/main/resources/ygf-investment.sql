/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : ygf-investment

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 07/09/2019 15:58:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_contract
-- ----------------------------
DROP TABLE IF EXISTS `t_contract`;
CREATE TABLE `t_contract`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同号',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同类型',
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '合同购买人',
  `nominal_member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名义上的甲方',
  `sign_date` date NULL DEFAULT NULL COMMENT '签订日期',
  `sign_user_id` bigint(20) NULL DEFAULT NULL COMMENT '签订人',
  `start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `ticket_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收据编号',
  `ticket_date` datetime(0) NULL DEFAULT NULL COMMENT '收据日期',
  `amount` double NULL DEFAULT NULL COMMENT '合同金额',
  `recommend_id` bigint(20) NULL DEFAULT NULL COMMENT '推荐人',
  `nominal_recommend_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名义上的推荐人',
  `store_id` bigint(20) NULL DEFAULT NULL COMMENT '所属门店',
  `check_id` bigint(20) NULL DEFAULT NULL COMMENT '核对人',
  `check_time` datetime(0) NULL DEFAULT NULL COMMENT '核对时间',
  `finance_id` bigint(20) NULL DEFAULT NULL COMMENT '核销人',
  `finance_time` datetime(0) NULL DEFAULT NULL COMMENT '核销时间',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0:待核销,1:已核销,99:已退',
  `check_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0:未核对,1:已核对',
  `transfer_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0:未转,1:已转',
  `transfer_id` bigint(20) NULL DEFAULT NULL COMMENT '被转到的合同主键',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合同表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_crowdfunding
-- ----------------------------
DROP TABLE IF EXISTS `t_crowdfunding`;
CREATE TABLE `t_crowdfunding`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员主键',
  `contract_id` bigint(20) NULL DEFAULT NULL COMMENT '合同主键(不一定使用)',
  `ticket_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收据编号',
  `receive_amount` double NULL DEFAULT NULL COMMENT '实收金额',
  `receive_date` datetime(0) NULL DEFAULT NULL COMMENT '收款日期',
  `check_id` bigint(20) NULL DEFAULT NULL COMMENT '核对人',
  `check_time` datetime(0) NULL DEFAULT NULL COMMENT '核对时间',
  `check_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1:已核对，0:未核对',
  `nominal_member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名义上的甲方',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员众创款表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_crowdfunding_return
-- ----------------------------
DROP TABLE IF EXISTS `t_crowdfunding_return`;
CREATE TABLE `t_crowdfunding_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `crowdfunding_id` bigint(20) NULL DEFAULT NULL COMMENT '众创款主键',
  `return_amount` double NULL DEFAULT NULL COMMENT '返款金额',
  `return_date` date NULL DEFAULT NULL COMMENT '返款日期',
  `return_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1:已返款，0:未返款',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字段',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员众创款返款明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员密码',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员手机号',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `id_card` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生日期',
  `register_date` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `recommend_id` bigint(20) NULL DEFAULT NULL COMMENT '推荐人',
  `level` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员等级',
  `province` bigint(20) NULL DEFAULT NULL COMMENT '所在省份',
  `city` bigint(20) NULL DEFAULT NULL COMMENT '所在城市',
  `district` bigint(20) NULL DEFAULT NULL COMMENT '所在区县',
  `address` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '具体门牌地址',
  `store_id` bigint(20) NULL DEFAULT NULL COMMENT '所属门店',
  `company_id` bigint(20) NULL DEFAULT NULL COMMENT '所属公司',
  `is_valid` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否已注销(1:未注销,0:已注销)',
  `is_first_login` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否首次登录1:是,0:否',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idCard_unique`(`id_card`) USING BTREE COMMENT '身份证号码唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 15620 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_member_rights
-- ----------------------------
DROP TABLE IF EXISTS `t_member_rights`;
CREATE TABLE `t_member_rights`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员主键',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1:A积分，2:B积分，3:期权，4:天福股权，5:美宅券，6:乐活股权',
  `amount` double NULL DEFAULT NULL COMMENT '权益数量',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员权益表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_member_rights_adjust
-- ----------------------------
DROP TABLE IF EXISTS `t_member_rights_adjust`;
CREATE TABLE `t_member_rights_adjust`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员主键',
  `adjust_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调整编码',
  `adjust_time` datetime(0) NULL DEFAULT NULL COMMENT '调整时间',
  `reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调整原因',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员权益调整表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_member_rights_adjust_details
-- ----------------------------
DROP TABLE IF EXISTS `t_member_rights_adjust_details`;
CREATE TABLE `t_member_rights_adjust_details`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rights_adjust_id` bigint(20) NULL DEFAULT NULL COMMENT '会员权益调整表主键',
  `member_rights_id` bigint(20) NULL DEFAULT NULL COMMENT '会员权益主键',
  `adjust_amount` double NULL DEFAULT NULL COMMENT '调整量',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员权益调整明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_member_rights_details
-- ----------------------------
DROP TABLE IF EXISTS `t_member_rights_details`;
CREATE TABLE `t_member_rights_details`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_rights_id` bigint(20) NULL DEFAULT NULL COMMENT '会员权益主键',
  `change_amount` double NULL DEFAULT NULL COMMENT '权益变更量',
  `remain_amount` double NULL DEFAULT NULL COMMENT '变更后剩余量(废弃，不再使用)',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更说明',
  `change_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更类型 1:订单权益，2:权益调整，3:销售权益，4:权益奖励',
  `service_id` bigint(20) NULL DEFAULT NULL COMMENT '引起权益变更具体表的主键(合同，门店，权益调整等)',
  `service_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '引起权益变更具体单据号',
  `change_time` datetime(0) NULL DEFAULT NULL COMMENT '变更时间',
  `move_flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1:提交申请，2:提交审批，3:审批通过，99:审批不通过',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 217 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员权益详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_member_rights_move
-- ----------------------------
DROP TABLE IF EXISTS `t_member_rights_move`;
CREATE TABLE `t_member_rights_move`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转让系统编码',
  `from_id` bigint(20) NULL DEFAULT NULL COMMENT '被转让的权益ID，t_member_rights_details的主键',
  `apply_member_id` bigint(20) NULL DEFAULT NULL COMMENT '转让申请人',
  `to_id` bigint(20) NULL DEFAULT NULL COMMENT '转让到的权益ID，t_member_rights_details的主键',
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '转让到的会员',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转让说明',
  `apply_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `operate_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `operate_id` bigint(20) NULL DEFAULT NULL COMMENT '操作人',
  `review_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `review_id` bigint(20) NULL DEFAULT NULL COMMENT '审批人',
  `review_suggestion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `operate_flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1:提交申请，2:提交审批，3:审批通过，99:审批不通过',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1:菜单,2:按钮',
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单链接',
  `symbol` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标识',
  `per_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限代码',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级主键',
  `level` int(11) NULL DEFAULT NULL COMMENT '菜单级别',
  `available` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有效',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_id` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色代码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `available` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可用 1:可用，0:不可用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_id` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色表主键',
  `permission_id` bigint(20) NULL DEFAULT NULL COMMENT '资源权限表主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密盐值',
  `person_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户真实姓名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户电话号码',
  `locked` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0:未被锁定，1:已被锁定',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户表主键',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色表主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
