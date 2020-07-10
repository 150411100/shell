#!/bin/bash

# 每隔5分钟检查指定用户是否登录系统
# 如果指定用户已经登录 则显示相信息

read -p "Pls input the username:" username

while :
do
 if who |grep -qw $username
 then
  echo "$username login."
 else
  echo "$username not login."
 fi
done