<?php

/**
 * T_Seller model config
 */
//use App\Models\T_User;// Laravel NOT initialized right now
//use Illuminate\Support\Facades\DB;

$user = 'pegasus';
$pass = 'secret';

// select t_user's reated t_login info
$sql     = 'SELECT distinct u.id as user_id, t.id as type_id, t.type, u.login_id,l.username from t_user as u JOIN (t_login as l, t_user_type as t) ON (u.login_id = l.id AND u.user_type = t.id)';
$dbh     = new PDO('mysql:host=localhost;dbname=pegasus', $user, $pass);
$results = $dbh->query($sql);
?>
<pre>
<?php
foreach($results as $key => $row) {
    //echo "----";
    //print_r($row);
    print("[" . $key . ":" . $row['user_id'] . "\t" . $row['username'] . "]\n");
}
$dbh = null;
?>
<pre>

<?php
return 0;
////$users = DB::table('t_user')->get();
//foreach ($users as $user) {
//    //echo $user->ulogin()->getParent()->username;
//    echo $user->id;
//}

return array(

    'title' => '商家列表',

    'single' => '商家',

    'model' => 'App\Models\T_Seller',

    //'form_width' => 200,
    /**
     * The display columns
     */
    'columns' => array(
        'id',
        //'date_add',
        'name' => [
            'title' => '商家名称',
        ],
        'username' => [
            'title' => '登录名称',
            'relationship' => 'user.ulogin',
            'select' => "(:table).username"
        ],
        'regemail' => [
            'title' => '注册邮箱',
            'relationship' => 'user.ulogin',
            'select' => "(:table).email"
        ],
        'focus' => [
            'title' => '主营',
        ],
        'brand' => [
            'title' => '主打品牌',
        ],
        'description' => [
            'title' => '商家简介',
        ],
        'email' => [
            'title' => '联系邮箱',
        ],
        'QQ' => [
            'title' => '联系QQ',
        ],
        'country' => [
            'title' => '销往地区',
        ],
        //'log',
        //'created_at',
        //'updated_at',
    ),

    /**
     * The filter set
     */
    'filters' => array(
        'id',
        //'date_add',
        'name' => [
            'title' => '商家名称',
        ],
        'userLoginName' => [
            'title' => '登录名称',
            'type' => 'relationship',
            'name_field' => 'username',
        ],
        'userLoginEmail' => [
            'title' => '注册邮箱',
            'type' => 'relationship',
            'name_field' => 'email',
        ],
        'focus' => [
            'title' => '主营',
        ],
        'brand' => [
            'title' => '主打品牌',
        ],
        'description' => [
            'title' => '商家简介',
        ],
        'email' => [
            'title' => '联系邮箱',
        ],
        'QQ' => [
            'title' => '联系QQ',
        ],
        'country' => [
            'title' => '销往地区',
        ],
        //'log',
        //'created_at',
        //'updated_at',
    ),

    /**
     * The editable fields
     */
    'edit_fields' => array(
        //'id',
        //'date_add',
        'name' => [
            'title' => '商家名称',
        ],
        'user' => [
            'title' => '登录名称',
            'type' => 'relationship',
            'name_field' => 'id',
            //'options_filter' => function($query) { // filter some speicific records
            //    $query->where('id', 1);
            //},
            //'value' => $var,
        ],
        //'userLoginEmail' => [
        //    'title' => '注册邮箱',
        //    'type' => 'relationship',
        //    'name_field' => 'email',
        //],
        'focus' => [
            'title' => '主营',
        ],
        'brand' => [
            'title' => '主打品牌',
        ],
        'description' => [
            'title' => '商家简介',
        ],
        'email' => [
            'title' => '联系邮箱',
        ],
        'QQ' => [
            'title' => '联系QQ',
        ],
        'country' => [
            'title' => '销往地区',
        ],
        //'log',
        //'created_at',
        //'updated_at',
    ),
);
