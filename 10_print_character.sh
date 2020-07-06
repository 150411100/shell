#!/bin/bash

# Bash also interprets a number of multi-character options 打印字母数小于6的单词

msg="Bash also interprets a number of multi-character options"

for s in $msg
do
  n=`echo $s|wc -c`
  if [ $n -lt 7 ]
  then
    echo $s
  fi
done