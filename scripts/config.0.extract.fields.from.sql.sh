#!/bin/bash
source ./script.profile;

# locate to /cygdrive/d/xampp/htdocs/pegasus
cd "$ProjectHome/config/administrator/pegasus"
    TableFieldListFile="app_daigouguanjia.table.fields.list";
    cp "$ProjectHome/database/app_daigouguanjia.sql" "$TableFieldListFile";
        #s/CREATE TABLE IF NOT EXISTS //g;
    sed -i '
        /PRIMARY KEY /d;
        /UNIQUE KEY/d;
    ' "$TableFieldListFile";
cd -
