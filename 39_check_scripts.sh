#!/bin/bash

# 检测shell脚步是否有语法错误

sh -n $1 2>/tmp/err

if [ $? -eq "0" ]
then
  echo "The script is OK."
else
  cat /tmp/err
  read -p "Pls input Q/q to exit ,or others to edit it by vim." n
  if [ -z $n ]
  then
    vim $1
    exit
  fi 
  if [ $n == "q" -o $n == "Q" ]
  then
    exit
  else
    vim $1
    exit
  fi
fi