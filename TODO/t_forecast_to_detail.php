CREATE TABLE IF NOT EXISTS 't_forecast_to_detail' (
  'id',
  'forecast_id',
  'seq_num',
  'created_at',
  'updated_at',
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='forecast_user与ship_history的关联表' AUTO_INCREMENT=1 ;

