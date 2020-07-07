#!/bin/bash

# 输入一个数字对应运行一个命令

echo "* cmd meau * 1 - date 2 - ls 3 - who 4 - pwd"

read -p "Pls input a number 1-4:" num

n2=`echo $num|sed 's/[0-9]//g'`

if [ -n "$n2" ]
then
  echo "The input content is not a number"
  exit
fi

case $num in
1)
  date
  ;;
2) 
  ls
  ;;
3) 
  who
  ;;
4) 
  pwd
  ;;
*)
  echo “Please input a number:1-4”
  ;;
esac