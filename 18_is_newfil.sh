#!/bin/bash

# 每5分钟检测上传目录中的新文件

d=`date -d "-5 min" +%Y%m%d%H%M`
web_dir=/data/web/attachment

find $web_dir -type f -mmin -5 > /tmp/newfile.txt
n=`wc -l /tmp/newfile.txt`

if [ $n -gt 0 ]
then
  /bin/mv /tmp/newfile /tmp/$d
fi