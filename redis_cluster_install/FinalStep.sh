# Last Update:2017-02-27 14:19:20
#########################################################################
# File Name: SecondStep.sh
# Author: wangchenxi
# mail: chinawangchenxi@gmail.com
# Created Time: Mon 27 Feb 2017 02:19:20 PM CST
# brief:
#########################################################################
#!/bin/bash

IP1=$(cat ./IpAndPort |awk -F" " '{print $1}')
IP2=$(cat ./IpAndPort |awk -F" " '{print $2}')
IP3=$(cat ./IpAndPort |awk -F" " '{print $3}')
IP4=$(cat ./IpAndPort |awk -F" " '{print $4}')
IP5=$(cat ./IpAndPort |awk -F" " '{print $5}')
Port1=$(cat ./IpAndPort |awk -F" " '{print $6}')
Port2=$(cat ./IpAndPort |awk -F" " '{print $7}')
Port3=$(cat ./IpAndPort |awk -F" " '{print $8}')

redis-trib.rb create --replicas 2 $IP1:$Port1 $IP2:$Port1 $IP3:$Port1 $IP4:$Port1 $IP5:$Port1 $IP2:$Port2 $IP3:$Port2 $IP3:$Port3 $IP4:$Port2 $IP4:$Port3 $IP5:$Port2 $IP1:$Port2 $IP5:$Port3 $IP1:$Port3 $IP2:$Port3
