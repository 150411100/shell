#!/bin/bash

# lnmp环境
# 502现象偶尔发生
# 重启php-fpm 

# Tyrone.Zhao
log_file=/data/log/access.log
N=10

while:
do
    tail -n 300 $log_file > /tmp/log
    n_502=`grep -c '502' /tmp/log`
    if [ $n_502 -ge $N ]
    then
      /etc/init.d/php-fpm restart 2>/dev/null
      sleep 60 
    fi
sleep 10 
done