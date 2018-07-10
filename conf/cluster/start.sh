#!/bin/bash
BASE_DIR=`pwd`
#echo $BASE_DIR

for conf_file in $BASE_DIR/*.conf
do 
    echo "start redis instance:" $conf_file
    redis-server $conf_file
done

echo "[redis-trib.rb]: Begin to create cluster..."
redis-trib.rb create --replicas 1 127.0.0.1:6379 127.0.0.1:6380 127.0.0.1:6381 127.0.0.1:6382 127.0.0.1:6383 127.0.0.1:6384