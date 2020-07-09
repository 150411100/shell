#!/bin/bash

# shell 实现 logrotate工具

function  e_df(){
    [ -f $1 ] && rm -rf $1
}

for i in `seq 5 -1 2`
do
  i2=$[$i-1]
  e_df /log/1.log.$i
  if [ -f /log/1.lgo.$i2 ]
  then
    mv /log/1.log.$i2 /log/1.log.$i
  fi
done
e_df /log/1.log.1
mv /log/1.log /log/1.log.1