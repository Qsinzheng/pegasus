<?php

/**
 * T_User_Type model config
 */

return array(

    'title' => '用户类型',

    'single' => '用户类型',

    'model' => 'App\Models\T_User_Type',

    //'form_width' => 200,
    /**
     * The display columns
     */
    'columns' => array(
        'id',
        'type' => [
            'title' => '用户类型',
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
        'type' => [
            'title' => '用户类型',
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
        'type' => [
            'title' => '用户类型',
        ],
        'comment' => [
            'title' => '备注',
        ],
        //'created_at',
        //'updated_at',
    ),
);
