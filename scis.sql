/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : scis

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 22/10/2019 16:55:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(22) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 1001, '管理员', '男', '123456', '123456');

-- ----------------------------
-- Table structure for allot
-- ----------------------------
DROP TABLE IF EXISTS `allot`;
CREATE TABLE `allot`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL,
  `expert_id` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `allot_project_id`(`project_id`) USING BTREE,
  INDEX `allot_expert_id`(`expert_id`) USING BTREE,
  CONSTRAINT `allot_expert_id` FOREIGN KEY (`expert_id`) REFERENCES `expert` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `allot_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of allot
-- ----------------------------
INSERT INTO `allot` VALUES (1, 1, 1, '1111', '2018-04-07', '2018-04-07');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `download_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '1', '上传地址', '下载地址', '1');

-- ----------------------------
-- Table structure for circular
-- ----------------------------
DROP TABLE IF EXISTS `circular`;
CREATE TABLE `circular`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告内容',
  `start` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `end` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `visible` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0,不可见，1可见',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'url',
  `create_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `update_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `target_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '跳转url',
  `book_circular_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_circular_id`(`book_circular_id`) USING BTREE,
  CONSTRAINT `book_circular_id` FOREIGN KEY (`book_circular_id`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告|jiac|20180117' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `khm` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户名',
  `gj` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `lxfs` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `khfl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户分类',
  `khdz` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `gxqcp` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '感兴趣产品',
  `sl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数量',
  `cx` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车型',
  `oe` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OE号',
  `bj` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报价',
  `yx` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sku` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'J Davioss', '哥斯达黎加 CR', 'ali:   cr1334224577uhms\n\n+506-50686186692', '下单客户', 'jason nicolas davis,+506-50686186692, recidencial la flores casa #2,casa # 2,heredia,san pablo heredia ,Costa Rica,40202', '倒车雷达', NULL, NULL, NULL, NULL, 'riodavios@gmail.com', NULL, '2019-10-21 16:13:41', '2019-10-21 16:13:41');
