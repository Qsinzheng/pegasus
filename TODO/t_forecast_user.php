CREATE TABLE IF NOT EXISTS 't_forecast_user' (
  'id',
  'user_type',
  'user_id',
  'express_id',
  'carrier',
  'tracking_no_us',
  'weight',
  'date_submit',
  'date_confirm',
  'remark_user',
  'remark_express',
  'status',
  'created_at',
  'updated_at',
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家/海淘客预报表' AUTO_INCREMENT=1 ;

