#!/bin/bash

# 根据用户输入的数字打印
# 用户输入end提出程序

while :
do
 read -p "Pls input a number:(input \"end\",it will be exit.)" n
 num=`echo $n|sed 's//[0-9]/g'wc -l`
 if [ $n == "end" ]
 then
   echo "Bye!"
   exit
 fi
 if [ $num -ne 0 ]
 then
  echo "Your input is not a num ,Pls try again."
 else
  echo "Your input num is:$n"
 fi
done