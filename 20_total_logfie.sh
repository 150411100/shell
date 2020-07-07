#!/bin/bash

# 每小时都执行的脚步，每天0点和12点清空/data/log下的的文件，不删除
# 其他时间统计/data/log 目录下文件的大小，并记录到一个文件里面

logdir="/data/log"
t=`date +%H`
d=`date +%F-%H`

[ -d /tmp/log_size ]||mkdir /tmp/log_size
for log in `find $logdir -type f`
do
  if [ $t == “0” ] || [ $t == "12" ]
  then
    true > $log
  else 
    du -sh $log >> /tmp/log_size/$d
  fi
done