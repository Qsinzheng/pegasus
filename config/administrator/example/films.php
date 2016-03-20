<?php

/**
 * Films model config
 */

return array(

	'title' => '电影',

	'single' => 'film',

	'model' => 'App\Models\Film',

    //'form_width' => 200,
	/**
	 * The display columns
	 */
	'columns' => array(
		'id',
		'name',
		'image' => array(
            'title' => 'Image',
            'output' => '<img src="/uploads/films/thumbs/small/(:value)" height="100" />',
        ),
		'release_date' => array(
			'title' => 'release date'
		),
		'director_name' => array(
			'title' => 'Director Name',
			'relationship' => 'director',
			'select' => "CONCAT((:table).first_name, ' ', (:table).last_name)"
		),
		'num_actors' => array(
			'title' => '# Actors',
			'relationship' => 'actors',
			'select' => "COUNT((:table).id)"
		),
		'box_office' => array(
			'title' => 'Box Office',
			'relationship' => 'boxOffice',
			'select' => "CONCAT('$', FORMAT(SUM((:table).revenue), 2))"
		),
	),

	/**
	 * The filter set
	 */
	'filters' => array(
		'id',
		'name',
		'release_date' => array(
			'title' => 'Release Date',
			'type' => 'date',
			'date_format' => 'yy-mm-dd',
		),
		'director' => array(
			'title' => 'Director',
			'type' => 'relationship',
			'name_field' => 'name',
			'options_sort_field' => "CONCAT(first_name, ' ' , last_name)",
		),
		'actors' => array(
			'title' => 'Actors',
			'type' => 'relationship',
			'name_field' => 'name',
			'options_sort_field' => "CONCAT(first_name, ' ' , last_name)",
		),
	),

	/**
	 * The editable fields
	 */
	'edit_fields' => array(
		'name',
        'image' => array(
            'title' => 'Image',
            'type' => 'image',
            'location' => public_path() . '/uploads/films/originals/',
            'naming' => 'random',
            'length' => 20,
            'size_limit' => 2,
            'sizes' => array(
                array(65,   57, 'crop',         public_path() . '/uploads/films/thumbs/small/', 100),
                array(220, 138, 'landscape',    public_path() . '/uploads/films/thumbs/medium/', 100),
                array(383, 276, 'fit',          public_path() . '/uploads/films/thumbs/full/', 100)
            )
        ),
		'release_date' => array(
			'title' => 'Release Date',
			'type' => 'date',
			'date_format' => 'yy-mm-dd',
		),
		'director' => array(
			'title' => 'Director',
			'type' => 'relationship',
			'name_field' => 'name',
			'options_sort_field' => "CONCAT(first_name, ' ' , last_name)",
		),
		'actors' => array(
			'title' => 'Actors',
			'type' => 'relationship',
			'name_field' => 'name',
			'options_sort_field' => "CONCAT(first_name, ' ' , last_name)",
		),
		'theaters' => array(
			'title' => 'Theater',
			'type' => 'relationship',
			'name_field' => 'name',
		),
	),

);
