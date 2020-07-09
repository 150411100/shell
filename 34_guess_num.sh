#!/bin/bash

# 随机生成一个0-100数字，用户判断，提示用户的数字比随机的大或者小

m=`echo $RANDOM`
n1=$[$m%100]
while :
do
  read -p "Pls input num(0-100)" num
  if [ $n1 == $num ]
  then
    break
  elif [ $n1 -gt $num ]
  then
     echo "你输入的数字小了"
     continue
  else
     echo "你输入的数字大了"
     continue
  fi
done
echo "恭喜你，答对了！"