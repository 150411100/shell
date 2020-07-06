#!/bin/bash

# 判断本机80端口是否开启，如果开启，什么都不用操作
# 如果未开始，重启httpd服务，并发送邮件告警

mail=150411100@qq.com

if netstat -lntp|grep ':80'
then
  exit
fi
/usr/local/apache2/bin/apachectl restart > /dev/null 2 > /dev/null
python mail.py $mail "check_80" "The 80 port is down."

n=`pgrep -l httpd|wc -l`
if [ $n -eq 0 ]
then
    /usr/local/apache2/bin/apachectl start 2 > /tmp/apache_start.err
fi

if [ -s /tmp/apache_start.err ]
then
    python mail.py $mail "apache_start_error" "`cat /tmp/apache_start.err`"
if