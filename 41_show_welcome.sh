#!/bin/bash

# 根据系统的时间，向用户输出问好

h=`date +%H`

if [ $h - ge 0 ] && [ $h -lt 12 ]
then 
  echo "Good Morning"
elif [ $h -ge 12 ] && [ $h -lt 18 ]
then
  echo "Good afternoon"
else
  echo "Good evening"
fi