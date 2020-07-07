#!/bin/bash

# 创建user用户00-09 ，并生成十位数密码，
# 将生成的用户名和密码保存到文件中

yum install -y expect 

for i in `seq -w 0 09`
do
  useradd user_$i
  p=`mkpasswd -s 0 -l 10`
  echo “user_$i $p” >> /tmp/user_pwd.pass
  echo $p|passwd --stdin user_$i
done