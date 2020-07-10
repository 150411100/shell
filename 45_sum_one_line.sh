#!/bi/bash

# 文本中，将每3行内容合并到一行

n=0
cat test.txt|while read line
do
  n=$[$n+1]
  if [ $[$n%3] -ne 0 ]
  then
    echo -ne "$line"
  else
    echo $line 
  fi
done