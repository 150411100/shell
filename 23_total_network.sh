#!/bin/bash

# 检查网络的流量,并记录到日志
# 一分钟统计一次

yum install -y sysstat

while :
do
LANG=en
DATE=`date +"%Y-%m-%d %H:%M"`
LOG_PATH=/tmp/`date +%Y%m`
LOG_FILE=$LOG_PATH/traffic_check_`date +%d`.log
exec >> $LOG_FILE
[ -d $LOG_PATH ] || mkdir -p $LOG_PATH
echo "$DATE" sar -n DEV 1 59|grep Average|grep eth0|awk '{print "\n",$2,"\t","input:",$5*1000*8,"bps","\t","\n",$2,"\t","output:",$6*1000*8,"bps"}'
echo "#########################"
done