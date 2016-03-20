<?php
require 'profile.php';

/**
 * T_Seller model config
 */
//use App\Models\T_User;// Laravel NOT initialized right now
//use Illuminate\Support\Facades\DB;


$userLoginInfo = [];
// query t_user's related t_login info for edit reference
$sql     = 'SELECT u.id as user_id, t.id as type_id, t.type, u.login_id,l.username from t_user as u JOIN (t_login as l, t_user_type as t) ON (u.login_id = l.id AND u.user_type = t.id) where t.type = "商家"';
$dbh     = new PDO('mysql:host=localhost;dbname=pegasus;charset=utf8', $user, $pass);
$results = $dbh->query($sql);

foreach($results as $row) {
#    $userLoginInfo["user_id:" . $row['user_id']] = $row['type'] . ":" . $row['username']; // enum key NO need to be string after modified the source code
    $userLoginInfo[$row['user_id']] = $row['type'] . ":" . $row['username'];
}
$dbh = null;

#echo "<pre>";
#print_r($userLoginInfo);
#echo "</pre>";

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
        #'userLoginName' => [
        #    'title' => '登录名称',
        #    'type' => 'relationship',
        #    'name_field' => 'login_id',
        #    'options_filter' => function($query)
        #    {// filter only seller's login id
        #        $query->join('t_user_type', 't_user.user_type', '=', 't_user_type.id')
        #            ->where('t_user_type.type', '=', '商家')
        #            ->select('t_user.*');
        #    },
        #],
        'user_id' => [ // write relationship field manually by enum -- works, human-readable, though ugly
            'title' => '登录账户',
            'type' => 'enum',
            'options' => $userLoginInfo,
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
        #'userLoginAccount' => [ // use builtin relationship(manually nested, for direct-nest-filter NOT supported), works for filter(see filter:userLoginName), but NOT work here when Save(can NOT write into db)
        #    'title' => '登录账户1',
        #    'type' => 'relationship',
        #    'name_field' => 'login_id',
        #    'options_filter' => function($query)
        #    {// filter only seller's login id
        #        $query->join('t_user_type', 't_user.user_type', '=', 't_user_type.id')
        #            ->where('t_user_type.type', '=', '商家')
        #            ->select('t_user.*');
        #    },
        #],
        'user_id' => [ // write relationship field manually by enum -- works, human-readable, though ugly
            'title' => '登录账户',
            'type' => 'enum',
            //'editable' => function($model) {
            //    return !$model->exists; //will only be editable before an item is saved for the first time
            //},
            'options' => $userLoginInfo,
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
