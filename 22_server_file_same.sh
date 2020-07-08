#!/bin/bash

# A和B两台服务器 ，同样目录/data/web
# 以A服务器目录为参考标准，对比B服务器

dir=/data/web
B_ip=192.168.1.100
find $dir -type f |xargs md5sum > /tmp/md5.txt
ssh $B_ip "find $dir -type f |xargs md5sum > /tmp/md5_b.txt" 
scp $B_ip:/tmp/md5_b.txt /tmp

for f in `awk {print $2} /tmp/md5.txt`
do
  if grep -qw "$f" /tmp/md5_b.txt
  then
    md5_a=`grep -w $f /tmp/md5.txt|awk '{print $1}'`
    md5_b=`grep -w $f /tmp/md5_b.txt|awk '{print $1}'`
    if [ $md5_a != $md5_b ]
    then
      echo "$f changed"
    fi
  else
    echo "$f deleted"
  fi
done