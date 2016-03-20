<?php

/**
 * T_Login model config
 */

return array(

    'title' => '登录管理',

    'single' => '登录账户',

    'model' => 'App\Models\T_Login',

    //'form_width' => 200,
    /**
     * The display columns
     */
    'columns' => array(
        'id',
        'username' => [
            'title' => '登录名称',
        ],
        'email' => [
            'title' => '注册邮箱',
        ],
        'country_code' => [
            'title' => '国家码',
        ],
        'phone' => [
            'title' => '注册手机',
        ],
        //'date_register', //TODO:get rid of it
        'created_at' => [
            'title' => '注册时间',
        ],
        //'log',
        'password' => [
            'title' => '密码',
        ],
        'status' => [
            'title' => '账户状态',
            'relationship' => 'lstatus',
            'select' => "(:table).status"
        ],
        //'created_at',
        //'updated_at',
    ),

    /**
     * The filter set
     */
    'filters' => array(
        'id',
        'username' => [
            'title' => '登录名称',
        ],
        'email' => [
            'title' => '注册邮箱',
        ],
        'country_code' => [
            'title' => '国家码',
        ],
        'phone' => [
            'title' => '注册手机',
        ],
        //'password',
        //'date_register',
        //'created_at' => [
        //    'title' => '注册时间',
        //],
        //'log',
        'lstatus' => [
            'title' => '账户状态',
            'type' => 'relationship',
            'name_field' => 'status',
        ],
        //'created_at',
        //'updated_at',
    ),

    /**
     * The editable fields
     */
    'edit_fields' => array(
        //'id',
        'username' => [
            'title' => '登录名称',
        ],
        'email' => [
            'title' => '注册邮箱',
        ],
        'country_code' => [
            'title' => '国家码',
        ],
        'phone' => [
            'title' => '注册手机',
        ],
        'password' => [
            'title' => '密码',
            'type' => 'password',
        ],
        //'date_register',
        //'created_at' => [
        //    'title' => '注册时间',
        //],
        //'log',
        'lstatus' => [
            'title' => '账户状态',
			'type' => 'relationship',
			'name_field' => 'status',
            'value' => 1,
        ],
    ),
);
