#!/bin/bash

# 每10分钟检测一次指定网卡的流量，如果流量为0，则重启网卡

n1=`sar -n DEV 1 5|grep eth0|grep -i average|awk '{print $5}'|sed 's/\.//g'`
n2=`sar -n DEV 1 5|grep eth0|grep -i average|awk '{print $6}'|sed 's/\.//g'`

if [ $n1 == "000" ] && [ $n2 == "000" ]
then
  ifdown eth0;if up eth0
fi