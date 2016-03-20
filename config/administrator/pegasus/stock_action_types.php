<?php

/**
 * T_Stock_Action_Type model config
 */

return array(

    'title' => '库存操作类型',

    'single' => '库存操作类型',

    'model' => 'App\Models\T_Stock_Action_Type',

    //'form_width' => 200,
    /**
     * The display columns
     */
    'columns' => array(
        'id',
        'type' => [
            'title' => '库存操作类型',
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
            'title' => '库存操作类型',
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
            'title' => '库存操作类型',
        ],
        'comment' => [
            'title' => '备注',
        ],
        //'created_at',
        //'updated_at',
    ),
);
