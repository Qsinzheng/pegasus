<?php

/**
 * T_User model config
 */

return array(

    'title' => '用户列表',

    'single' => '用户',

    'model' => 'App\Models\T_User',

    //'form_width' => 200,
    /**
     * The display columns
     */
    'columns' => array(
        'id',
        'type' => [
            'title' => '用户类型',
            'relationship' => 'utype',
            'select' => "(:table).type"
        ],
        'username' => [
            'title' => '登录名称',
            'relationship' => 'ulogin',
            'select' => "(:table).username"
        ],
        'email' => [
            'title' => '注册邮箱',
            'relationship' => 'ulogin',
            'select' => "(:table).email"
        ],
        'country_code' => [
            'title' => '国家码',
            'relationship' => 'ulogin',
            'select' => "(:table).country_code"
        ],
        'phone' => [
            'title' => '注册手机',
            'relationship' => 'ulogin',
            'select' => "(:table).phone"
        ],
        //'date_register', //TODO:get rid of it
        'created_at' => [
            'title' => '注册时间',
            'relationship' => 'ulogin',
            'select' => "(:table).created_at"
        ],
        //'log',
        'lstatus' => [
            'title' => '账户状态',
            'relationship' => 'ulogin.lstatus',
            'select' => "(:table).status"
        ],
        'status' => [
            'title' => '用户状态',
            'relationship' => 'ustatus',
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
        'utype' => [
            'title' => '用户类型',
            'type' => 'relationship',
            'name_field' => 'type',
        ],
        'ulogin' => [
            'title' => '登录名称',
            'type' => 'relationship',
            'name_field' => 'username',
        ],
        //'date_add',
        //'log',
        'ustatus' => [
            'title' => '用户状态',
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
        'utype' => [
            'title' => '用户类型',
			'type' => 'relationship',
			'name_field' => 'type',
			'value' => 2, // default: 商家
        ],
        'ulogin' => [
            'title' => '登录名称',
            'type' => 'relationship',
            'name_field' => 'username',
        ],
        //'date_add',
        //'log',
        'ustatus' => [
            'title' => '用户状态',
			'type' => 'relationship',
			'name_field' => 'status',
			'value' => 2, // default:正常
        ],
        //'created_at',
        //'updated_at',
    ),
);
