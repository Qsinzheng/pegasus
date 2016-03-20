<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class T_Log extends Model
{
	protected $table = 't_log';
    //
    public function lstatus()
    {
        return $this->belongsTo('App\Models\T_Login_Status', 'status');
    }
}
