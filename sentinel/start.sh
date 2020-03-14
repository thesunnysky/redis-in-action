#!/bin/bash
BASE_DIR="."
#echo $BASE_DIR

rm -rf data/*

cnt=0
for conf_file in $BASE_DIR/server-*.conf
do 
    echo "start redis server:" $conf_file
    redis-server $conf_file
	let cnt++
done

echo "${cnt} redis server started"
ps -ef | grep redis-server | grep -v "grep" | grep -v "sentinel"

echo -e "\nBegein to start redis-sentinel..."
cnt=0
for conf_file in $BASE_DIR/sentinel-*.conf
do 
    echo "start sentinel:" $conf_file
    redis-server $conf_file --sentinel
	let cnt++
done
echo "${cnt} sentinel started"
ps -ef | grep redis-server | grep -v "grep" | grep sentinel

for i in {26379..26381}
do
    redis-cli -p $i sentinel monitor master1 127.0.0.1 6379 2
done

echo "127.0.0.1:6380 slaveof 127.0.0.1:6379"
redis-cli -p 6380 slaveof 127.0.0.1 6379
