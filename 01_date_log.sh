#!/bin/bash

# print date disk status log
# Tyrone.Zhao
d=`date +%F`
logfile=$d.log
df -h > $logfile
