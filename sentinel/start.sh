#!/bin/bash
BASE_DIR=`pwd`
#echo $BASE_DIR

cnt=0
for conf_file in $BASE_DIR/redis-server-*.conf
do 
    echo "start redis server:" $conf_file
    redis-server $conf_file
	let cnt++
done
echo "${cnt} redis server started"
ps -ef | grep redis-server | grep -v "grep" | grep -v "sentinel"

echo -e "\nBegein to start redis-sentinel..."
cnt=0
for conf_file in $BASE_DIR/redis-sentinel-*.conf
do 
    echo "start redis-sentinel:" $conf_file
    redis-server $conf_file --sentinel
	let cnt++
done
echo "${cnt} redis sentinel started"
ps -ef | grep redis-server | grep -v "grep" | grep sentinel

