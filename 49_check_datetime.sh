#!/bin/bash

# 检测日期是否合法
if [  $# -ne 1 ] || [ ${#1} -ne 8 ]
then
  echo "Usage: bash $0 yyyymmdd"
  exit 1
fi

datem=$1
year=${datem:0:4}
month=${datem:4:2}
day=${datem:6:2}

if echo $day|grep -q '^0'
then
  day=`echo $day|sed 's/^0//'`
fi

if cal $month $year > /dev/null/ 2>/dev/null 
then
  daym=`cal $month $year|egrep -v "year|Su"|grep -w "$day"`
  if [ "$daym" != "" ]
  then
    echo ok
  else
    echo "Error: Pls input a wright date."
    exit 1
  fi
else
  echo "Error: Pls input a wright date"
  exit 1
fi