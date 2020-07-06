#!/bin/bash

# shell脚步备份数据库
# 本地服务器保存一份，远程服务器拷贝一份
# 本地保存一周的数据，远程保存一个月

# Tyrone.Zhao

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/usr/local/mysql/bin
d1=`date +%w`
d2=`date +%d`

mysql_pass=RootRoot
bakdir=/bak/mysql
r_bakdir=192.168.1.100::backup

exec 1 > /var/log/mysqlbak.log 2>/var/log/mysqlbak.log

echo "MySQL backup begin at `date +"%F %T`."
mysqldump - uroot -p$mysql_pass --default-character-set=gbk discuz > $bakdir/$d1.sql
rsync -az $bakdir/$d1.sql $r_bakdir/$d2.sql 
echo "MySQL backup end at `date +"%F %T"`."