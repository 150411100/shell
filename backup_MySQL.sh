#!/bin/bash

# Tyrone.Zhao
# 2020-07-09 

/usr/local/mysql/bin/mysqldump -uroot --default-character-set=utf8 -p'*****' database > /tmp/data_$(date +%F).sql

[ $? -eq 0 ] && gzip /tmp/data_$(date +%F).sql

[ -f /tmp/data_$(date +%F).gz ] && rsync -av -e "ssh -p 22" /tmp/data_$(date +%F).gz root@10.211.55.10:/backup/