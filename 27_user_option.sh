#!/bin/bash

# 添加删除用户 ，有三个选项 add del help
# add是先判断是否存在，存在则提示，不存在则添加，密码为用户名
# del是先判断是否存在，存在则删除，不存则提示，并删除home目录
# help 反馈使用方法

if [ $# -ne 2 ]
then
  echo "user $0 --add username or $0 --del username or $0 --help"
  exit 1
fi

case $1 in
  --add)
    n=0
    for u in `echo $2|sed 's/,//g'`
    do 
      if id $u > /dev/null 2>/dev/null
      then
        echo "The user $u exist."
        n=$[$n+1]
      else
        useradd $u
        echo -e "$u\n$u"|passwd $u >/dev/null 2>&1
        echo "The user $u add successful"
      fi
    done
    if [ $n -gt 0 ]
    then
      exit 2
    else
      exit 0
    fi
    ;;
  --del)
    n=0 
    for u in `echo $2|sed 's/,//g'`
    do
      if id $u >/dev/null 2>&1
      then
        userdel -r $u
        echo "The user $u deleted successful"
      else
        echo "The use $u not exits"
        n=$[$n+1]
      fi
    done
    if [ $n -gt 0 ]
    then
      exit 3
    else 
      exit 0
    fi
    ;;
  --help)
    echo -e "--add user1 "
    echo "--del user1"
    exit 0
    ;;
  *)
    echo "user $0 add username -r $0 del username or $0 help "
    exit 1
    ;;
esac