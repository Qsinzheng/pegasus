<?php
require 'profile.php';

/**
 * T_Stock model config
 */
//use App\Models\T_User;// Laravel NOT initialized right now
//use Illuminate\Support\Facades\DB;

return array(

    'title' => '库存列表',

    'single' => '库存',

    'model' => 'App\Models\T_Stock',

    //'form_width' => 200,
    /**
     * The display columns
     */
    'columns' => array(
        'id',
        //'sku_id',
		'img_mini' => array(
            'title' => 'SKU图片',
            'relationship' => 'sku',
            'select' => '(:table).img_mini',
            'output' => '<img src="/uploads/pegasus/thumbs/small/(:value)" height="80" />',
        ),
        'skudesc' => [
            'title' => 'SKU描述',
            'relationship' => 'sku',
            'select' => '(:table).description'
        ],
        //'product_id', sku_id所属
        'quantity' => [
            'title' => '数量',
        ],
        //'log',
        //'date_update',
        //'created_at',
        'updated_at' => [
            'title' => '更新时间',
        ],
        'seller' => [
            'title' => '商家',
            'relationship' => 'seller',
            'select' => '(:table).name'
        ],
    ),

    /**
     * The filter set
     */
    'filters' => array(
        'id',
        'seller' => [
            'title' => '商家',
            'type' => 'relationship',
            'name_field' => 'name',
        ],
        //'sku_id',
        'skuDesc' => [
            'title' => 'SKU描述',
            'type' => 'relationship',
            'name_field' => 'description',
        ],
        //'product_id', sku_id所属
        'quantity' => [
            'title' => '数量',
        ],
        //'log',
        //'date_update',
        //'created_at',
        //'updated_at',
    ),

    /**
     * The editable fields
     */
    'edit_fields' => array(
        //'id',
        'seller' => [
            'title' => '商家',
            'type' => 'relationship',
            'name_field' => 'name',
        ],
        //'sku_id',
        'skuDesc' => [
            'title' => 'SKU描述',
            'type' => 'relationship',
            'name_field' => 'description',
        ],
        //'product_id', sku_id所属
        'quantity' => [
            'title' => '数量',
        ],
        //'log',
        //'date_update',
        //'created_at',
        //'updated_at',
    ),
    #'actions' => array(
    #    //Ordering an item up
    #    'order_up' => array(
    #        'title' => 'Order Up',
    #        'messages' => array(
    #            'active' => 'Reordering...',
    #            'success' => 'Reordered',
    #            'error' => 'There was an error while reordering',
    #        ),
    #        'permission' => function($model)
    #        {
    #            //return $model->category_id !== 2;
    #            return true;
    #        },
    #        //the model is passed to the closure
    #        'action' => function($model)
    #        {
    #            //get all the items of this model and reorder them
    #            # $model->orderUp();
    #        }
    #    ),
    #),

    'link' => function($model)
    {
        return URL::route('welcome');
    },
);
