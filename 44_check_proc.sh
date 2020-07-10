#!/bin/bash

# 每个进程都有PID ，每个PID都会在/proc内产生
# 如果proc内没有，则说明进程被修改，代表系统可能被入侵

ps aux|awk '/[0-9]/ {print $2}'|while read pid
do
  result=`find /proc/ -maxdepth 1 -type d -name "$pid"`
  if [ -z $result ]
  then
    echo "$pid abnormal!"
  fi
done