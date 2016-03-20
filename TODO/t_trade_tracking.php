CREATE TABLE IF NOT EXISTS 't_trade_tracking' (
  'id',
  'trade_id',
  'date_add',
  'status',
  'status_detail',
  'user_id',
  'user_type',
  'created_at',
  'updated_at',
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单的状态全程追踪描述' AUTO_INCREMENT=1 ;

