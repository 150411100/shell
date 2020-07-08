#!/bin/bash

# 检查MySQL服务是否正常
# 检查当前的MySQL服务是主还是从
# 如果是从，判断主是否正常，如果是主，则不需要做什么

Mysql_c="mysql -uroot -p123456"
$Mysql_c -e "show processlist" > /tmp/mysql_pro.log 2>/tmp/mysq_log.err

if [ $? -gt 0 ]
then
    echo "The mysql service err"
else
    $Mysql_c -e "show slave status\G" > /tmp/mysql_s.log
    n1=`wc -l /tmp/mysql_s.log|awk '{print $1}'`
    if [ $n1 -gt 0 ]
    then
      y1=`grep 'Slave_IO_Running:' /tmp/mysql_s.log|awk -F: '{print $2}'|sed 's/ //g'`
      y2=`grep 'Slave_SQL_Running:' /tmp/mysql_s.log|awk -F: '{print $2}'|sed 's/ //g'`
      if [ $y1 == "Yes" ] && [ $y2 == "Yes"]
      then
        echo "The slave status is good."
      else
        echo "The slave is down"
      fi
    fi
fi