#!/bin/bash

# 检查系统是否安装http和MySQL服务，如果没有安装，则进行安装
# 检查安装了的httpd 和MySQL服务是否启动，如果没有启动，则启动

if_install(){
  n=`rpm -qa|grep -cw "$1"`
  if [ $n -eq 0 ]
  then
    echo "$1 not install"
    yum install -y $1
  else
    echo "$1 installed"
  fi
}

check_service(){
    p_n=`ps -C "$1" --no-heading |wc -l`
    if [ $p_n -eq 0 ]
    then
      echo "$1 not start"
      systemctl start $1
    else
      echo "$1 started."
    fi
}

if_install httpd
if_install mysql-server
check_service httpd
check_service mysqld