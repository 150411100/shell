#!/bin/bash

# 输入一串随机数，然后按千分位输出
# eg： 123456789  ，123,456,789

while true
do
  read -p "Pls input num:" number
  n2=`echo $number|sed 's/[0-9]//g'`
  if [ -n "$n2" ]
  then
    echo "输入的不是纯数字，请重新输入"
    continue
  else
    break
  fi
done

