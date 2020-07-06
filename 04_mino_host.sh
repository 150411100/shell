#!/bin/bash

# 监控一台主机，如果宕机，发送邮件

ip=199.1.1.0
mail=150411100@qq.com
while 1
do
  n=`ping -c$ip | grep 'received'|awk -F'received,|%' '{print $2}'`
  if [ -z "$n" ]
  then
    echo "There is the wrong in the script."
    exit
  fi
  if [ $n -gt 20 ]
  then 
    python /tools/mail.py $mail "$ip down" "$ip is down"
  fi 
sleep 30
done