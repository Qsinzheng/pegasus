<?php
require 'profile.php';

/**
 * T_Sku model config
 */
//use App\Models\T_User;// Laravel NOT initialized right now
//use Illuminate\Support\Facades\DB;

return array(

    'title' => 'SKU列表',

    'single' => 'SKU',

    'model' => 'App\Models\T_Sku',

    //'form_width' => 200,
    /**
     * The display columns
     */
    'columns' => array(
        'id',
        #'img' => [
        #    'title' => '图片',
        #],
		'img_mini' => array(
            'title' => '图片',
            'output' => '<img src="/uploads/pegasus/thumbs/small/(:value)" height="80" />',
        ),
        'title' => [
            'title' => '商品标题',
            'relationship' => 'product',
            'select' => '(:table).title',
        ],
        'style_no' => [
            'title' => '商品货号',
            'relationship' => 'product',
            'select' => '(:table).style_no',
        ],
        'description' => [
            'title' => '描述',
        ],
        'sku_origin' => [
            'title' => '原SKU编码',
        ],
        //'log',
        //'created_at',
        //'updated_at',
    ),

    /**
     * The filter set
     */
    'filters' => array(
        'id',
        #'img' => [
        #    'title' => '图片',
        #],
        #'img_mini' => [
        #    'title' => '图片',
        #],
        'ptitle' => [
            'title' => '商品标题',
            'type' => 'relationship',
            'name_field' => 'title',
        ],
        'pstyleno' => [
            'title' => '商品货号',
            'type' => 'relationship',
            'name_field' => 'style_no',
        ],
        'description' => [
            'title' => '描述',
        ],
        'sku_origin' => [
            'title' => '原SKU编码',
        ],
        //'log',
        //'created_at',
        //'updated_at',
    ),

    /**
     * The editable fields
     */
    'edit_fields' => array(
        //'id',
        #'img' => [
        #    'title' => '图片',
        #],
        'img_mini' => array(
            'title' => '图片',
            'type' => 'image',
            'location' => public_path() . '/uploads/pegasus/originals/',
            'naming' => 'random',
            'length' => 20,
            'size_limit' => 2,
            'sizes' => array(
                array(80,   60, 'crop',         public_path() . '/uploads/pegasus/thumbs/small/', 100),
                array(480, 360, 'landscape',    public_path() . '/uploads/pegasus/thumbs/medium/', 100),
            )
        ),
        'product' => [
            'title' => '商品标题',
            'type' => 'relationship',
            'name_field' => 'title',
        ],
        'description' => [
            'title' => '描述',
        ],
        'sku_origin' => [
            'title' => '原SKU编码',
        ],
        //'log',
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
