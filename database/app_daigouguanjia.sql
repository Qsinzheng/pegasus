-- phpMyAdmin SQL Dump
-- version 3.3.8.1
-- http://www.phpmyadmin.net
--
-- 主机: w.rdc.sae.sina.com.cn:3307
-- 生成日期: 2016 年 03 月 07 日 16:47
-- 服务器版本: 5.6.23
-- PHP 版本: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `app_daigouguanjia`
--

-- --------------------------------------------------------


--
-- 表的结构 `t_accounting`
--

CREATE TABLE IF NOT EXISTS `t_accounting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  -- `user_type` tinyint(1) NOT NULL COMMENT '商家、海淘客',
  `user_id` int(11) NOT NULL COMMENT 't_user表ID，商家、海淘客',
  `express_id` int(11) DEFAULT NULL,
  `type` tinyint NOT NULL COMMENT '1:入款，-1:扣款',
  `amount` float NOT NULL COMMENT '商家/海淘客与我们之间发生的费用',
  `amount_express` float NOT NULL COMMENT '快递与我们之间发生的费用',
  `description` varchar(16) NOT NULL COMMENT '具体类型，如支付宝在线充值、运费、仓储费、丢件补偿等',
  `seq_num` varchar(64) NOT NULL COMMENT '交易号，如支付宝交易号，快递单号，仓储商品编号',
  `operator` varchar(16) NOT NULL,
  `date_add` datetime NOT NULL,
  `remark` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`type`) References `t_accounting_type` (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='账目' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_accounting_type`
--

CREATE TABLE IF NOT EXISTS `t_accounting_type` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `type` varchar(127) NOT NULL COMMENT '1:入款，-1:扣款',
  `comment` varchar(127) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='账目类型表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_address`
--

CREATE TABLE IF NOT EXISTS `t_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(32) NOT NULL COMMENT '备注的名称，如：常用地址、地址123等',
  -- `user_type` tinyint(1) NOT NULL COMMENT '1-顾客,2-买手,3-卖家,4-分销,5-员工,6-快递,7-护士长',
  `user_id` int(11) NOT NULL COMMENT 't_user表ID，1-顾客,2-买手,3-卖家,4-分销,5-员工,6-快递,7-护士长',
  `name` varchar(32) NOT NULL COMMENT '姓名',
  `phone` varchar(16) NOT NULL COMMENT '联系电话',
  `country` varchar(16) NOT NULL COMMENT '国家名称（中文）',
  `province` varchar(16) DEFAULT NULL COMMENT '省份',
  `city` varchar(16) DEFAULT NULL COMMENT '城市',
  `address` varchar(128) NOT NULL COMMENT '地址',
  `date_add` datetime NOT NULL,
  `log` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`nickname`) References `t_address_type` (id),
  UNIQUE KEY `uniq_addr` (`user_id`,`name`,`phone`,`country`,`province`,`city`,`address`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='地址表，包括商家的客户地址等' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_channel`
--

CREATE TABLE IF NOT EXISTS `t_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `express_id` int(11) NOT NULL,
  `channel_code` varchar(16) NOT NULL COMMENT '渠道的简要描述，如：渠道A、渠道B等',
  `product_category` varchar(255) NOT NULL COMMENT '适用的商品描述',
  `description` text NOT NULL COMMENT '渠道具体文字描述',
  `cost_1` float NOT NULL COMMENT '首磅运费',
  `cost_2` float NOT NULL COMMENT '续磅运费',
  `cost_our_1` float NOT NULL COMMENT '快递向我们收取的首磅费用',
  `cost_our_2` float NOT NULL COMMENT '快递向我们收取的续磅续费',
  `is_in_use` tinyint(1) NOT NULL DEFAULT '1' COMMENT '该渠道当前是否可用',
  `log` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='快递发货渠道及默认收费方案表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_cost_user`
--

