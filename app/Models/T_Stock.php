<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class T_Stock extends Model
{
	protected $table = 't_stock';
    //
	public static $rules = array
	(
		'sku_id' => 'required',
	);

	public function skuDesc()
	{
		return $this->sku();
	}

	public function seller()
	{
		return $this->belongsTo('App\Models\T_Seller');
	}

	public function sku()
	{
		return $this->belongsTo('App\Models\T_Sku');
	}
}
