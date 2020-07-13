#!/bin/bash

# 打印用户home目录下小于5kb的文件，并以当前日期为文件名压缩为.tar.gz 

t=`date +%F`
cd $HOME
tar czf $t.targ.z `find . type -f -size -5k|xargs`