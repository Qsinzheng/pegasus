-- phpMyAdmin SQL Dump
-- version 3.3.8.1
-- http://www.phpmyadmin.net
--
-- 主机: w.rdc.sae.sina.com.cn:3307
-- 生成日期: 2016 年 03 月 08 日 02:07
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
-- 表的结构 `aaa_accounting`
--

CREATE TABLE IF NOT EXISTS `aaa_accounting` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(1) NOT NULL COMMENT '商家、海淘客',
  `user_id` int(11) NOT NULL,
  `express_id` int(11) DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1:入款，-1:扣款',
  `amount` float NOT NULL COMMENT '商家/海淘客与我们之间发生的费用',
  `amount_express` float NOT NULL COMMENT '快递与我们之间发生的费用',
  `description` varchar(16) NOT NULL COMMENT '具体类型，如支付宝在线充值、运费、仓储费、丢件补偿等',
  `seq_num` varchar(64) NOT NULL COMMENT '交易号，如支付宝交易号，快递单号，仓储商品编号',
  `operator` varchar(16) NOT NULL,
  `date_add` datetime NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='账目' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_address`
--

CREATE TABLE IF NOT EXISTS `aaa_address` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(10) NOT NULL COMMENT '备注的名称，如：常用地址、地址123等',
  `user_type` tinyint(1) NOT NULL COMMENT '1-顾客,2-买手,3-卖家,4-分销,5-员工,6-快递,7-护士长',
  `user_id` int(11) NOT NULL COMMENT '对应的db_XXX中的index',
  `name` varchar(32) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `country` varchar(16) NOT NULL COMMENT '国家名称（中文）',
  `province` varchar(16) DEFAULT NULL COMMENT '省份',
  `city` varchar(16) DEFAULT NULL COMMENT '城市',
  `address` varchar(128) NOT NULL COMMENT '地址',
  `date_add` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `user_type` (`user_type`,`user_id`,`name`,`phone`,`country`,`province`,`city`,`address`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='地址表，包括商家的客户地址等' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_channel`
--

CREATE TABLE IF NOT EXISTS `aaa_channel` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='快递发货渠道及默认收费方案表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_cost_user`
--

CREATE TABLE IF NOT EXISTS `aaa_cost_user` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `express_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `cost_1` float NOT NULL,
  `cost_2` float NOT NULL,
  `date_update` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_employee_express`
--

