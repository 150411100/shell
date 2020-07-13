#!/bin/bash

# 根据输入的数字参数 ，生产参数个一组为3位数字

get_a_number(){
    n=$[$RANDOM%10]
    echo $n
}

get_numbers(){
    for i in 0 1 2 
    do
      a[$i]=`get_a_number`
    done

    while [ ${a[0]} -eq 0 ]
    do
      a[0]=$[$RANDOM%10]
    done
    echo ${a[@]}|sed 's/ //g'
}

if [ $# -gt 1]
then
  echo "Usage: sh $0 n , n is number !"
  exit
elif [ -n "$1" ]
then
  m=`echo $1|sed 's/[0-9]//g'`
  if [ -n "$m" ] || [ $1 -eq 0 ]
  then
    echo "Usage: sh $0 n , n is number !"
    exit
  else
    for i in `seq 1 $1`
    do
      echo -n "`get_numbers`"
    done
    echo 
  if
else
  get_numbers
fi