CREATE TABLE IF NOT EXISTS `t_cost_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  -- `user_type` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `express_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `cost_1` float NOT NULL,
  `cost_2` float NOT NULL,
  `date_update` datetime NOT NULL,
  `log` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_forecast_detail`
--

CREATE TABLE IF NOT EXISTS `t_forecast_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  -- `user_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '商家、海淘客',
  `user_id` int(11) NOT NULL COMMENT 't_user表ID，商家、海淘客',
  `express_id` int(11) NOT NULL COMMENT '快递ID',
  `seq_num` varchar(16) NOT NULL COMMENT '一次发货/入库指令中所有商品对应的编号，由系统自动生成',
  `trade_id` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL COMMENT '对应product_color中的ID',
  `product_id` int(11) DEFAULT NULL COMMENT '对应sku中的product_id',
  `title` varchar(255) NOT NULL COMMENT '商品标题（含SKU信息）',
  `quantity` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `price` float NOT NULL COMMENT '商品采购价/清关价',
  `forecast_type` tinyint(1) NOT NULL COMMENT '预报类型：1:发出，2:入库',
  `channel_id` int(11) NOT NULL COMMENT '发货渠道对应的ID',
  `insurance_amount` float NOT NULL COMMENT '保费金额',
  `cost_insurance` float NOT NULL,
  `cost_insurance_out` float NOT NULL,
  `remark_user` text NOT NULL COMMENT '商家/海淘客备注',
  `date_update` datetime NOT NULL COMMENT '最近更新的日期',
  `status` tinyint NOT NULL COMMENT '预报状态：0:快递未确认，1:快递确认收到',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`status`) References `t_forecast_detail_status` (id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='预报详情表（商家/海淘客提交发货/入库指令表）' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_forecast_detail_status`
--

CREATE TABLE IF NOT EXISTS `t_forecast_detail_status` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `status` varchar(127) NOT NULL COMMENT '预报状态：0:快递未确认，1:快递确认收到',
  `comment` varchar(127) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='预报详情状态表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_forecast_to_detail`
--

CREATE TABLE IF NOT EXISTS `t_forecast_to_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_id` int(11) NOT NULL COMMENT 'forecast_user的ID',
  `seq_num` varchar(16) NOT NULL COMMENT 'forecast_detail表中的seq_num',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='forecast_user与ship_history的关联表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_forecast_user`
--

CREATE TABLE IF NOT EXISTS `t_forecast_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  -- `user_type` tinyint(1) NOT NULL COMMENT '商家，海淘客',
  `user_id` int(11) NOT NULL COMMENT 't_user表ID，商家，海淘客',
  `express_id` int(11) NOT NULL,
  `carrier` varchar(16) NOT NULL COMMENT '美国快递，如FedEx，送货上门',
  `tracking_no_us` varchar(32) NOT NULL COMMENT '美国境内快递单号，如FedEx单号',
  `weight` float NOT NULL,
  `date_submit` datetime NOT NULL,
  `date_confirm` datetime NOT NULL,
  `remark_user` text COMMENT '对商家/海淘、快递可见',
  `remark_express` text COMMENT '仅对快递可见',
  `status` tinyint NOT NULL COMMENT '10:商家已提交，50:快递已确认',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`status`) References `t_forecast_user_status` (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家/海淘客预报表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_forecast_user_status`
--

CREATE TABLE IF NOT EXISTS `t_forecast_user_status` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `status` varchar(127) NOT NULL COMMENT '10:商家已提交，50:快递已确认',
  `comment` varchar(127) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='商家/海淘客预报状态表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_id_card`
--

