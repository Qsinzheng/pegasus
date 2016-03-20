<?php
require 'profile.php';

/**
 * T_Stock_Detail model config
 */
//use App\Models\T_User;// Laravel NOT initialized right now
//use Illuminate\Support\Facades\DB;

return array(

    'title' => '库存详情TODO',

    'single' => '库存',

    'model' => 'App\Models\T_Stock_Detail',

    //'form_width' => 200,
    /**
     * The display columns
     */
    'columns' => array(
        'id',
        'stock_id',
        'express_id',
        'shelf',
        'bar_code',
        'cost',
        'remark_seller',
        'remark_express',
        //'log',
        //'date_update',
        //'created_at',
    ),

    /**
     * The filter set
     */
    'filters' => array(
        'id',
        'stock_id',
        'express_id',
        'shelf',
        'bar_code',
        'cost',
        'remark_seller',
        'remark_express',
        //'log',
        //'date_update',
        //'created_at',
        //'updated_at',
    ),

    /**
     * The editable fields
     */
    'edit_fields' => array(
        'id',
        'stock_id',
        'express_id',
        'shelf',
        'bar_code',
        'cost',
        'remark_seller',
        'remark_express',
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
