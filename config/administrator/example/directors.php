<?php

/**
 * Directors model config
 */

return array(

	'title' => 'Directors',

	'single' => 'director',

	'model' => 'App\Models\Director',

	/**
	 * The display columns
	 */
	'columns' => array(
		'name' => array(
			'title' => 'Name',
		),
		'FormattedSalary' => array(
			'title' => 'Salary',
			'sort_field' => 'salary'
		),
		'xfilms' => array(
			'title' => '# films',
			'relationship' => 'films',
			'select' => 'COUNT((:table).id)',
		),
		//'NumFilms' => array(
		//	'title' => '# films2',
		//),
		'created_at',
	),

	/**
	 * The filter set
	 */
	'filters' => array(
		'id',
		'first_name',
		'last_name',
		'salary' => array(
			'type' => 'number',
			'symbol' => '$',
			'decimals' => 2,
		),
		'created_at' => array(
			'type' => 'datetime'
		),
	),

	/**
	 * The editable fields
	 */
	'edit_fields' => array(
		'first_name' => array(
			'title' => 'First Name',
			'type' => 'text',
		),
		'last_name' => array(
			'title' => 'Last Name',
			'type' => 'text',
		),
		'salary' => array(
			'title' => 'Salary',
			'type' => 'number',
			'symbol' => '$',
			'decimals' => 2
		),
	),

);
