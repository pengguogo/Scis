



ALTER TABLE `project` ADD   `genre` varchar(255) NULL DEFAULT NULL COMMENT '个人/团体';

ALTER TABLE `project` ADD   `groups` varchar(255) NULL DEFAULT NULL COMMENT '团体参赛人编号';

CREATE TABLE `mg_product_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_name` varchar(500) DEFAULT NULL COMMENT '产品名称',
  `product_name_en` varchar(500) DEFAULT NULL COMMENT '产品名称英文',
  `SKU` varchar(500) DEFAULT NULL COMMENT 'SKU',
  `OE` varchar(500) DEFAULT NULL COMMENT 'OE',
  `zl` varchar(500) DEFAULT NULL COMMENT '重量',
  `cc` varchar(500) DEFAULT NULL COMMENT '尺寸',
  `cpp` varchar(500) DEFAULT NULL COMMENT '车品牌',
  `spxh` varchar(500) DEFAULT NULL COMMENT '适配型号',
  `gysa` varchar(500) DEFAULT NULL COMMENT '供应商A',
  `cgja` varchar(500) DEFAULT NULL COMMENT '采购价A',
  `gysb` varchar(500) DEFAULT NULL COMMENT '供应商B',
  `cgjb` varchar(500) DEFAULT NULL COMMENT '采购价B',
  `bz` varchar(500) DEFAULT NULL COMMENT '备注',
  `xp` varchar(500) DEFAULT NULL COMMENT '询盘情况（关联）',
  `dd` varchar(500) DEFAULT NULL COMMENT '订单情况（关联）',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='产品列表';


INSERT INTO `scis`.`mg_product_info`(`id`, `product_name`, `product_name_en`, `SKU`, `OE`, `zl`, `cc`, `cpp`, `spxh`, `gysa`, `cgja`, `gysb`, `cgjb`, `bz`, `xp`, `dd`, `create_time`, `update_time`) VALUES (1, '燃油泵总成', 'Fuel Pump Assembly', '110', '911', '36kg', '56cm', '奔驰', '公用', NULL, NULL, NULL, NULL, '1', NULL, NULL, '2019-08-30 11:57:20', '2019-09-01 14:48:03');
INSERT INTO `scis`.`mg_product_info`(`id`, `product_name`, `product_name_en`, `SKU`, `OE`, `zl`, `cc`, `cpp`, `spxh`, `gysa`, `cgja`, `gysb`, `cgjb`, `bz`, `xp`, `dd`, `create_time`, `update_time`) VALUES (2, '测试产品2', 'cecp2', '12', '12', '12', '12', '12', 'g', NULL, NULL, NULL, NULL, '12', NULL, NULL, '2019-08-30 17:36:28', '2019-08-30 18:04:12');

