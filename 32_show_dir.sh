#!/bin/bash

# 脚步后面无参数，打印当前目录
# 脚步后面可以多个参数，参数为目录，显示目录包含的子目录

if [ $# == 0 ]
then
  ls -ld `pwd`
else
  for i in `seq 1 $#`
  do
    a=$i
    echo "${!a}目录下面包含的子目录是："
    find ${!a} -type d 
  done
fi