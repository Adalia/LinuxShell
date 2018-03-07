#!/bin/bash

interval=60 
if [ "$1" != "" ]
then
  interval=$1
fi

echo "检查时间间隔(单位秒)："$interval
datetime=`date +'%Y%m%d'`
echo""> /home/info/info-$datetime
while :
do
  echo `date +'%Y%m%d %H:%M:%S'` >> /home/info/info-$datetime
  cat /proc/meminfo | grep  -E 'MemTotal|MemFree|Cached' |grep -v SwapCached|xargs >> /home/info/info-$datetime    
  top -b -d 1 -n 1 |grep -E "PID.*USER|load|Cpu|Data" >> /home/info/info-$datetime
  sleep $interval
  echo "----------------------------------------------------------------------------------" >> /home/info/info-$datetime
done

