#!/bin/bash

# Total web.log IP score
# Tyrone.Zhao

awk '{print $1}' /tools/web.log | sort -n | uniq -c | sort -n 