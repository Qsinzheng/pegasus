<?php

/**
 * T_User_Status model config
 */

return array(

    'title' => '用户状态',

    'single' => '用户状态',

    'model' => 'App\Models\T_User_Status',

    //'form_width' => 200,
    /**
     * The display columns
     */
    'columns' => array(
        'id',
        'status' => [
            'title' => '用户状态',
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
            'title' => '用户状态',
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
            'title' => '用户状态',
        ],
        'comment' => [
            'title' => '备注',
        ],
        //'created_at',
        //'updated_at',
    ),
);
