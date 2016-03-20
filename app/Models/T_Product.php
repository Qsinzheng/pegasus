<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class T_Product extends Model
{
	protected $table = 't_product';
    //
	public static $rules = array//TODO:spread to others
	(
		'title' => 'required',
		'style_no' => 'required',
		'seller_id' => 'required',
	);

	public function seller()
	{
		return $this->belongsTo('App\Models\T_Seller');
	}
}
