#!/bin/bash

# 将文本中1-5行包含字母的行删除
# 将6-10行中全部字母删除

# Tyrone.Zhao
sed -n '1,5p' test.txt | sed '/[a-zA-Z]/d'
sed -n '6,10p' test.txt | sed 's/[a-zA-Z]//g'
sed -n '11,$p' test.txt