CREATE TABLE IF NOT EXISTS `aaa_employee_express` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `db_id` int(11) NOT NULL COMMENT 'db表ID',
  `express_id` int(11) NOT NULL COMMENT '对应express表中相应快递的index',
  `rank` varchar(1) NOT NULL DEFAULT '3' COMMENT 'TODO用户类别：1-管理员；2-普通管理员；3-普通员工',
  `status` varchar(1) NOT NULL COMMENT '用户类型：0手机未确认；1已确认；2已暂停；9已永久注销',
  `name` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `QQ` varchar(15) NOT NULL,
  `date_add` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `user_index` (`db_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_forecast_detail`
--

CREATE TABLE IF NOT EXISTS `aaa_forecast_detail` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '商家、海淘客',
  `user_id` int(11) NOT NULL COMMENT 'user_type对应的user_id',
  `express_id` int(11) NOT NULL COMMENT '快递ID',
  `seq_num` varchar(16) NOT NULL COMMENT '一次发货/入库指令中所有商品对应的编号，由系统自动生成',
  `trade_id` int(11) DEFAULT NULL,
  `sku_id` int(11) DEFAULT NULL COMMENT '对应product_color中的index',
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
  `status` tinyint(1) NOT NULL COMMENT '状态：0:快递未确认，1:快递确认收到',
  PRIMARY KEY (`index`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='预报详情表（商家/海淘客提交发货/入库指令表）' AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_forecast_to_detail`
--

CREATE TABLE IF NOT EXISTS `aaa_forecast_to_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_id` int(11) NOT NULL COMMENT 'forecast_user的ID',
  `seq_num` varchar(16) NOT NULL COMMENT 'forecast_detail表中的seq_num',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='forecast_user与ship_history的关联表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_forecast_user`
--

CREATE TABLE IF NOT EXISTS `aaa_forecast_user` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(1) NOT NULL COMMENT '商家，海淘客',
  `user_id` int(11) NOT NULL COMMENT '商家/海淘客ID',
  `express_id` int(11) NOT NULL,
  `carrier` varchar(16) NOT NULL COMMENT '美国快递，如FedEx，送货上门',
  `tracking_no_us` varchar(32) NOT NULL COMMENT '美国境内快递单号，如FedEx单号',
  `weight` float NOT NULL,
  `date_submit` datetime NOT NULL,
  `date_confirm` datetime NOT NULL,
  `remark_user` text COMMENT '对商家/海淘、快递可见',
  `remark_express` text COMMENT '仅对快递可见',
  `status` tinyint(2) NOT NULL COMMENT '10:商家已提交，50:快递已确认',
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家/海淘客预报表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_id_card`
--

CREATE TABLE IF NOT EXISTS `aaa_id_card` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(1) NOT NULL COMMENT '用户类型：顾客，海淘客',
  `user_id` int(11) NOT NULL,
  `id_name` varchar(16) NOT NULL COMMENT '身份证姓名',
  `id_num` varchar(32) NOT NULL,
  `photo1` varchar(255) NOT NULL COMMENT '身份证正面',
  `photo2` varchar(255) NOT NULL COMMENT '身份证反面',
  PRIMARY KEY (`index`),
  UNIQUE KEY `user_type` (`user_type`,`user_id`,`id_name`,`id_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_log`
--

CREATE TABLE IF NOT EXISTS `aaa_log` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(1) NOT NULL COMMENT '1-顾客,2-买手,3-卖家,4-分销,5-员工,6-快递,7-护士长',
  `user_id` int(11) NOT NULL,
  `table_name` varchar(32) NOT NULL COMMENT 'table的名称',
  `table_id` int(11) NOT NULL COMMENT '该表的ID',
  `action` varchar(16) NOT NULL COMMENT '操作类型：登录、编辑库存、等',
  `description` varchar(255) NOT NULL COMMENT '操作的具体描述，如：添加库存、更改库存、添加订单等',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_operation_to_tracking`
--

CREATE TABLE IF NOT EXISTS `aaa_operation_to_tracking` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `operation_no` varchar(16) NOT NULL,
  `tracking_no` varchar(16) NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='业务号和追踪单号的关联表，满足多对多的对应原则' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_product`
--

CREATE TABLE IF NOT EXISTS `aaa_product` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL COMMENT '即：seller_id。潜在问题：如果买手上传商品呢？',
  `origin` tinyint(1) NOT NULL COMMENT '1-淘宝；2-微店；3-京东',
  `id_origin` int(11) NOT NULL COMMENT '商品原来的index',
  `brand` varchar(100) DEFAULT NULL,
  `style_no` varchar(100) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `img_mini` varchar(255) NOT NULL,
  `material` varchar(20) NOT NULL,
  `measure` varchar(20) NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `user_id` (`seller_id`,`brand`,`style_no`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10001 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_ship_history`
--

CREATE TABLE IF NOT EXISTS `aaa_ship_history` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `trade_id` int(11) NOT NULL COMMENT 'trade表的ID',
  `user_type` tinyint(1) NOT NULL COMMENT '用户类型',
  `user_id` int(11) NOT NULL COMMENT '商家/海淘用户ID',
  `express_id` int(11) NOT NULL,
  `tracking_no` varchar(20) DEFAULT NULL COMMENT '国际快递追踪单号',
  `recipient` varchar(20) NOT NULL,
  `status` tinyint(2) NOT NULL COMMENT '发货状态：20-仓库已收到；30-仓库已打包；40-仓库已发出',
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
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='国际快递发货记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_ship_history_detail`
--

CREATE TABLE IF NOT EXISTS `aaa_ship_history_detail` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `ship_history_id` int(11) NOT NULL COMMENT 'ship_history表的id',
  `sku_id` int(11) DEFAULT NULL COMMENT '直接发货时可为空',
  `product_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL COMMENT '商品描述',
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL COMMENT '清关价',
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_sku`
--

CREATE TABLE IF NOT EXISTS `aaa_sku` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `sku_origin` varchar(20) NOT NULL COMMENT '原有的商家编码',
  `img` varchar(255) NOT NULL COMMENT '图片',
  `img_mini` varchar(255) NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `unique_index` (`product_id`,`description`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=231799 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_stock`
--

CREATE TABLE IF NOT EXISTS `aaa_stock` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) DEFAULT NULL COMMENT '卖家序号',
  `sku_id` int(11) DEFAULT NULL COMMENT '对应product_color中的index',
  `product_id` int(11) DEFAULT NULL COMMENT '对应sku中的product_id',
  `quantity` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `date_update` datetime NOT NULL COMMENT '最近更新的日期',
  PRIMARY KEY (`index`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='库存单' AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_stock_action`
--

CREATE TABLE IF NOT EXISTS `aaa_stock_action` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL,
  `stock_detail_id` int(11) NOT NULL COMMENT 'stock_detail表的ID',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1：入库；-1：出库',
  `action` varchar(10) NOT NULL COMMENT '入库；出库；销毁；手工添加',
  `date` datetime NOT NULL,
  `user_type` tinyint(4) NOT NULL COMMENT '操作用户类型',
  `user_id` int(11) NOT NULL COMMENT '操作用户ID',
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_stock_detail`
--

CREATE TABLE IF NOT EXISTS `aaa_stock_detail` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL,
  `express_id` int(11) NOT NULL COMMENT '快递ID',
  `shelf` varchar(16) NOT NULL COMMENT '货架编号',
  `bar_code` varchar(32) NOT NULL COMMENT '我们生成的条形码',
  `cost` float NOT NULL,
  `remark_seller` text NOT NULL COMMENT '商家备注',
  `remark_express` text NOT NULL COMMENT '快递的备注',
  `log` text NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='库存详情，每一记录对应一个库存' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_trade`
--

CREATE TABLE IF NOT EXISTS `aaa_trade` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `operation_no` varchar(16) NOT NULL COMMENT '业务号',
  `seller_id` int(11) DEFAULT NULL COMMENT '卖家的编号',
  `customer_id` int(11) NOT NULL COMMENT '对应db_customer中的用户index',
  `origin` varchar(10) NOT NULL COMMENT '订单来源：淘宝、微店等',
  `transaction_no` varchar(40) DEFAULT NULL COMMENT '原有订单编号',
  `date_order` datetime NOT NULL COMMENT '顾客下单时间',
  `date_pay` datetime NOT NULL COMMENT '顾客付款时间',
  `date_upload` datetime NOT NULL COMMENT '加入数据库时间',
  `price` float NOT NULL COMMENT '售价(总价)，统一使用人民币为单位',
  `pay_type` varchar(10) NOT NULL COMMENT '直接付款、分期付款、货到付款',
  `address_id` int(11) NOT NULL COMMENT '对应的用户地址的index',
  `remark_seller` text NOT NULL COMMENT '卖家内部留言',
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  KEY `seller_id` (`seller_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3137 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_trade_product`
--

CREATE TABLE IF NOT EXISTS `aaa_trade_product` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` tinyint(2) NOT NULL COMMENT '10 - available 30 - buyed 40 - instock 50 - shipped 60 - ship_intl 65-转国内快递 70 - received 80 - complete 0 - invalid',
  `date_status_update` datetime NOT NULL COMMENT '最后更新状态的时间',
  `remark_seller` text NOT NULL COMMENT '卖家内部留言',
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  KEY `radio_status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3137 ;

-- --------------------------------------------------------

--
-- 表的结构 `aaa_trade_tracking`
--

CREATE TABLE IF NOT EXISTS `aaa_trade_tracking` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `trade_id` int(11) DEFAULT NULL,
  `date_add` datetime NOT NULL COMMENT '记录添加时间',
  `status` tinyint(2) NOT NULL COMMENT '状态代号：10-加入库存；20-。。。',
  `status_detail` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` tinyint(4) NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单的状态全程追踪描述' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `accounting_buyer`
--

CREATE TABLE IF NOT EXISTS `accounting_buyer` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `account_detail` text NOT NULL COMMENT '买手收款账号详情',
  `type` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '1-买手收；-1-买手支出',
  `amount` float NOT NULL COMMENT '商家实际录入的金额',
  `currency` varchar(10) NOT NULL,
  `status` varchar(1) NOT NULL COMMENT '0-pending；1-confirmed；9-denied',
  `date_add` datetime NOT NULL,
  `date_update` datetime NOT NULL,
  `msg_buyer` text NOT NULL,
  `is_processing` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否正在处理中(一般针对付款)',
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  KEY `buyer_id` (`buyer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- 表的结构 `batch_task`
--

CREATE TABLE IF NOT EXISTS `batch_task` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `token_index` int(11) NOT NULL,
  `open_id` int(11) NOT NULL COMMENT '对应平台的商家ID',
  `seller_id` int(11) NOT NULL COMMENT '本系统的商家index',
  `type` varchar(10) NOT NULL COMMENT '类型：订单、商品',
  `platform` varchar(5) NOT NULL COMMENT '平台：wd, sn, jd, tb',
  `date_end` datetime NOT NULL COMMENT '处理结束的时间',
  `date_request` datetime NOT NULL COMMENT '请求时间',
  `status` varchar(10) NOT NULL COMMENT '状态：0新建; 1完成；-1出错；2处理中',
  `done_current` tinyint(1) NOT NULL DEFAULT '1',
  `page` int(11) NOT NULL COMMENT '当前处理到第几页',
  `error` text NOT NULL COMMENT '错误信息',
  `error_count` int(11) NOT NULL COMMENT '错误次数，若连续错误3次，则将任务终结',
  `log` text NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `date_last` datetime NOT NULL COMMENT '上次使用时间',
  `count` int(11) NOT NULL COMMENT '调用次数',
  `date_add` datetime NOT NULL,
  `add_by` varchar(15) NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `seller_id` (`seller_id`,`brand`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- 表的结构 `db`
--

CREATE TABLE IF NOT EXISTS `db` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(1) NOT NULL COMMENT '1-验证 0-未验证 9-黑名单/机器人',
  `username` varchar(15) NOT NULL,
  `email` varchar(64) NOT NULL,
  `country_code` varchar(6) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `password` varchar(32) NOT NULL,
  `date_register` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `unique_index` (`country_code`,`phone`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

-- --------------------------------------------------------

--
-- 表的结构 `db_attribute`
--

CREATE TABLE IF NOT EXISTS `db_attribute` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(1) NOT NULL COMMENT '1-正常 0-已暂停 9-黑名单/机器人',
  `db_id` int(11) NOT NULL COMMENT 'db表ID',
  `type` varchar(1) NOT NULL DEFAULT '1' COMMENT '1-顾客,2-买手,3-卖家,4-分销,5-员工,6-快递,7-护士长',
  `date_add` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `unique_index` (`db_id`,`type`),
  KEY `user_index` (`db_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

-- --------------------------------------------------------

--
-- 表的结构 `db_customer`
--

CREATE TABLE IF NOT EXISTS `db_customer` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `db_id` int(11) NOT NULL COMMENT 'db表ID',
  `status` varchar(1) NOT NULL COMMENT '用户类型：0手机未确认；1已确认；2已暂停；9已永久注销',
  `phone` varchar(15) NOT NULL,
  `name` varchar(15) NOT NULL,
  `date_register` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `db_employee`
--

CREATE TABLE IF NOT EXISTS `db_employee` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `user_index` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL COMMENT '对应seller列表中相应卖家的index',
  `rank` varchar(1) NOT NULL DEFAULT '3' COMMENT '用户类别：1-管理员；2-普通管理员；3-普通员工',
  `status` varchar(1) NOT NULL COMMENT '用户类型：0手机未确认；1已确认；2已暂停；9已永久注销',
  `name` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `QQ` varchar(15) NOT NULL,
  `date_add` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `user_index` (`user_index`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- 表的结构 `db_express`
--

CREATE TABLE IF NOT EXISTS `db_express` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) NOT NULL COMMENT '类型：1-华人快递(一般是快递收到即需发出) 2-快递仓库(收到后不一定需要发出) 0-买手直邮顾客',
  `db_id` int(11) NOT NULL COMMENT '对应的db中的index',
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
  PRIMARY KEY (`index`),
  UNIQUE KEY `UNIQUE_INDEX` (`country`,`city`,`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 表的结构 `db_seller`
--

CREATE TABLE IF NOT EXISTS `db_seller` (
  `index` int(11) NOT NULL AUTO_INCREMENT COMMENT '也即是seller_id',
  `date_add` datetime NOT NULL,
  `db_id` int(11) NOT NULL COMMENT 'db表ID',
  `name` varchar(15) NOT NULL,
  `focus` varchar(20) NOT NULL COMMENT '主营类型及品牌：箱包、服饰等',
  `brand` varchar(20) NOT NULL COMMENT '主打品牌，填一个',
  `description` varchar(255) NOT NULL COMMENT '商家简介',
  `email` varchar(40) NOT NULL,
  `QQ` varchar(15) NOT NULL,
  `country` varchar(10) NOT NULL COMMENT '销往地区，中文：中国、美国、英国等',
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `user_index` (`db_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `decoder`
--

CREATE TABLE IF NOT EXISTS `decoder` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `db` varchar(20) NOT NULL COMMENT '表名',
  `type` varchar(10) NOT NULL COMMENT '如：status,等',
  `value_original` tinyint(4) NOT NULL,
  `value_text` varchar(255) NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `db` (`db`,`type`,`value_original`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='本表记录一些表中的某些值对应的文字含义' AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `express`
--

CREATE TABLE IF NOT EXISTS `express` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `carrier` varchar(15) NOT NULL,
  `tracking_url` varchar(255) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `carrier` (`carrier`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `ip_scam`
--

CREATE TABLE IF NOT EXISTS `ip_scam` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(40) NOT NULL,
  `count` int(11) NOT NULL,
  `date_add` date NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `log_error`
--

CREATE TABLE IF NOT EXISTS `log_error` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `page` varchar(50) NOT NULL,
  `type` varchar(40) NOT NULL COMMENT '错误类型:备份失败等',
  `user` varchar(20) NOT NULL,
  `errmsg` text NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=120 ;

-- --------------------------------------------------------

--
-- 表的结构 `notice`
--

CREATE TABLE IF NOT EXISTS `notice` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(30) NOT NULL COMMENT '主题',
  `content` text NOT NULL,
  `link` varchar(255) NOT NULL COMMENT '相关的链接',
  `date_add` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- 表的结构 `notice_attribute`
--

CREATE TABLE IF NOT EXISTS `notice_attribute` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `notice_id` int(11) NOT NULL,
  `user_type` varchar(1) NOT NULL COMMENT '用户类型',
  `user_id` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_read` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- 表的结构 `origin`
--

CREATE TABLE IF NOT EXISTS `origin` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `class` varchar(1) NOT NULL DEFAULT '0' COMMENT '支持导入类型：0-手工；1-表格导入；2-自动',
  `origin` varchar(15) NOT NULL,
  `date_use` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `receipt`
--

CREATE TABLE IF NOT EXISTS `receipt` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_id` int(11) NOT NULL COMMENT '对应的买手index',
  `link` varchar(255) NOT NULL COMMENT 'receipt的链接',
  `status` varchar(1) NOT NULL COMMENT '0-待确认；1-客服已确认；2-管理员已确认；9-已拒绝',
  `date_upload` datetime NOT NULL,
  `date_confirm` datetime NOT NULL,
  `remark` text NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `search`
--

CREATE TABLE IF NOT EXISTS `search` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `search_by` varchar(1) NOT NULL DEFAULT '1' COMMENT '搜索者身份：1-顾客,2-买手,3-卖家,4-分销,5-员工,6-快递,7-护士长',
  `user_id` int(11) NOT NULL,
  `keyword` varchar(20) NOT NULL,
  `date_search` datetime NOT NULL,
  `count` int(11) NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `unique_index` (`keyword`,`search_by`,`user_id`),
  KEY `seller_id` (`search_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

-- --------------------------------------------------------

--
-- 表的结构 `search_index`
--

CREATE TABLE IF NOT EXISTS `search_index` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `search_by` varchar(1) NOT NULL DEFAULT '1' COMMENT '搜索者身份：1-顾客,2-买手,3-卖家,4-分销,5-员工,6-快递,7-护士长',
  `user_id` int(11) NOT NULL,
  `keyword` varchar(50) NOT NULL,
  `date_search` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  KEY `seller_id` (`search_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=125 ;

-- --------------------------------------------------------

--
-- 表的结构 `ship_history`
--

CREATE TABLE IF NOT EXISTS `ship_history` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `db_type` tinyint(4) NOT NULL COMMENT '1-trade; 2-stock',
  `db_index` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `transient_id` int(11) DEFAULT NULL,
  `label_id` int(11) DEFAULT NULL,
  `date_ship` datetime NOT NULL,
  `date_deliver` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL COMMENT '卖家在我们系统中的编号',
  `type` varchar(10) NOT NULL,
  `open_id` int(11) NOT NULL COMMENT '卖家在对应平台的编号',
  `shop_name` varchar(15) NOT NULL,
  `request_count` int(11) NOT NULL COMMENT '当天请求次数',
  `access_token` varchar(60) NOT NULL,
  `date_expire` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`),
  KEY `seller_id` (`open_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `verify`
--

CREATE TABLE IF NOT EXISTS `verify` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `user` varchar(20) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `date_expire` datetime NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;
