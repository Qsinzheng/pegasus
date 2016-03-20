<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class T_Trade extends Model
{
	protected $table = 't_trade';
    //
	public static $rules = array//TODO:spread to others
	(
		'seller_id' => 'required',
		'customer_id' => 'required',
		'address_id' => 'required',
	);

	public function seller()
	{
		return $this->belongsTo('App\Models\T_Seller');
	}

	public function customer()
	{
		return $this->belongsTo('App\Models\T_Customer');
	}

#	public function userOfCustomer()
#	{
#		return $this->belongsTo('App\Models\T_User', 'user_id_of_customer_id');
#	}

	public function paymentType()
	{
		return $this->belongsTo('App\Models\T_Payment_Type', 'payment_type');
	}

	public function address()
	{
		return $this->belongsTo('App\Models\T_Address', 'address_id');
	}
}
