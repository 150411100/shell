#!/bin/bash

# 每分钟检查22端口是否被iptables限制
iptables -nvL INPUT --line-number|grep "dpt:22" > /tmp/drop.txt

i=`awk '{print $4}' /tmp/drop.txt|egrep "DROP|REJECT"|wc -l`

if [ $i -gt 0 ]
then
  for n in `awk '$4 ~ /DROP|REJECT/{print $1}' /tmp/drop.txt|sort -nr`
  do
    iptables -D INPUT $n
  done
fi