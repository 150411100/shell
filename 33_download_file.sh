#!/bin/bash

# 判断是否为两个参数，第一个参数URL ，第二个参数目录
# 判断目录是否存在，不存在提醒是否创建，不创建返回51
# 下载文件是否成功，成功返回0 ，不成功返回52

download(){
    if [ $# -ne 2 ]
    then
      echo "参数为2，第一个URL ，第二个目录"
      exit 1
    fi

    if [ ! -d $2 ]
    then
      while :
      do
        read -p "The $2 dir not exist , please make dir,Y|N?" c
        case $c in
          Y|y)
            mkdir -pv $2
            break
            ;;
          N|n)
            return 51
            ;;
          *)
            echo "只能输入Y或者N"
            continue
            ;;
        esac
      done
    if
    cd $2
    wget $1
    if [ $? -ne 0 ]
    then
      return 51
    else
      return 0
    fi
}

download