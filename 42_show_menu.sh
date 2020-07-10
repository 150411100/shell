#! /bin/bash

# 实现简单的弹出菜单 ，用户根据显示的菜单从键盘选择对应的命令

function meun(){
    echo "0, w"
    echo "1. ls"
    echo "2. quit"
    echo -p "Pls input parameter(0,1,2):" num 
}

while :
do
  meun
  case $num in
  0)
    w
    echo 
    continue
    ;;
  1)
    ls
    echo 
    continue
    ;;
  2)
    echo "Bye"
    exit 0
    ;;
  *)
    echo "Unkown cmd"
    continue
    ;;
  esac
done