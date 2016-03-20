<?php
require 'profile.php';

/**
 * T_Trade model config
 */
//use App\Models\T_User;// Laravel NOT initialized right now
//use Illuminate\Support\Facades\DB;

return array(

    'title' => '订单列表',

    'single' => '订单',

    'model' => 'App\Models\T_Trade',

    //'form_width' => 200,
    /**
     * The display columns
     */
    'columns' => array(
        'id',
        'operation_no' => [
            'title' => '业务号',
        ],
        'seller' => [
            'title' => '商家',
            'relationship' => 'seller',
            'select' => '(:table).name'
        ],
        'customer' => [
            'title' => '顾客名称',
            'relationship' => 'customer',
            'select' => '(:table).name'
        ],
        'username' => [
            'title' => '顾客账户',
            'relationship' => 'customer.user.ulogin',
            'select' => "(:table).username"
        ],
        'origin' => [
            'title' => '订单来源',//TODO: FK
        ],
        'transaction_no' => [
            'title' => '原订单号',
        ],
        'date_order' => [
            'title' => '下单时间',
        ],
        'date_pay' => [
            'title' => '付款时间',
        ],
        'paymentTypexx' => [
            'title' => '付款类型',
            'relationship' => 'paymentType',
            'select' => '(:table).type',
        ],
        'price' => [
            'title' => '售价',
        ],
        'address' => [
            'title' => '地址',
            'relationship' => 'address',
            'select' => "CONCAT((:table).nickname, ':', (:table).address)",
        ],
        'remark_seller' => [
            'title' => '卖家内部留言',
        ],
        //'log',
        //'date_upload'// use created_at
        //'created_at',
        //'updated_at',
    ),

    /**
     * The filter set
     */
    'filters' => array(
        'id',
        'operation_no' => [
            'title' => '业务号',
        ],
        'seller' => [
            'title' => '商家',
            'type' => 'relationship',
            'name_field' => 'name'
        ],
        'customer' => [
            'title' => '顾客',
            'type' => 'relationship',
            'name_field' => 'name'
        ],
        #'userOfCustomer' => [// address联动桥接字段 -- 该字段本身都没能和customer字段联动!
        #    'title' => '顾客账户',
        #    'type' => 'relationship',
        #    'name_field' => 'id',
        #    'constraints' => [
        #        'customer' => 'hasUser',
        #    ],
        #],
        'origin' => [
            'title' => '订单来源',//TODO: FK
        ],
        'transaction_no' => [
            'title' => '原订单号',
        ],
        'date_order' => [
            'title' => '下单时间',
        ],
        'date_pay' => [
            'title' => '付款时间',
        ],
        'paymentType' => [
            'title' => '付款类型',
            'type' => 'relationship',
            'name_field' => 'type'
        ],
        'price' => [
            'title' => '售价',
        ],
        'address' => [
            'title' => '地址',
            'type' => 'relationship',
            'name_field' => 'address',
            'options_filter' => function($query)
            { // only return customers' addr
                $query->join('t_user', 't_address.user_id', '=', 't_user.id')
                    ->join('t_user_type', 't_user.user_type', '=', 't_user_type.id')
                    ->where('t_user_type.type', '=', '顾客')
                    ->select('t_address.*');
            },
            #'constraints' => [// 无法与customer联动
            #    'customer' => 'addresses',
            #],
        ],
        'remark_seller' => [
            'title' => '卖家内部留言',
        ],
        //'log',
        //'date_upload'// use created_at
        //'created_at',
        //'updated_at',
    ),

    /**
     * The editable fields
     */
    'edit_fields' => array(
        //'id',
        'operation_no' => [
            'title' => '业务号',
        ],
        'seller' => [
            'title' => '商家',
            'type' => 'relationship',
            'name_field' => 'name'
        ],
        'customer' => [
            'title' => '顾客',
            'type' => 'relationship',
            'name_field' => 'name'
        ],
        #'userOfCustomer' => [// address联动桥接字段 -- 该字段本身都没能和customer字段联动!
        #    'title' => '顾客账户',
        #    'type' => 'relationship',
        #    'name_field' => 'id',
        #    'constraints' => [
        #        'customer' => 'hasUser',
        #    ],
        #],
        'origin' => [
            'title' => '订单来源',//TODO: FK
        ],
        'transaction_no' => [
            'title' => '原订单号',
        ],
        'date_order' => [
            'title' => '下单时间',
        ],
        'date_pay' => [
            'title' => '付款时间',
        ],
        'paymentType' => [
            'title' => '付款类型',
            'type' => 'relationship',
            'name_field' => 'type'
        ],
        'price' => [
            'title' => '售价',
        ],
        'address' => [
            'title' => '地址',
            'type' => 'relationship',
            'name_field' => 'address',
            'options_filter' => function($query) { // only return customers' addr
                $query->join('t_user', 't_address.user_id', '=', 't_user.id')
                      ->join('t_user_type', 't_user.user_type', '=', 't_user_type.id')
                      ->where('t_user_type.type', '=', '顾客')
                      ->select('t_address.*');
            },
            #'constraints' => [// 无法与customer联动
            #    'customer' => 'addresses',
            #],
        ],
        'remark_seller' => [
            'title' => '卖家内部留言',
        ],
        //'date_upload'// use created_at
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
