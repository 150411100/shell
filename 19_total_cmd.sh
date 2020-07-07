#!/bin/bash

# 统计经常输入排前10的命令

sort /root/.bash_history|uniq -c |sort -nr|head