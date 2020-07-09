#!/bin/bash

# 执行脚步，输入用户名和密码（英文的大小写、数字，不能有特殊符号）
# 然后输出一个数字，脚步不退出，继续提示输入名字
# 输入相同的名字，输出的数字一样
# 前面已经输出的数字，下次不能再出现
# 输入q或者Q，脚步退出

tmpf=/tmp/user_nu.txt 
if [ -f $tmpf ]
then
  true > $tmpf
else
  touch $tmpf
fi

while :
do
  read -p "Input your name(名字为英文，名字只能含有大小写字母或数字)，输入q或者Q退出：" name
  if [ $name == "q" ] || [ $name == "Q" ]
  then
    echo "脚步退出"
    exit 0
  fi

  if echo $name |grep -q '[^0-9a-zA-Z]'
  then
    echo "你输入的名字不合法"
    continue
  fi

  if awk '{print $1}' $tmpf|grep -qw "$name"
  then
    echo "输入的名字已经存在，你的数字为："
    awk -v na=$name '$1==na{print $2}' $tmpf
    continue
  if

  while :
  do
    number=$[$RANDOM%100]
    if awk '{print $2}' $tmpf|grep -qw $number
    then
      continue
    else
      break
    fi
  done
  echo "$name 你的数字是：$number"
  echo "$name $number" >> $tmpf
done