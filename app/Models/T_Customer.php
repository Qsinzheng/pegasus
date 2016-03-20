<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Log;

class T_Customer extends Model
{
	protected $table = 't_customer';
    //
    public function user()
    {
        return $this->belongsTo('App\Models\T_User', 'user_id');
    }

#    public function hasUser()
#    {
#        return $this->hasOne('App\Models\T_User', 'user_id');
#    }

    public function ustatus()
    {
        return $this->belongsTo('App\Models\T_Customer_Status', 'status');
    }

    public function addresses()
    {
        return $this->user()->getParent()->addresses();
    }

//    private function userLogin()
//    {
//        return $this->belongsTo('App\Models\T_User', 'user_id')
//            ->getParent()
//            ->belongsTo('App\Models\T_Login', 'login_id');
//    }
}