INSERT INTO `customer` VALUES (2, 'Paul J', '美国迈阿密', '\n\n+17868632220', '下单客户', 'Punit Jiwnani,+1-7868630007, 495 Brickell Ave, Apt 3703,Miami,Florida,United States of America,33131', ' 倒车雷达', NULL, NULL, NULL, NULL, 'pauljivani@gmail.com', NULL, '2019-10-21 16:13:44', '2019-10-21 16:13:44');
INSERT INTO `customer` VALUES (3, 'Amer Alasle\nعامر مجدي حماده', '沙特阿拉伯', '966-0541833989\n阿里：sa1331916105zooo\n', '下单客户', 'عامر مجدي حماده0541833989+966-, 40th Street beside Al-inma\'a Bank، Prince Mutaib bin Abdulaziz Rd, Al Safa,Buraidah,Qassim,Saudi Arabia,23454\n', ' 倒车雷达', NULL, NULL, NULL, NULL, 'alshbh.alasle6577@gmail.com', NULL, '2019-10-21 16:13:45', '2019-10-21 16:13:45');
INSERT INTO `customer` VALUES (4, 'Mr. urfan franck', '法国', '\n\n', '下单客户', '', ' 燃油泵总成', NULL, NULL, NULL, NULL, 'infos@reprog-ums.fr', NULL, '2019-10-21 16:13:45', '2019-10-21 16:13:45');
INSERT INTO `customer` VALUES (5, 'Sarah Cho', '韩国', '', '下单客户', '', ' 喷油器', NULL, NULL, NULL, NULL, 'info@motortool.co.kr', NULL, '2019-10-21 16:13:45', '2019-10-21 16:13:45');
INSERT INTO `customer` VALUES (6, 'Irina Saveliev', '美国', '', '下单客户', '', '倒车雷达', NULL, NULL, NULL, NULL, 'saveliev887@gmail.com', NULL, '2019-10-21 16:13:45', '2019-10-21 16:13:45');
INSERT INTO `customer` VALUES (7, 'Teisser', '以色列', '微信：TeisserAqqad', '下单客户', '', 'EGR废气循环阀', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:45', '2019-10-21 16:13:45');
INSERT INTO `customer` VALUES (8, 'Nesredin hagos', '沙特阿拉伯', '电话：966537002123', '下单客户', '', '转向助力泵', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:45', '2019-10-21 16:38:19');
INSERT INTO `customer` VALUES (9, 'Azlee hashim', '马来西亚', '\n+60 192366602', '下单客户', '', '空气悬挂打气泵', NULL, NULL, NULL, NULL, 'azlee@amg-mrs.com', NULL, '2019-10-21 16:13:46', '2019-10-21 16:38:20');
INSERT INTO `customer` VALUES (10, 'Royce', '津巴布韦', '', '下单客户', NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:46', '2019-10-21 16:13:46');
INSERT INTO `customer` VALUES (11, 'Robert ', '波兰', '\n+48-602711171', '下单客户', '', '温度传感器  ', NULL, NULL, NULL, NULL, 'rimcar@o2.pl', NULL, '2019-10-21 16:13:46', '2019-10-21 16:38:20');
INSERT INTO `customer` VALUES (12, 'lee jong goo', '韩国', '', '下单客户', '', '空气悬挂打气泵', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:46', '2019-10-21 16:38:20');
INSERT INTO `customer` VALUES (13, 'KI WAN', '泰国', '', '下单客户', '', '高压燃油泵', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:46', '2019-10-21 16:38:20');
INSERT INTO `customer` VALUES (14, 'Juan', '秘鲁', '电话：0051950204429', '下单客户', NULL, '刹车真空泵，转向助力泵', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:47', '2019-10-21 16:13:47');
INSERT INTO `customer` VALUES (15, '', '', '', '下单客户', NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:47', '2019-10-21 16:13:47');
INSERT INTO `customer` VALUES (16, 'TUAN FAHMI', '马来西亚', '', '下单客户', '', '分配阀', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:47', '2019-10-21 16:38:20');
INSERT INTO `customer` VALUES (17, 'Wesley Petersen', '南非', '电话：0027828566685', '下单客户', NULL, '倒车雷达线速等', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:47', '2019-10-21 16:13:47');
INSERT INTO `customer` VALUES (18, 'Royce', '津巴布韦', '电话：00263772683706', '下单客户', NULL, '氧传感器等', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:47', '2019-10-21 16:13:47');
INSERT INTO `customer` VALUES (19, 'Edson Ribeiro', '巴西', '\n+5511956581455', '下单客户', '', '多产品，传感器，泵类等', NULL, NULL, NULL, NULL, 'Dcrimportadora@gmail.com', NULL, '2019-10-21 16:13:47', '2019-10-21 16:13:47');
INSERT INTO `customer` VALUES (20, 'Khalid Mohammed', '阿曼', 'kmaalnofli@hotmail.com\n968-98866863', '下单客户', '', '燃油泵总成', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:47', '2019-10-21 16:38:20');
INSERT INTO `customer` VALUES (21, 'Lek Sooper', '泰国', '微信号： Sooperlek', '下单客户', 'Mr.Yos V.\nKN0050\n\n广州市白云区石井镇鸦岗村大围物流中心一期G43/44挡联系电话13533905514/020-36132571吴娴雯', '燃油泵总成', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:47', '2019-10-21 16:13:47');
INSERT INTO `customer` VALUES (22, 'MYOUNGSUK SHIN', '韩国', '082-01094468899\n', '下单客户', 'MYOUNGSUK SHIN,082-01094468899, 1178, Hwadoo-eup, sulelo, Ian Apartment 102 dong - 202 ho,Namyangju-si,Gyeonggi-do,Republic of Korea,12195', '燃油泵总成', NULL, NULL, NULL, NULL, 'myoungsuk74@gmail.com', NULL, '2019-10-21 16:13:47', '2019-10-21 16:13:47');
INSERT INTO `customer` VALUES (23, 'Abu', '沙特阿拉伯', '\n+966530394482', '下单客户', '', '燃油泵总成', NULL, NULL, NULL, NULL, 'ssass_a@hotmail.com', NULL, '2019-10-21 16:13:47', '2019-10-21 16:38:20');
INSERT INTO `customer` VALUES (24, 'Leo(MEGA PARTS)', '韩国', '微信号：wxid_cyvmie10pw0322电话：082-042-8258184\n', '下单客户', '', '皮带轮', NULL, NULL, NULL, NULL, 'megaparts123@naver.com', NULL, '2019-10-21 16:13:48', '2019-10-21 16:38:20');
INSERT INTO `customer` VALUES (25, 'Eugenia Cervantes', '美国', '\n1-786-8373263', '下单客户', '', '刹车灯开关', NULL, NULL, NULL, NULL, 'ecervantes@qjtparts.com', NULL, '2019-10-21 16:13:48', '2019-10-21 16:38:20');
INSERT INTO `customer` VALUES (26, 'Oleg Zhukov', '俄罗斯', '007-9296477775\n', '下单客户', 'Oleg Zhukov,007-9296477775, 117198 Москва, ул. Островитянова 5-33,Moscow,Moscow,Russian Federation,117198', '空气悬挂打气泵', NULL, NULL, NULL, NULL, '3gorka@inbox.ru', NULL, '2019-10-21 16:13:48', '2019-10-21 16:13:48');
INSERT INTO `customer` VALUES (27, 'Doon Ramcharan', '特立尼达和多巴哥', '1-868-764-5640\n', '下单客户', '138 Aranjuez Main Road,San Juan,Trinidad. West Indies', '变速箱电磁阀总成', NULL, NULL, NULL, NULL, 'doon372000@yahoo.com', NULL, '2019-10-21 16:13:48', '2019-10-21 16:13:48');
INSERT INTO `customer` VALUES (28, 'BRESCH NICOLAS', '法国', '\n0033 492913010', '下单客户', '105 ROUTE DU PIN MONTARD, BIOT, France, 06410', '燃油泵总成', NULL, NULL, NULL, NULL, 'buyer1@breach.com', NULL, '2019-10-21 16:13:48', '2019-10-21 16:13:48');
INSERT INTO `customer` VALUES (29, 'Andi Baso Kone Tantu', '印尼', '0062-81287686867', '下单客户', 'Jalan Aroepala Kompleks Permata Hijau Lestari Blok Q No 8 Kota Makassar, Provinsi Sulawesi Selatan, Negara Indonesia, 90222', '电磁阀套装总成', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:48', '2019-10-21 16:13:48');
INSERT INTO `customer` VALUES (30, 'Wesley Petersen', '南非', '0027-828566685', '下单客户', '875, 16th Road, Alphen Square North, Midrand, Gauteng, South Africa，1682', '倒车雷达等', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:48', '2019-10-21 16:13:48');
INSERT INTO `customer` VALUES (31, 'Asaah Divine ', '喀麦隆', '微信：divinitiv', '下单客户', '', '温度传感器，氧传感器', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:48', '2019-10-21 16:13:48');
INSERT INTO `customer` VALUES (32, '', '', '', '下单客户', '', '', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:48', '2019-10-21 16:13:48');
INSERT INTO `customer` VALUES (33, 'Yves ETTIEN', '科特迪瓦', 'bossrolys@gmail.com\n225-02712224', '下单客户', '', 'LED大灯驱动', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:48', '2019-10-21 16:13:48');
INSERT INTO `customer` VALUES (34, '', '', '', '下单客户', '', '', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:48', '2019-10-21 16:13:48');
INSERT INTO `customer` VALUES (35, '赵阳', '日本', '微信：zhaoyang0081\nQQ:772386261', '下单客户', NULL, '燃油泵总成', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:49', '2019-10-21 16:13:49');
INSERT INTO `customer` VALUES (36, '', '', '', '下单客户', NULL, '', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:49', '2019-10-21 16:13:49');
INSERT INTO `customer` VALUES (37, ' shan khan', '美国', 'daddysparts@gmail.com\n+1-8324889991', '下单客户', '', '倒车雷达', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:49', '2019-10-21 16:13:49');
INSERT INTO `customer` VALUES (38, ' shan khan', '美国', 'daddysparts@gmail.com\n+1-8324889991', '下单客户', '', '倒车雷达', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:49', '2019-10-21 16:13:49');
INSERT INTO `customer` VALUES (39, 'mohamed kamal', '埃及', '微信：surprisingkemo\n', '下单客户', '', '燃油泵', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:49', '2019-10-21 16:13:49');
INSERT INTO `customer` VALUES (40, '孟先生', '中国', '微信：MFT-1995', '下单客户', NULL, '皮带轮', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:49', '2019-10-21 16:13:49');
INSERT INTO `customer` VALUES (41, 'mohamed kamal', '埃及', '微信：surprisingkemo\n', '下单客户', NULL, '燃油泵', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:49', '2019-10-21 16:13:49');
INSERT INTO `customer` VALUES (42, '', '韩国', '微信： wade124', '下单客户', NULL, '皮带轮', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:49', '2019-10-21 16:13:49');
INSERT INTO `customer` VALUES (43, 'awadatec', '冈比亚', '微信：wxid_5wysszek7evp22', '下单客户', NULL, '机油冷却器', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:49', '2019-10-21 16:13:49');
INSERT INTO `customer` VALUES (44, 'Irina Saveliev', '美国', '', '下单客户', NULL, '倒车雷达', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:49', '2019-10-21 16:13:49');
INSERT INTO `customer` VALUES (45, 'Jerome Dela Cruz', '菲律宾', 'jeromejdelacruz08@gmail.com\n+639175768838', '下单客户', '110 Magna Building, Stellar Place Condominium, Visayas Avenue, Brgy Bahay Toro, Quezon City ,Philippines', ' 氙气灯镇流器，L型日行灯', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:50', '2019-10-21 16:13:50');
INSERT INTO `customer` VALUES (46, '', '', '', '下单客户', '', '', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:50', '2019-10-21 16:13:50');
INSERT INTO `customer` VALUES (47, 'Oberd Mandla Magagula', '南非', 'mandla@pathlifelab.co.za\n0027-834864385', '下单客户', 'Shop 23 Lowveld Mall,Hazyview 1242,Hazyview,Mpumalanga,South Africa', '燃油泵总成', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:50', '2019-10-21 16:13:50');
INSERT INTO `customer` VALUES (48, 'Dassaud Damien', '新喀里多尼亚', 'd.dassaud@gmx.com\n00687-828015', '下单客户', 'Dumbea,BP 04274,Dumbea,South Province,New Caledonia,98839', '变速箱电磁阀总成', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:50', '2019-10-21 16:13:50');
INSERT INTO `customer` VALUES (49, 'Joni christian huang', '菲律宾PH', 'jhonny3christian@gmail.com\n+639173089389', '下单客户', NULL, '转向助力泵', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:50', '2019-10-21 16:13:50');
INSERT INTO `customer` VALUES (50, 'Jackestibens Velasquez Ruiz', '秘鲁PE', 'stevens_064@hotmail.com\n+51960149640', '下单客户', 'Jiron tacna 1150 departamento 601,Lima,Magdalena del mar,Peru,15086', '机油冷却器', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:50', '2019-10-21 16:13:50');
INSERT INTO `customer` VALUES (51, 'Billy tan', '马来西亚MY', '微信：Mr_Billyyyy\n+6016-9966179\n', '下单客户', 'Billy tan\nNo. 206, Jalan Pudu, 55100 Kuala Lumpur.\n+6016-9966179', '燃油泵总成', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:50', '2019-10-21 16:13:50');
INSERT INTO `customer` VALUES (52, 'Charis Symeou', '塞浦路斯CY', 'symeou.x@gmail.com\n0035799846214', '下单客户', 'ANASTASEOS 4A KATO POLEMIDIA LIMASSOL CYPRUS 4154', '转向助力泵', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:50', '2019-10-21 16:13:50');
INSERT INTO `customer` VALUES (53, '', '', '', '下单客户', NULL, '转向助力泵修理包', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:50', '2019-10-21 16:13:50');
INSERT INTO `customer` VALUES (54, ' \nThipphayawadee Malison', '泰国TH', '\nRosarie24@hotmail.com\n66-085-918-9555', '下单客户', 'Thipphayawadee Malison ( บ้านคุณโรส ) กรมทหารราบที่ 11 รักษาพระองค์ บางเขน ( 153 ) 11th Infantry Regiment King’s Guard Phahon Yothin Rd. Bangkhen Bangkok Thailand 10220', '转向助力泵', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:50', '2019-10-21 16:13:50');
INSERT INTO `customer` VALUES (55, 'Knut Uleberg', '挪威 NO', '0047-97703037', '下单客户', ', Dåsvannsdalen 676, Hornnes, Norway,Norway,4737', '电脑板总成', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:50', '2019-10-21 16:13:50');
INSERT INTO `customer` VALUES (56, 'EDMILSON LUCIO DA SILVA', '巴西 BR', 'ellus.tanabi@gmail.com\n0055-1781644692\n0055-1732729500', '下单客户', '1781644692-1732729500, Rua CAP DANIEL DA CUNHA MORAES, Nº 1675,RUA JORGE TABACHI, Nº 1.480,Tanabi,Sao Paulo,Brazil,15170-000', '燃油泵总成', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:50', '2019-10-21 16:13:50');
INSERT INTO `customer` VALUES (57, 'Turan Kiraz', '德国 DE', 'turankiraz@gmx.de\n0049-01606357846', '下单客户', 'Turan Kiraz,+49-04901606357846, Josefstraße 21, 73525,Schwäbisch Gmünd,Baden-Württemberg,Germany,73525', '燃油泵总成', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:51', '2019-10-21 16:13:51');
INSERT INTO `customer` VALUES (58, 'Angelito Wong', '菲律宾', 'angelito_wong@yahoo.com\n+639173007016', '下单客户', 'B57 L33 Raphael St, Villa Modena, Villaggio Ignatius, Buenavista 1, General Trias, Cavite, 4107 ,Philippines', '变速箱阀体', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:51', '2019-10-21 16:13:51');
INSERT INTO `customer` VALUES (59, 'Citi-Link Auto Parts', '巴布亚新几内亚 PG', 'citilink.autoparts@gmail.com\n675-73010010', '下单客户', 'Vunamami #1, Ward 2, Williams Road City: Kokopo Province: East New Britain,Papua New Guinea, 613', '空调压缩机', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:51', '2019-10-21 16:13:51');
INSERT INTO `customer` VALUES (60, 'Florence Dumontet', '法国', 'ggerdautos@outlook.com\n33-6-51-80-17-36', '下单客户', NULL, '变速箱阀体', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:51', '2019-10-21 16:13:51');
INSERT INTO `customer` VALUES (61, 'Yves ETTIEN', '科特迪瓦', 'bossrolys@gmail.com\n225-02712224', '下单客户', '唛头： To Yves ETTIEN +22502712224', '氧传感器', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:51', '2019-10-21 16:13:51');
INSERT INTO `customer` VALUES (62, '', '', '', '下单客户', 'Yves ETTIEN, 环市中路300号天秀大厦B座10-05室法兰喜出口发展公司,广州市,广东省,China', '点火线圈', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:51', '2019-10-21 16:13:51');
INSERT INTO `customer` VALUES (63, 'Charis Symeou', '塞浦路斯CY', 'symeou.x@gmail.com\n0035799846214', '下单客户', '', '转向助力泵修理包', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:51', '2019-10-21 16:13:51');
INSERT INTO `customer` VALUES (64, 'Hawil Hassan', '马里', 'alihandro48@gmail.com\n00223-90999908', '下单客户', '', '空调压缩机', NULL, NULL, NULL, NULL, '', NULL, '2019-10-21 16:13:51', '2019-10-21 16:13:51');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chairman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, 1001, '计算机科学与工程', '小高', '123456789', '计算机', NULL, NULL);
INSERT INTO `dept` VALUES (2, 2001, '机械制造', '小倩', '12345678944', '机械制造学院', NULL, NULL);
INSERT INTO `dept` VALUES (3, 3001, '人文', '小段', '12345678944', '人文学院', NULL, NULL);

-- ----------------------------
-- Table structure for expert
-- ----------------------------
DROP TABLE IF EXISTS `expert`;
CREATE TABLE `expert`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(22) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birth` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resume` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 162 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expert
-- ----------------------------
INSERT INTO `expert` VALUES (1, 123456, '专家', '123456', '男', '2018-04-06', '123456', '专家地址', '专家简历');
INSERT INTO `expert` VALUES (4, 123456, '专家', '123456', '男', '2018-04-06', '123456', '专家地址', '专家简历');
INSERT INTO `expert` VALUES (5, 123456, '专家', '123456', '男', '2018-04-06', '123456', '专家地址', '专家简历');
INSERT INTO `expert` VALUES (6, 123456, '专家', '123456', '男', '2018-04-06', '123456', '专家地址', '专家简历');
INSERT INTO `expert` VALUES (7, 123456, '专家', '123456', '男', '2018-04-06', '123456', '专家地址', '专家简历');
INSERT INTO `expert` VALUES (8, 123456, '专家', '123456', '男', '2018-04-06', '123456', '专家地址', '专家简历');
INSERT INTO `expert` VALUES (9, 123456, '专家', '123456', '男', '2018-04-06', '123456', '专家地址', '专家简历');
INSERT INTO `expert` VALUES (10, 123456, '专家', '123456', '男', '2018-04-06', '123456', '专家地址', '专家简历');
INSERT INTO `expert` VALUES (11, 123456, '专家', '123456', '男', '2018-04-06', '123456', '专家地址', '专家简历');
INSERT INTO `expert` VALUES (12, 123456, '专家', '123456', '男', '2018-04-06', '123456', '专家地址', '专家简历');
INSERT INTO `expert` VALUES (16, 123456, '专家', '123456', '男', '2018-04-06', '123456', '专家地址', '专家简历');
INSERT INTO `expert` VALUES (111, 123456, '专家3', '123456', '男', '2018-04-06', '123456', '专家地址', '专家简历');
INSERT INTO `expert` VALUES (121, 123456, '专家', '123456', '男', '2018-04-06', '123456', '专家地址', '专家简历');
INSERT INTO `expert` VALUES (161, 123456, '专家', '123456', '男', '2018-04-06', '123456', '专家地址', '专家简历');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assistant` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_id` int(11) NULL DEFAULT NULL,
  `create_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `major_dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `major_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, 100106, '软件工程', '123456789', '小高', 1, NULL, NULL);
INSERT INTO `major` VALUES (2, 100107, '信息工程', '123456789', '小倩', 1, NULL, NULL);
INSERT INTO `major` VALUES (3, 100103, '网络工程', '12345678944', '小胡', 1, NULL, NULL);
INSERT INTO `major` VALUES (4, 100104, '物联网', '12345678944', '小倩', 1, NULL, NULL);
INSERT INTO `major` VALUES (5, 200101, '机械制造', '12345678944', '小花', 2, NULL, NULL);
INSERT INTO `major` VALUES (6, 200102, '数控技术', '12345678944', '小资', 2, NULL, NULL);
INSERT INTO `major` VALUES (7, 200103, '铸造技术', '12345678944', '小南', 2, NULL, NULL);
INSERT INTO `major` VALUES (8, 300101, '中国语言文学', '12345678944', 'GodV', 3, NULL, NULL);
INSERT INTO `major` VALUES (9, 300102, '语言学及应用语言学', '12345678944', '小朱', 3, NULL, NULL);
INSERT INTO `major` VALUES (10, 300103, '汉语言文字学', '12345678944', '笑笑', 3, NULL, NULL);

-- ----------------------------
-- Table structure for mg_product_info
-- ----------------------------
DROP TABLE IF EXISTS `mg_product_info`;
CREATE TABLE `mg_product_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `product_name_en` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称英文',
  `SKU` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SKU',
  `OE` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OE',
  `zl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重量',
  `cc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '尺寸',
  `cpp` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '车品牌',
  `spxh` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适配型号',
  `gysa` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商A',
  `cgja` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购价A',
  `gysb` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商B',
  `cgjb` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采购价B',
  `bz` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `xp` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '询盘情况（关联）',
  `dd` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单情况（关联）',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `jg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '价格',
  `mxs` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '满箱数',
  `mxwxcc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '满箱外箱尺寸',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mg_product_info
-- ----------------------------
INSERT INTO `mg_product_info` VALUES (166, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA1', '16117260640;\n16117260640;\nFISPA 20459;\nFISPA 70459;\nHOFFER 7507278;\nMEAT & DORIA 77278;\nPIERBURG 7.02701.60.0;\nSIDAT 70459;\nTI Automotive 7521007;\n', '0.95', '215*225*2358', 'BMW', 'BMW5 Gran Turismo (F07) 535 i N55 B30 A 2979 225 306 Hatchback 09/10 - /\nBMW5 (F10, F18) 523 i N53 B30 A 2996 150 204 Saloon 09/12 - /\nBMW5 (F10, F18) 535 i N55 B30 A 2979 225 306 Saloon 09/12 - /\nBMW5 (F10, F18) ActiveHybrid N55 B30 A 2979 250 340 Saloon 11/09 - /\nBMW5 Touring (F11) 523 i N53 B30 A 2996 150 204 Estate 10/09 - /\nBMW5 Touring (F11) 528 i N53 B30 A 2996 190 258 Estate 10/09 - /\nBMW5 Touring (F11) 535 i N55 B30 A 2979 225 306 Estate 10/09 - /\nBMW6 Convertible (F12) 640 i N55 B30 A 2979 235 320 Convertible 11/03 - /\nBMW6 Coupe (F13) 640 i N55 B30 A 2979 235 320 Coupe 10/11 - /', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-06 15:42:26', '2019-09-06 15:42:26', '222', '18个/箱', '10号五版外箱540×450×540');
INSERT INTO `mg_product_info` VALUES (167, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA2', '16146765823          16146765822', '1.382', '340*260*173', 'BMW', 'E60 E61', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:26', '2019-09-06 15:42:26', '232', '6个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (168, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA3', '16146765820; 16117373458', '0.966', '340*260*173', 'BMW', 'E60 E63 E64', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:26', '2019-09-06 15:42:26', '232', '6个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (169, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA4', '16117373503; FG2015', '1.38', '390*320*200', 'BMW', 'BMW E60 525i 530i', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:27', '2019-09-06 15:42:27', '222', '6个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (170, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA5', '16117373458               16146765820           FG1239', '1.38', '390*320*200', 'BMW', 'BMW 525i 530i 545i 550i 645ci 650i', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:27', '2019-09-06 15:42:27', '222', '6个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (171, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA6', '16117373476                   FG2017', '1.38', '390*320*200', 'BMW', 'BMW E60N 520d,', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:27', '2019-09-06 15:42:27', '222', '4个/箱', '14号五版外箱660×420×420');
INSERT INTO `mg_product_info` VALUES (172, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA7', '16117170011', '0.63', '340*173*173', 'BMW', 'BMW E65 N52', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:27', '2019-09-06 15:42:27', '185', '9个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (173, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA8', '16117194000', '0.62', '340*173*173', 'BMW', 'BMW 7 E65 E66', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:27', '2019-09-06 15:42:27', '185', '9个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (174, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA9', '16146759955', '1.148', '340*260*173', 'BMW', 'BMW MINI', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:27', '2019-09-06 15:42:27', '190', '6个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (175, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA10', '16146756185\nE8594M \n228-226-007-002Z', '1.09', '340*215*173', 'BMW', 'MINI COOPER', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:28', '2019-09-06 15:42:28', '190', '6个/箱', '3号五版外箱450×360×540');
INSERT INTO `mg_product_info` VALUES (176, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA11', '16112755082\nFG1175  \nSP5095M ', '0.824', '300*260*173', 'BMW', 'MINI COOPER 15-07 L4-1.6L\nMINI COOPER 15-07 L4-1.6L', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:28', '2019-09-06 15:42:28', '190', '6个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (177, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA12', '16117195463', '1.12', '340*215*173', 'BMW', 'BMW X5：E70', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:28', '2019-09-06 15:42:28', '240', '6个/箱', '3号五版外箱450×360×540');
INSERT INTO `mg_product_info` VALUES (178, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA13', '16117197076     16147163297', '0.83', '300*173*173', 'BMW', 'BMW :E81 E90 E91 E92', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:28', '2019-09-06 15:42:28', '190', '9个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (179, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA14', '16147163298', '0.585', '300*173*173', 'BMW', 'BMW  X1    2.0L L4 Turbocharged    2013 3.0L L6 Turbocharged    2013 128I    3.0L L6    2008 325I    3.0L L6    2006 \n325XI    3.0L L6    2006 \n328I    3.0L L6    2007 328XI    3.0L L6    2007 330I    3.0L L6    2006 \n330XI    3.0L L6    2006 \n1 SERIES M    3.0L L6 Turbocharged    2011 \n135I    3.0L L6 Turbocharged    2008 335I    3.0L L6 Turbocharged    2007 335IS    3.0L L6 Turbocharged    2011 335XI    3.0L L6 Turbocharged    2007 2008', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:28', '2019-09-06 15:42:28', '200', '9个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (180, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA15', '16117297780\n0580200328   16117414490\n0580200124\n16117273276', '0.878', '300*260*173', 'BMW', 'BMW 1(F20) 116i,118i 2010-', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:28', '2019-09-06 15:42:28', '259', '6个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (181, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA16', '16117243974\n 0580200326', '1.052', '300*260*173', 'BMW', 'BMW 1(F20) 116 i, 3(F30,F35) 316 i 2011-', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:28', '2019-09-06 15:42:28', '259', '6个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (182, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA17', '16117243975', '1.052', '300*260*173', 'BMW', 'BMW 1(F20) 125 i, 2(F22)220i,3(F30,F35) 320 i 2011-', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:28', '2019-09-06 15:42:28', '259', '6个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (183, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA18', '16117260644（77277）\nBMW OEM 16117260644\nFISPA 20455\nFISPA 70455\nHOFFER 7507277\nMEAT & DORIA 77277\nPIERBURG 7.02701.59.0\nSIDAT 70455\nTI Automotive 7521006', '0.848', '215*173*173', 'BMW', 'BMW5 (F10, F18) 520 i N20 B20 A 1997 120 163 Saloon 11/09 - /\nBMW5 (F10, F18) 520 i N20 B20 A 1997 135 184 Saloon 11/09 - /\nBMW5 (F10, F18) 528 i N20 B20 A 1997 180 245 Saloon 11/09 - /\nBMW5 (F10, F18) 528 i N53 B30 A 2996 190 258 Saloon 10/02 - /\nBMW5 Touring (F11) 520 i N20 B20 A 1997 135 184 Estate 11/09 - /\nBMW5 Touring (F11) 528 i N20 B20 A 1997 180 245 Estate 11/09 - /', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:28', '2019-09-06 15:42:28', '222', '18个/箱', '10号五版外箱540×450×540');
INSERT INTO `mg_product_info` VALUES (184, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA19', '16117260648（77276）\nBMW OEM 16117260648/7260648\nFISPA 70454\nFISPA 20454\nHOFFER 7507276\nMEAT & DORIA 77276\nPIERBURG 7.02701.87.0\nSIDAT 70454\nTI Automotive 7511004', '0.768', '260*173*173', 'BMW', 'BMW5 Gran Turismo (F07) 530 d N57 D30 A 2993 155 211 Hatchback 10/07 - /\nBMW5 Gran Turismo (F07) 530 d N57 D30 A 2993 180 245 Hatchback 09/10 - /\nBMW5 Gran Turismo (F07) 535 d N57 D30 B 2993 220 299 Hatchback 10/09 - /\nBMW5 (F10, F18) 520 d N47 D20 C 1995 135 184 Saloon 10/03 - /\nBMW5 (F10, F18) 525 d N57 D30 A 2993 150 204 Saloon 10/02 - /\nBMW5 (F10, F18) 530 d N57 D30 A 2993 180 245 Saloon 09/12 - /\nBMW5 (F10, F18) 530 d N57 D30 A 2993 190 258 Saloon 11/09 - /\nBMW5 Touring (F11) 530 d N57 D30 A 2993 190 258 Estate 11/09 - /\nBMW5 Touring (F11) 535 d N57 D30 B 2993 230 313 Estate 11/09 - /\nBMW5 Touring (F11) 520 d N47 D20 C 1995 135 184 Estate 10/09 - /\nBMW5 Touring (F11) 525 d N57 D30 A 2993 150 204 Estate 10/09 - /\nBMW5 Touring (F11) 530 d N57 D30 A 2993 180 245 Estate 10/09 - /\nBMW5 Touring (F11) 535 d N57 D30 B 2993 220 299 Estate 10/09 - /\nBMW6 Convertible (F12) 640 d N57 D30 B 2993 230 313 Convertible 11/09 - /\nBMW6 Coupe (F13) 640 d N57 D30 B 2993 230 313 Coupe 10/11 - /', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:28', '2019-09-06 15:42:28', '231', '18个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (185, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA20', '1684701494             1684701994           1684702494', '1.0', '300*173*173', 'Mercedes Benz', '(W168)ML A140 160 190 210', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:29', '2019-09-06 15:42:29', '222', '9个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (186, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA21', 'A1694701294     1694700594', '1.21', '340*215*173', 'Mercedes Benz', '(W169)A160 180 200 B180 200', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:29', '2019-09-06 15:42:29', '222', '6个/箱', '3号五版外箱450×360×540');
INSERT INTO `mg_product_info` VALUES (187, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA22', '1684702894    228231006004Z', '1.105', '300*173*173', 'Mercedes Benz', '(W168)A140 160 190', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:29', '2019-09-06 15:42:29', '231', '9个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (188, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA23', '1694700494', '0.95', '340*215*173', 'Mercedes Benz', '(W169)A150 170 200 (W245)B150 170 200', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:29', '2019-09-06 15:42:29', '195', '6个/箱', '3号五版外箱450×360×540');
INSERT INTO `mg_product_info` VALUES (189, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA24', '2034703594      2034702894', '0.585', '300*173*173', 'Mercedes Benz', 'W203 CL203 S203 S202', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:29', '2019-09-06 15:42:29', '181', '9个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (190, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA25', 'A2114702994\n77109', '0.768', '215*173*173', 'Mercedes Benz', 'MERCEDES-BENZ CLS 280,E-CLASS E200 Kompressor 2003', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:29', '2019-09-06 15:42:29', '182', '无', '无');
INSERT INTO `mg_product_info` VALUES (191, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA26', '2094700294', '0.683', '300*215*173', 'Mercedes Benz', 'W203 S203 CL203 A209', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:29', '2019-09-06 15:42:29', '209', '12个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (192, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA27', 'A2094700294', '0.87', '300*215*173', 'Mercedes Benz', 'Mercedes C 230 (S203),  CLK(C209)', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:29', '2019-09-06 15:42:29', '209', '12个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (193, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA28', '2114700000\n2114701794\nA2114700000', '1.1423', '300*260*173', 'Mercedes Benz', 'Mercedes w211 e55 AMG', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:29', '2019-09-06 15:42:29', '290', '6个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (194, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA29', 'CROSS REFERENCE   \n2114701794\nE8572M', '1.0', '300*173*173', 'Mercedes Benz', 'MERCEDES-BENZ  E55 AMG 2003-2005', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:29', '2019-09-06 15:42:29', '290', '6个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (195, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA30', '2114703994', '0.68', '300*260*173', 'Mercedes Benz', 'W211 S211 C219', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:29', '2019-09-06 15:42:29', '170', '6个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (196, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA31', 'A2044701494     A2044700494', '0.69', '390*320*200', 'Mercedes Benz', 'W204 S204 X204 W212 S212', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:30', '2019-09-06 15:42:30', '170', '4个/箱', '14号五版外箱660×420×420');
INSERT INTO `mg_product_info` VALUES (197, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA32', '2044700394\n77220', '0.587', '340*260*173', 'Mercedes Benz', 'MERCEDES-BENZ C-CLASS (W204) 1.6,C-CLASS Coupe (C204)1.8 2007-2014', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:30', '2019-09-06 15:42:30', '214', '6个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (198, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA33', '2044702094\n79448', '0.596', '340*260*173', 'Mercedes Benz', 'MERCEDES-BENZ C-CLASS Saloon (W204),E-CLASS (W212),2007-2014', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:30', '2019-09-06 15:42:30', '214', '6个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (199, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA34', 'A2124701394\n79343', '0.59', '340*260*173', 'Mercedes Benz', 'MERCEDES-BENZ C-CLASS (W204),C-CLASS T-Model (S204),E-CLASS (W212),2007-2014', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:30', '2019-09-06 15:42:30', '214', '6个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (200, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA35', '2184700994', '0.704', '390*320*200', 'Mercedes Benz', 'Mercedes-Benz E-Klasse Coupe C207 2013/02-2016/12', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:30', '2019-09-06 15:42:30', '214', '4个/箱', '14号五版外箱660×420×420');
INSERT INTO `mg_product_info` VALUES (201, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA36', '2514700090', '0.88', '340*173*173', 'Mercedes Benz', 'GL450 ML550 R350 ML500 R500', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:30', '2019-09-06 15:42:30', '190', '9个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (202, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA37', 'CROSS REFERENCE  \n2514700090\nA2C53042063, A2514700090', '1.5', '300*260*173', 'Mercedes Benz', 'MERCEDES BENZ GL450,MERCEDES BENZ ML550,M500,MERCEDES BENZ R350,R500 2006-2012', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:30', '2019-09-06 15:42:30', '200', '', '');
INSERT INTO `mg_product_info` VALUES (203, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA38', 'A2514701094', '0.952', '300*260*173', 'Mercedes Benz', 'Benz R280 R300 R350 Rwd Awd W251 2006-12', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:31', '2019-09-06 15:42:31', '218', '6个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (204, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA39', '1644702194\nE8924M\nFG1279\nSP5114M/SP5120M', '0.92', '300*215*173', 'Mercedes Benz', '2009-06 MERCEDES-BENZ 350 SERIES 3498 cc. (3.5L) 6\n2008-07 MERCEDES-BENZ 450 SERIES 4663 cc. (4.7L) 8\n2008 MERCEDES-BENZ GL550 5461 cc. (5.5L) 8\n2008 MERCEDES-BENZ ML550 5461 cc. (5.5L) 8', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:31', '2019-09-06 15:42:31', '218', '12个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (205, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA40', '2044701394', '0.926', '300*260*173', 'Mercedes Benz', 'W204 S204', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:31', '2019-09-06 15:42:31', '200', '6个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (206, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA41', '2044700294', '0.754', '260*260*173', 'Mercedes Benz', 'BENZ C-CLASS Saloon (W204)(2007/01 - 2014/01)\nBENZ C-CLASS T-Model (S204)(2007/08 - /)', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:31', '2019-09-06 15:42:31', '210', '12个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (207, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA42', '2124701594', '1.0', '260*260*173', 'Mercedes Benz', 'BENZ C-CLASS Saloon (W204)(2007/01 - 2014/01)\nBENZ C-CLASS T-Model (S204)(2007/08 - /)', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:31', '2019-09-06 15:42:31', '210', '12个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (208, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA43', 'A2124700494', '0.754', '260*260*173', 'Mercedes Benz', 'Mercedes E-Class E200 CDI 2009 ', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:31', '2019-09-06 15:42:31', '218', '12个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (209, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA44', 'A2124701894', '0.754', '260*260*173', 'Mercedes Benz', 'Mercedes E-Class E200 CDI 2009 ', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:31', '2019-09-06 15:42:31', '218', '12个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (210, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA45', 'A2124700194', '0.754', '260*260*173', 'Mercedes Benz', 'Mercedes E-Class E200 CDI 2009 ', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:31', '2019-09-06 15:42:31', '218', '12个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (211, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA46', '2044700794', '1.16', '260*260*173', 'Mercedes Benz', 'MERCEDES C(W204,S204)2007,E(W212) 2009', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:31', '2019-09-06 15:42:31', '214', '12个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (212, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA47', 'A2124701794', '0.95', '300*215*173', 'Mercedes Benz', 'W212 W204', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:31', '2019-09-06 15:42:31', '200', '12个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (213, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA48', 'CROSS REFERENCE    0986580163\nMN186226\nSMN186226\nA4544700094\n4544700094\nE10600M\n0 986 580 163\nFE10059-12B1\n72269\n22269\n7506873\n7506900\n76873\n', '1.0', '300*260*173', 'SMART FORFOUR ', 'SMART FORFOUR (454) 1.1 (454.030) M 134.910 04/01 - 06/06\nSMART FORFOUR (454) 1.3 (454.031) M 135.930 04/01 - 06/06\nSMART FORFOUR (454) 1.5 (454.032) M 135.950 04/01 - 06/06\nMitsubishi Motors COLT VI (Z3_A, Z2_A) 1.3 4A90 04/06 - 12/06\nMitsubishi Motors COLT VI (Z3_A, Z2_A) 1.5 4A91 04/06 - 12/06\nMitsubishi Motors COLT VI (Z3_A, Z2_A) 1.1 3A91 04/10 - 12/06\nMitsubishi Motors COLT Convertible (RG) 1.5 4A91 06/05 - 09/07', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:31', '2019-09-06 15:42:31', '223', '6个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (214, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA49', 'LR043385', '0.56', '260*215*173', 'LAND ROVER ', 'LAND ROVER DISCOVERY 5.0L 2009-2015\nRANGER ROVER SPORT 4.2L 2006-2009 5.0L 2010-2015', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:32', '2019-09-06 15:42:32', '191', '12个/箱', '10号五版外箱540×450×540');
INSERT INTO `mg_product_info` VALUES (215, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA50', 'WGS500051', '0.791', '300*173*173', 'LAND ROVER ', 'LAND ROVER LR3 4.0L 4.4L 2005-2009\nRANGER ROVER SPORT 4.4L 2006-2009', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:32', '2019-09-06 15:42:32', '182', '9个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (216, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA51', 'WGS500012      A2C53098411Z  ', '0.82', '300*173*173', 'LAND ROVER ', 'RANGE ROVER SPORT (LS) 4.2 4x4  05/02 -', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:32', '2019-09-06 15:42:32', '223', '9个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (217, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA52', 'WGS500110', '0.718', '300*260*173', 'LAND ROVER ', 'Discovery 3, 2.7 TDV6, 2004-2009\nRange Rover Sport, 2.7 TDV6, 2005-2010\nRange Rover Sport, 3.6 TDV8, 2005-2012\nDiscovery, 2.7 TDV6, 2010-2011', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:32', '2019-09-06 15:42:32', '264', '6个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (218, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA53', 'LR015178                                    WGS500140                                               A2C53341995Z', '1.0', '520*260*173', 'LAND ROVER ', 'RANGE ROVER 2006 - 2009  4.4L V8 PETROL', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:32', '2019-09-06 15:42:32', '291', '6个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (219, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA54', 'LR015177                                         WGS500150                       A2C53341992Z', '1.24', '520*260*173', 'LAND ROVER ', 'RANGE ROVER 2006 - 2009 4.2L SC V8 PETROL. 11 - 2017', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:32', '2019-09-06 15:42:32', '291', '6个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (220, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA55', 'CROSS REFERENCE    LR016845 （77359）   bosch             \n22740\n7507359\n77359\n72740\nA2C53385126Z', '0.675', '260*215*173', 'LAND ROVER ', 'LANDROVER DISCOVERY III (TAA)\n2004-2009', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:32', '2019-09-06 15:42:32', '241', '12个/箱', '10号五版外箱540×450×540');
INSERT INTO `mg_product_info` VALUES (221, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA56', ' CROSS REFERENCE       LR043385（77357）    bosch            LR043385/LR014997\n22738\n7507357\n77357\n72738\nA2C53323174Z', '0.691', '260*215*173', 'LAND ROVER ', 'LANDROVER RANGE ROVER SPORT (LS)\n2005-2013\nLANDROVER DISCOVERY IV (LA)2009-/', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:32', '2019-09-06 15:42:32', '241', '12个/箱', '10号五版外箱540×450×540');
INSERT INTO `mg_product_info` VALUES (222, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA57', 'WFX000160', '1.16', '520*260*173', 'LAND ROVER ', 'LAND ROVER;RANGE ROVER III 3.0L 02/03 - 12/08', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:32', '2019-09-06 15:42:32', '255', '6个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (223, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA58', 'VDO:228-232-003-002Z       LAND ROVER:WFX0000130', '1.139', '340*215*173', 'LAND ROVER ', 'FREELANDER Soft Top 1.8 i 16V 4x4   98/02 - 06/10；     FREELANDER (LN) 1.8 16V 4x4    98/02 - 06/10；', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:32', '2019-09-06 15:42:32', '191', '6个/箱', '3号五版外箱450×360×540');
INSERT INTO `mg_product_info` VALUES (224, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA59', 'WFX000200    WFX500070', '1.02', '340*215*173', 'LAND ROVER ', 'FREELANDER (LN) 2.0 Td4 4x4        01/11 - 06/10', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:32', '2019-09-06 15:42:32', '185', '6个/箱', '3号五版外箱450×360×540');
INSERT INTO `mg_product_info` VALUES (225, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA60', 'WFX100980', '1.08', '340*215*173', 'LAND ROVER ', ' FREELANDER Soft Top 2.0 DI 4x4      98/02 - 06/10；  FREELANDER (LN) 2.0 DI 4x4     98/02 - 00/11', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:32', '2019-09-06 15:42:32', '185', '6个/箱', '3号五版外箱450×360×540');
INSERT INTO `mg_product_info` VALUES (226, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA61', 'WFX000190', '1.373', '340*215*173', 'LAND ROVER ', 'FREELANDER (LN) 1.8 16V 4x4   Closed Off-Road Vehicle 00/11 - 06/10', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:33', '2019-09-06 15:42:33', '191', '6个/箱', '3号五版外箱450×360×540');
INSERT INTO `mg_product_info` VALUES (227, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA62', 'WFX000210', '1.145', '340*215*173', 'LAND ROVER ', 'FREELANDER (LN) 2.5 V6 4x4    00/11 - 06/10', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:33', '2019-09-06 15:42:33', '191', '6个/箱', '3号五版外箱450×360×540');
INSERT INTO `mg_product_info` VALUES (228, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA63', 'WFX101060', '1.214', '390*173*173', 'LAND ROVER ', 'DISCOVERY II (LJ, LT) 4.0 V8 4x4    98/11 - 04/06', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:33', '2019-09-06 15:42:33', '191', '9个/箱', '9号五版外箱540×410×540');
INSERT INTO `mg_product_info` VALUES (229, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA64', 'WFX000250', '1.42', '390*260*173', 'LAND ROVER ', 'DEFENDER Cabrio (LD) 2.5 Td5 4x4   98/06 - /；DEFENDER Station Wagon (LD) 2.5 Td5 4x4  98/06 - /   ；DEFENDER Pickup (LD_) 2.5 Td5 4x4   Pickup   98/06 - /；', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:33', '2019-09-06 15:42:33', '191', '6个/箱', '9号五版外箱540×410×540');
INSERT INTO `mg_product_info` VALUES (230, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA65', 'WFX000260', '1.421', '390*260*173', 'LAND ROVER ', 'DEFENDER Cabrio (LD) 2.5 90 TDI 4x4   90/09 - /；DEFENDER Cabrio (LD) 2.5 Td5 4x4  98/06 - /；DEFENDER Cabrio (LD) 2.5 D 4x4   90/09 - 01/09；DEFENDER Station Wagon (LD) 2.5 90,110 TDI 4x4  90/09 - 98/12；    DEFENDER Station Wagon (LD) 2.5 D 4x4  90/09 - 01/09；DEFENDER Station Wagon (LD) 2.5 Td5 4x4   98/06 - /；DEFENDER Pickup (LD_) 2.5 Td5 4x4  98/06 - /；', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:33', '2019-09-06 15:42:33', '191', '6个/箱', '9号五版外箱540×410×540');
INSERT INTO `mg_product_info` VALUES (231, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA66', 'LR038601', '1.127', '340*260*173', 'LAND ROVER ', 'LAND ROVER LR2 2.0L 2013-2014 LR2 3.2L 2008-2012\nFREELANDER 2 3.2L 2006-2014', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:33', '2019-09-06 15:42:33', '241', '6个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (232, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA67', 'A2C53377801Z\nW0133-1895136\n95562093201', '0.806', '340*260*173', 'Porsche', 'CAYENNE (955) S 4.5	4511	02/09 - 07/09\n  CAYENNE (955) Turbo 4.5	4511	02/09 - 07/09\n  CAYENNE (955) 3.2	          CAYENNE (955) S 4.5	4511	02/09 - 07/09\n  CAYENNE (955) Turbo 4.5	4511	02/09 - 07/09\n  CAYENNE (955) 3.2	          3189	03/10 - 07/09\n  CAYENNE (955) Turbo S 4.5	4511	04/01 - 07/09\n  CAYENNE (955) Turbo S 4.5	4511	06/03 - 07/09\n  CAYENNE (955) 3.6	          3598	07/02 - 10/09\n  CAYENNE (955) S 4.8	4806	07/02 - 10/09\n  CAYENNE (955) Turbo S 4.8	4806	07/02 - 10/09\n  CAYENNE (955) GTS 4.8	4806	07/10 - 10/09\n  CAYENNE (955) Turbo S 4.8	4806	08/08 - 10/09\n  CAYENNE (955) Turbo S 4.8	4806	07/02 - 10/09\n  CAYENNE 3.6	          3598	10/06 - /\n  CAYENNE 4.8 S	          4806	10/06 - /\n  CAYENNE 4.8 GTS	          4806	12/06 - /\n  CAYENNE 4.8 Turbo S	4806	12/10 - /\n  CAYENNE 4.8 Turbo	          4806	10/06 - /\n  CAYENNE 4.8 Turbo	          4806	10/06 - /\n', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:33', '2019-09-06 15:42:33', '232', '6个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (233, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA68', 'A2C53377802Z\nW0133-1895135\n95562093101', '0.806', '340*260*173', 'Porsche', 'CAYENNE (955) S 4.5	4511	02/09 - 07/09\n  CAYENNE (955) Turbo 4.5	4511	02/09 - 07/09\n  CAYENNE (955) 3.2	          3189	03/10 - 07/09\n  CAYENNE (955) Turbo S 4.5	4511	04/01 - 07/09\n  CAYENNE (955) Turbo S 4.5	4511	06/03 - 07/09\n  CAYENNE (955) 3.6	          3598	07/02 - 10/09\n  CAYENNE (955) S 4.8	4806	07/02 - 10/09\n  CAYENNE (955) Turbo S 4.8	4806	07/02 - 10/09\n  CAYENNE (955) GTS 4.8	4806	07/10 - 10/09\n  CAYENNE (955) Turbo S 4.8	4806	08/08 - 10/09\n  CAYENNE (955) Turbo S 4.8	4806	07/02 - 10/09\n  CAYENNE 3.6	          3598	10/06 - /\n  CAYENNE 4.8 S	          4806	10/06 - /\n  CAYENNE 4.8 GTS	          4806	12/06 - /\n  CAYENNE 4.8 Turbo S	4806	12/10 - /\n  CAYENNE 4.8 Turbo	          4806	10/06 - /\n  CAYENNE 4.8 Turbo	          4806	10/06 - /\n', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:33', '2019-09-06 15:42:33', '232', '6个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (234, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA69', '7L6919087G', '1.083', '300*173*173', 'VW', 'VW TOUAREG', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:33', '2019-09-06 15:42:33', '191', '9个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (235, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA70', '7L6919087F', '1.068', '300*173*173', 'VW', 'VW TOUAREG', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:33', '2019-09-06 15:42:33', '191', '9个/箱', '7号五版外箱540×330×540');
INSERT INTO `mg_product_info` VALUES (236, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA71', '3C0919050E             3C0919050G', '0.945', '340*260*173', 'VW', 'VW PASSAT', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:33', '2019-09-06 15:42:33', '191', '6个/箱', '8号五版外箱540×360×540');
INSERT INTO `mg_product_info` VALUES (237, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA72', '3C0 919 051AK', '1.315', '300*215*173', 'VW', 'PASSAT/4MOTION/SANTANA 09-11;  PASSAT CC FSI发动机 09-12', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:33', '2019-09-06 15:42:33', '223', '12个/箱', '13号五版外箱540×540×540');
INSERT INTO `mg_product_info` VALUES (238, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA73', '580303016', '1.27', '340*215*173', 'CITROEN ', 'CITROEN JUMPER Bus 1994-2002\nFIAT DUCATO    1994-2002\nPEUGEOT BOXER  1994-2002', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:33', '2019-09-06 15:42:33', '191', '6个/箱', '3号五版外箱450×360×540');
INSERT INTO `mg_product_info` VALUES (239, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA74', '1582980135\n77440', '0.97', '390*320*200', 'VOLVO', 'VOLVO S60 V70 II 2.4D  2000-2010', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:34', '2019-09-06 15:42:34', '232', '4个/箱', '14号五版外箱660×420×420');
INSERT INTO `mg_product_info` VALUES (240, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA75', '1582980134\n 77348', '0.9', '390*320*200', 'VOLVO', 'VOLVO S60 V70 II 2.4D  2000-2010', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:34', '2019-09-06 15:42:34', '232', '4个/箱', '14号五版外箱660×420×420');
INSERT INTO `mg_product_info` VALUES (241, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA76', '77164 \n1582980136\n77164 \n30761736', '1.0', '390*320*200', 'VOLVO', 'VOLVO V70 II 2.5TDI   1999-2007', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:34', '2019-09-06 15:42:34', '241', '4个/箱', '14号五版外箱660×420×420');
INSERT INTO `mg_product_info` VALUES (242, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA77', '1582980203\n77170\n30761747  31305018', '1.19', '390*320*200', 'VOLVO', 'VOLVO S60 V70 II 2.4  2001-2009', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:34', '2019-09-06 15:42:34', '259', '4个/箱', '14号五版外箱660×420×420');
INSERT INTO `mg_product_info` VALUES (243, '燃油泵总成', 'Fuel Pump Assembly', 'DA-FPA78', '5QD919051D\n5Q0919051M\n5Q0919051B\n5Q0919051N\n5Q0919051BH\n77640', '0.85', '300*260*215', 'Audi ', 'Audi A3(8V1); VW Golf VII (TSI)', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:34', '2019-09-06 15:42:34', '168', '4个/箱', '15号五版外箱450×330×540');
INSERT INTO `mg_product_info` VALUES (244, '燃油泵', 'Fuel Pump Assembly', 'DA-FPA79', '4704994', '0.59', '190*68*75', 'Mercedes Benz', 'BENZ', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:34', '2019-09-06 15:42:34', '86', '30个/箱', '495*395*245');
INSERT INTO `mg_product_info` VALUES (245, '燃油泵', 'Fuel Pump Assembly', 'DA-FPA80', '16144024378', '0.63', '190*68*75', 'BMW', 'BMW', NULL, NULL, NULL, NULL, '', NULL, NULL, '2019-09-06 15:42:34', '2019-09-06 15:42:34', '91', '30个/箱', '495*395*245');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_num` int(20) NULL DEFAULT NULL,
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_resource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money_resource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `e_status` tinyint(1) NULL DEFAULT NULL,
  `e_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `book_id` int(11) NULL DEFAULT NULL,
  `t_status` tinyint(1) NULL DEFAULT NULL,
  `t_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `book_video_id` int(11) NULL DEFAULT NULL,
  `create_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `type_id` int(11) NULL DEFAULT NULL,
  `genre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人/团体',
  `groups` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '团体参赛人编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pro_student_id`(`student_id`) USING BTREE,
  INDEX `pro_book_id`(`book_id`) USING BTREE,
  INDEX `pro_teacher`(`teacher_id`) USING BTREE,
  INDEX `book_video_id`(`book_video_id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  CONSTRAINT `book_video_id` FOREIGN KEY (`book_video_id`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pro_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pro_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pro_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, '1', '项目来源', '经费来源', '项目描述', 1, '1', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for schema_version
-- ----------------------------
DROP TABLE IF EXISTS `schema_version`;
CREATE TABLE `schema_version`  (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `checksum` int(11) NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `installed_on` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  INDEX `schema_version_s_idx`(`success`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schema_version
-- ----------------------------
INSERT INTO `schema_version` VALUES (1, '1.0.0.20180406.1', 'SCIS DB INIT', 'SQL', 'V1.0.0_20180406_1__SCIS_DB_INIT.sql', 2041224549, 'root', '2019-09-02 09:21:29', 4193, 1);
INSERT INTO `schema_version` VALUES (2, '1.0.0.20180407.1', 'ADD  TABLE ALLOTPRO', 'SQL', 'V1.0.0_20180407_1__ADD _TABLE_ALLOTPRO.sql', 1705450590, 'root', '2019-09-02 09:21:30', 386, 1);
INSERT INTO `schema_version` VALUES (3, '1.0.0.20180410.2', 'ADD  TABLE Notice', 'SQL', 'V1.0.0_20180410_2__ADD _TABLE_Notice.sql', -1226246389, 'root', '2019-09-02 09:21:30', 387, 1);
INSERT INTO `schema_version` VALUES (4, '1.0.0.20180416.1', 'ADD  TABLE FIELD', 'SQL', 'V1.0.0_20180416_1__ADD _TABLE_FIELD.sql', -768436933, 'root', '2019-09-02 09:21:32', 2184, 1);
INSERT INTO `schema_version` VALUES (5, '1.0.0.20180416.2', 'ADD  SOME DATA', 'SQL', 'V1.0.0_20180416_2__ADD _SOME_DATA.sql', 335783523, 'root', '2019-09-02 09:21:32', 82, 1);
INSERT INTO `schema_version` VALUES (6, '1.0.0.20180510.1', 'ADD  TABLE CIRCULAR', 'SQL', 'V1.0.0_20180510_1__ADD _TABLE_CIRCULAR.sql', 1072634980, 'root', '2019-09-02 09:21:33', 302, 1);
INSERT INTO `schema_version` VALUES (7, '1.0.0.20180510.2', 'ADD  TABLE FIELD', 'SQL', 'V1.0.0_20180510_2__ADD _TABLE_FIELD.sql', 1904869983, 'root', '2019-09-02 09:21:35', 2290, 1);
INSERT INTO `schema_version` VALUES (8, '1.0.0.20180510.3', 'ADD  TABLE FIELD', 'SQL', 'V1.0.0_20180510_3__ADD _TABLE_FIELD.sql', 1288629556, 'root', '2019-09-02 09:21:36', 497, 1);
INSERT INTO `schema_version` VALUES (9, '1.0.0.20180517.1', 'ADD  TABLE FIELD', 'SQL', 'V1.0.0_20180517_1__ADD _TABLE_FIELD.sql', 1928653640, 'root', '2019-09-02 09:21:36', 776, 1);
INSERT INTO `schema_version` VALUES (10, '1.0.0.20180517.2', 'ADD  FORGIN KEY', 'SQL', 'V1.0.0_20180517_2__ADD _FORGIN_KEY.sql', -2105509760, 'root', '2019-09-02 09:21:38', 1516, 1);
INSERT INTO `schema_version` VALUES (11, '1.0.0.20180517.3', 'CHANGE  CIRCULAR FIELD', 'SQL', 'V1.0.0_20180517_3__CHANGE _CIRCULAR_FIELD.sql', -528529806, 'root', '2019-09-02 09:21:42', 4292, 1);
INSERT INTO `schema_version` VALUES (12, '1.0.0.20180518.1', 'ADD PROJECT DATE', 'SQL', 'V1.0.0_20180518_1__ADD_PROJECT_DATE.sql', -2043696691, 'root', '2019-09-02 09:21:46', 3237, 1);
INSERT INTO `schema_version` VALUES (13, '1.0.0.20180522.1', 'DELETE PROJECT FIELD', 'SQL', 'V1.0.0_20180522_1__DELETE_PROJECT_FIELD.sql', 366527784, 'root', '2019-09-02 09:21:48', 1871, 1);
INSERT INTO `schema_version` VALUES (14, '1.0.0.20180524.1', 'CHANGE  NUM FIELD', 'SQL', 'V1.0.0_20180524_1__CHANGE _NUM_FIELD.sql', 176095671, 'root', '2019-09-02 09:21:48', 421, 1);
INSERT INTO `schema_version` VALUES (15, '1.0.0.20180525.1', 'ADD DEPT FIELD', 'SQL', 'V1.0.0_20180525_1__ADD_DEPT_FIELD.sql', 1519074102, 'root', '2019-09-02 09:21:56', 7333, 1);
INSERT INTO `schema_version` VALUES (16, '1.0.0.20180527.1', 'ADD DEPT FIELD', 'SQL', 'V1.0.0_20180527_1__ADD_DEPT_FIELD.sql', 701633359, 'root', '2019-09-02 09:22:02', 6317, 1);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(22) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birth` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sclass` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_major_id`(`major_id`) USING BTREE,
  CONSTRAINT `student_major_id` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 1306, '我叫学生', '123456', '女', '2018-04-04', '1', '123456', 1);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `gsm` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名',
  `zycp` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主营产品',
  `lxr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `lxdh` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `wz` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网址',
  `qq` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `wx` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信',
  `dz` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 233 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '温州格罗孛活塞环有限公司', '活塞环', '余海帆', '0086-577-63791686', 'https://www.11467.com/qiye/47627817.htm', '1', '1', '浙江省温州市平阳县万全镇京信路1号', '2019-10-18 16:11:12', '2019-10-18 16:17:11');
INSERT INTO `supplier` VALUES (2, '河北鈦通滤清器有限公司', '机油滤清器 燃油滤清器 空气滤清器 空调滤清器', '季超', '0318-5190222', 'http://u71493035.b2bname.com/', '2567600132', NULL, '河北省深州市黄河东路333号', '2019-10-18 16:11:12', '2019-10-18 16:11:12');
INSERT INTO `supplier` VALUES (3, '浙江力驰雷奥环保科技有限公司', '冷却器管，真空电磁阀，ERG冷却器等', '谢刚', NULL, 'http://www.zjlclo.com/', NULL, NULL, '浙江省温岭市城西街道九龙大道2号路', '2019-10-18 16:11:12', '2019-10-18 16:11:12');
INSERT INTO `supplier` VALUES (4, '邢台耐尔特活塞制造有限公司', '活塞', '曹素娟', '13932900362', 'www.netpiston.com.cn', '2850250161', NULL, '河北省任县西刘工业区海河路', '2019-10-18 16:11:12', '2019-10-18 16:11:12');
INSERT INTO `supplier` VALUES (5, '常州市得超汽车机电厂', '电磁开关，发动机，发电机', '胡城富', '15261196888', 'http://www.dechaodianji.com/ch/index.html', '1838646740', '15261196888', '江苏省常州市武进区牛塘镇清莲路6-7号', '2019-10-18 16:11:12', '2019-10-18 16:11:12');
INSERT INTO `supplier` VALUES (6, '河北清河顺发汽车配件有限公司', '衬套，发动机支撑、橡胶减震底盘件、悬置、胶管', '焦书保', '0319-8281678', 'jiaoshubao@shunfaqipei.com', '1360078875', '15030485888', '河北清城关工业区', '2019-10-18 16:11:12', '2019-10-18 16:11:12');
INSERT INTO `supplier` VALUES (7, '广州鸿远汽车配件有限公司', '汽油泵、柴油泵、滤清器、机油泵、', '全思杰', '020-86210275', 'http://gzxhyqp.51sole.com/', '469879868', '13828402245', '广州市白云区石槎路聚源街50号欣凯科技园A2栋', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (8, '上海容佳国际贸易有限公司', '汽摩零配件', '应利彬', '', NULL, NULL, NULL, '上海市静安区威海路511号1806室', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (9, '江苏华尚汽车玻璃工业有限公司', '汽车玻璃', '鞠亚京', '0086-515-83898826', 'http://www.bsgautoglass.net\n', NULL, NULL, '盐城市大丰经济开发区风电产业园锦丰路36号', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (10, '宁波思博洁具有眼公司', '洗车刷，毛巾布', '程方立', '0086-574-28900968', 'www.siboer.en.alibaba.com\n', NULL, NULL, '宁波市鄞州', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (11, '黄岩新前盈佳金属制品厂', '门锁、搭扣', '张萍', '0576-84355185', 'www.trailerparts.com.cn', NULL, NULL, '浙江省台州黄岩北城北院大道7-1号', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (12, '山东久力工贸集团有限公司', '拉网式起动用铅酸蓄电池', '曹云霞', NULL, 'http://www.sdjljt.cn/en', NULL, 'caoyunxia316', '山东日照五莲区玉里镇', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (13, '浙江骏龙配件有限公司', '机油滤清器等', '尤晓洁', '0086-57765272655', NULL, NULL, NULL, '瑞安市，塘下镇，海安街，367-369号，中国', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (14, '荆州慶洋機械有限公司\n', '万向节', '方妮娜', '+86-716-8334366', 'Http://www.kym.com.tw', NULL, 'cake-fang', '中国湖北省荆州市恒隆路8号', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (15, '广州鸿远汽车配件有限公司', '发动机及配件', '全思杰', '020-86210275', 'http://gzxhyqp.huisou.com/company/', '469879868', '13828402245', '广州市白云区石槎路聚源街50号', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (16, '前进汽车是架有限公司', NULL, '焚保兴', '18632562161', 'www.qiqcxj.com', NULL, NULL, '中国河北省唐山市玉田县孤树工业园', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (17, '深圳市奥特瑞实业有限公司', '汽车安全用品; 汽车保养产品; 汽车天线; 防滑链; 打气筒; 后视镜; 应急电源', '唐龙', '（86-755)25906310', 'www.szart.com', NULL, NULL, '深圳市罗湖区红岭中路荔景大厦808室', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (18, '浙江省余姚市模具城冶山路286号', '钥匙锁、天线', '黄颖', '+08657462566286', 'http://www.puredz.com', NULL, NULL, '浙江省余姚市模具城冶山路286号', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (19, '宁波市鄞州豪曼迪机电有限公司', '发电机及发电机组', '夏军芳', '0086(0574)87833348', 'www.hamden.com', NULL, 'rgbvfthbv', '浙江省宁波市鄞州区云龙镇获江村工业区', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (20, '温州瑞明工业股份有限公司', '汽车发动机', '孟倩', '+86(577)59896500', 'www.chinarm.com', NULL, NULL, '浙江温州瑞安市汽摩配产业基地北区', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (21, '嘉兴博友进出口有限公司', NULL, '沈建华', '0086-57386028003', 'www.motortech.asia', '2923873053', ' maxapw', '浙江省海盐县勤俭南路165号颐高中心1108 ', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (22, '柳州市立安联合刀片有限公司', '食品加工用刀\n金属加工刀片\n木材削片机刀\n包装刀片\n塑料和制粒机刀片\n纺织、无纺布、聚脂纤维刀片\n烟草切刀\n造纸行业刀片', '余雯', '+86-772-2833117', 'www.luk-knife.com', NULL, '+8617774718082', '广西柳州市河西工业区福馨路12号天步孵化器6号楼一层', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (23, '宜宾天瑞达汽车零部件有限公司', '负压EGR阀\n电动EGR阀\n高频电磁阀\n节流阀类\n', '谢刚', NULL, 'www,zjlo.com', NULL, NULL, '四川省宣宾市叙州区城北新区金山路', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (24, '邢台耐尔特活塞制造有限公司 ', '活塞', '曹素娟', '+86-319-756507', NULL, '2850250161', NULL, '中国河北省任县西刘工业区海河路', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (25, '常州市得超汽车电机厂', '电机', '胡诚富', '+86(0)519-86397087', 'http://www.dechaodianji.com/', '1838646740', '+86 15261196888', '江苏省常州市武进区牛塘镇青莲路6-7号', '2019-10-18 16:11:13', '2019-10-18 16:11:13');
INSERT INTO `supplier` VALUES (26, '邢台市佛瑞克汽车配件有限公司\n', '十字胶圈，液压修理包等', '吴少雷', '0086-18832971170', 'http:/www.fikfilter.com', '981113105', 'Jason-FIL TERS', 'Xiliu Industrial Park, Ren County Xingtai City, Hebei Province, China', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (27, '宁波石材汽车附件限制公司', '车窗调节器', '殳亚芬', '+86-574-86690198', 'www.stonemotor.com', '479183759', NULL, '北268号，通源路骆驼机电工业园，中国宁波', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (28, '开平市本铃机车密封垫有限公司', '汽缸垫和大修包', '胡健辉', '+86-750-2610822', 'https://www.pvc123.com/b-benling', NULL, NULL, '广东省开平市赤坎镇河南路172号', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (29, '山东振挺精工活塞有限公司', '通机活塞、摩托车活塞', '任猛', '+86-538-8669916-8', 'http://www.nypiston.com', NULL, '18854816847', '1826. Qixian Road，Ningyang County,Tai\'an City, Shandong Province, China', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (30, '浙江中立集团有限公司', '轮毂锁、摩托车锁', '未提供', '0577-86086320', 'www.lock-king.com', NULL, NULL, '浙江温州瓯海区三溪工业园康宏西路1号', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (31, '锐奇控股股份有限公司', '冲击钻，水钻等工具', '陆雪华', '+86-21-57767309', 'http://www.ken-tools.com/web/main.php', NULL, NULL, '上海市松江区新茸路5号', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (32, '江苏苏美达车轮有限公司', '车轮', '张延飞', '025-84531733', 'http://www.sumecwheels.om', NULL, NULL, '江苏省扬州市宝应县宝胜路8号', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (33, '青岛市平度宏华橡胶厂', '卡车和拖车轮胎', '潘泉', '0086-532-85820926', NULL, NULL, '704835109', '13Y Jinfu Mansion (B),22 Shandong Road. Qingdao China，266071', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (34, '瑞安市都邦汽车配件有限公司', '车用水通,气门室盖,进气岐管等', '叶多焕', '0086-577-6538600', 'Http:www.radubang.com', '2877859640', NULL, '浙江省瑞安市塘下花园工业区', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (35, '佛山市赢米电子科技有限公司', '汽车车灯', '廖江平', '0757-27722516', 'www.tourytechnology.com', '1769038720', '15168700188', '佛山市顺德区伦教北海工业区兴业南路3号三楼', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (36, '上海协通(集团)有限公司', '车灯', '谭晓林', '021-66307770', 'www.gzmeiche.com', NULL, NULL, '上海市闸北区永和路318弄18号', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (37, '青岛欧美亚橡胶工业有限公司', '空气弹簧', '孙燕丽', '+86-532-80796111', 'http://www.worldeaa.com/', NULL, NULL, '山东省青岛市平度崔家集镇中庄宏华工业园', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (38, '南京钻望机电设备有限公司', '汽车轮毂', '胡飞艳', '025-84721236', 'www.dhwheel.com', NULL, '15720822199', '南京市中山东路300号长发中心A座803', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (39, '四川川南减震器集团有限公司', '汽摩减震器', '程涛', '(0833)4262186', 'www.cnabsorber.cn', NULL, NULL, '中国四川省乐山市犍为县玉津镇铜高村9组', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (40, '宁波摩多进出口有限公司', '车载吸尘器，方向盘', '沈朱杰', '+86-6574-81877164', 'www.auto-xracing.com\n\n', NULL, NULL, '中国浙江宁波市高新区光华路290弄研发园C10-9F', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (41, '中国浙江永康美能达五金工具制造厂', '电动工具、锂电工具、角向磨光机、电钻、电锤、电镐', '徐露莹', NULL, 'www.cnmeineng.com', '2533688826', NULL, '浙江永康市白云工业功能分区云三路11号', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (42, '广州市灵狮贸易发展有限公司', '汽车零部件', '卢兴光', '86-20-87707848', 'http://887282.51sole.com/', NULL, NULL, '广州市 天河区广园东路2193号时代新世界中心北塔2407-08', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (43, '浙江兴豪汽车零部件技术有限公司', '滤清器', '陈元丹', '0086-577-65295288', 'www.vkfilter.com', NULL, '', '浙江省瑞安市塘下镇罗西889', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (44, '泰安东泰机械制造有限公司', '柴油发动机及其零件', '雷旺', NULL, 'www.dtdiesel.com', '36918935', NULL, '中国山东泰安', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (45, '天津裕达软管夹有限公司', '软管夹', '李益莲', '86-02289129128', 'www.yudahoseclamp.com', NULL, NULL, '605室，海泰大厦5号，中国天津市西青区', '2019-10-18 16:11:14', '2019-10-18 16:11:14');
INSERT INTO `supplier` VALUES (46, '丹阳欧博汽车部件有限公司', '车灯', '陈娬', '0086-51-86386730', 'Http://www.hyl-cn.com', '319596696', '13952832363', '江苏省丹阳市丹北镇新桥滨江村(常泰高速新桥入口处)', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (47, ' 杭州天丰电源股份有限公司', '各种电池', '金校刚', '0571-88140995-1014', 'www.skyrichpower.com', NULL, NULL, '浙江省杭州市拱墅区临半路118号', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (48, '黄山立国机车部件有限公司', '缸盖', '张浩', '+86-18955997158', 'www.legoalmotor.com', '350357565', NULL, '安徽省黄山市歙县经济开发区维六路', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (49, '台州市广庆塑业有限公司', '喷洒壶', '罗志远', '+86-15157693788', 'https://shop436t571401549.1688.com/', NULL, NULL, '浙江省台州市椒江区三甲街道松农路34号', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (50, '安徽美瑞尔滤淸器有限公司', '汽车滤清器', '胡翔详', '15055305533', 'www.mrefilter.com', NULL, NULL, '安徽省芜湖县机械工业园东湾路333号', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (51, '成都海思实业有限公司', '空调出风口', '邓瑞萍', '028-85770927', NULL, '553465722', NULL, '成都市致民路36号锦江新园402号', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (52, '江苏嘉沃车业有限公司', '车灯，保险杠、叶子板内衬、车门', '陈贺军', '0086（511）-86397757', 'http://www.top-jh.cn/', '2355249224', NULL, '丹阳市丹北镇后巷高桥开发区', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (53, '重庆秋域机械有限公司', '汽车变速器总成等', '张婷婷', '17783471081', NULL, '3307934959', NULL, '重庆市璧山区壁泉街道铬山路16号', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (54, '余姚市美士杰电器有限公司', '车载充气泵，抽油泵', '无', '+86-574-62178908', 'www.nbmsj.com', '2355504364', '', '浙江省余姚市泗门镇泗北工业区科技路7号', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (55, '常州市鹏翔汽车装饰厂', 'SUV踏板、日行灯等', '商婷', '86-519-83506997', 'http：//www.cz-px.cn', '842136674', NULL, '江苏省常州市新北区小河富民工业园区孙家路5号', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (56, '凤城市华强机械制造有限公司', '涡轮增压器及其配件', '迟强', '0086-415-8298789', 'http://www.hqturbo.com/contact-us', NULL, NULL, '辽宁省凤城市草河工业园丹玉路36号', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (57, '宁波裕恒汽车用品有限公司', '吸尘器、充气泵', '黄勇清', '400-900-8513', 'http://www.yyzjf.com/call%20us.html', '1004147737', NULL, '浙江省余姚市泗门工业园区', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (58, '海利达工具', '千斤顶等', '谢先生', '86-576-86746158　', 'http://www.hailidatools.com/contact/&FrontColumns_navigation01-1339125003921FirstColumnId=0f6e047f-5e52-4991-b69f-edcc33f9bdb0.html', NULL, NULL, '中国浙江省温岭市泽国三亚大桥工业区。', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (59, '宁波拓野工具有限公司', '充抢电钻、电动螺丝刀', '朱刚', '15606699961', 'https://tuoyegongju.1688.com/', '2044728042', '601682687', '宁波市北仑区戚家山环山路425弄21号', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (60, '中山市车仕盾电子有限公司', '汽车防盗器系统', '王伟', '86 0760 22211157', 'https://carshidun.1688.com/', NULL, NULL, '中国 广东 中山市 东升镇文田路45号', '2019-10-18 16:11:15', '2019-10-18 16:11:15');
INSERT INTO `supplier` VALUES (61, '广州金佳汽车制造有限公司', '冷凝器', '刘瑞亚', '0086-20-87810068', 'http://www.kingacooling.com/contact-us', NULL, NULL, '广州市先烈中路81号之三（洪都大厦A座401）A6', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (62, '广州西尔盾汽车用品有限公司', '车用窗帘，遮阳挡', '刘志灵', '18818399580', 'https://shieldautomotive.1688.com/', '3039401726', 'shield-automotive', '广州市白云区石马桃红西街38号', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (63, '中国国际合作有限公司', '工具类', '王智勇', '0086-574-87120444 87116726', 'Http://www.car-line.com', NULL, '13505743749', '浙江宁波马原路198号10层', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (64, '浙江博盟精工轴承有限公司', '轴承、导轨、装置', '王先生', '18857570033 ', 'http://bom-cn.com/page/lxwm/index.php', NULL, NULL, '浙江省绍兴市袍江工业区三江东路29号', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (65, '广州轻出集团股份有限公司', '光电源、自行车胎、卫浴、五金、建材', '黎学铭', '020-83373896', 'http://www.gzli.com/', NULL, NULL, '广州市沿江西路145号之一八楼', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (66, '蒋龙零部件有限公司', '灯具、保险杠等', '蒋彤', '85161592', 'http://www.j-longparts.com/', NULL, NULL, '常州市新区汉江中路368号金城大厦1013室', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (67, '河北铂锐汽车用品制造有限公司', '汽车方向盘套', '杨军良', '0321-6043866', NULL, '1040928459', '13833026726', '河北黎县东魏工业区', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (68, '荆门俊楷电子商务有限公司', '细节抛光机等汽车美容工具', '刘莎莎', '+86 18986967990', 'https://shop7f06337j673y5.1688.com/', NULL, NULL, '湖北省荆州市门漳河新区荆门万达广场A座10楼1004室', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (69, '台州随塔汽车用品有限公司', '汽车坐垫', '杨壮壮 ', '86 0576 83728862', 'https://ttstzd.1688.com/', NULL, NULL, '中国 浙江 天台县 坦头镇灵珠路12号台州隋塔汽车用品有限公司', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (70, '浙江省三门呈祥汽配有限公司', '汽车垫、汽车毯、地毯门垫', '何佳橙', '0576-83373110', 'http://www.winfull-auto.com/', NULL, NULL, '浙江省三门县健跳镇三岔工业区', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (71, '道明光学股份有限公司', '反光膜、反光布等', '吴军鹏', '0579 8731 1606', 'https://motian.1688.com/', NULL, NULL, '浙江省永康市经济开发区东吴路581号', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (72, '浙江睿泰汽车零部件有限公司', '倒车镜片、前灯罩等', '李先生', '0570-7365777  ', 'http://www.outai.net/', NULL, NULL, '浙江省衢州市龙游城南开发区开源路43号', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (73, '常州市旭日汽车配件厂', '汽车车灯', '郭正平', '0086-519-85038536 85038528', 'http://www.xrcd.cn/', NULL, NULL, '常州市新北区小河镇富平工业园区', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (74, '奥德利汽车配件有限公司', '方向盘套等汽车零部件', 'Ms Vicky', '+ 86-20-83198523', 'http://www.cnaudly.com/content/Econtact.html', NULL, NULL, '广州市海珠区新港西路3号银华大厦5楼', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (75, '常熟通润汽车配件', '千斤顶起升工具', '未提供', '86-512 52343388', 'http://www.tongrunjacks.com/cn/about/contact.html', NULL, NULL, '江苏常熟经济开发区新龙腾工业园', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (76, '台州市航宇塑胶有限公司', '洗车器、喷雾器', 'Cookie', '0086 576 88133278', 'https://hysjtz.1688.com/', NULL, NULL, '中国 浙江 台州市椒江区 滨海工业区启航路1008号', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (77, 'j龙零部件(常州)有限公司公司', '车灯、车镜等 ', '蒋彤', '+86-519-85161592/89881592', 'www.j-longparts.com', NULL, NULL, '常州市新北区汉江中路368号金城大厦1013室', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (78, '泉州市和美机械配件有限公司 ', '挖掘机零配件', '未提供', ' 02032037566', 'http://tina891209.cn.globalimporter.net/03/about.asp', NULL, NULL, '福建省南安市滨江机械装备制造基地', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (79, '镇江太阳世界电子有限公司', '车灯', '未提供', '+ 86-511-82055399', 'http://www.sunworldlighting.com/', '534065890', '534065890', '山东省瑞安市丹徒区镇江三山工业园路', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (80, '凤城市凤凰增压器制造有限公司!', '增压器整机及其配件', '未提供', '0086-415-8267686', 'www.turbofh.com', NULL, NULL, '辽宁省凤城市现代产业园区二龙工业园区B区', '2019-10-18 16:11:16', '2019-10-18 16:11:16');
INSERT INTO `supplier` VALUES (81, '西格迈股份有限公司', '减震器及空气悬挂等', 'Aziz', '+ 86-576-83582888', 'http://cn.xgmauto.com/contact-us', NULL, NULL, '浙江省台州市三门县浦坝港镇', '2019-10-18 16:11:17', '2019-10-18 16:11:17');
INSERT INTO `supplier` VALUES (82, '广州Sunon汽车配件有限公司', '汽车车灯', '张女士', '0086-13662445820', 'https://lcled.en.alibaba.com/', '1451228927', '008613662445820', '广东广州越秀区永福路丽园广场D46号', '2019-10-18 16:11:17', '2019-10-18 16:11:17');
INSERT INTO `supplier` VALUES (83, '杭州维泰汽车用品有限公司', '空气压缩机、Led工作灯等', '蒋蕾', '86 18768120511', 'http://www.vcantiger.com/', NULL, '+86 18768120511', '中国浙江省杭州市滨江区滨胜路3867号宝隆城市广场A栋6楼', '2019-10-18 16:11:17', '2019-10-18 16:11:17');
INSERT INTO `supplier` VALUES (84, '余姚市裕瑞电器有限公司', '悬挂气泵、车用吸尘器等', '田凤田', '86-574-62062561', 'http://www.zjyufeng.com/contact.asp', '912154430', NULL, '余姚市临山镇湖堤开发区', '2019-10-18 16:11:17', '2019-10-18 16:11:17');
INSERT INTO `supplier` VALUES (85, '车之福汽车用品有限公司', '汽车灯系列、车充、车载吸尘器', 'jenny', '0757-25527895', 'http://www.sdcarfu.com.cn/', '2853630833', 'carfu18928667561', '广东省佛山市顺德区勒流镇仁海工业区8号', '2019-10-18 16:11:17', '2019-10-18 16:11:17');
INSERT INTO `supplier` VALUES (86, '浙江傲路工贸有限公司', '汽车牵引绳子', '李文凤', '+86-571-85053239', 'Http://www.zjallroad.cn', NULL, NULL, '浙江省杭州市体育场路218号', '2019-10-18 16:11:17', '2019-10-18 16:11:17');
INSERT INTO `supplier` VALUES (87, '张家港中天达工具有限公司', '管控制工具', '顾淑懿', '+ 86-512-58766911', 'https://www.tiandatools.com/', NULL, NULL, '中国江苏省张家港市大新镇', '2019-10-18 16:11:17', '2019-10-18 16:11:17');
INSERT INTO `supplier` VALUES (88, '海宁耐得照明电器有限公司', '疝气灯、卤素头灯', 'Yoka', '0086-573-87865887', 'www.cnbulb.com', NULL, NULL, '中国浙江省海宁市袁花镇双丰村民丰路12号', '2019-10-18 16:11:17', '2019-10-18 16:11:17');
INSERT INTO `supplier` VALUES (89, '无锡市华锋车业部件有限公司', '软轴线系列', 'Tracy Fang', '+86-510-88790256', 'http://www.huafengqp.com/', NULL, NULL, '无锡港下工业园区A区', '2019-10-18 16:11:17', '2019-10-18 16:11:17');
INSERT INTO `supplier` VALUES (90, '浙江茂源橡塑股份有限公司', '汽车脚垫、地毯脚垫', 'Nancy', '0086-576-83089999 ', 'http://www.maoyuan-cn.com/english/index.asp', NULL, NULL, '浙江天台三合工业园（亭头）', '2019-10-18 16:11:17', '2019-10-18 16:11:17');
INSERT INTO `supplier` VALUES (91, '杭州新源宏进出口贸易有限公司', '太阳挡，汽车椅套等', '王新贵', '86-571-88255898', 'http://www.lixiang-china.com/', NULL, NULL, '杭州市文二西路99号银座公寓3-3801', '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (92, '佛山市顺德区雄仕汽车用品有限公司', '方向盘套', 'jessica', '86-20 83587649 ', 'http://www.hombest.net/', '1075780768', '86-15889960323', '广东省广州市越秀区永福路45号广东永福国际汽车用品城B区043A-045档', '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (93, '宁波福鼎工贸有限公司', '安全套件、工具等', '丁世海', ' 86-574-86199651', 'www.fudingcar.com', NULL, '15888120690', '中国浙江省浙江省宁波北仑区小岗区', '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (94, '浙江沃尔德汽车用品有限公司', '汽车脚垫、地毯脚垫', '吴梦佳', '0086-576-83112229', 'https://voldautoaccessories.en.alibaba.com/', NULL, NULL, NULL, '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (95, '台州阳光电机泵业有限公司', '空压机、水泵及其配件', '苏先生（女士）', '0576-86331893', 'http://www.sunlightpump.cn/', '284346646', '284346646', '浙江省台州浙江 大溪镇大洋城工业区', '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (96, '杭州阳光工具有限公司', '充电器、测试仪、附件产品', '陈妙妙', '86-571-82305168', 'http://www.sunstorm-auto.com/cn/', NULL, NULL, '杭州市萧山区闻堰街道山河村湘山路58号', '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (97, '张家港杰博工具制造有限公司', '工具类', '茅熊', '86-013801561430', 'http://www.jibtools.com/', NULL, NULL, NULL, '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (98, '河北精拓轴承科技有限公司', '轴承', '吴士震', '0635-8550888', NULL, NULL, NULL, NULL, '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (99, '天津威龙汽车零部件销售有限公司', '雨刷', '李涛', '022-26962126', 'https://shop1416588308994.1688.com/', NULL, NULL, '中国 天津市西青区 西青道金盛工业园', '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (100, '丹阳雷斯通汽车部件有限公司', '车灯、车身套件', '未提供', '13862399930', 'https://leisitong.en.alibaba.com/', NULL, NULL, '江苏省丹阳市新桥镇群楼工业园', '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (101, '上海赛韧机电设备有限公司', '机电设备', '袁婷婷', '0086-15356756861', NULL, NULL, NULL, '上海市青浦区练塘路588弄15号1幢1层F区104室', '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (102, '宁波凯思泵业有限公司', '油泵震动泵及其配件', '林建杰', '+86-574-88014811', 'www.kaicepump.com', NULL, NULL, '中国浙江宁波市海曙区高桥镇秀丰工业区三成路82号', '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (103, '宁波创裕汽车用品有限公司', '车载吸尘器、充气泵、冰箱', '胡先生', '+86 574 62692899', 'http://www.tire-butler.cn/lxfs.html', NULL, NULL, '浙江省余姚市阳明街道丰南村上畈', '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (104, '柳州市千鑫汽车配件有限公司', 'EPDM水管、橡胶制品', '张蓝天', '0772-7525708', NULL, '649205934', NULL, '柳州市南环路塘头下屯松花小区12号', '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (105, '汇能特机械（珠海）有限公司', '水泵 切割机', '未提供', '0756-7734706 ', 'www.westlands.com.cn/', NULL, NULL, '广东省珠海市金湾区红旗镇永安路', '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (106, '佛山市塔孚汽车照明有限公司', '汽车车灯', '韩笑', '0086-757-85853011', 'http://www.tuffplus.cn/about/?10.html', NULL, NULL, '佛山市南海区狮山镇松岗松夏工业园日田园A座 ', '2019-10-18 16:11:18', '2019-10-18 16:11:18');
INSERT INTO `supplier` VALUES (107, '钱涛科技有限公司', '空气压缩机', '江铃', '0086-576-86308020', 'http://www.cn-dayou.com/', NULL, NULL, '浙江台州', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (108, '擎天塑件有限公司', '保险杠，车灯，车镜，中网，内外饰件等', '彭世宏', '13905290288', 'https://cn.made-in-china.com/showroom/pengshihong001', NULL, NULL, '江苏省丹阳市新桥镇南环东路8号', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (109, '金展代股份有限公司', '真空泵、压缩机等', 'Joyce wu', '886 977263782', 'https://twevo.en.taiwantrade.com/#', NULL, NULL, '中国台湾', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (110, '广州玛太电子有限公司', '各类汽摩车灯', '何珍', '020-22158921', 'http://www.matechid.com/', NULL, NULL, '广州市白云区嘉禾彭上致富路4号致星工业园G栋', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (111, '江苏俊鑫汽配有限公司', '重卡配件', '未提供', '0511-86381351', 'http://llvans.com/', NULL, NULL, NULL, '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (112, '天津电机有限公司', '机电产品制造商和分销商。', '张慧', '0086-13816508465', 'http://www.strempumps.com/', NULL, NULL, '中国天津市西青经济开发区西大集美工业区17号', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (113, '常州乾海车业有限公司', '车辆配件 , 车辆饰件 , 车辆灯具 ', '王慧宁', '13961231313', NULL, '271685508', NULL, '常州市新北区小河工业园', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (114, '常州市神霸车辆配件有限公司', 'SUV外饰件', '未提供', '0519-83508552', 'https://czshenba.en.alibaba.com/', NULL, NULL, '江苏省常州市新北区孟河镇国和村（现市桥村）（中国大陆）', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (115, '奥斯莱汽车用品有限公司', '汽车电子、车灯、太阳挡等', '黎志勇（先生）', '13824451383', 'http://www.cnaudly.com/chinese/content/about.html', NULL, ' ', '广州市海珠区东晓路海锦写字楼 ', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (116, '浙江奔克汽车部件有限公司', '灯罩、车灯、后雨刮器', '未提供', '0578-2928888', 'http://www.chinabenke.com/cn/', NULL, NULL, '浙江省丽水市经济 开发区绿谷大道337', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (117, '万向进出口有限公司', '减震器、卡尺、刹车', NULL, '0086-571-82832999', 'http://www.wanxiang.com.cn/', NULL, NULL, '浙江杭州', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (118, '广东雷腾智能光电有限公司', '车灯', '王雪玲', '020-28003729', 'http://www.rayton.cc/', '759250084', 'linda20111', '广州市花都区风神大道岭西路雷腾工业区', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (119, '浙江省浦江伯虎链条有限公司', '防滑链条', '黄媛媛', NULL, NULL, '2850293194', NULL, '浙江省浦江县亚太大道565号', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (120, '张家港欣迈五金工具有限公司', '五金工具', '未提供', '0512-58185702', 'http://www.globalmarket.com/', NULL, NULL, '浙江江苏', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (121, 'Lanseko', '车灯', 'Susan', NULL, 'http://www.lanseko.com/', NULL, NULL, '广东省广州市白云区黄石东路红风创意园13号楼', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (122, '中山市鼎恒照明有限公司', '汽车/摩托车/电动车通用灯', '未提供', ' ', 'https://zsdingheng.en.alibaba.com/', NULL, NULL, '广东省中山市东升镇合福村东路一街13号', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (123, '泰州市德众电子有限公司', '>圆盘喇叭\n>蜗牛角\n>喇叭配件\n>气喇叭\n>新产品\n>警报警报器喇叭', '王女士', '13539858340', 'www.dzhorn.com', '961098829', '13539858340', '江苏省泰州兴化市陈堡镇工业区', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (124, '安平石兰照明电子有限公司', '车灯', '吴先生', '+86 025-12345678', 'http://www.shilan-headlight.com/', NULL, '18022997255', ' 江苏省南京市星火路软件大厦A座', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (125, '深圳市华思旭科技有限公司', '汽车应急启动电源工具', 'Candy', '+86 158 1731 6219', 'http://www.car-ku.com/', NULL, '+86 158 1731 6219', '广东省惠州市惠城区三栋数码园惠泰路7号赢合科技园D栋', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (126, '广州市LEDWAY照明科技有限公司', '车灯', '王慧珠', '13902328834', 'https://ledway2013.en.ec21.com/', NULL, NULL, '广东省广州市番禺区番禺大道555号天安节能园高科技创业中心201-204室', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (127, '北京四正天元科贸有限公司', '高压清洗机', '法比奥', '0579-87205326', 'http://www.lavorchina.cn/', '340996911', NULL, '浙江省永康市西城街道花城西路80号', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (128, '台州市洁霸清洁用品有限公司', '洗车用吸尘器', 'Charles', '0576-88124882', 'http://zh.cnjieba.com/Contact.html', NULL, NULL, '浙江省台州市椒江区三甲街道', '2019-10-18 16:11:19', '2019-10-18 16:11:19');
INSERT INTO `supplier` VALUES (129, '泉州市圣诺机械制造有限公司', '传动轴支架总成', '吴慧虹', '+86-595-22456132', 'http://www.sinor2009.com/', NULL, '+86-1590597087', '福建省泉州市鲤城区高新科技园二期紫山西路6号', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (130, '埃埃拓普企业', '顶胶，控制臂、拉杆等', '龙维', '020-66356001', 'http://aa-top.com/', '301189197', NULL, '广州市花都新华工业园毕村北路1号', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (131, '浙江康信汽车电器有限公司', '汽车锁、开关、传感器、连接器、线束、打火机等。', '潘亦鹏', '86-577-61380777', 'http://www.conshion.com/', '200965806', NULL, '浙江省乐清市石帆镇公园湖工业区', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (132, '宁波余通电器有限公司', '便携式冰箱', 'sally', '+86-574-62062078', 'http://www.cn-yutong.com/', '2885292488', NULL, '浙江省余姚市', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (133, '浙江万安科技股份有限公司', '干燥器总成', '赵凯峰', '021-58596966', 'http://www.vie.com.cn/contact/contact-164.html', NULL, NULL, '浙江诸暨店口镇万安科技园区', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (134, '邢台鑫驰橡塑制品有限公司', '转向机修理包\n发动机大修包\n气门室盖垫', '张群峰', '86-13703194366', 'https://junxi18.1688.com/', '297441115', NULL, '中国 河北 巨鹿县 河北省邢台市巨鹿张庄工业区', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (135, '江苏恒联车业有限公司', '车灯', 'Rudy', '0511－86385588', 'http://www.wjautoparts.com/', NULL, NULL, '苏省丹阳市界牌乐港工业园', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (136, '广东省机械进出口股份有限公司', '雨刮片、国外雨刮臂、有骨雨刮片等', '叶健强', '202-37658286', 'http://www.gmg.com.cn/', NULL, NULL, '广州市东风东路726号', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (137, '三门县倍欧特橡胶有限公司', '汽车V带', '吴慧敏', '13305766652', 'https://binda888.1688.com/', '2692963666', 'xyzy52', '浙江省台州市三门县', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (138, '美途汽配实业有限公司', '雨刷，雨刷包及其配件', '吴先生', ' 0592-6039191', 'http://www.meto.com.cn/', NULL, NULL, ' 福建省厦门市同安区洪塘镇洪塘路182号', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (139, '厦门福来德汽配有限公司', '无骨雨刷', '沈文级', NULL, 'http://www.flatech.cn/', '1425013652@qq.com', NULL, '厦门市同安区美溪道同安工业园11-12号第六楼', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (140, '常州君昊进出口有限公司', '灯泡', '未知', '+86-519-86305890', 'www.lampstrade.com', NULL, NULL, '江苏省常州市武进区湖塘南洋商贸广场铂安国际A座703-705室', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (141, '常州成峰车业有限公', '车灯', 'Mike', '0086-13775615678', 'http://www.cf-cy.com/', '2850714601', NULL, '江苏省常州市新北区孟河镇建设路31号', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (142, '鼎工动力有限公司', '水泵，发电机组等', '未知', '+86-18883122012', 'http://www.china-dk.cn/', NULL, NULL, '重庆市合川工业园草街扩展区', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (143, '丹阳市红峰塑业有限公司', '车灯', '未知', '0086-511-86383538', 'http://www.hongfeng-cn.com/', NULL, NULL, '丹阳城市行签署红烛镇工业区', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (144, '浙江奔泰汽车零部件有限公司', '方向盘、雾灯', '未知', '+86-577-58815519', 'http://www.pentair1.com/', NULL, NULL, '瑞安市，塘下镇', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (145, '丹阳市越丰车业有限公司', '车灯', '钱经理', '0511-86465588', 'http：//www.yf-auto.com', '695363490', NULL, '丹阳市访仙镇红光村', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (146, '广东鑫统仕车用热系统有限公司', '冷凝器、暖风、发电机', '谭荣森', '13610575738', 'http://www.tongshirad.com/page66', NULL, NULL, '广东省清远市佛冈县汤塘镇106国道联合村', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (147, '嘉兴金派机械有限公司', '千斤顶', 'C.key Bu', '0573 86811888', 'http://www.kingslift.com/', NULL, NULL, '浙江海盐西塘桥刘庄村', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (148, '浙江瑞飞交通器材有限公司', '车载置物架等', '吕琳琳', '0086-570-7781168', 'http://www.ruifeichina.com/cpindex.htm', NULL, '18857024577', '浙江龙游县湖镇', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (149, '余姚市贝斯迪汽车用品有限公司', '车载吸尘器、充气泵', '潘海斌', '13968396858', 'https://shop1371574873340.1688.com/', NULL, NULL, '浙江省余姚市竹山桥工业园区36号', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (150, '台州中际汽车零部件有限公司', '空压机', '张琼', '+86 1358626 0380', 'www.auto-compressors.com', NULL, NULL, '浙江省临海市聚景路203号两水工业区', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (151, '温州迅源汽车部件有限公司', '空气弹簧', '王先生', '0577-65186102', 'www.xy-airspring.com', NULL, NULL, '浙江省瑞安市塘下镇罗凤北工业区凤都二路181号', '2019-10-18 16:11:20', '2019-10-18 16:11:20');
INSERT INTO `supplier` VALUES (152, '鸿长丰科技有限公司', '防滑板', '潘伟明', '13822110273', 'www.firkar4X4.com', NULL, NULL, '广东省佛山市三水区白堄镇汇银路27号', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (153, '达州市金恒机械有限责任公司', '汽车缸体', '杜平', '0818-2799500', 'www.dzjinheng.com', NULL, NULL, '四川省达州市经济开发区', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (154, '重庆市渝快汽车配件有限公司', '盘片，鼓片', '柯昌海', '86-23-65093066', 'www.cqykfm.com', NULL, NULL, '重庆市九龙坡区华岩镇西山工业园', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (155, '绵阳市万欣汽车配件有限公司', '空气流量计，空气滤清器', '吴国东', '0816-4326016', 'http://www.mywanxin.com/', NULL, NULL, '四川绵阳安县工业园', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (156, '湖南省博云汽车制动材料有限公司', '盘式/鼓式 刹车片', 'Chris', '+86-731-88122751', 'http://www.boyunbrake.com/', NULL, NULL, '长沙高新开发区麓松路500号 ', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (157, '瑞安市鸿威特汽配有限公司', '后视镜', '叶静', '0577-66009602', '未知', NULL, NULL, '浙江省瑞安市塘下罗凤北工业区罗凤西路758号', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (158, '台州动林汽车空调压缩机有限公司', '空调压缩机', ' 未知', '+86-13989649188', 'http://www.tzdlon.com/html/cn/index.php?ac=article&at=list&tid=10', NULL, NULL, '浙江省台州市温岭市泽国镇西桐村荣时路', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (159, '重庆金桥机器制造有限公司', '凸轮轴、喷油泵凸轮轴', ' 未知', '023-65701910', 'http://www.cqjinqiao.cn/', NULL, NULL, '重庆市九龙坡区白市铎', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (160, '中山市蓝柏电子有限公司', '汽车防盗、中控锁', 'Amy Lan', '+86-760-22825659', 'https://lanbosecurity.1688.com/', '740584005', '86-13790709231', '中国 广东 中山市 东升镇顷二街8号3楼', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (161, '惠州市车田汽车配件有限公司', '油箱盖装饰、大灯眉贴', 'Stephen xia', '+86 752 6911896', '未知', NULL, NULL, '惠州市石湾镇科技园', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (162, '全兴精工集团有限公司', '助力泵、方向机', '王孝斌', '135-6757-8475', 'http://www.china-quanxing.com/cn/contact.php', '2323628889', NULL, '浙江省诸暨阳街道兆山路16号', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (163, '宁波江北众晟汽车用品有限公司', '遮阳罩、汽车零部件', '沈一', '0086-574-88200342 ', 'Http://www.ming-sheng.com', NULL, NULL, NULL, '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (164, '山东三慧汽车轴承制造厂', '轴承', 'Jane', '+866355675889', NULL, '1354932708', NULL, '山东省聊城市冠县经济开发区', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (165, '江西天岳汽车电器有限公司', 'pmw调速模块、电动风扇总成', '陈学翰', '0795-2197239', 'http://www.xintianyue.com/', NULL, NULL, '江西省宜春市经济技术开发区', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (166, '重庆羿业气门有限公司', '通用汽油机、柴油机', '曹宏', '17723572079', 'http://www.cqyyqm.cn/', '643444092', NULL, '重庆市合川工业园区高阳路田崎实业7号厂房', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (167, '成都正恒动力股份有限公司', '发动机缸体', '郑良义', '+862883912135', 'http://www.zhdl.com/', NULL, NULL, '成都市新都工业东区聚合路69号', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (168, '瑞丽汽车零部件有限公司', '汽车制动系统及其他关键安全相关汽车零部件', '未提供', '0086-577-6500 8000', 'http://www.sorl.cn/', NULL, NULL, NULL, '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (169, '博尔德公司', '减震器', '未提供', '+86 0575-83619688', 'http://www.bortchina.com/About.asp', NULL, NULL, '中国浙江省绍兴市', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (170, '温州汇润机电有限公司', '燃油泵、氧传感器、滤清器', '孙林容', '+86-0577-86808059', 'http://www.achr.cn/', NULL, NULL, '温州经济技术开发区海滨一道1389号', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (171, '东营宝泰汽车配件集团', '制动盘，刹车片', '李小慧', '0546-7072666', 'http://en.baotaigroup.net/', NULL, NULL, '山东省东营市广饶经济开发区', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (172, '凤城市明晓涡轮增压器制造有限公司', '涡轮增压器及其配件', 'Tiffany-tan', '+86-20-32233365', 'http://www.mxturbocharger.com/site/index.shtml', '2853316886', NULL, '广州市黄埔区中山路8号黄埔环宇国际工程机械市场', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (173, '浙江顺家汽车配件有限公司', '雨刷', 'Afena Meng', '+86 181 5775 3819', 'http://www.theuniper.com/', NULL, NULL, '浙江省平阳县万全轻工基地机械园经三路1号', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (174, '贵阳白云合金容铸厂', '发动机曲轴', '曾睿', '+86 851 84606510', 'https://stem.en.alibaba.com/', NULL, NULL, '贵州省贵阳市白云区，白云南路粑粑坳', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (175, '清河县德正汽车配件有限公司', '胶管、汽车、工程机械胶条', '张丽娟', '+86 319-8136667', 'http://www.hbdezheng.com/', NULL, NULL, '河北省清河市', '2019-10-18 16:11:21', '2019-10-18 16:11:21');
INSERT INTO `supplier` VALUES (176, '佛山顺德区实力汽车配件有限公司', '千斤顶及其配件', '未知', '+86-757-26156166', 'http://www.sdshili.com.cn/blank.html', NULL, NULL, '广东省佛山市顺德区', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (177, '河南万路达车业部件有限公司', '水泵', '未知', '0577-65382333', 'http://www.youboy.net/', NULL, NULL, '浙江省瑞安市塘下万佳园A栋302', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (178, '浙江沪天胶带有限公司', '普通V 带、汽车V带、切割带、同步带、输送带系列产品', 'Steven', '0086-576-83080333', 'http://gb.hutian.com/comcontent_detail/i=2&comContentId=2.html', NULL, NULL, '中国浙江省天台县莪园工业区工南东路2号', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (179, '济南广茂源电子技术有限公司', '滤清器; 燃油泵及总成;点火线圈', 'Tommy Ji', '0086-13964095918', 'http://www.bestarinc.cn/', '2355242262', '+8613964095918', NULL, '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (180, '湖北东风捷翔汽车减震器股份有限公司', '汽车减震', 'Ms. Coco Cao', '0724-4225668', 'https://dfjc.en.alibaba.com/', NULL, NULL, '湖北荆门', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (181, '邢台文静汽车配件有限公司', '刹车盘、刹车片', 'Yao Dai ', NULL, 'https://jiafengfilter.en.alibaba.com/', NULL, NULL, '河北省邢台威县开发区爱国中路段', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (182, '河北迪羽汽车用品制造有限公司', '车衣', '白经理', '0086-17733733319', 'https://shop1484067384402.1688.com/', NULL, NULL, '中国 河北 任丘市 燕山道', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (183, '重庆汇心逸科技有限公司', '汽车座椅生产研发', 'Jenny', '+86 15123349935', 'http://www.jiuyivip.com/', NULL, '+86 15123349935', '重庆市巴南区花溪工业园立松路3号', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (184, '广州市星科机电设备有限公司', '环保空调', '王先生', '400-882-5266', 'http://www.gdxikoo.com/', NULL, NULL, '广州市番禺区桥南街蚬涌中心路二横路4号', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (185, '常州平江电器设备有限公司', '涡轮增压器', '未提供', '+86-519-82315522', 'http://www.jdturbo.com', NULL, NULL, NULL, '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (186, ' 凤城太平洋神龙增压器有限公司', '增压器', '未提供', '0086-415-8133333', 'http://www.slturbo.net/', NULL, NULL, '辽宁凤城市', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (187, '浙江茂源实业有限公司', '电线电缆，灭火器管', '未提供', '0576-8308 9999', 'http://www.maoyuan8.com/', NULL, 'chhc8822', '浙江省天台县三合工业园区', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (188, '凤城市华曾实业有限公司', '涡轮增压器', 'Kylie', '0086-0415-8264777', 'http://www.hzturbo.com/', NULL, NULL, '辽宁', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (189, '凤城太平洋神龙增压器有限公司', '涡轮增压器', '梁芳', '0415-8133333', NULL, NULL, NULL, '辽宁省凤城市二龙工业园D区北路', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (190, '\n佛山市南海蕾特汽车配件有限公司', '热交换器及其配件', '谭思敏', '0757-85628651', 'http://www.fsleite.com/', NULL, NULL, '广东省佛山市南海区里水镇河村西紫工业区', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (191, '溢涛钱朝减震科技股份有限公司', '空气减震器', 'Robin Zhang', '86-13924157073', 'http://www.ytairspring.com/', NULL, NULL, '广州市白云区太和镇工业区建业中路9号', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (192, '浙江奥斯特汽车配件有限公司', '汽车同步带，多楔带，切割带', '邬志刚 / 施丹萍', '0580-8660908', 'http://www.china-ast.com/', NULL, NULL, '浙江省舟山市定海区双桥镇小山干工业区15号', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (193, ' 永康市通产工具厂', '入式混凝土振动器和吹风机系列等电动工具', '周先生', '0579-87027001', 'http://www.tongchantools.com/html/about-84.html', NULL, NULL, '浙江省永康市城西新区玉桂路88-16号', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (194, '福建省荣顺机械制造有限公司', '万向节、十字轴等', 'Jake', '0595-22351828\n0595-26889997\n0595-26889998', 'http://www.qzrs.net/', '82235612', NULL, '福建省泉州市南安滨江工业区金河大道（荣顺大厦）', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (195, '浙江安露清洗机有限公司', '高压清洗机 全自动洗车机 工程车 洗轮机电动车', '未提供', '086-576-82898008 82898009', 'https://www.anlu.com/home/', NULL, NULL, '浙江省 台州市 路桥区 金清大道西899号', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (196, '兴华市中兴电器制造有限公司', '电动工具', '未提供', '0086-13564764492', 'http://www.zx-industrial.com/', '57609832', NULL, '江苏省兴华市经济开发区维四路9号', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (197, '武汉博基机床有限公司', '切断机、台锯、带锯', 'Mill zeng', '(86-27)83916029', 'http://www.bokymfr.com/', NULL, NULL, '武汉', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (198, '宁波辰威电机有限公司', '家用泵产品潜水泵、花园泵', '未提供', ' +86-574-2882  2571 \n +86-574-2882  2576   ', 'http://www.sunwayem.com/cn/about/?17.html', NULL, NULL, '宁波市联丰中路新庄新工业区9号', '2019-10-18 16:11:22', '2019-10-18 16:11:22');
INSERT INTO `supplier` VALUES (199, '上海亿力电器有限公司', '高压清洗机、亿力真空吸尘器、亿力空气净化器等', '蔡国通', '86-021 6489', 'http://www.yilichina.cn/product/', NULL, NULL, '上海市闵行区向阳路1318号', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (200, '丰城日波涡轮制造有限公司', '涡轮增压器', 'susan', '86-415-6869555', 'http://www.ripoturbo.com/', '1006930122', '15941592855', '中国辽宁省埃隆莫登工业园区B区第18号公路', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (201, '芜湖德业摩擦材料有限公司', '刹车片摩擦材料', '周晓虎', '+86-0553-8767693', 'http://www.dyebrake.com/', '27255174', NULL, '安徽省芜湖市芜湖县新芜经济开发区纬三路1058号', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (202, '浙江seineca汽车零部件有限公司', '滤清器、传感器', 'Prince Wang', '8657763839999', 'http://www.seineca.com/', NULL, NULL, '中国浙江平阳', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (203, '荆州荆福汽车零部件有限公司', '上下球头，控制臂、连杆总成等', '高小姐', '0716-8181225', 'http://www.jzjingfu.com/', '3327877901', NULL, '中国湖北省荆州市沙市区西湖路98号', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (204, '瑞飞交通器材', '三角警示板', '吕琳琳', '0086 18857024577', 'http://www.ruifeichina.com/', NULL, NULL, '浙江省龙游县湖镇工业新区腾昌路1号', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (205, '台州中迹汽车零部件有限公司', '汽车空压机', '张琼', '+86 576 8939 1891', 'http://www.auto-compressors.com/', '139002442', NULL, '台州中迹汽车零部件有限公司', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (206, '宁波洁米凡可清洁电器有限公司', '高压清洗机', '邵初霞', '0574-62562889 ', 'http://www.jmfkelec.com/alone/alone.php?id=25', NULL, NULL, '浙江省余姚市兰江街道工业园区赵家园路12号', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (207, '广州兴科机械设备有限公司', '蒸发式空气冷却器', 'Jason Ding', '15915858479', 'http://www.justaircooler.com/', '358811602', NULL, '中国广东省广州市番禺区桥南街道咸冲中路二横路4号', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (208, '浙江圣峰汽车部件有限公司', '滤清器、油水分离器', 'Vivan', '+86 13666559621', 'http://www.shengfengfilter.com/cn/h-col-103.html', '1502382707', NULL, '中国浙江省丽水市', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (209, '重庆万里江发链轮有限公司', '发链轮', 'Lily Xun', '+86-138 8305 0488', 'http://www.wljfsprockets.com/', NULL, NULL, '重庆市巴南区', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (210, 'Morsun', 'LED头灯，雾灯', NULL, NULL, 'http://www.morsunled.com/Contact/index.html', NULL, NULL, '广州白云区', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (211, '重庆聚创动力机械有限公司', '缸体盖总成', NULL, NULL, NULL, NULL, NULL, '重庆', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (212, '浙江铭泰汽车刹车部件有限公司', '刹车部件', '张梦雅', '15356517750', NULL, NULL, '+86 15888200718', '浙江省，瑞安市，亭台镇', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (213, '台州华龙离合器有限公司', '专业离合器工厂', '未知', '0576-87277006', 'http://www.hl-clutch.com/', NULL, NULL, '浙江省玉环县汽摩配工业园区', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (214, '重庆博纳汽车零部件有限公司', '冷却部件、引擎部件', '未知', '+86-13908311872', 'https://bonamotor.en.alibaba.com/contactinfo.html?spm=a2700.icbuShop.88.39.ec8c6e65qIuI7b', NULL, NULL, '渝北回兴宝桐路9,2-1-1', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (215, '重庆泽曼驰汽车零部件有限公司', '汽摩零配件', '董良', '023-8710 8815', NULL, NULL, NULL, '重庆市合川区清平镇中威大道666号19栋附2-8号', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (216, '4x4 auto parts', '悬挂、差速锁', '未知', '954-971-3510', 'https://www.4x4parts.com/', '1203733909', NULL, '广州市番禹区大石镇北联村新北大街28号一楼', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (217, '浙江声宝车业部件有限公司', '蜗牛喇叭等汽车喇叭', '戴一鹏', '0577-66003188', 'http://www.sbhorn.com/', NULL, NULL, '瑞安市塘下镇', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (218, '温岭市海利达工具有限公司', '汽车修理工具', '谢先生', '86-576-86746158', 'http://www.hailidatools.com/', NULL, NULL, '浙江省温岭市泽国三亚桥工业区', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (219, '\n\n江苏赛恩泰克有限公司', '越野配件', 'David', '+86 25 8456 7377', 'http://www.sainty.com.cn/lxfs.html', NULL, NULL, '江苏省南京市洪武路239号', '2019-10-18 16:11:23', '2019-10-18 16:11:23');
INSERT INTO `supplier` VALUES (220, '安徽省技术进出口股份有限公司', '车灯', '未提供', '+86-551-65101188', 'http://www.anhuitech.com.cn/', NULL, 'jianma@ahtech.com.cn', '安徽省合肥市蜀山区长江西路459号 ', '2019-10-18 16:11:24', '2019-10-18 16:11:24');
INSERT INTO `supplier` VALUES (221, '广州豹驰实业有限公司', '高强度紧固件', '乜靖', '+86 13922482290', 'www.baostep.com', NULL, NULL, '广州市天河区东圃汇彩路38号', '2019-10-18 16:11:24', '2019-10-18 16:11:24');
INSERT INTO `supplier` VALUES (222, '晋江宏辉汽车配件制造有限公司', '十字轴', '蔡依萍', NULL, 'http://www.fjhhqp.com/', NULL, NULL, '福建省晋江经济开发区(五里园区)裕源路8-9号', '2019-10-18 16:11:24', '2019-10-18 16:11:24');
INSERT INTO `supplier` VALUES (223, '福建第一锻造制品有限公司', '履带链节组件', '未提供', '+86595 22161626', 'http://www.tri-f.com.cn/first/Eindex.asp', NULL, NULL, '福建省福州市连江鳌江投资区', '2019-10-18 16:11:24', '2019-10-18 16:11:24');
INSERT INTO `supplier` VALUES (224, '金鼎实业股份有限公司', '雨刷', '杨证凯', '+886-2-2957-3478', 'http://www.sd-jinding.com/', NULL, NULL, '山东邹城市', '2019-10-18 16:11:24', '2019-10-18 16:11:24');
INSERT INTO `supplier` VALUES (225, '东港威远油泵油嘴有限公司', '油泵、油嘴', 'Ally Lee', '0415-7512331', 'http://www.dgweiyuan.com/lxwm.asp', NULL, NULL, '辽宁省东港市孤山镇中大街236号 ', '2019-10-18 16:11:24', '2019-10-18 16:11:24');
INSERT INTO `supplier` VALUES (226, '无锡市法尔纳汽车空调有限公司', '汽车空调', 'Eric Pu', '+86-510-88718026', 'http://www.finerltd.com/', '65477459', NULL, '江蘇省錫山經濟技術開發區', '2019-10-18 16:11:24', '2019-10-18 16:11:24');
INSERT INTO `supplier` VALUES (227, '安徽美瑞尔滤清器有限公司', '滤清器', '未提供', '0553-8118118', 'http://www.mrefilter.cn/about.aspx', NULL, NULL, '安徽省芜湖县新芜经济开发区', '2019-10-18 16:11:24', '2019-10-18 16:11:24');
INSERT INTO `supplier` VALUES (228, '福建明佳机械科技股份有限公司', '减震器', '黄婉婷', '+86-595-86769999', 'https://www.cnacr.com/', NULL, NULL, '福建省南安市滨江机械装备制造基地', '2019-10-18 16:11:24', '2019-10-18 16:11:24');
INSERT INTO `supplier` VALUES (229, '贵州XJD汽车零部件有限公司', '曲轴', '聂详华', '86-851-86829902', 'http://www.guizhouxjd.com/', NULL, NULL, '贵州贵阳北景路62号', '2019-10-18 16:11:24', '2019-10-18 16:11:24');
INSERT INTO `supplier` VALUES (230, '重庆璧山区安然贸易有限公司', '变速器总成及齿轮配件', '林元菊', '+86 15086954499', NULL, NULL, NULL, NULL, '2019-10-18 16:11:24', '2019-10-18 16:11:24');
INSERT INTO `supplier` VALUES (231, '瑞安市沃玛汽配有限公司', '倒车雷达', '戴', '0577-65372588', 'http://www.womacn.com/', NULL, 'woma3333', '浙江省瑞安市塘下塘西工业区', '2019-10-18 16:11:24', '2019-10-18 16:11:24');
INSERT INTO `supplier` VALUES (232, '重庆汤姆汽车配件有限公司', '点火线圈', '张先生', '+0086 13908321341', 'http://www.tomcoil.com/tom/cn/', '', '', '中国 · 重庆市江北区', '2019-10-18 16:11:24', '2019-10-18 16:11:24');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(22) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birth` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resume` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teacher_dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `teacher_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 1002, '老师', '123456', '女', '2018-04-04', '123456', '老师地址', '教授', '老师简历', 1);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `num` int(22) NOT NULL,
  `number` int(11) NULL DEFAULT NULL COMMENT '类型拥有的app数量',
  `create_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '类型' ROW_FORMAT = Dynamic;


DROP TABLE IF EXISTS `inquiry`;
CREATE TABLE `inquiry` (
  `customer` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cp` varchar(500) DEFAULT NULL COMMENT '产品',
  `xssj` datetime DEFAULT NULL COMMENT '销售时间',
  `cpje` varchar(500) DEFAULT NULL COMMENT '产品金额',
  `ddzje` varchar(500) DEFAULT NULL COMMENT '订单总金额',
  `yf` varchar(500) DEFAULT NULL COMMENT '运费',
  `gys` varchar(500) DEFAULT NULL COMMENT '供应商',
  `cgj` varchar(500) DEFAULT NULL COMMENT '采购价',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='询盘列表';



SET FOREIGN_KEY_CHECKS = 1;
