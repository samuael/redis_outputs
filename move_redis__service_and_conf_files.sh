#!/bin/bash
#
#
#   This script generate the binary for each release and install the binary as a service 
#
# #1 specifies the path to Redis releases #2 specifies the redis releases directory 
current_directory=$(pwd);
for release in redis-4.0.6  redis-5.0.10  redis-5.0.3  redis-5.0.4  redis-6.0.5;
do
    
    cp $1/redis/utils/redis.service $1/$release/utils/;
    cp $1/redis/redis.conf $1/$release/;

done 
