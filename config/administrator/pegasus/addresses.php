<?php
require 'profile.php';

/**
 * T_Address model config
 */
//use App\Models\T_User;// Laravel NOT initialized right now
//use Illuminate\Support\Facades\DB;

$enumOptions = [
    'k1' => 'v1',
    'k2' => 'v2',
];
$userLoginInfo = [];
// query t_user's related t_login info for edit reference
$sql     = 'SELECT u.id as user_id, t.id as type_id, t.type, u.login_id,l.username from t_user as u JOIN (t_login as l, t_user_type as t) ON (u.login_id = l.id AND u.user_type = t.id)';
$dbh     = new PDO('mysql:host=localhost;dbname=pegasus;charset=utf8', $user, $pass);
$results = $dbh->query($sql);

foreach($results as $row) {
    #$userLoginInfo["user_id:" . $row['user_id']] = $row['type'] . ":" . $row['username']; // enum key NO need to be string after modified the source cod
    $userLoginInfo[$row['user_id']] = $row['type'] . ":" . $row['username'];
}
$dbh = null;

#echo "<pre>";
#print_r($userLoginInfo);
#echo "</pre>";

return array(

    'title' => '地址列表',

    'single' => '地址',

    'model' => 'App\Models\T_Address',

    //'form_width' => 200,
    /**
     * The display columns
     */
    'columns' => array(
        'id',
        'nickname' => [
            'title' => '地址类型',
        ],
        'userType' => [
            'title' => '所属账户', // 即, 用户类型
            'relationship' => 'user.utype',
            'select' => "(:table).type"
        ],
        'userName' => [
            'title' => '账户名称',
            'relationship' => 'user.ulogin',
            'select' => "(:table).username"
        ],
        'name' => [
            'title' => '联系人',
        ],
        'phone' => [
            'title' => '联系电话',
        ],
        'country' => [
            'title' => '国家',
        ],
        'province' => [
            'title' => '省份',
        ],
        'city' => [
            'title' => '城市',
        ],
        'address' => [
            'title' => '地址',
        ],
        //'date_add',
        //'log',
        //'created_at',
        //'updated_at',
    ),

    /**
     * The filter set
     */
    'filters' => array(
        'id',
        'nickname' => [
            'title' => '地址类型',
        ],
        'user_id' => [ // write relationship field manually by enum -- works, human-readable, though ugly
            'title' => '登录账户',
            'type' => 'enum',
            'options' => $userLoginInfo,
        ],
        'name' => [
            'title' => '联系人',
        ],
        'phone' => [
            'title' => '联系电话',
        ],
        'country' => [
            'title' => '国家',
        ],
        'province' => [
            'title' => '省份',
        ],
        'city' => [
            'title' => '城市',
        ],
        'address' => [
            'title' => '地址',
        ],
        //'date_add',
        //'log',
        //'created_at',
        //'updated_at',
    ),

    /**
     * The editable fields
     */
    'edit_fields' => array(
        //'id',
        'nickname' => [
            'title' => '地址类型',
        ],
        'user_id' => [ // write relationship field manually by enum -- works, human-readable, though ugly
            'title' => '登录账户',
            'type' => 'enum',
            //'editable' => function($model) {
            //    return !$model->exists; //will only be editable before an item is saved for the first time
            //},
            'options' => $userLoginInfo,
        ],
        'name' => [
            'title' => '联系人',
        ],
        'phone' => [
            'title' => '联系电话',
        ],
        'country' => [
            'title' => '国家',
        ],
        'province' => [
            'title' => '省份',
        ],
        'city' => [
            'title' => '城市',
        ],
        'address' => [
            'title' => '地址',
        ],
        //'date_add',
        //'log',
        //'created_at',
        //'updated_at',
    ),
    #'actions' => array(
    #    //Ordering an item up
    #    'order_up' => array(
    #        'title' => 'Order Up',
    #        'messages' => array(
    #            'active' => 'Reordering...',
    #            'success' => 'Reordered',
    #            'error' => 'There was an error while reordering',
    #        ),
    #        'permission' => function($model)
    #        {
    #            //return $model->category_id !== 2;
    #            return true;
    #        },
    #        //the model is passed to the closure
    #        'action' => function($model)
    #        {
    #            //get all the items of this model and reorder them
    #            # $model->orderUp();
    #        }
    #    ),
    #),

    'link' => function($model)
    {
        return URL::route('welcome');
    },
);
