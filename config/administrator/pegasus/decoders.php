<?php

/**
 * T_Decoder model config
 */

return array(

    'title' => '系统常量',

    'single' => '常量',

    'model' => 'App\Models\T_Decoder',

    //'form_width' => 200,
    /**
     * The display columns
     */
    'columns' => array(
        'id',
        'table' => [
            'title' => '表名',
        ],
        'column' => [
            'title' => '字段',
        ],
        'text' => [
            'title' => '文本',
        ],
    ),

    /**
     * The filter set
     */
    'filters' => array(
        'id',
        'table' => [
            'title' => '表名',
        ],
        'column' => [
            'title' => '字段',
        ],
        'text' => [
            'title' => '文本',
        ],
    ),

    /**
     * The editable fields
     */
    'edit_fields' => array(
        //'id',
        'table' => [
            'title' => '表名',
        ],
        'column' => [
            'title' => '字段',
        ],
        'text' => [
            'title' => '文本',
        ],
    ),
);
