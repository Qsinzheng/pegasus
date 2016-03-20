CREATE TABLE IF NOT EXISTS 't_stock_detail' (
  'id',
  'stock_id',
  'express_id',
  'shelf',
  'bar_code',
  'cost',
  'remark_seller',
  'remark_express',
  'log',
  'created_at',
  'updated_at',
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='库存详情，每一记录对应一个库存' AUTO_INCREMENT=1 ;

