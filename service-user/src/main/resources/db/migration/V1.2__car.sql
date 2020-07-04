CREATE TABLE IF NOT EXISTS `car`
(
    `id`          int(11)        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id`     int(11)        NOT NULL COMMENT '所属用户ID',
    `brand`       varchar(20)    NOT NULL COMMENT '车辆品牌',
    `price`       decimal(10, 2) NOT NULL COMMENT '车辆价格',
    `buy_time`    datetime       NOT NULL COMMENT '购买时间',
    `creator`     varchar(20)             DEFAULT NULL COMMENT '创建人',
    `modifier`    varchar(20)             DEFAULT NULL COMMENT '更新人',
    `create_time` datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `modify_time` datetime       NOT NUll DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`),
    KEY `index_user_id` (`user_id`) USING BTREE COMMENT '用户ID'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci
    COMMENT '用户车辆信息';
