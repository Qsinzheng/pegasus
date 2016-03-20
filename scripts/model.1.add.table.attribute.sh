#!/bin/bash
source ./script.profile;

# locate to /cygdrive/d/xampp/htdocs/pegasus
pwd
cd ".." 1>/dev/null 2>&1
    for model in $Models; do
        echo "add table attribute for model: $model";

        Bingo=`grep 'protected $table =' ./app/$model.php`;
        if [ -z "$Bingo" ]; then
            sed -i "/{/a protected \$table = '$model';" ./app/$model.php;
            sed -i "s/\(^protected \$table = '\)\(.*\)/\t\1\L\2/"       ./app/$model.php;
        fi
    done
cd - 1>/dev/null 2>&1
