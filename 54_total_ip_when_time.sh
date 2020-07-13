#!/bin/bash

# 统计早上9点到中午十二点，访问Nginx 的IP数量

grep '15/Sep/2017:[0-9]:[0-5][0-9]:' /usr/local/nginx/logs/access.log|awk '{print $1}'|sort -n |uniq -c|sort -n|tail -n1
#grep '15/Sep/2017:[0-9]:[0-5][0-9]:' /usr/local/nginx/logs/access.log|awk '{print $1}'|sort -n |uniq -c|sort -nr|head -1