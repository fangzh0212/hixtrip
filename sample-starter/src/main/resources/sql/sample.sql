#todo 你的建表语句,包含索引

# 主从库创建以下order表，配置读写分离，分表策略依据user_id对order表数量模余
DROP TABLE IF EXISTS `order_0`;
CREATE TABLE `order_0` (
                         `id` varchar(255) NOT NULL COMMENT '主键',
                         `user_id` bigint NOT NULL COMMENT '购买人ID',
                         `sku_id` bigint NOT NULL COMMENT 'SkuID',
                         `amount` int NOT NULL COMMENT '购买数量',
                         `money` decimal(10,2) NOT NULL COMMENT '购买金额',
                         `pay_time` datetime DEFAULT NULL COMMENT '购买时间',
                         `pay_status` char(1) DEFAULT NULL COMMENT '支付状态（1支付成功 2支付失败 3重复支付）',
                         `del_flag` bigint NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
                         `create_by` varchar(255) NOT NULL COMMENT '创建人',
                         `create_time` datetime NOT NULL COMMENT '创建时间',
                         `update_by` varchar(255) DEFAULT NULL COMMENT '修改人',
                         `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                         PRIMARY KEY (`id`),
                         KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';

DROP TABLE IF EXISTS `order_1`;
CREATE TABLE `order_1` (
                           `id` varchar(255) NOT NULL COMMENT '主键',
                           `user_id` bigint NOT NULL COMMENT '购买人ID',
                           `sku_id` bigint NOT NULL COMMENT 'SkuID',
                           `amount` int NOT NULL COMMENT '购买数量',
                           `money` decimal(10,2) NOT NULL COMMENT '购买金额',
                           `pay_time` datetime DEFAULT NULL COMMENT '购买时间',
                           `pay_status` char(1) DEFAULT NULL COMMENT '支付状态（1支付成功 2支付失败 3重复支付）',
                           `del_flag` bigint NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
                           `create_by` varchar(255) NOT NULL COMMENT '创建人',
                           `create_time` datetime NOT NULL COMMENT '创建时间',
                           `update_by` varchar(255) DEFAULT NULL COMMENT '修改人',
                           `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                           PRIMARY KEY (`id`),
                           KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';

DROP TABLE IF EXISTS `order_2`;
CREATE TABLE `order_2` (
                           `id` varchar(255) NOT NULL COMMENT '主键',
                           `user_id` bigint NOT NULL COMMENT '购买人ID',
                           `sku_id` bigint NOT NULL COMMENT 'SkuID',
                           `amount` int NOT NULL COMMENT '购买数量',
                           `money` decimal(10,2) NOT NULL COMMENT '购买金额',
                           `pay_time` datetime DEFAULT NULL COMMENT '购买时间',
                           `pay_status` char(1) DEFAULT NULL COMMENT '支付状态（1支付成功 2支付失败 3重复支付）',
                           `del_flag` bigint NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
                           `create_by` varchar(255) NOT NULL COMMENT '创建人',
                           `create_time` datetime NOT NULL COMMENT '创建时间',
                           `update_by` varchar(255) DEFAULT NULL COMMENT '修改人',
                           `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                           PRIMARY KEY (`id`),
                           KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';

DROP TABLE IF EXISTS `order_3`;
CREATE TABLE `order_3` (
                           `id` varchar(255) NOT NULL COMMENT '主键',
                           `user_id` bigint NOT NULL COMMENT '购买人ID',
                           `sku_id` bigint NOT NULL COMMENT 'SkuID',
                           `amount` int NOT NULL COMMENT '购买数量',
                           `money` decimal(10,2) NOT NULL COMMENT '购买金额',
                           `pay_time` datetime DEFAULT NULL COMMENT '购买时间',
                           `pay_status` char(1) DEFAULT NULL COMMENT '支付状态（1支付成功 2支付失败 3重复支付）',
                           `del_flag` bigint NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
                           `create_by` varchar(255) NOT NULL COMMENT '创建人',
                           `create_time` datetime NOT NULL COMMENT '创建时间',
                           `update_by` varchar(255) DEFAULT NULL COMMENT '修改人',
                           `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                           PRIMARY KEY (`id`),
                           KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';

DROP TABLE IF EXISTS `order_4`;
CREATE TABLE `order_4` (
                           `id` varchar(255) NOT NULL COMMENT '主键',
                           `user_id` bigint NOT NULL COMMENT '购买人ID',
                           `sku_id` bigint NOT NULL COMMENT 'SkuID',
                           `amount` int NOT NULL COMMENT '购买数量',
                           `money` decimal(10,2) NOT NULL COMMENT '购买金额',
                           `pay_time` datetime DEFAULT NULL COMMENT '购买时间',
                           `pay_status` char(1) DEFAULT NULL COMMENT '支付状态（1支付成功 2支付失败 3重复支付）',
                           `del_flag` bigint NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
                           `create_by` varchar(255) NOT NULL COMMENT '创建人',
                           `create_time` datetime NOT NULL COMMENT '创建时间',
                           `update_by` varchar(255) DEFAULT NULL COMMENT '修改人',
                           `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                           PRIMARY KEY (`id`),
                           KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';