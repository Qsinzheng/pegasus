<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use DB;
use Log;

class T_Address extends Model
{
	protected $table = 't_address';
    //
    public function user()
    {
        return $this->belongsTo('App\Models\T_User', 'user_id');
    }
}
