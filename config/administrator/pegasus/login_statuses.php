<?php

/**
 * T_Login_Status model config
 */

return array(

    'title' => '登录状态',

    'single' => '登录状态',

    'model' => 'App\Models\T_Login_Status',

    //'form_width' => 200,
    /**
     * The display columns
     */
    'columns' => array(
        'id',
        'status' => [
            'title' => '登录状态',
        ],
        'comment' => [
            'title' => '备注',
        ],
        //'created_at',
        //'updated_at',
    ),

    /**
     * The filter set
     */
    'filters' => array(
        'id',
        'status' => [
            'title' => '登录状态',
        ],
        'comment' => [
            'title' => '备注',
        ],
        //'created_at',
        //'updated_at',
    ),

    /**
     * The editable fields
     */
    'edit_fields' => array(
        //'id',
        'status' => [
            'title' => '登录状态',
        ],
        'comment' => [
            'title' => '备注',
        ],
        //'created_at',
        //'updated_at',
    ),
);
