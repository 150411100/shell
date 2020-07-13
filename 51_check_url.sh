#!/bin/bash

# 测试url 是否正常，返回状态码200表示正常

url="http://www.baidu.com"
status=`curl -I $url 2>/dev/null|head -1|awk '{print $2}'`

if [ $status != "200" ]
then
  python mail.py "150411100@qq.com" "$url down." "$url down"
else
  echo "$url status $status"
fi