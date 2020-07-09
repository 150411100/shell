#!/bin/bash

# 把192.168.0.0/24 网段在线的ip罗列出来

ips="192.168.0."
for i in `seq 1 254`
do
  ping -c 2 $ips$i > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    echo "echo $ips$i is online"
  else
    echo "echo $ips$i is not online"
  fi
done