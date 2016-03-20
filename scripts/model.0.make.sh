#!/bin/bash
source ./script.profile;

# locate to /cygdrive/d/xampp/htdocs/pegasus
cd ".." 1>/dev/null 2>&1
    for model in $Models; do
        echo "make:model $model";
        php artisan make:model $model;
    done
cd - 1>/dev/null 2>&1
