<?php

namespace App\Policies;

use App\Models\T_Login;
use App\Task;
use Illuminate\Auth\Access\HandlesAuthorization;

class TaskPolicy
{
    use HandlesAuthorization;

    /**
     * Determine if the given user can delete the given task.
     *
     * @param  User  $user
     * @param  Task  $task
     * @return bool
     */
    public function destroy(T_Login $login, Task $task)
    {
        return $login->id === $task->user_id;
    }
}