CREATE TABLE IF NOT EXISTS `t_id_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  -- `user_type` tinyint(1) NOT NULL COMMENT '用户类型：顾客，海淘客',
  `user_id` int(11) NOT NULL COMMENT 't_user表ID，用户类型：顾客，海淘客',
  `id_name` varchar(16) NOT NULL COMMENT '身份证姓名',
  `id_num` varchar(32) NOT NULL,
  `photo1` varchar(255) NOT NULL COMMENT '身份证正面',
  `photo2` varchar(255) NOT NULL COMMENT '身份证反面',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_id` (`user_id`,`id_name`,`id_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_log`
--

CREATE TABLE IF NOT EXISTS `t_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  -- `user_type` tinyint(1) NOT NULL COMMENT '1-顾客,2-买手,3-卖家,4-分销,5-员工,6-快递,7-护士长',
  `user_id` int(11) NOT NULL COMMENT 't_user表ID，1-顾客,2-买手,3-卖家,4-分销,5-员工,6-快递,7-护士长',
  `table_name` varchar(32) NOT NULL COMMENT 'table的名称',
  `table_id` int(11) NOT NULL COMMENT '该表的ID',
  `action` varchar(16) NOT NULL COMMENT '操作类型：登录、编辑库存、等',
  `description` varchar(255) NOT NULL COMMENT '操作的具体描述，如：添加库存、更改库存、添加订单等',
  `date_add` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_operation_to_tracking`
--

CREATE TABLE IF NOT EXISTS `t_operation_to_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_no` varchar(16) NOT NULL,
  `tracking_no` varchar(16) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='业务号和追踪单号的关联表，满足多对多的对应原则' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_product`
--

CREATE TABLE IF NOT EXISTS `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL COMMENT '卖家ID, 潜在问题：如果买手上传商品呢？',
  `origin` tinyint(1) NOT NULL COMMENT '1-淘宝；2-微店；3-京东',
  `id_origin` int(11) NOT NULL COMMENT '商品原来的ID',
  `brand` varchar(100) DEFAULT NULL,
  `style_no` varchar(100) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `img_mini` varchar(255) NOT NULL,
  `material` varchar(20) NOT NULL,
  `measure` varchar(20) NOT NULL,
  `log` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`seller_id`,`brand`,`style_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_ship_history`
--

CREATE TABLE IF NOT EXISTS `t_ship_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_id` int(11) NOT NULL COMMENT 'trade表的ID',
  -- `user_type` tinyint(1) NOT NULL COMMENT '用户类型',
  `user_id` int(11) NOT NULL COMMENT 't_user表ID，商家/海淘用户ID',
  `express_id` int(11) NOT NULL,
  `tracking_no` varchar(20) DEFAULT NULL COMMENT '国际快递追踪单号',
  `recipient` varchar(20) NOT NULL,
  `weight` float NOT NULL,
  `channel_id` int(11) NOT NULL COMMENT '渠道ID说明：A渠道、包关税渠道等',
  `cost_shipping` float NOT NULL COMMENT '我们向商家收取的运费',
  `cost_shipping_our` float NOT NULL COMMENT '快递向我们收取的费用',
  `buy_insurance` tinyint(1) NOT NULL DEFAULT '0' COMMENT '顾客是否购买保险',
  `insurance_amount` float NOT NULL DEFAULT '0' COMMENT '顾客购买保险的保额',
  `cost_insurance` float NOT NULL COMMENT '丢件险，我们向商家收取',
  `cost_insurance_our` float NOT NULL DEFAULT '0' COMMENT '快递向我们收取的保险费',
  `cost_total` float NOT NULL COMMENT '我们向顾客收取的运费总额',
  `cost_total_our` float NOT NULL COMMENT '快递向我们收取的运费总额',
  `remark_user` text NOT NULL COMMENT '用户的备注',
  `remark_express` text NOT NULL,
  `log` text NOT NULL,
  `status` tinyint NOT NULL COMMENT '发货状态：20-仓库已收到；30-仓库已打包；40-仓库已发出',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`status`) References `t_ship_history_status` (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='国际快递发货记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_ship_history_status`
--

CREATE TABLE IF NOT EXISTS `t_ship_history_status` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `status` varchar(127) NOT NULL COMMENT '发货状态：20-仓库已收到；30-仓库已打包；40-仓库已发出',
  `comment` varchar(127) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='国际快递发货记录状态表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_ship_history_detail`
--

CREATE TABLE IF NOT EXISTS `t_ship_history_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ship_history_id` int(11) NOT NULL COMMENT 'ship_history表的id',
  `sku_id` int(11) DEFAULT NULL COMMENT '直接发货时可为空',
  `product_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL COMMENT '商品描述',
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL COMMENT '清关价',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_sku`
--

CREATE TABLE IF NOT EXISTS `t_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `sku_origin` varchar(20) NOT NULL COMMENT '原有的商家编码',
  `img` varchar(255) NOT NULL COMMENT '图片',
  `img_mini` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`product_id`,`description`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_stock`
--

CREATE TABLE IF NOT EXISTS `t_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) DEFAULT NULL COMMENT '卖家ID',
  `sku_id` int(11) DEFAULT NULL COMMENT '对应product_color中的ID',
  `product_id` int(11) DEFAULT NULL COMMENT '对应sku中的product_id',
  `quantity` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `date_update` datetime NOT NULL COMMENT '最近更新的日期',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='库存单' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_stock_action`
--

CREATE TABLE IF NOT EXISTS `t_stock_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL,
  `stock_detail_id` int(11) NOT NULL COMMENT 'stock_detail表的ID',
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '1：入库；-1：出库',
  `action` varchar(10) NOT NULL COMMENT '入库；出库；销毁；手工添加', -- TODO: redundant?
  `date` datetime NOT NULL,
  -- `user_type` tinyint(4) NOT NULL COMMENT '操作用户类型',
  `user_id` int(11) NOT NULL COMMENT 't_user表ID，操作用户ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`type`) References `t_stock_action_type` (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_stock_action_type`
--

CREATE TABLE IF NOT EXISTS `t_stock_action_type` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `type` varchar(127) NOT NULL COMMENT '1：入库；-1：出库',
  `comment` varchar(127) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='库存操作类型表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_stock_detail`
--

CREATE TABLE IF NOT EXISTS `t_stock_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL,
  `express_id` int(11) NOT NULL COMMENT '快递ID',
  `shelf` varchar(16) NOT NULL COMMENT '货架编号',
  `bar_code` varchar(32) NOT NULL COMMENT '我们生成的条形码',
  `cost` float NOT NULL,
  `remark_seller` text NOT NULL COMMENT '商家备注',
  `remark_express` text NOT NULL COMMENT '快递的备注',
  `log` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='库存详情，每一记录对应一个库存' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_trade`
--

CREATE TABLE IF NOT EXISTS `t_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_no` varchar(16) NOT NULL COMMENT '业务号',
  `seller_id` int(11) DEFAULT NULL COMMENT '卖家ID, 对应t_seller的ID',
  `customer_id` int(11) NOT NULL COMMENT '顾客ID, 对应t_customer的ID',
  `origin` varchar(10) NOT NULL COMMENT '订单来源：淘宝、微店等',
  `transaction_no` varchar(40) DEFAULT NULL COMMENT '原有订单编号',
  `date_order` datetime NOT NULL COMMENT '顾客下单时间',
  `date_pay` datetime NOT NULL COMMENT '顾客付款时间',
  `payment_type` tinyint NOT NULL COMMENT '直接付款、分期付款、货到付款',
  `price` float NOT NULL COMMENT '售价(总价)，统一使用人民币为单位',
  `address_id` int(11) NOT NULL COMMENT '地址ID',
  `remark_seller` text NOT NULL COMMENT '卖家内部留言',
  `log` text NOT NULL,
  -- `date_upload` datetime NOT NULL COMMENT '加入数据库时间', use created_at
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`seller_id`) References `t_seller` (id),
  Foreign Key (`customer_id`) References `t_customer` (id),
  Foreign Key (`payment_type`) References `t_payment_type` (id),
  Foreign Key (`address_id`) References `t_address` (id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_payment_type`
--

CREATE TABLE IF NOT EXISTS `t_payment_type` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `type` varchar(127) NOT NULL COMMENT '直接付款、分期付款、货到付款',
  `comment` varchar(127) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='付款类型表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_trade_product`
--

CREATE TABLE IF NOT EXISTS `t_trade_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_id` int(11) NOT NULL,
  `sku_id` int(11) DEFAULT NULL COMMENT '我们系统的sku_id',
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1' COMMENT '需要的数量',
  `quantity_shipped` int(11) NOT NULL COMMENT '已经寄出的数量（方便卖家核实是否完全寄出）',
  `item_id` int(11) DEFAULT NULL COMMENT '原有(如在微店等系统)的商品编号',
  `sku_origin` varchar(32) DEFAULT NULL COMMENT ' 商家平台(如淘宝)sku_id',
  `title` varchar(255) NOT NULL,
  `img_mini` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `date_upload` datetime NOT NULL COMMENT '加入数据库时间',
  `date_receive` datetime NOT NULL,
  `date_complete` datetime NOT NULL,
  `price` float NOT NULL COMMENT '售价，统一使用人民币为单位',
  `pay_type` varchar(10) NOT NULL COMMENT '直接付款、分期付款、货到付款',
  `date_status_update` datetime NOT NULL COMMENT '最后更新状态的时间',
  `remark_seller` text NOT NULL COMMENT '卖家内部留言',
  `log` text NOT NULL,
  `status` tinyint NOT NULL COMMENT '10 - available 30 - buyed 40 - instock 50 - shipped 60 - ship_intl 65-转国内快递 70 - received 80 - complete 0 - invalid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`status`) References `t_trade_product_status` (id),
  KEY `radio_status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_trade_product_status`
--

CREATE TABLE IF NOT EXISTS `t_trade_product_status` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `status` varchar(127) NOT NULL COMMENT '10 - available 30 - buyed 40 - instock 50 - shipped 60 - ship_intl 65-转国内快递 70 - received 80 - complete 0 - invalid',
  `comment` varchar(127) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='交易商品状态表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_trade_tracking`
--

CREATE TABLE IF NOT EXISTS `t_trade_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_id` int(11) DEFAULT NULL,
  `date_add` datetime NOT NULL COMMENT '记录添加时间',
  `status_detail` varchar(255) NOT NULL,
  -- `user_type` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint NOT NULL COMMENT '状态代号：10-加入库存；20-。。。',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`status`) References `t_trade_tracking_status` (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单的状态全程追踪描述' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_trade_tracking_status`
--

CREATE TABLE IF NOT EXISTS `t_trade_tracking_status` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `status` varchar(127) NOT NULL COMMENT '状态代号：10-加入库存；20-。。。',
  `comment` varchar(127) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='订单的状态全程追踪描述状态表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_login`
--

CREATE TABLE IF NOT EXISTS `t_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `remember_token` varchar(100) NOT NULL,
  `country_code` varchar(6) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `date_register` datetime NOT NULL,
  `log` text NOT NULL,
  `status` tinyint NOT NULL COMMENT '账户状态：0-未验证 1-已验证 9-黑名单/机器人',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`status`) References `t_login_status` (id),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`),
  UNIQUE KEY `uniq_phone` (`country_code`,`phone`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='登录信息' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_password_resets`
--

CREATE TABLE IF NOT EXISTS `t_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `t_login_status`
--

CREATE TABLE IF NOT EXISTS `t_login_status` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `status` varchar(127) NOT NULL COMMENT '账户状态：0-未验证 1-已验证 9-黑名单/机器人',
  `comment` varchar(127) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='登录信息状态表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_user`
--

CREATE TABLE IF NOT EXISTS `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` tinyint NOT NULL DEFAULT '1' COMMENT '用户类型: 1-顾客,2-买手,3-卖家,4-分销,5-员工,6-快递,7-护士长', -- TODO:FK
  `login_id` int(11) NOT NULL COMMENT '用户ID: t_login表ID',
  `date_add` datetime NOT NULL,
  `log` text NOT NULL,
  `status` tinyint NOT NULL COMMENT '用户状态：0-停用 1-正常 9-黑名单/机器人',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`user_type`) References `t_user_type` (id),
  Foreign Key (`login_id`) References `t_login` (id),
  Foreign Key (`status`) References `t_user_status` (id),
  UNIQUE KEY `unique_index` (`user_type`,`login_id`),
  KEY `user_index` (`login_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户信息'  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_user_type`
--

CREATE TABLE IF NOT EXISTS `t_user_type` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `type` varchar(127) NOT NULL COMMENT '用户类型: 1-顾客,2-买手,3-卖家,4-分销,5-员工,6-快递,7-护士长',
  `comment` varchar(127) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户类型表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_user_status`
--

CREATE TABLE IF NOT EXISTS `t_user_status` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `status` varchar(127) NOT NULL COMMENT '用户状态：0-停用 1-正常 9-黑名单/机器人',
  `comment` varchar(127) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户状态表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_customer`
--

CREATE TABLE IF NOT EXISTS `t_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 't_user表ID',
  `phone` varchar(15) NOT NULL,
  `name` varchar(15) NOT NULL,
  `date_register` datetime NOT NULL,
  `log` text NOT NULL,
  `status` tinyint NOT NULL COMMENT '顾客状态：0手机未确认；1已确认；2已暂停；9已永久注销',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`user_id`) References `t_user` (id),
  Foreign Key (`status`) References `t_customer_status` (id),
  UNIQUE KEY `user_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_customer_status`
--

CREATE TABLE IF NOT EXISTS `t_customer_status` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `status` varchar(127) NOT NULL COMMENT '顾客状态：0手机未确认；1已确认；2已暂停；9已永久注销',
  `comment` varchar(127) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='顾客状态表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_express`
--

CREATE TABLE IF NOT EXISTS `t_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `express_type` tinyint NOT NULL COMMENT '快递类型：1-华人快递(一般是快递收到即需发出) 2-快递仓库(收到后不一定需要发出) 0-买手直邮顾客', -- TODO:FK
  `user_id` int(11) NOT NULL COMMENT 't_user表ID',
  `name` varchar(16) NOT NULL COMMENT '快递名称',
  `name_public` varchar(16) NOT NULL COMMENT '对外(商家)展示，如芝加哥仓库',
  `short_code` varchar(20) NOT NULL COMMENT '对应的海淘通的short code',
  `country` varchar(10) NOT NULL COMMENT '中文，如：美国、香港等',
  `city` varchar(20) NOT NULL COMMENT '所在城市，中文',
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `contact_email` varchar(30) NOT NULL COMMENT '我们提供给快递的邮箱，用于商家与快递的沟通',
  `date_add` datetime NOT NULL,
  `log` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`express_type`) References `t_express_type` (id),
  Foreign Key (`user_id`) References `t_user` (id),
  UNIQUE KEY `UNIQUE_INDEX` (`country`,`city`,`name`),
  UNIQUE KEY `user_index` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_express_type`
--

CREATE TABLE IF NOT EXISTS `t_express_type` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `type` varchar(127) NOT NULL COMMENT '快递类型：1-华人快递(一般是快递收到即需发出) 2-快递仓库(收到后不一定需要发出) 0-买手直邮顾客',
  `comment` varchar(127) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='快递类型表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_employee_of_express`
--

CREATE TABLE IF NOT EXISTS `t_employee_of_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 't_user表ID',
  `express_id` int(11) NOT NULL COMMENT '所属快递ID, 对应t_express的ID',
  `rank` varchar(1) NOT NULL DEFAULT '3' COMMENT 'TODO用户类别：1-管理员；2-普通管理员；3-普通员工',
  `name` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `QQ` varchar(15) NOT NULL,
  `date_add` datetime NOT NULL,
  `log` text NOT NULL,
  `status` tinyint NOT NULL COMMENT '员工状态：0手机未确认；1已确认；2已暂停；9已永久注销',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`user_id`) References `t_user` (id),
  Foreign Key (`express_id`) References `t_express` (id),
  Foreign Key (`status`) References `t_employee_of_express_status` (id),
  UNIQUE KEY `user_index` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_employee_of_express_status`
--

CREATE TABLE IF NOT EXISTS `t_employee_of_express_status` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `status` varchar(127) NOT NULL COMMENT '员工状态：0手机未确认；1已确认；2已暂停；9已永久注销',
  `comment` varchar(127) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='员工状态表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_seller`
--

CREATE TABLE IF NOT EXISTS `t_seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '卖家ID',
  `date_add` datetime NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 't_user表ID',
  `name` varchar(15) NOT NULL,
  `focus` varchar(20) NOT NULL COMMENT '主营类型及品牌：箱包、服饰等',
  `brand` varchar(20) NOT NULL COMMENT '主打品牌，填一个',
  `description` varchar(255) NOT NULL COMMENT '商家简介',
  `email` varchar(40) NOT NULL,
  `QQ` varchar(15) NOT NULL,
  `country` varchar(10) NOT NULL COMMENT '销往地区，中文：中国、美国、英国等',
  `log` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  Foreign Key (`user_id`) References `t_user` (id),
  UNIQUE KEY `user_index` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_decoder` -- deprecated -- separated into several talbes
--

CREATE TABLE IF NOT EXISTS `t_decoder` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `table` varchar(20) NOT NULL COMMENT '表名, 如t_trade_tracking',
  `column` varchar(10) NOT NULL COMMENT '表中字段名, 如：status',
  `text` varchar(255) NOT NULL COMMENT '字段字面问吧，如：处理中',
  `comment` varchar(255) NULL COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_meaning` (`table`,`column`,`text`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='本表记录一些表中的某些数值字段取值对应的文字含义' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

