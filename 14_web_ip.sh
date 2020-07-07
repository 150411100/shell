#!/bin/bash

# 根据web服务器上的访问日志，把一些请求量非常高的IP拒绝掉
# 并且每隔半个小时把不再发起请求或者请求量很小的IP解封

logfile=/data/logs/access.log
d1=`date -d "-1 minute" +%H:%M`
d2= `date +%M`

ipt=/sbin/iptables
ips=/tmp/ips.txt

block(){
  grep "$d1:" $logfile|awk '{print $1}'|sort -n|uniq -c |sort -n > $ips
  for ip in `awk '$1>100 {print $2}' $ips`
  do
    $ipt -I INPUT -p tcp --dport 80 -s $ip -j REJECT
    echo "`date +%F-%T` $ip" >> /tmp/badip.txt
  done
}

unblock(){
  for i in `$ipt -nvL INPUT --line-numbers|grep '0.0.0.0/0'|awk '$2<10 {print $1}'|sort -nr`;
  do
    $ipt -D INPUT $i
  done
  $ipt -Z
}

if [ $d2 == "00" ] || [ $d2 == "30" ] 
then
  unblock
  block
else
  block
fi