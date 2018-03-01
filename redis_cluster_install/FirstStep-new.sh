#########################################################################
# File Name: FirstStep-new.sh
# Author: Lihaihui
# mail: chinawangchenxi@gmail.com
# Created Time: 2018-03-01
# brief:
#########################################################################
#!/bin/bash
setIpandPort(){
    echo "================================================"
    echo " *安装提示：期望你能相对仔细的阅读安装提示。"
    echo "================================================"
    echo "*请按照顺序依次输入$ipnum 个服务器的IP地址(该地址为$ipnum 台服务器能够互联的局域网地址)!，一起按Ctrl键和C键，将终止本程序"
    echo "*IP地址形如: 123.234.134.124 按Enter键完成一次输入"
    echo "================================================"
    sleep 1
    echo $portnum
    for ((ip=1; ip<=$ipnum; ip++))
    do 
	echo "*请输入第$ip 台服务器的IP地址："
	read IP${ip}
        eval echo \$IP$ip
	eval echo -n \$IP$ip >> IpAndPort     #间接引用方法一
        echo -n  " " >> IpAndPort
	echo "================================================"
    done
    echo "请按照“ 相同顺序  ”依次输入用于Redis集群的$portnum 个端口号(该端口号应该已经被讨论确定过)："
    echo "端口号范围: 1-65535"
    echo "================================================"
    sleep 1
    for ((port=1; port<=$portnum;port++))
    do
	echo "请输入第$port 个端口号："
	read Port${port}
	eval echo -n \$Port$port >> IpAndPort
        echo -n  " " >> IpAndPort
	echo "================================================"
    done	
   # echo "$IP1 $IP2 $IP3 $IP4 $IP5 $Port1 $Port2 $Port3 ">IpAndPort 
    sleep 1
}
ipnum=1
portnum=2
datetime=`date +'%Y%m%d_%H:%M:%S'`

if [ $# -ne 2 ]
then 
    echo "usage: ./FirstStep.sh IpNum PortNum "
    exit
else
    ipnum=$1
    portnum=$2
fi

#if [ ! -f "./IpAndPort" -a  ! -s "./IpAndPort"  ] ; then

if [ ! -f "./IpAndPort" -a  ! -s "./IpAndPort"  ] ; then
    setIpandPort
else
    echo "是否使用IpAndPort文件中的数据设置，文件中的IP数量与port数量应与传入的参数相同[y/n]"
    read setflag
    if [ $setflag = "y" ];then	
	sum=$ipnum+$portnum
	for (( ip=1; ip<=$ipnum;ip++))
        do 
          echo "IP$ip"
          eval IP$ip=$(cat ./IpAndPort |awk -F" " -v nip=$ip '{print $nip}')   #awk中自定义变量输出
        done
        for (( port=1; port<=$portnum;port++))
        do
          echo "Port$port"
          eval Port$port=$(cat ./IpAndPort |awk -F" " -v nport=$port '{print $nport}')
        done 
				
    else
       #datetime=`date +'%Y%m%d_%H:%M:%S'`
       mv ./IpAndPort ./IpAndPort-$datetime
	   sleep 1
       echo "备份IpAndPort,手动输入IP和PORT"
       setIpandPort
    fi
fi
echo "================================================"
echo "请输入本服务器用于组建Redis集群的IP地址(该地址为$ipnum台服务器能够互联的局域网地址)："
read IPself
echo "================================================"
echo "输入结束，集群正在部署..."
sleep 2

:<<COMMENT
多行注释
COMMENT
ThreadNum=$(grep 'processor' /proc/cpuinfo | sort -u | wc -l)
unzip ./zlib1210.zip 
cd ./zlib-1.2.10/ 
./configure 
make -j${ThreadNum}
make install
cd ..
rm -rf ./zlib-1.2.10/

unzip ./rubygems-2.6.8.zip 
cd ./rubygems-2.6.8/ 
ruby setup.rb
cp bin/gem /usr/local/bin 
cd ..
rm -rf ./rubygems-2.6.8/ 

gem install -l ./redis-3.2.2.gem 
gem install -l ./json_pure-2.0.2.gem

tar -xf redis-3.0.6.tar.gz
cd ./redis-3.0.6/ 
make -j${ThreadNum}  && make install
cd src
cp redis-trib.rb /usr/local/bin/ 
cd ../../ 
rm -rf ./redis-3.0.6/

#source ./out1.sh "apk_name='com.amparosoft.progressivemetronome.free'"  
for ((port=1; port<=$portnum;port++))
do
    source OutputConf.sh
    OutputConf $IPself $[Port$port]
done	

if [ -d "/etc/RedisCluster" ]; then
    mv /etc/RedisCluster /etc/RedisCluster_$datetime
fi

mv ./$IPself/RedisCluster /etc/

if [ -a "/etc/init.d/redis_cluster" ]; then
    echo "=========================================================="
    echo "是否删除现有的启动端口脚本/etc/init.d/redis_cluster,[y/n]"
    echo "=========================================================="
    read delflag
    echo $delflag
    if [ $delflag = "y" ]
    then
       echo "删除现有的启动端口脚本"
       sleep 2
       rm -rf /etc/init.d/redis_cluster
    fi
fi

for ((port=1; port<=$portnum;port++))
do
    pp="Port"$port
    redis-server /etc/RedisCluster/${!pp}/redis.conf
    echo "redis-server /etc/RedisCluster/${!pp}/redis.conf" >> /etc/init.d/redis_cluster     #间接引用方法二
done
chmod a+x /etc/init.d/redis_cluster

NeedToAdd=$(grep '/etc/init.d/redis_cluster' /etc/rc.local)
if [ -z "$NeedToAdd" ]; then
    echo "/etc/init.d/redis_cluster" >> /etc/rc.local
fi
echo "完成安装！"
