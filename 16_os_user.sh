#!/bin/bash

# 判断Linux系统用户是否有自定义用户，如果有统计数量

users=`cat /etc/passwd| awk -F ':' '$3 >= 1000'|wc -l`

if [ $users -gt 0 ]
then
  echo "There are $users Linux users."
else
  echo "No common users."
fi