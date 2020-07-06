#!/bin/bash

# 查找目录下后缀为.txt的文件，并重命名为.txt.bak
# 把所有.bak的文件打包到hello.tar.gz 
# 批量还原.txt.bak 文件名为.txt

# 重命名为.txt.bak
find /tmp/ -type f -name "*.txt" > /tmp/txt.list
for f in `cat /tmp/txt.list`
do
  mv $f $f.bak
done

dir=`date +%F`
mkdir -p /tmp/$dir
for f in  `cat /tmp/txt.list`
do
  cp $f.bak /tmp/$dir
done

# 打包到hello.tar.gz 
cd /tmp/
tar -czf hello.tar.gz $dir

# 恢复文件后缀名.txt 
for f in `cat /tmp/txt.list`
do
  mv $f.bak $f 
done