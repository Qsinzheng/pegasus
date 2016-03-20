<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Log;

class T_Express extends Model
{
	protected $table = 't_express';
    //
    public function type()
    {
        return $this->belongsTo('App\Models\T_Express_Type', 'express_type');
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
