#!/bin/bash

# 计算文本中每行出现的数字个数
# 计算整个文档中一共出现了几个数字

n=`wc -l test.txt|awk '{print $1}'`
sum=0
for i in `seq 0 $n`
do
  line=`sed -n "$i"p test.txt`
  n_n=`echo -n $line|sed 's/[^0-9]//g'|wc -l`
  echo $n_n
  sum=$[$sum+$n_n]

done

echo $sum 