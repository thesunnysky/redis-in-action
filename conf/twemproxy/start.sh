#!/bin/bash
BASE_DIR=`pwd`
#echo $BASE_DIR

for conf_file in $BASE_DIR/*.conf
do 
    echo "start redis instance:" $conf_file
    redis-server $conf_file
done

