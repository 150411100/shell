#!/bin/bash

# 判断服务器是否开启web服务
# 判断是哪种web服务NGINX 或是Apache

netstat -lntup|grep ':80'|awk -F'/' '{print $2}'| sort|uniq > /tmp/web.log
n=`wc -l /tmp/web.log|awk '{print $1}'`

if [ $n -eq 0 ]
then
  echo "No Web Service Runging!"
  exit;
fi

check_server(){
    case $1 in
      httpd)
        echo "Apache Server"
        ;;
      nginx)
        echo "Nginx Server"
        ;;
      *) 
        echo "Other Server"
        ;;
    esac
}

if [ $n -eq 1 ] 
then
  w_s=`cat /tmp/web.log`
  check_server $w_s
else
  echo "There are $n web servers:"
  for web in `cat /tmp/web.log`
  do 
    check_server $web
  done
fi