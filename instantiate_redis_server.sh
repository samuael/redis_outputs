#!/bin/bash
#
#
# in this instantiation 'samuael' represents my user name in this node
# and 'proxyweb-PGO' represents the 'group'
#


cd redis-4.0.6 ;
#sudo make ;
#sudo make test;
sudo make install;

cd ../;


sudo mkdir -p  /var/lib/redis;
sudo chown samuael:proxyweb-PGO /var/lib/redis;
sudo chmod a+rwx /var/lib/redis;
sudo mkdir -p /etc/redis;
sudo chmod a+rwx  /etc/redis;
sudo cp redis.conf /etc/redis;
sudo cp redis.service /etc/systemd/system/;
sudo systemctl start redis;
sudo systemctl enable redis;

# Reloading the system whenever a new service is added.
sudo systemctl deamon-reload;
redis-server --version;
