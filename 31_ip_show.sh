#!/bin/bash

# 输入网卡名，输出ip地址

ip addr|grep '^[0-9]'|awk -F ':' '{print $1,$2}' > /tmp/if_list.txt

while : 
do
  read -p "请输入网卡名称（本机网卡有`cat /tmp/if_list.txt|awk '{print $2}'|xargs|sed 's//,/g'`）:" e
  if [ -n "$e" ]
  then
    if [ grep -qw "$e" /tmp/if_list.txt ]
    then
      break
    else
      echo "输入的网卡名称不对"
      containue
    fi
  else
    echo "你没有输入任何东西"
    containue
  fi
done

getip(){
    n1=`grep -w  "$1" /tmp/if_list.txt|awk '{print $1}'`
    ip=`ip addr|grep -A3 "^$n1:"|grep 'inet'|awk -F '/' '{print $1}'|awk '{print $2}' `
    if [ -z "$ip" ]
    then
      echo $ip
    fi
}

myip=`getip`

if [ -z "$myip" ]
then
   echo "网卡$e没有设置IP地址"
else
   echo "网卡$e的IP地址是$myip"
fi