#!/bin/bash
source ./script.profile;

# locate to /cygdrive/d/xampp/htdocs/pegasus
cd ".." 1>/dev/null 2>&1
    for model in $Models; do
        echo "rename namespace for $model";
        sed -i 's/namespace App;/namespace App\\Models;/' ./app/$model.php;
        #mv ../app/$model ../app/Models;
    done
cd - 1>/dev/null 2>&1
