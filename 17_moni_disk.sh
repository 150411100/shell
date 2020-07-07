#!/bin/bash

# 检测所有磁盘分区使用率和inode使用率
# 如果都超高85%，邮件告警

LANG=en
space_file=`date +%F`_space.log
inode_file=`date +%F`_inode.log

check_space(){
  df -h|grep -v Use > $space_file
  for i in `cat $space_file|awk '{print $5}'|sed 's/\%//g'`
  do
    if [ $i -gt 85 ]
    then
      python mail.py "150411100@qq.com" "Disk Spache is not enough" "`df -h`"
    fi
  done
}

check_inode(){
  df -i |grep -v IUse > $inode_file
  for i in `cat $inode_file|grep -v IUse|awk '{print $5}'| sed 's/\%//g'`
  do
    if [ $i -gt 85 ]
    then
      python mail.py "150411100@qq.com" "Disk Inode is not enough" "`df -i`"
    fi
  done
}