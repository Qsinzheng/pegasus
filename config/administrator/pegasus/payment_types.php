<?php

/**
 * T_Payment_Type model config
 */

return array(

    'title' => '付款类型',

    'single' => '付款类型',

    'model' => 'App\Models\T_Payment_Type',

    //'form_width' => 200,
    /**
     * The display columns
     */
    'columns' => array(
        'id',
        'type' => [
            'title' => '付款类型',
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
            'title' => '付款类型',
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
            'title' => '付款类型',
        ],
        'comment' => [
            'title' => '备注',
        ],
        //'created_at',
        //'updated_at',
    ),
);
