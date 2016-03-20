<?php
require 'profile.php';

/**
 * T_Product model config
 */
//use App\Models\T_User;// Laravel NOT initialized right now
//use Illuminate\Support\Facades\DB;

return array(

    'title' => '商品列表',

    'single' => '商品',

    'model' => 'App\Models\T_Product',

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
            'title' => '标题',
        ],
        'style_no' => [
            'title' => '货号',
        ],
        'brand' => [
            'title' => '品牌',
        ],
        'material' => [
            'title' => '材质',
        ],
        'measure' => [
            'title' => '计量单位',
        ],
        'origin' => [//TODO:column type => FK
            'title' => '商品来源',
        ],
        'id_origin' => [
            'title' => '来源id',
        ],
        'seller' => [
            'title' => '商家',
            'relationship' => 'seller',
            'select' => '(:table).name'
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
        'seller' => [
            'title' => '商家',
            'type' => 'relationship',
            'name_field' => 'name',
        ],
        'title' => [
            'title' => '标题',
        ],
        'style_no' => [
            'title' => '货号',
        ],
        'brand' => [
            'title' => '品牌',
        ],
        'material' => [
            'title' => '材质',
        ],
        'measure' => [
            'title' => '计量单位',
        ],
        'origin' => [//TODO:column type => FK
            'title' => '商品来源',
        ],
        'id_origin' => [
            'title' => '来源id',
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
        'seller' => [
            'title' => '商家',
            'type' => 'relationship',
            'name_field' => 'name',
        ],
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
        'title' => [
            'title' => '标题',
        ],
        'style_no' => [
            'title' => '货号',
        ],
        'brand' => [
            'title' => '品牌',
        ],
        'material' => [
            'title' => '材质',
        ],
        'measure' => [
            'title' => '计量单位',
        ],
        'origin' => [//TODO:column type => FK
            'title' => '商品来源',
        ],
        'id_origin' => [
            'title' => '来源id',
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
