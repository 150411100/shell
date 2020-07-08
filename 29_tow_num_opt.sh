#!/bin/bash

# sh opt.sh num1 num2
# 加减乘除

if [ $# -ne 2 ]
then
  echo "The number of parameter is not 2 , Pls useage: ./$0 num1 num2"
  exit 1
if

is_int(){
  if echo "$1"|grep -q '[^0-9]' 
  then
    echo "$1 is not interger number."
    exit 1
  fi   
}

max(){
  if [ $1 -gt $2]
  then
      echo $1
  else
      echo $2
  if
}

min(){
   if [ $1 -lt $2]
  then
      echo $1
  else
      echo $2
  if
}

sum(){
    echo "$1 +$2 = $[$1+$2]"
}

minus(){
    big=`max $1 $2`
    small=`min $1 $2`
    echo "$big - $small = $[$big-$small]"
}

mult(){
    echo "$1 * $2 =$[$1*$2]"
}

div(){
  big=`max $1 $2`
  small=`mini $1 $2`
  d=`echo "scale=2;$big/$small"|bc`
  echo "$big/$small=$d"
}

is_int $1
is_int $2
sum $1 $2
minus $1 $2
mult $1 $2
div $1 $2