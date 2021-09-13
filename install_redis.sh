#!/bin/bash
#
#
#   This script generate the binary for each release and install the binary as a service 
#
# #1 specifies the path to Redis releases #2 specifies the redis releases directory 
export LLVM_CONPILER=clang
#sudo cp $1/redis/redis.conf /etc/redis/redis.conf
#sudo cp $1/$release/utils/redis.service /etc/systemd/system/;
sudo chmod 770 /var/lib/redis
current_directory = $( pwd )
for release in redis-4.0.6  redis-5.0.10  redis-5.0.3  redis-5.0.4  redis-6.0.5;
do
#    export  LLVM_COMILER=clang;
    cd $1/$release;
    export  LLVM_COMILER=clang;
    sudo make distclean;
    CPPFLAGS="-fPIC" CFLAGS="-fPIC" CC="wllvm -O3" CXX="wllvm++ -O3"  make && make test && sudo make install;
    # i am making /var/lib/redis to be accesible because it it to be accessed by the redis without sudo access.
    #sudo cp redis.conf /etc/redis/redis.conf
    #sudo cp $1/$release/utils/redis.service /etc/systemd/system/;
    # create the redis 
 #   sudo systemctl start redis
#sudo systemctl restart redis;    
# Checking the redis server version.
#    redis-server --version;
    cd $current_directory;
done 
