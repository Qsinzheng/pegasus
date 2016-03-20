<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class T_Sku extends Model
{
	protected $table = 't_sku';
    //
	public static $rules = array//TODO:spread to others
	(
		'product_id' => 'required',
	);

	public function ptitle()
	{
		return $this->product();
	}

	public function pstyleno()
	{
		return $this->product();
	}

	public function product()
	{
		return $this->belongsTo('App\Models\T_Product', 'product_id');
	}
}
