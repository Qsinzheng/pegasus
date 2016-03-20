CREATE TABLE IF NOT EXISTS 't_operation_to_tracking' (
  'id',
  'operation_no',
  'tracking_no',
  'created_at',
  'updated_at',
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='业务号和追踪单号的关联表，满足多对多的对应原则' AUTO_INCREMENT=1 ;

