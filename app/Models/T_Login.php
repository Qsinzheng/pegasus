<?php

namespace App\Models;

use App\Task;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Foundation\Auth\Access\Authorizable;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;

class T_Login extends Model implements AuthenticatableContract,
                                    AuthorizableContract,
                                    CanResetPasswordContract
{
    use Authenticatable, Authorizable, CanResetPassword;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 't_login';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['username', 'email', 'password'];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = ['password', 'remember_token'];

    /**
     * password accessor/mutator
     */
    public function getPasswordAttribute($value)
    {
        return $value;
    }
    public function setPasswordAttribute($value)
    {
        //$this->attributes['password'] = bcrypt($value);
        $this->attributes['password'] = $value; // hash it in AuthController
    }

    /**
    /**
     * Get login status.
     */
    public function lstatus()
    {
        return $this->belongsTo('App\Models\T_Login_Status', 'status');
    }

    /**
     * Get all of the tasks for the user.
     */
    public function tasks()
    {
        return $this->hasMany(Task::class, 'user_id');
    }
}
