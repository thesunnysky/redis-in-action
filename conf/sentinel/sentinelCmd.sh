#!/bin/bash
set -x
sentinels=(26379 26380 26381)
cmd=$@
echo $sentinels

for port in ${sentinels[@]}
do
    echo "port:$port"
    redis-cli -h 127.0.0.1 -p $port $cmd
done

