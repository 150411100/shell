#!/bin/bash

# 杀死一个进程

ps aux|grep clean.sh |grep -v grep |awk '{print $2}'|xargs kill