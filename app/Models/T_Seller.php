<?php

namespace app\models;

use illuminate\database\eloquent\model;

use log;

class T_Seller extends Model
{
	protected $table = 't_seller';
    //
    public function userLoginName()
    {
        return $this->user();
    }

    public function userLoginAccount()
    {
        return $this->user();
    }

    public function user()
    {
        return $this->belongsTo('App\Models\T_User', 'user_id');
    }

//    private function userLogin()
//    {
//        return $this->belongsTo('App\Models\T_User', 'user_id')
//            ->getParent()
//            ->belongsTo('App\Models\T_Login', 'login_id');
//    }
}
