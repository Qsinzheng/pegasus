<?php

namespace App\Repositories;

use App\Models\T_Login;
use App\Task;

class TaskRepository
{
    /**
     * Get all of the tasks for a given user.
     *
     * @param  User  $user
     * @return Collection
     */
    public function forUser(T_Login $login)
    {
        return Task::where('user_id', $login->id)
                    ->orderBy('created_at', 'asc')
                    ->get();
    }
}
