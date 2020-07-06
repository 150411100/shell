#!/bin/bash

# 统计Linux系统所有进程占用内存大小的总和
# Tyrone.Zhao

sum=0
for men in `ps aux | awk '{print $6}'|grep -v 'RSS'`
do
  sum=$[$sum+$men]
done
echo "The total mem is $sum."