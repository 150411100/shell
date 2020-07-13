#!/bin/bash

# 格式 check_ip_or_interface  [-i interface | l ip]
# -i选项时显示指定网卡的ip 
# -l 选项时显示指定ip所属网卡

ip add|awk -F ':' '$1 ~/^[0-9]/{print $2}'|sed 's/ //g' > /tmp/eths.txt

[ -f /tmp/eth_ip.log ] && rm -f /tmp/eth_ip.log

for eth in `cat /tmp/eths.txt`
do
  ip=`ip add|grep -A2 ":eth" |grep inet|awk '{print $2}'|cut -d '/' -f 1`
  echo "$eth:$ip" >> /tmp/eth_ip.log
done

useage(){
    echo "Pls useage:$0 -i 网卡名称 or $0 -l ip地址"
}

wrong_eth(){
    if ! awk -F ':' '{print $1}' /tmp/eth_ip.log|grep -qw "^$1$"
    then
      echo "请指定正确的网卡名称"
      exit
    fi
}

wrong_ip(){
    if ! awk -F ':' '{print $2}' /tmp/eth_ip.log |grep -qw "^$1$"
    then
        echo "请输入正确的IP地址"
        exit
    fi
}

if [ $# -ne 2 ]
then
  useage
  exit
fi

case $1 in
  -i)
    wrong_eth $2
    grep -w $2 /tmp/eth_ip.log |awk -F ':' '{print $2}'
    ;;
  -l)
    wrong_ip $2
    grep -w $2 /tmp/eth_ip.log |awk -F ':' '{print $1}'
    ;;
  *)
    useage
    exit
esac