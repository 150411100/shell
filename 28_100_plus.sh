#!/bin/bash

#计算100以内能被3整除的正整数之和

sum=0
for i in {1..100}
do
  n=$[$i%3]
  if [ $n -eq 0 ]
  then
    sum=$[$i+$sum]
  fi
done

echo "sum:$sum"