#!/bin/bash

# 10 31 53 77 105 141 ...... 输出后面的10个数

m=10

echo $m


for i in `seq 0 14`
do
  j=$[2**$i]
  x=$[20+$j]
  m=$[$m+$x]
  echo $m
done