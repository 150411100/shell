#!/bin/bash

judge(){
    if [ -z "$1" ] 
    then
      echo "Pls input num!"
      exit
    fi
    n=`echo $1|sed 's/[0-9]//g'`
    if [ -n "$n" ]
    then
      echo "Input num error."
      exit
    fi
}

read -p "Input stop num :" num_1
judge $num_1
for i in `seq 1 $num1`
do
  echo $i
done

read -p "Is continue input num ?" a
case $a in
  yes|YES)
    read -p "Pls continue input num:" num_2
    judge $num_2
    if [ $num_2 -le $num_1 ]
    then
      echo "Pls input num2 than num1"
      exit
    fi
    num_3=$[$num_2+1]
    for h in `seq num_3,num_2`
    do
      echo $h
    done
    ;;
  no|NO)
    exit
    ;;
  *)
    echo "Pls input yes or no"
    exit
esac