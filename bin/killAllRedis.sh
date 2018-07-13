#!/bin/bash
BASE_DIR=`pwd`
#echo $BASE_DIR

#pids=(21604 21596 21594 21588 21577 18399 16329)
pids=(`pidof redis-server`)
for pid in ${pids[@]}
do 
    kill $pid
    echo "kill pid:$pid"
done

