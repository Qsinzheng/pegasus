<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use App\Models\T_Login;
use DB;

use Log;

class T_User extends Model
{
	protected $table = 't_user';
    //
    public function getLoginIdAttribute($value)
    {
        $loginID = $value;
        $login   = T_Login::find($loginID);

        Log::debug('getLoginIdAttribute:', [
            'value' => $value,
            'login' => $login,
        ]);

        #return $value . '-5mid-' . $login->username;  // Error: Trying to get property of non-object
        return $login['username'];
    }

    public function uloginname()
    {
        return ulogin()->getParent()->username;
    }

    public function utype()
    {
        return $this->belongsTo('App\Models\T_User_Type', 'user_type');
    }

    public function ulogin()
    {
        return $this->belongsTo('App\Models\T_Login', 'login_id');
    }

    public function ustatus()
    {
        return $this->belongsTo('App\Models\T_User_Status', 'status');
    }

    public function addresses()
    {
        return $this->hasMany('App\Models\T_Address', 'user_id');
    }
}
