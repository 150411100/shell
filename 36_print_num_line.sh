#!/bin/bash

# 把一个文本中只有一个数字的行打印出来

f=/etc/passwd
n=`wc -l|$f|awk '{print $1}'`
for a in `seq 1 $n`
do
  num=`sed -n "$a"p $f|sed 's/[^0-9]//g'|wc -l`
  if [ $n -eq 1 ]
  then
    sed -n "$a"p $f
  fi
done