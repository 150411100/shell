#!/bin/bash

# 每10秒检查服务器httpd进程数 ，如果大于500，需要重启httpd服务
# httpd 如果没有重启成功，需要再次重启，重启次数不超过5次，邮件告警
# 重启成功，1分钟后再次检查httpd进程数，若还是大于500，需要邮件告警

check_server()
{
    n=0
    for i in `seq 1 5`
    do
      /usr/local/apache2/bin/apachectl restart 2 > /tmp/apache.err
      if [ $? -ne 0 ]
      then
        n=$[$n+1]
      else
        break
      fi
    done
    if [ $n -eq 5 ]
    then
      python mail.py "150411100@qq.com" "httpd service down " `cat /tmp/apache.err`
      exit
    fi
}

while true
do
  t_n=`ps -C httpd --no-heading|wc -l`
  if [ $t_n -ge 500 ]
  then
    /usr/local/apache2/bin/apachectl restart
    if [ $? -ne 0 ]
    then
      check_server
    fi
    sleep 60
    t_n=`ps -C httpd --no-heading|wc -l`
    if [ $t_n -ge 500 ] 
    then
      python mail.py "150411100@qq.com" "httpd service some wrong" "The httpd process is busy"
      exit
    fi
  fi
  sleep 10
done