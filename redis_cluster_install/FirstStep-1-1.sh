# Last Update:2017-02-27 11:12:44
#########################################################################
# File Name: FirstStep.sh
# Author: wangchenxi
# mail: chinawangchenxi@gmail.com
# Created Time: Mon 27 Feb 2017 11:12:44 AM CST
# brief:
#########################################################################
#!/bin/bash
OutputConf () {
    IP_Func=$1
    PortNum_Func=$2

    FinalPath=/etc
    ConfPath=/RedisCluster/${PortNum_Func}
    ConfFile=${IP_Func}/$ConfPath/redis.conf
    if [ -d "./${IP_Func}" ]; then
        rm -rf ${IP_Func}/$ConfPath
    fi
    mkdir  ${IP_Func}/$ConfPath -p

    echo "# Redis configuration file example.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Note that in order to read the configuration file, Redis must be">>$ConfFile
    echo "# started with the file path as first argument:">>$ConfFile
    echo "#">>$ConfFile
    echo "# ./redis-server /path/to/redis.conf">>$ConfFile
    echo "">>$ConfFile
    echo "# Note on units: when memory size is needed, it is possible to specify">>$ConfFile
    echo "# it in the usual form of 1k 5GB 4M and so forth:">>$ConfFile
    echo "#">>$ConfFile
    echo "# 1k => 1000 bytes">>$ConfFile
    echo "# 1kb => 1024 bytes">>$ConfFile
    echo "# 1m => 1000000 bytes">>$ConfFile
    echo "# 1mb => 1024*1024 bytes">>$ConfFile
    echo "# 1g => 1000000000 bytes">>$ConfFile
    echo "# 1gb => 1024*1024*1024 bytes">>$ConfFile
    echo "#">>$ConfFile
    echo "# units are case insensitive so 1GB 1Gb 1gB are all the same.">>$ConfFile
    echo "">>$ConfFile
    echo "################################## INCLUDES ###################################">>$ConfFile
    echo "">>$ConfFile
    echo "# Include one or more other config files here.  This is useful if you">>$ConfFile
    echo "# have a standard template that goes to all Redis servers but also need">>$ConfFile
    echo "# to customize a few per-server settings.  Include files can include">>$ConfFile
    echo "# other files, so use this wisely.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Notice option \"include\" won't be rewritten by command \"CONFIG REWRITE\"">>$ConfFile
    echo "# from admin or Redis Sentinel. Since Redis always uses the last processed">>$ConfFile
    echo "# line as value of a configuration directive, you'd better put includes">>$ConfFile
    echo "# at the beginning of this file to avoid overwriting config change at runtime.">>$ConfFile
    echo "#">>$ConfFile
    echo "# If instead you are interested in using includes to override configuration">>$ConfFile
    echo "# options, it is better to use include as the last line.">>$ConfFile
    echo "#">>$ConfFile
    echo "# include /path/to/local.conf">>$ConfFile
    echo "# include /path/to/other.conf">>$ConfFile
    echo "">>$ConfFile
    echo "################################ GENERAL  #####################################">>$ConfFile
    echo "">>$ConfFile
    echo "# By default Redis does not run as a daemon. Use 'yes' if you need it.">>$ConfFile
    echo "# Note that Redis will write a pid file in /var/run/redis.pid when daemonized.">>$ConfFile
    echo "daemonize yes">>$ConfFile
    echo "">>$ConfFile
    echo "# When running daemonized, Redis writes a pid file in /var/run/redis.pid by">>$ConfFile
    echo "# default. You can specify a custom pid file location here.">>$ConfFile
    echo "pidfile /var/run/redis_${PortNum_Func}.pid">>$ConfFile
    echo "">>$ConfFile
    echo "# Accept connections on the specified port, default is 6379.">>$ConfFile
    echo "# If port 0 is specified Redis will not listen on a TCP socket.">>$ConfFile
    echo "port ${PortNum_Func}">>$ConfFile
    echo "">>$ConfFile
    echo "# TCP listen() backlog.">>$ConfFile
    echo "#">>$ConfFile
    echo "# In high requests-per-second environments you need an high backlog in order">>$ConfFile
    echo "# to avoid slow clients connections issues. Note that the Linux kernel">>$ConfFile
    echo "# will silently truncate it to the value of /proc/sys/net/core/somaxconn so">>$ConfFile
    echo "# make sure to raise both the value of somaxconn and tcp_max_syn_backlog">>$ConfFile
    echo "# in order to get the desired effect.">>$ConfFile
    echo "tcp-backlog 511">>$ConfFile
    echo "">>$ConfFile
    echo "# By default Redis listens for connections from all the network interfaces">>$ConfFile
    echo "# available on the server. It is possible to listen to just one or multiple">>$ConfFile
    echo "# interfaces using the \"bind\" configuration directive, followed by one or">>$ConfFile
    echo "# more IP addresses.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Examples:">>$ConfFile
    echo "#">>$ConfFile
    echo "# bind 192.168.1.100 10.0.0.1">>$ConfFile
    echo "bind  ${IP_Func}">>$ConfFile
    echo "">>$ConfFile
    echo "# Specify the path for the Unix socket that will be used to listen for">>$ConfFile
    echo "# incoming connections. There is no default, so Redis will not listen">>$ConfFile
    echo "# on a unix socket when not specified.">>$ConfFile
    echo "#">>$ConfFile
    echo "# unixsocket /tmp/redis.sock">>$ConfFile
    echo "# unixsocketperm 700">>$ConfFile
    echo "">>$ConfFile
    echo "# Close the connection after a client is idle for N seconds (0 to disable)">>$ConfFile
    echo "timeout 0">>$ConfFile
    echo "">>$ConfFile
    echo "# TCP keepalive.">>$ConfFile
    echo "#">>$ConfFile
    echo "# If non-zero, use SO_KEEPALIVE to send TCP ACKs to clients in absence">>$ConfFile
    echo "# of communication. This is useful for two reasons:">>$ConfFile
    echo "#">>$ConfFile
    echo "# 1) Detect dead peers.">>$ConfFile
    echo "# 2) Take the connection alive from the point of view of network">>$ConfFile
    echo "#    equipment in the middle.">>$ConfFile
    echo "#">>$ConfFile
    echo "# On Linux, the specified value (in seconds) is the period used to send ACKs.">>$ConfFile
    echo "# Note that to close the connection the double of the time is needed.">>$ConfFile
    echo "# On other kernels the period depends on the kernel configuration.">>$ConfFile
    echo "#">>$ConfFile
    echo "# A reasonable value for this option is 60 seconds.">>$ConfFile
    echo "tcp-keepalive 0">>$ConfFile
    echo "">>$ConfFile
    echo "# Specify the server verbosity level.">>$ConfFile
    echo "# This can be one of:">>$ConfFile
    echo "# debug (a lot of information, useful for development/testing)">>$ConfFile
    echo "# verbose (many rarely useful info, but not a mess like the debug level)">>$ConfFile
    echo "# notice (moderately verbose, what you want in production probably)">>$ConfFile
    echo "# warning (only very important / critical messages are logged)">>$ConfFile
    echo "loglevel notice">>$ConfFile
    echo "">>$ConfFile
    echo "# Specify the log file name. Also the empty string can be used to force">>$ConfFile
    echo "# Redis to log on the standard output. Note that if you use standard">>$ConfFile
    echo "# output for logging but daemonize, logs will be sent to /dev/null">>$ConfFile
    echo "logfile \"\"">>$ConfFile
    echo "">>$ConfFile
    echo "# To enable logging to the system logger, just set 'syslog-enabled' to yes,">>$ConfFile
    echo "# and optionally update the other syslog parameters to suit your needs.">>$ConfFile
    echo "# syslog-enabled no">>$ConfFile
    echo "">>$ConfFile
    echo "# Specify the syslog identity.">>$ConfFile
    echo "# syslog-ident redis">>$ConfFile
    echo "">>$ConfFile
    echo "# Specify the syslog facility. Must be USER or between LOCAL0-LOCAL7.">>$ConfFile
    echo "# syslog-facility local0">>$ConfFile
    echo "">>$ConfFile
    echo "# Set the number of databases. The default database is DB 0, you can select">>$ConfFile
    echo "# a different one on a per-connection basis using SELECT <dbid> where">>$ConfFile
    echo "# dbid is a number between 0 and 'databases'-1">>$ConfFile
    echo "databases 16">>$ConfFile
    echo "">>$ConfFile
    echo "################################ SNAPSHOTTING  ################################">>$ConfFile
    echo "#">>$ConfFile
    echo "# Save the DB on disk:">>$ConfFile
    echo "#">>$ConfFile
    echo "#   save <seconds> <changes>">>$ConfFile
    echo "#">>$ConfFile
    echo "#   Will save the DB if both the given number of seconds and the given">>$ConfFile
    echo "#   number of write operations against the DB occurred.">>$ConfFile
    echo "#">>$ConfFile
    echo "#   In the example below the behaviour will be to save:">>$ConfFile
    echo "#   after 900 sec (15 min) if at least 1 key changed">>$ConfFile
    echo "#   after 300 sec (5 min) if at least 10 keys changed">>$ConfFile
    echo "#   after 60 sec if at least 10000 keys changed">>$ConfFile
    echo "#">>$ConfFile
    echo "#   Note: you can disable saving completely by commenting out all \"save\" lines.">>$ConfFile
    echo "#">>$ConfFile
    echo "#   It is also possible to remove all the previously configured save">>$ConfFile
    echo "#   points by adding a save directive with a single empty string argument">>$ConfFile
    echo "#   like in the following example:">>$ConfFile
    echo "#">>$ConfFile
    echo "#   save \"\"">>$ConfFile
    echo "">>$ConfFile
    echo "save 900 1">>$ConfFile
    echo "save 300 10">>$ConfFile
    echo "save 60 10000">>$ConfFile
    echo "">>$ConfFile
    echo "# By default Redis will stop accepting writes if RDB snapshots are enabled">>$ConfFile
    echo "# (at least one save point) and the latest background save failed.">>$ConfFile
    echo "# This will make the user aware (in a hard way) that data is not persisting">>$ConfFile
    echo "# on disk properly, otherwise chances are that no one will notice and some">>$ConfFile
    echo "# disaster will happen.">>$ConfFile
    echo "#">>$ConfFile
    echo "# If the background saving process will start working again Redis will">>$ConfFile
    echo "# automatically allow writes again.">>$ConfFile
    echo "#">>$ConfFile
    echo "# However if you have setup your proper monitoring of the Redis server">>$ConfFile
    echo "# and persistence, you may want to disable this feature so that Redis will">>$ConfFile
    echo "# continue to work as usual even if there are problems with disk,">>$ConfFile
    echo "# permissions, and so forth.">>$ConfFile
    echo "stop-writes-on-bgsave-error yes">>$ConfFile
    echo "">>$ConfFile
    echo "# Compress string objects using LZF when dump .rdb databases?">>$ConfFile
    echo "# For default that's set to 'yes' as it's almost always a win.">>$ConfFile
    echo "# If you want to save some CPU in the saving child set it to 'no' but">>$ConfFile
    echo "# the dataset will likely be bigger if you have compressible values or keys.">>$ConfFile
    echo "rdbcompression yes">>$ConfFile
    echo "">>$ConfFile
    echo "# Since version 5 of RDB a CRC64 checksum is placed at the end of the file.">>$ConfFile
    echo "# This makes the format more resistant to corruption but there is a performance">>$ConfFile
    echo "# hit to pay (around 10%) when saving and loading RDB files, so you can disable it">>$ConfFile
    echo "# for maximum performances.">>$ConfFile
    echo "#">>$ConfFile
    echo "# RDB files created with checksum disabled have a checksum of zero that will">>$ConfFile
    echo "# tell the loading code to skip the check.">>$ConfFile
    echo "rdbchecksum yes">>$ConfFile
    echo "">>$ConfFile
    echo "# The filename where to dump the DB">>$ConfFile
    echo "dbfilename dump_${PortNum_Func}.rdb">>$ConfFile
    echo "">>$ConfFile
    echo "# The working directory.">>$ConfFile
    echo "#">>$ConfFile
    echo "# The DB will be written inside this directory, with the filename specified">>$ConfFile
    echo "# above using the 'dbfilename' configuration directive.">>$ConfFile
    echo "#">>$ConfFile
    echo "# The Append Only File will also be created inside this directory.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Note that you must specify a directory here, not a file name.">>$ConfFile
    echo "dir $FinalPath$ConfPath/.">>$ConfFile
    echo "">>$ConfFile
    echo "################################# REPLICATION #################################">>$ConfFile
    echo "">>$ConfFile
    echo "# Master-Slave replication. Use slaveof to make a Redis instance a copy of">>$ConfFile
    echo "# another Redis server. A few things to understand ASAP about Redis replication.">>$ConfFile
    echo "#">>$ConfFile
    echo "# 1) Redis replication is asynchronous, but you can configure a master to">>$ConfFile
    echo "#    stop accepting writes if it appears to be not connected with at least">>$ConfFile
    echo "#    a given number of slaves.">>$ConfFile
    echo "# 2) Redis slaves are able to perform a partial resynchronization with the">>$ConfFile
    echo "#    master if the replication link is lost for a relatively small amount of">>$ConfFile
    echo "#    time. You may want to configure the replication backlog size (see the next">>$ConfFile
    echo "#    sections of this file) with a sensible value depending on your needs.">>$ConfFile
    echo "# 3) Replication is automatic and does not need user intervention. After a">>$ConfFile
    echo "#    network partition slaves automatically try to reconnect to masters">>$ConfFile
    echo "#    and resynchronize with them.">>$ConfFile
    echo "#">>$ConfFile
    echo "# slaveof <masterip> <masterport>" >>$ConfFile
    echo "# If the master is password protected (using the \"requirepass\" configuration">>$ConfFile
    echo "# directive below) it is possible to tell the slave to authenticate before">>$ConfFile
    echo "# starting the replication synchronization process, otherwise the master will">>$ConfFile
    echo "# refuse the slave request.">>$ConfFile
    echo "#">>$ConfFile
    echo "# masterauth <master-password>">>$ConfFile
    echo "">>$ConfFile
    echo "# When a slave loses its connection with the master, or when the replication">>$ConfFile
    echo "# is still in progress, the slave can act in two different ways:">>$ConfFile
    echo "#">>$ConfFile
    echo "# 1) if slave-serve-stale-data is set to 'yes' (the default) the slave will">>$ConfFile
    echo "#    still reply to client requests, possibly with out of date data, or the">>$ConfFile
    echo "#    data set may just be empty if this is the first synchronization.">>$ConfFile
    echo "#">>$ConfFile
    echo "# 2) if slave-serve-stale-data is set to 'no' the slave will reply with">>$ConfFile
    echo "#    an error \"SYNC with master in progress\" to all the kind of commands">>$ConfFile
    echo "#    but to INFO and SLAVEOF.">>$ConfFile
    echo "#">>$ConfFile
    echo "slave-serve-stale-data yes">>$ConfFile
    echo "">>$ConfFile
    echo "# You can configure a slave instance to accept writes or not. Writing against">>$ConfFile
    echo "# a slave instance may be useful to store some ephemeral data (because data">>$ConfFile
    echo "# written on a slave will be easily deleted after resync with the master) but">>$ConfFile
    echo "# may also cause problems if clients are writing to it because of a">>$ConfFile
    echo "# misconfiguration.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Since Redis 2.6 by default slaves are read-only.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Note: read only slaves are not designed to be exposed to untrusted clients">>$ConfFile
    echo "# on the internet. It's just a protection layer against misuse of the instance.">>$ConfFile
    echo "# Still a read only slave exports by default all the administrative commands">>$ConfFile
    echo "# such as CONFIG, DEBUG, and so forth. To a limited extent you can improve">>$ConfFile
    echo "# security of read only slaves using 'rename-command' to shadow all the">>$ConfFile
    echo "# administrative / dangerous commands.">>$ConfFile
    echo "slave-read-only yes">>$ConfFile
    echo "">>$ConfFile
    echo "# Replication SYNC strategy: disk or socket.">>$ConfFile
    echo "#">>$ConfFile
    echo "# -------------------------------------------------------">>$ConfFile
    echo "# WARNING: DISKLESS REPLICATION IS EXPERIMENTAL CURRENTLY">>$ConfFile
    echo "# -------------------------------------------------------">>$ConfFile
    echo "#">>$ConfFile
    echo "# New slaves and reconnecting slaves that are not able to continue the replication">>$ConfFile
    echo "# process just receiving differences, need to do what is called a \"full">>$ConfFile
    echo "# synchronization\". An RDB file is transmitted from the master to the slaves.">>$ConfFile
    echo "# The transmission can happen in two different ways:">>$ConfFile
    echo "#">>$ConfFile
    echo "# 1) Disk-backed: The Redis master creates a new process that writes the RDB">>$ConfFile
    echo "#                 file on disk. Later the file is transferred by the parent">>$ConfFile
    echo "#                 process to the slaves incrementally.">>$ConfFile
    echo "# 2) Diskless: The Redis master creates a new process that directly writes the">>$ConfFile
    echo "#              RDB file to slave sockets, without touching the disk at all.">>$ConfFile
    echo "#">>$ConfFile
    echo "# With disk-backed replication, while the RDB file is generated, more slaves">>$ConfFile
    echo "# can be queued and served with the RDB file as soon as the current child producing">>$ConfFile
    echo "# the RDB file finishes its work. With diskless replication instead once">>$ConfFile
    echo "# the transfer starts, new slaves arriving will be queued and a new transfer">>$ConfFile
    echo "# will start when the current one terminates.">>$ConfFile
    echo "#">>$ConfFile
    echo "# When diskless replication is used, the master waits a configurable amount of">>$ConfFile
    echo "# time (in seconds) before starting the transfer in the hope that multiple slaves">>$ConfFile
    echo "# will arrive and the transfer can be parallelized.">>$ConfFile
    echo "#">>$ConfFile
    echo "# With slow disks and fast (large bandwidth) networks, diskless replication">>$ConfFile
    echo "# works better.">>$ConfFile
    echo "repl-diskless-sync no">>$ConfFile
    echo "">>$ConfFile
    echo "# When diskless replication is enabled, it is possible to configure the delay">>$ConfFile
    echo "# the server waits in order to spawn the child that transfers the RDB via socket">>$ConfFile
    echo "# to the slaves.">>$ConfFile
    echo "#">>$ConfFile
    echo "# This is important since once the transfer starts, it is not possible to serve">>$ConfFile
    echo "# new slaves arriving, that will be queued for the next RDB transfer, so the server">>$ConfFile
    echo "# waits a delay in order to let more slaves arrive.">>$ConfFile
    echo "#">>$ConfFile
    echo "# The delay is specified in seconds, and by default is 5 seconds. To disable">>$ConfFile
    echo "# it entirely just set it to 0 seconds and the transfer will start ASAP.">>$ConfFile
    echo "repl-diskless-sync-delay 5">>$ConfFile
    echo "">>$ConfFile
    echo "# Slaves send PINGs to server in a predefined interval. It's possible to change">>$ConfFile
    echo "# this interval with the repl_ping_slave_period option. The default value is 10">>$ConfFile
    echo "# seconds.">>$ConfFile
    echo "#">>$ConfFile
    echo "# repl-ping-slave-period 10">>$ConfFile
    echo "">>$ConfFile
    echo "# The following option sets the replication timeout for:">>$ConfFile
    echo "#">>$ConfFile
    echo "# 1) Bulk transfer I/O during SYNC, from the point of view of slave.">>$ConfFile
    echo "# 2) Master timeout from the point of view of slaves (data, pings).">>$ConfFile
    echo "# 3) Slave timeout from the point of view of masters (REPLCONF ACK pings).">>$ConfFile
    echo "#">>$ConfFile
    echo "# It is important to make sure that this value is greater than the value">>$ConfFile
    echo "# specified for repl-ping-slave-period otherwise a timeout will be detected">>$ConfFile
    echo "# every time there is low traffic between the master and the slave.">>$ConfFile
    echo "#">>$ConfFile
    echo "# repl-timeout 60">>$ConfFile
    echo "">>$ConfFile
    echo "# Disable TCP_NODELAY on the slave socket after SYNC?">>$ConfFile
    echo "#">>$ConfFile
    echo "# If you select \"yes\" Redis will use a smaller number of TCP packets and">>$ConfFile
    echo "# less bandwidth to send data to slaves. But this can add a delay for">>$ConfFile
    echo "# the data to appear on the slave side, up to 40 milliseconds with">>$ConfFile
    echo "# Linux kernels using a default configuration.">>$ConfFile
    echo "#">>$ConfFile
    echo "# If you select \"no\" the delay for data to appear on the slave side will">>$ConfFile
    echo "# be reduced but more bandwidth will be used for replication.">>$ConfFile
    echo "#">>$ConfFile
    echo "# By default we optimize for low latency, but in very high traffic conditions">>$ConfFile
    echo "# or when the master and slaves are many hops away, turning this to \"yes\" may">>$ConfFile
    echo "# be a good idea.">>$ConfFile
    echo "repl-disable-tcp-nodelay no">>$ConfFile
    echo "">>$ConfFile
    echo "# Set the replication backlog size. The backlog is a buffer that accumulates">>$ConfFile
    echo "# slave data when slaves are disconnected for some time, so that when a slave">>$ConfFile
    echo "# wants to reconnect again, often a full resync is not needed, but a partial">>$ConfFile
    echo "# resync is enough, just passing the portion of data the slave missed while">>$ConfFile
    echo "# disconnected.">>$ConfFile
    echo "#">>$ConfFile
    echo "# The bigger the replication backlog, the longer the time the slave can be">>$ConfFile
    echo "# disconnected and later be able to perform a partial resynchronization.">>$ConfFile
    echo "#">>$ConfFile
    echo "# The backlog is only allocated once there is at least a slave connected.">>$ConfFile
    echo "#">>$ConfFile
    echo "# repl-backlog-size 1mb">>$ConfFile
    echo "">>$ConfFile
    echo "# After a master has no longer connected slaves for some time, the backlog">>$ConfFile
    echo "# will be freed. The following option configures the amount of seconds that">>$ConfFile
    echo "# need to elapse, starting from the time the last slave disconnected, for">>$ConfFile
    echo "# the backlog buffer to be freed.">>$ConfFile
    echo "#">>$ConfFile
    echo "# A value of 0 means to never release the backlog.">>$ConfFile
    echo "#">>$ConfFile
    echo "# repl-backlog-ttl 3600">>$ConfFile
    echo "">>$ConfFile
    echo "# The slave priority is an integer number published by Redis in the INFO output.">>$ConfFile
    echo "# It is used by Redis Sentinel in order to select a slave to promote into a">>$ConfFile
    echo "# master if the master is no longer working correctly.">>$ConfFile
    echo "#">>$ConfFile
    echo "# A slave with a low priority number is considered better for promotion, so">>$ConfFile
    echo "# for instance if there are three slaves with priority 10, 100, 25 Sentinel will">>$ConfFile
    echo "# pick the one with priority 10, that is the lowest.">>$ConfFile
    echo "#">>$ConfFile
    echo "# However a special priority of 0 marks the slave as not able to perform the">>$ConfFile
    echo "# role of master, so a slave with priority of 0 will never be selected by">>$ConfFile
    echo "# Redis Sentinel for promotion.">>$ConfFile
    echo "#">>$ConfFile
    echo "# By default the priority is 100.">>$ConfFile
    echo "slave-priority 100">>$ConfFile
    echo "">>$ConfFile
    echo "# It is possible for a master to stop accepting writes if there are less than">>$ConfFile
    echo "# N slaves connected, having a lag less or equal than M seconds.">>$ConfFile
    echo "#">>$ConfFile
    echo "# The N slaves need to be in \"online\" state.">>$ConfFile
    echo "#">>$ConfFile
    echo "# The lag in seconds, that must be <= the specified value, is calculated from">>$ConfFile
    echo "# the last ping received from the slave, that is usually sent every second.">>$ConfFile
    echo "#">>$ConfFile
    echo "# This option does not GUARANTEE that N replicas will accept the write, but">>$ConfFile
    echo "# will limit the window of exposure for lost writes in case not enough slaves">>$ConfFile
    echo "# are available, to the specified number of seconds.">>$ConfFile
    echo "#">>$ConfFile
    echo "# For example to require at least 3 slaves with a lag <= 10 seconds use:">>$ConfFile
    echo "#">>$ConfFile
    echo "# min-slaves-to-write 3">>$ConfFile
    echo "# min-slaves-max-lag 10">>$ConfFile
    echo "#">>$ConfFile
    echo "# Setting one or the other to 0 disables the feature.">>$ConfFile
    echo "#">>$ConfFile
    echo "# By default min-slaves-to-write is set to 0 (feature disabled) and">>$ConfFile
    echo "# min-slaves-max-lag is set to 10.">>$ConfFile
    echo "">>$ConfFile
    echo "################################## SECURITY ###################################">>$ConfFile
    echo "">>$ConfFile
    echo "# Require clients to issue AUTH <PASSWORD> before processing any other">>$ConfFile
    echo "# commands.  This might be useful in environments in which you do not trust">>$ConfFile
    echo "# others with access to the host running redis-server.">>$ConfFile
    echo "#">>$ConfFile
    echo "# This should stay commented out for backward compatibility and because most">>$ConfFile
    echo "# people do not need auth (e.g. they run their own servers).">>$ConfFile
    echo "#">>$ConfFile
    echo "# Warning: since Redis is pretty fast an outside user can try up to">>$ConfFile
    echo "# 150k passwords per second against a good box. This means that you should">>$ConfFile
    echo "# use a very strong password otherwise it will be very easy to break.">>$ConfFile
    echo "#">>$ConfFile
    echo "# requirepass foobared">>$ConfFile
    echo "">>$ConfFile
    echo "# Command renaming.">>$ConfFile
    echo "#">>$ConfFile
    echo "# It is possible to change the name of dangerous commands in a shared">>$ConfFile
    echo "# environment. For instance the CONFIG command may be renamed into something">>$ConfFile
    echo "# hard to guess so that it will still be available for internal-use tools">>$ConfFile
    echo "# but not available for general clients.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Example:">>$ConfFile
    echo "#">>$ConfFile
    echo "# rename-command CONFIG b840fc02d524045429941cc15f59e41cb7be6c52">>$ConfFile
    echo "#">>$ConfFile
    echo "# It is also possible to completely kill a command by renaming it into">>$ConfFile
    echo "# an empty string:">>$ConfFile
    echo "#">>$ConfFile
    echo "# rename-command CONFIG \"\"">>$ConfFile
    echo "#">>$ConfFile
    echo "# Please note that changing the name of commands that are logged into the">>$ConfFile
    echo "# AOF file or transmitted to slaves may cause problems.">>$ConfFile
    echo "">>$ConfFile
    echo "################################### LIMITS ####################################">>$ConfFile
    echo "">>$ConfFile
    echo "# Set the max number of connected clients at the same time. By default">>$ConfFile
    echo "# this limit is set to 10000 clients, however if the Redis server is not">>$ConfFile
    echo "# able to configure the process file limit to allow for the specified limit">>$ConfFile
    echo "# the max number of allowed clients is set to the current file limit">>$ConfFile
    echo "# minus 32 (as Redis reserves a few file descriptors for internal uses).">>$ConfFile
    echo "#">>$ConfFile
    echo "# Once the limit is reached Redis will close all the new connections sending">>$ConfFile
    echo "# an error 'max number of clients reached'.">>$ConfFile
    echo "#">>$ConfFile
    echo "# maxclients 10000">>$ConfFile
    echo "">>$ConfFile
    echo "# Don't use more memory than the specified amount of bytes.">>$ConfFile
    echo "# When the memory limit is reached Redis will try to remove keys">>$ConfFile
    echo "# according to the eviction policy selected (see maxmemory-policy).">>$ConfFile
    echo "#">>$ConfFile
    echo "# If Redis can't remove keys according to the policy, or if the policy is">>$ConfFile
    echo "# set to 'noeviction', Redis will start to reply with errors to commands">>$ConfFile
    echo "# that would use more memory, like SET, LPUSH, and so on, and will continue">>$ConfFile
    echo "# to reply to read-only commands like GET.">>$ConfFile
    echo "#">>$ConfFile
    echo "# This option is usually useful when using Redis as an LRU cache, or to set">>$ConfFile
    echo "# a hard memory limit for an instance (using the 'noeviction' policy).">>$ConfFile
    echo "#">>$ConfFile
    echo "# WARNING: If you have slaves attached to an instance with maxmemory on,">>$ConfFile
    echo "# the size of the output buffers needed to feed the slaves are subtracted">>$ConfFile
    echo "# from the used memory count, so that network problems / resyncs will">>$ConfFile
    echo "# not trigger a loop where keys are evicted, and in turn the output">>$ConfFile
    echo "# buffer of slaves is full with DELs of keys evicted triggering the deletion">>$ConfFile
    echo "# of more keys, and so forth until the database is completely emptied.">>$ConfFile
    echo "#">>$ConfFile
    echo "# In short... if you have slaves attached it is suggested that you set a lower">>$ConfFile
    echo "# limit for maxmemory so that there is some free RAM on the system for slave">>$ConfFile
    echo "# output buffers (but this is not needed if the policy is 'noeviction').">>$ConfFile
    echo "#">>$ConfFile
    echo "# maxmemory <bytes>">>$ConfFile
    echo "">>$ConfFile
    echo "# MAXMEMORY POLICY: how Redis will select what to remove when maxmemory">>$ConfFile
    echo "# is reached. You can select among five behaviors:">>$ConfFile
    echo "#">>$ConfFile
    echo "# volatile-lru -> remove the key with an expire set using an LRU algorithm">>$ConfFile
    echo "# allkeys-lru -> remove any key according to the LRU algorithm">>$ConfFile
    echo "# volatile-random -> remove a random key with an expire set">>$ConfFile
    echo "# allkeys-random -> remove a random key, any key">>$ConfFile
    echo "# volatile-ttl -> remove the key with the nearest expire time (minor TTL)">>$ConfFile
    echo "# noeviction -> don't expire at all, just return an error on write operations">>$ConfFile
    echo "#">>$ConfFile
    echo "# Note: with any of the above policies, Redis will return an error on write">>$ConfFile
    echo "#       operations, when there are no suitable keys for eviction.">>$ConfFile
    echo "#">>$ConfFile
    echo "#       At the date of writing these commands are: set setnx setex append">>$ConfFile
    echo "#       incr decr rpush lpush rpushx lpushx linsert lset rpoplpush sadd">>$ConfFile
    echo "#       sinter sinterstore sunion sunionstore sdiff sdiffstore zadd zincrby">>$ConfFile
    echo "#       zunionstore zinterstore hset hsetnx hmset hincrby incrby decrby">>$ConfFile
    echo "#       getset mset msetnx exec sort">>$ConfFile
    echo "#">>$ConfFile
    echo "# The default is:">>$ConfFile
    echo "#">>$ConfFile
    echo "# maxmemory-policy noeviction">>$ConfFile
    echo "">>$ConfFile
    echo "# LRU and minimal TTL algorithms are not precise algorithms but approximated">>$ConfFile
    echo "# algorithms (in order to save memory), so you can tune it for speed or">>$ConfFile
    echo "# accuracy. For default Redis will check five keys and pick the one that was">>$ConfFile
    echo "# used less recently, you can change the sample size using the following">>$ConfFile
    echo "# configuration directive.">>$ConfFile
    echo "#">>$ConfFile
    echo "# The default of 5 produces good enough results. 10 Approximates very closely">>$ConfFile
    echo "# true LRU but costs a bit more CPU. 3 is very fast but not very accurate.">>$ConfFile
    echo "#">>$ConfFile
    echo "# maxmemory-samples 5">>$ConfFile
    echo "">>$ConfFile
    echo "############################## APPEND ONLY MODE ###############################">>$ConfFile
    echo "">>$ConfFile
    echo "# By default Redis asynchronously dumps the dataset on disk. This mode is">>$ConfFile
    echo "# good enough in many applications, but an issue with the Redis process or">>$ConfFile
    echo "# a power outage may result into a few minutes of writes lost (depending on">>$ConfFile
    echo "# the configured save points).">>$ConfFile
    echo "#">>$ConfFile
    echo "# The Append Only File is an alternative persistence mode that provides">>$ConfFile
    echo "# much better durability. For instance using the default data fsync policy">>$ConfFile
    echo "# (see later in the config file) Redis can lose just one second of writes in a">>$ConfFile
    echo "# dramatic event like a server power outage, or a single write if something">>$ConfFile
    echo "# wrong with the Redis process itself happens, but the operating system is">>$ConfFile
    echo "# still running correctly.">>$ConfFile
    echo "#">>$ConfFile
    echo "# AOF and RDB persistence can be enabled at the same time without problems.">>$ConfFile
    echo "# If the AOF is enabled on startup Redis will load the AOF, that is the file">>$ConfFile
    echo "# with the better durability guarantees.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Please check http://redis.io/topics/persistence for more information.">>$ConfFile
    echo "">>$ConfFile
    echo "appendonly no">>$ConfFile
    echo "">>$ConfFile
    echo "# The name of the append only file (default: \"appendonly.aof\")">>$ConfFile
    echo "">>$ConfFile
    echo "appendfilename \"appendonly.aof\"">>$ConfFile
    echo "">>$ConfFile
    echo "# The fsync() call tells the Operating System to actually write data on disk">>$ConfFile
    echo "# instead of waiting for more data in the output buffer. Some OS will really flush">>$ConfFile
    echo "# data on disk, some other OS will just try to do it ASAP.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Redis supports three different modes:">>$ConfFile
    echo "#">>$ConfFile
    echo "# no: don't fsync, just let the OS flush the data when it wants. Faster.">>$ConfFile
    echo "# always: fsync after every write to the append only log. Slow, Safest.">>$ConfFile
    echo "# everysec: fsync only one time every second. Compromise.">>$ConfFile
    echo "#">>$ConfFile
    echo "# The default is \"everysec\", as that's usually the right compromise between">>$ConfFile
    echo "# speed and data safety. It's up to you to understand if you can relax this to">>$ConfFile
    echo "# \"no\" that will let the operating system flush the output buffer when">>$ConfFile
    echo "# it wants, for better performances (but if you can live with the idea of">>$ConfFile
    echo "# some data loss consider the default persistence mode that's snapshotting),">>$ConfFile
    echo "# or on the contrary, use \"always\" that's very slow but a bit safer than">>$ConfFile
    echo "# everysec.">>$ConfFile
    echo "#">>$ConfFile
    echo "# More details please check the following article:">>$ConfFile
    echo "# http://antirez.com/post/redis-persistence-demystified.html">>$ConfFile
    echo "#">>$ConfFile
    echo "# If unsure, use \"everysec\".">>$ConfFile
    echo "">>$ConfFile
    echo "# appendfsync always">>$ConfFile
    echo "appendfsync everysec">>$ConfFile
    echo "# appendfsync no">>$ConfFile
    echo "">>$ConfFile
    echo "# When the AOF fsync policy is set to always or everysec, and a background">>$ConfFile
    echo "# saving process (a background save or AOF log background rewriting) is">>$ConfFile
    echo "# performing a lot of I/O against the disk, in some Linux configurations">>$ConfFile
    echo "# Redis may block too long on the fsync() call. Note that there is no fix for">>$ConfFile
    echo "# this currently, as even performing fsync in a different thread will block">>$ConfFile
    echo "# our synchronous write(2) call.">>$ConfFile
    echo "#">>$ConfFile
    echo "# In order to mitigate this problem it's possible to use the following option">>$ConfFile
    echo "# that will prevent fsync() from being called in the main process while a">>$ConfFile
    echo "# BGSAVE or BGREWRITEAOF is in progress.">>$ConfFile
    echo "#">>$ConfFile
    echo "# This means that while another child is saving, the durability of Redis is">>$ConfFile
    echo "# the same as \"appendfsync none\". In practical terms, this means that it is">>$ConfFile
    echo "# possible to lose up to 30 seconds of log in the worst scenario (with the">>$ConfFile
    echo "# default Linux settings).">>$ConfFile
    echo "#">>$ConfFile
    echo "# If you have latency problems turn this to \"yes\". Otherwise leave it as">>$ConfFile
    echo "# \"no\" that is the safest pick from the point of view of durability.">>$ConfFile
    echo "">>$ConfFile
    echo "no-appendfsync-on-rewrite no">>$ConfFile
    echo "">>$ConfFile
    echo "# Automatic rewrite of the append only file.">>$ConfFile
    echo "# Redis is able to automatically rewrite the log file implicitly calling">>$ConfFile
    echo "# BGREWRITEAOF when the AOF log size grows by the specified percentage.">>$ConfFile
    echo "#">>$ConfFile
    echo "# This is how it works: Redis remembers the size of the AOF file after the">>$ConfFile
    echo "# latest rewrite (if no rewrite has happened since the restart, the size of">>$ConfFile
    echo "# the AOF at startup is used).">>$ConfFile
    echo "#">>$ConfFile
    echo "# This base size is compared to the current size. If the current size is">>$ConfFile
    echo "# bigger than the specified percentage, the rewrite is triggered. Also">>$ConfFile
    echo "# you need to specify a minimal size for the AOF file to be rewritten, this">>$ConfFile
    echo "# is useful to avoid rewriting the AOF file even if the percentage increase">>$ConfFile
    echo "# is reached but it is still pretty small.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Specify a percentage of zero in order to disable the automatic AOF">>$ConfFile
    echo "# rewrite feature.">>$ConfFile
    echo "">>$ConfFile
    echo "auto-aof-rewrite-percentage 100">>$ConfFile
    echo "auto-aof-rewrite-min-size 64mb">>$ConfFile
    echo "">>$ConfFile
    echo "# An AOF file may be found to be truncated at the end during the Redis">>$ConfFile
    echo "# startup process, when the AOF data gets loaded back into memory.">>$ConfFile
    echo "# This may happen when the system where Redis is running">>$ConfFile
    echo "# crashes, especially when an ext4 filesystem is mounted without the">>$ConfFile
    echo "# data=ordered option (however this can't happen when Redis itself">>$ConfFile
    echo "# crashes or aborts but the operating system still works correctly).">>$ConfFile
    echo "#">>$ConfFile
    echo "# Redis can either exit with an error when this happens, or load as much">>$ConfFile
    echo "# data as possible (the default now) and start if the AOF file is found">>$ConfFile
    echo "# to be truncated at the end. The following option controls this behavior.">>$ConfFile
    echo "#">>$ConfFile
    echo "# If aof-load-truncated is set to yes, a truncated AOF file is loaded and">>$ConfFile
    echo "# the Redis server starts emitting a log to inform the user of the event.">>$ConfFile
    echo "# Otherwise if the option is set to no, the server aborts with an error">>$ConfFile
    echo "# and refuses to start. When the option is set to no, the user requires">>$ConfFile
    echo "# to fix the AOF file using the \"redis-check-aof\" utility before to restart">>$ConfFile
    echo "# the server.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Note that if the AOF file will be found to be corrupted in the middle">>$ConfFile
    echo "# the server will still exit with an error. This option only applies when">>$ConfFile
    echo "# Redis will try to read more data from the AOF file but not enough bytes">>$ConfFile
    echo "# will be found.">>$ConfFile
    echo "aof-load-truncated yes">>$ConfFile
    echo "">>$ConfFile
    echo "################################ LUA SCRIPTING  ###############################">>$ConfFile
    echo "">>$ConfFile
    echo "# Max execution time of a Lua script in milliseconds.">>$ConfFile
    echo "#">>$ConfFile
    echo "# If the maximum execution time is reached Redis will log that a script is">>$ConfFile
    echo "# still in execution after the maximum allowed time and will start to">>$ConfFile
    echo "# reply to queries with an error.">>$ConfFile
    echo "#">>$ConfFile
    echo "# When a long running script exceeds the maximum execution time only the">>$ConfFile
    echo "# SCRIPT KILL and SHUTDOWN NOSAVE commands are available. The first can be">>$ConfFile
    echo "# used to stop a script that did not yet called write commands. The second">>$ConfFile
    echo "# is the only way to shut down the server in the case a write command was">>$ConfFile
    echo "# already issued by the script but the user doesn't want to wait for the natural">>$ConfFile
    echo "# termination of the script.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Set it to 0 or a negative value for unlimited execution without warnings.">>$ConfFile
    echo "lua-time-limit 5000">>$ConfFile
    echo "">>$ConfFile
    echo "################################ REDIS CLUSTER  ###############################">>$ConfFile
    echo "#">>$ConfFile
    echo "# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++">>$ConfFile
    echo "# WARNING EXPERIMENTAL: Redis Cluster is considered to be stable code, however">>$ConfFile
    echo "# in order to mark it as \"mature\" we need to wait for a non trivial percentage">>$ConfFile
    echo "# of users to deploy it in production.">>$ConfFile
    echo "# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++">>$ConfFile
    echo "#">>$ConfFile
    echo "# Normal Redis instances can't be part of a Redis Cluster; only nodes that are">>$ConfFile
    echo "# started as cluster nodes can. In order to start a Redis instance as a">>$ConfFile
    echo "# cluster node enable the cluster support uncommenting the following:">>$ConfFile
    echo "#">>$ConfFile
    echo "cluster-enabled yes">>$ConfFile
    echo "">>$ConfFile
    echo "# Every cluster node has a cluster configuration file. This file is not">>$ConfFile
    echo "# intended to be edited by hand. It is created and updated by Redis nodes.">>$ConfFile
    echo "# Every Redis Cluster node requires a different cluster configuration file.">>$ConfFile
    echo "# Make sure that instances running in the same system do not have">>$ConfFile
    echo "# overlapping cluster configuration file names.">>$ConfFile
    echo "#">>$ConfFile
    echo "cluster-config-file nodes-${PortNum_Func}.conf">>$ConfFile
    echo "">>$ConfFile
    echo "# Cluster node timeout is the amount of milliseconds a node must be unreachable">>$ConfFile
    echo "# for it to be considered in failure state.">>$ConfFile
    echo "# Most other internal time limits are multiple of the node timeout.">>$ConfFile
    echo "#">>$ConfFile
    echo "cluster-node-timeout 15000">>$ConfFile
    echo "">>$ConfFile
    echo "# A slave of a failing master will avoid to start a failover if its data">>$ConfFile
    echo "# looks too old.">>$ConfFile
    echo "#">>$ConfFile
    echo "# There is no simple way for a slave to actually have a exact measure of">>$ConfFile
    echo "# its \"data age\", so the following two checks are performed:">>$ConfFile
    echo "#">>$ConfFile
    echo "# 1) If there are multiple slaves able to failover, they exchange messages">>$ConfFile
    echo "#    in order to try to give an advantage to the slave with the best">>$ConfFile
    echo "#    replication offset (more data from the master processed).">>$ConfFile
    echo "#    Slaves will try to get their rank by offset, and apply to the start">>$ConfFile
    echo "#    of the failover a delay proportional to their rank.">>$ConfFile
    echo "#">>$ConfFile
    echo "# 2) Every single slave computes the time of the last interaction with">>$ConfFile
    echo "#    its master. This can be the last ping or command received \(if the master">>$ConfFile
    echo "#    is still in the \"connected\" state\), or the time that elapsed since the">>$ConfFile
    echo "#    disconnection with the master (if the replication link is currently down).">>$ConfFile
    echo "#    If the last interaction is too old, the slave will not try to failover">>$ConfFile
    echo "#    at all.">>$ConfFile
    echo "#">>$ConfFile
    echo "# The point \"2\" can be tuned by user. Specifically a slave will not perform">>$ConfFile
    echo "# the failover if, since the last interaction with the master, the time">>$ConfFile
    echo "# elapsed is greater than:">>$ConfFile
    echo "#">>$ConfFile
    echo "#   (node-timeout * slave-validity-factor) + repl-ping-slave-period">>$ConfFile
    echo "#">>$ConfFile
    echo "# So for example if node-timeout is 30 seconds, and the slave-validity-factor">>$ConfFile
    echo "# is 10, and assuming a default repl-ping-slave-period of 10 seconds, the">>$ConfFile
    echo "# slave will not try to failover if it was not able to talk with the master">>$ConfFile
    echo "# for longer than 310 seconds.">>$ConfFile
    echo "#">>$ConfFile
    echo "# A large slave-validity-factor may allow slaves with too old data to failover">>$ConfFile
    echo "# a master, while a too small value may prevent the cluster from being able to">>$ConfFile
    echo "# elect a slave at all.">>$ConfFile
    echo "#">>$ConfFile
    echo "# For maximum availability, it is possible to set the slave-validity-factor">>$ConfFile
    echo "# to a value of 0, which means, that slaves will always try to failover the">>$ConfFile
    echo "# master regardless of the last time they interacted with the master.">>$ConfFile
    echo "# (However they'll always try to apply a delay proportional to their">>$ConfFile
    echo "# offset rank).">>$ConfFile
    echo "#">>$ConfFile
    echo "# Zero is the only value able to guarantee that when all the partitions heal">>$ConfFile
    echo "# the cluster will always be able to continue.">>$ConfFile
    echo "#">>$ConfFile
    echo "# cluster-slave-validity-factor 10">>$ConfFile
    echo "">>$ConfFile
    echo "# Cluster slaves are able to migrate to orphaned masters, that are masters">>$ConfFile
    echo "# that are left without working slaves. This improves the cluster ability">>$ConfFile
    echo "# to resist to failures as otherwise an orphaned master can't be failed over">>$ConfFile
    echo "# in case of failure if it has no working slaves.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Slaves migrate to orphaned masters only if there are still at least a">>$ConfFile
    echo "# given number of other working slaves for their old master. This number">>$ConfFile
    echo "# is the \"migration barrier\". A migration barrier of 1 means that a slave">>$ConfFile
    echo "# will migrate only if there is at least 1 other working slave for its master">>$ConfFile
    echo "# and so forth. It usually reflects the number of slaves you want for every">>$ConfFile
    echo "# master in your cluster.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Default is 1 (slaves migrate only if their masters remain with at least">>$ConfFile
    echo "# one slave). To disable migration just set it to a very large value.">>$ConfFile
    echo "# A value of 0 can be set but is useful only for debugging and dangerous">>$ConfFile
    echo "# in production.">>$ConfFile
    echo "#">>$ConfFile
    echo "# cluster-migration-barrier 1">>$ConfFile
    echo "">>$ConfFile
    echo "# By default Redis Cluster nodes stop accepting queries if they detect there">>$ConfFile
    echo "# is at least an hash slot uncovered (no available node is serving it).">>$ConfFile
    echo "# This way if the cluster is partially down (for example a range of hash slots">>$ConfFile
    echo "# are no longer covered) all the cluster becomes, eventually, unavailable.">>$ConfFile
    echo "# It automatically returns available as soon as all the slots are covered again.">>$ConfFile
    echo "#">>$ConfFile
    echo "# However sometimes you want the subset of the cluster which is working,">>$ConfFile
    echo "# to continue to accept queries for the part of the key space that is still">>$ConfFile
    echo "# covered. In order to do so, just set the cluster-require-full-coverage">>$ConfFile
    echo "# option to no.">>$ConfFile
    echo "#">>$ConfFile
    echo "# cluster-require-full-coverage yes">>$ConfFile
    echo "">>$ConfFile
    echo "# In order to setup your cluster make sure to read the documentation">>$ConfFile
    echo "# available at http://redis.io web site.">>$ConfFile
    echo "">>$ConfFile
    echo "################################## SLOW LOG ###################################">>$ConfFile
    echo "">>$ConfFile
    echo "# The Redis Slow Log is a system to log queries that exceeded a specified">>$ConfFile
    echo "# execution time. The execution time does not include the I/O operations">>$ConfFile
    echo "# like talking with the client, sending the reply and so forth,">>$ConfFile
    echo "# but just the time needed to actually execute the command (this is the only">>$ConfFile
    echo "# stage of command execution where the thread is blocked and can not serve">>$ConfFile
    echo "# other requests in the meantime).">>$ConfFile
    echo "#">>$ConfFile
    echo "# You can configure the slow log with two parameters: one tells Redis">>$ConfFile
    echo "# what is the execution time, in microseconds, to exceed in order for the">>$ConfFile
    echo "# command to get logged, and the other parameter is the length of the">>$ConfFile
    echo "# slow log. When a new command is logged the oldest one is removed from the">>$ConfFile
    echo "# queue of logged commands.">>$ConfFile
    echo "">>$ConfFile
    echo "# The following time is expressed in microseconds, so 1000000 is equivalent">>$ConfFile
    echo "# to one second. Note that a negative number disables the slow log, while">>$ConfFile
    echo "# a value of zero forces the logging of every command.">>$ConfFile
    echo "slowlog-log-slower-than 10000">>$ConfFile
    echo "">>$ConfFile
    echo "# There is no limit to this length. Just be aware that it will consume memory.">>$ConfFile
    echo "# You can reclaim memory used by the slow log with SLOWLOG RESET.">>$ConfFile
    echo "slowlog-max-len 128">>$ConfFile
    echo "">>$ConfFile
    echo "################################ LATENCY MONITOR ##############################">>$ConfFile
    echo "">>$ConfFile
    echo "# The Redis latency monitoring subsystem samples different operations">>$ConfFile
    echo "# at runtime in order to collect data related to possible sources of">>$ConfFile
    echo "# latency of a Redis instance.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Via the LATENCY command this information is available to the user that can">>$ConfFile
    echo "# print graphs and obtain reports.">>$ConfFile
    echo "#">>$ConfFile
    echo "# The system only logs operations that were performed in a time equal or">>$ConfFile
    echo "# greater than the amount of milliseconds specified via the">>$ConfFile
    echo "# latency-monitor-threshold configuration directive. When its value is set">>$ConfFile
    echo "# to zero, the latency monitor is turned off.">>$ConfFile
    echo "#">>$ConfFile
    echo "# By default latency monitoring is disabled since it is mostly not needed">>$ConfFile
    echo "# if you don't have latency issues, and collecting data has a performance">>$ConfFile
    echo "# impact, that while very small, can be measured under big load. Latency">>$ConfFile
    echo "# monitoring can easily be enabled at runtime using the command">>$ConfFile
    echo "# \"CONFIG SET latency-monitor-threshold <milliseconds>\" if needed.">>$ConfFile
    echo "latency-monitor-threshold 0">>$ConfFile
    echo "">>$ConfFile
    echo "############################# EVENT NOTIFICATION ##############################">>$ConfFile
    echo "">>$ConfFile
    echo "# Redis can notify Pub/Sub clients about events happening in the key space.">>$ConfFile
    echo "# This feature is documented at http://redis.io/topics/notifications">>$ConfFile
    echo "#">>$ConfFile
    echo "# For instance if keyspace events notification is enabled, and a client">>$ConfFile
    echo "# performs a DEL operation on key \"foo\" stored in the Database 0, two">>$ConfFile
    echo "# messages will be published via Pub/Sub:">>$ConfFile
    echo "#">>$ConfFile
    echo "# PUBLISH __keyspace@0__:foo del">>$ConfFile
    echo "# PUBLISH __keyevent@0__:del foo">>$ConfFile
    echo "#">>$ConfFile
    echo "# It is possible to select the events that Redis will notify among a set">>$ConfFile
    echo "# of classes. Every class is identified by a single character:">>$ConfFile
    echo "#">>$ConfFile
    echo "#  K     Keyspace events, published with __keyspace@<db>__ prefix.">>$ConfFile
    echo "#  E     Keyevent events, published with __keyevent@<db>__ prefix.">>$ConfFile
    echo "#  g     Generic commands (non-type specific) like DEL, EXPIRE, RENAME, ...">>$ConfFile
    echo "#  $     String commands">>$ConfFile
    echo "#  l     List commands">>$ConfFile
    echo "#  s     Set commands">>$ConfFile
    echo "#  h     Hash commands">>$ConfFile
    echo "#  z     Sorted set commands">>$ConfFile
    echo "#  x     Expired events (events generated every time a key expires)">>$ConfFile
    echo "#  e     Evicted events (events generated when a key is evicted for maxmemory)">>$ConfFile
    echo "#  A     Alias for g$lshzxe, so that the \"AKE\" string means all the events.">>$ConfFile
    echo "#">>$ConfFile
    echo "#  The \"notify-keyspace-events\" takes as argument a string that is composed">>$ConfFile
    echo "#  of zero or multiple characters. The empty string means that notifications">>$ConfFile
    echo "#  are disabled.">>$ConfFile
    echo "#">>$ConfFile
    echo "#  Example: to enable list and generic events, from the point of view of the">>$ConfFile
    echo "#           event name, use:">>$ConfFile
    echo "#">>$ConfFile
    echo "#  notify-keyspace-events Elg">>$ConfFile
    echo "#">>$ConfFile
    echo "#  Example 2: to get the stream of the expired keys subscribing to channel">>$ConfFile
    echo "#             name __keyevent@0__:expired use:">>$ConfFile
    echo "#">>$ConfFile
    echo "notify-keyspace-events Ex">>$ConfFile
    echo "#">>$ConfFile
    echo "#  By default all notifications are disabled because most users don't need">>$ConfFile
    echo "#  this feature and the feature has some overhead. Note that if you don't">>$ConfFile
    echo "#  specify at least one of K or E, no events will be delivered.">>$ConfFile
    echo "# notify-keyspace-events \"\"">>$ConfFile
    echo "">>$ConfFile
    echo "############################### ADVANCED CONFIG ###############################">>$ConfFile
    echo "">>$ConfFile
    echo "# Hashes are encoded using a memory efficient data structure when they have a">>$ConfFile
    echo "# small number of entries, and the biggest entry does not exceed a given">>$ConfFile
    echo "# threshold. These thresholds can be configured using the following directives.">>$ConfFile
    echo "hash-max-ziplist-entries 512">>$ConfFile
    echo "hash-max-ziplist-value 64">>$ConfFile
    echo "">>$ConfFile
    echo "# Similarly to hashes, small lists are also encoded in a special way in order">>$ConfFile
    echo "# to save a lot of space. The special representation is only used when">>$ConfFile
    echo "# you are under the following limits:">>$ConfFile
    echo "list-max-ziplist-entries 512">>$ConfFile
    echo "list-max-ziplist-value 64">>$ConfFile
    echo "">>$ConfFile
    echo "# Sets have a special encoding in just one case: when a set is composed">>$ConfFile
    echo "# of just strings that happen to be integers in radix 10 in the range">>$ConfFile
    echo "# of 64 bit signed integers.">>$ConfFile
    echo "# The following configuration setting sets the limit in the size of the">>$ConfFile
    echo "# set in order to use this special memory saving encoding.">>$ConfFile
    echo "set-max-intset-entries 512">>$ConfFile
    echo "">>$ConfFile
    echo "# Similarly to hashes and lists, sorted sets are also specially encoded in">>$ConfFile
    echo "# order to save a lot of space. This encoding is only used when the length and">>$ConfFile
    echo "# elements of a sorted set are below the following limits:">>$ConfFile
    echo "zset-max-ziplist-entries 128">>$ConfFile
    echo "zset-max-ziplist-value 64">>$ConfFile
    echo "">>$ConfFile
    echo "# HyperLogLog sparse representation bytes limit. The limit includes the">>$ConfFile
    echo "# 16 bytes header. When an HyperLogLog using the sparse representation crosses">>$ConfFile
    echo "# this limit, it is converted into the dense representation.">>$ConfFile
    echo "#">>$ConfFile
    echo "# A value greater than 16000 is totally useless, since at that point the">>$ConfFile
    echo "# dense representation is more memory efficient.">>$ConfFile
    echo "#">>$ConfFile
    echo "# The suggested value is ~ 3000 in order to have the benefits of">>$ConfFile
    echo "# the space efficient encoding without slowing down too much PFADD,">>$ConfFile
    echo "# which is O(N) with the sparse encoding. The value can be raised to">>$ConfFile
    echo "# ~ 10000 when CPU is not a concern, but space is, and the data set is">>$ConfFile
    echo "# composed of many HyperLogLogs with cardinality in the 0 - 15000 range.">>$ConfFile
    echo "hll-sparse-max-bytes 3000">>$ConfFile
    echo "">>$ConfFile
    echo "# Active rehashing uses 1 millisecond every 100 milliseconds of CPU time in">>$ConfFile
    echo "# order to help rehashing the main Redis hash table (the one mapping top-level">>$ConfFile
    echo "# keys to values). The hash table implementation Redis uses (see dict.c)">>$ConfFile
    echo "# performs a lazy rehashing: the more operation you run into a hash table">>$ConfFile
    echo "# that is rehashing, the more rehashing \"steps\" are performed, so if the">>$ConfFile
    echo "# server is idle the rehashing is never complete and some more memory is used">>$ConfFile
    echo "# by the hash table.">>$ConfFile
    echo "#">>$ConfFile
    echo "# The default is to use this millisecond 10 times every second in order to">>$ConfFile
    echo "# actively rehash the main dictionaries, freeing memory when possible.">>$ConfFile
    echo "#">>$ConfFile
    echo "# If unsure:">>$ConfFile
    echo "# use \"activerehashing no\" if you have hard latency requirements and it is">>$ConfFile
    echo "# not a good thing in your environment that Redis can reply from time to time">>$ConfFile
    echo "# to queries with 2 milliseconds delay.">>$ConfFile
    echo "#">>$ConfFile
    echo "# use \"activerehashing yes\" if you don't have such hard requirements but">>$ConfFile
    echo "# want to free memory asap when possible.">>$ConfFile
    echo "activerehashing yes">>$ConfFile
    echo "">>$ConfFile
    echo "# The client output buffer limits can be used to force disconnection of clients">>$ConfFile
    echo "# that are not reading data from the server fast enough for some reason (a">>$ConfFile
    echo "# common reason is that a Pub/Sub client can't consume messages as fast as the">>$ConfFile
    echo "# publisher can produce them).">>$ConfFile
    echo "#">>$ConfFile
    echo "# The limit can be set differently for the three different classes of clients:">>$ConfFile
    echo "#">>$ConfFile
    echo "# normal -> normal clients including MONITOR clients">>$ConfFile
    echo "# slave  -> slave clients">>$ConfFile
    echo "# pubsub -> clients subscribed to at least one pubsub channel or pattern">>$ConfFile
    echo "#">>$ConfFile
    echo "# The syntax of every client-output-buffer-limit directive is the following:">>$ConfFile
    echo "#">>$ConfFile
    echo "# client-output-buffer-limit <class> <hard limit> <soft limit> <soft seconds>">>$ConfFile
    echo "#">>$ConfFile
    echo "# A client is immediately disconnected once the hard limit is reached, or if">>$ConfFile
    echo "# the soft limit is reached and remains reached for the specified number of">>$ConfFile
    echo "# seconds (continuously).">>$ConfFile
    echo "# So for instance if the hard limit is 32 megabytes and the soft limit is">>$ConfFile
    echo "# 16 megabytes / 10 seconds, the client will get disconnected immediately">>$ConfFile
    echo "# if the size of the output buffers reach 32 megabytes, but will also get">>$ConfFile
    echo "# disconnected if the client reaches 16 megabytes and continuously overcomes">>$ConfFile
    echo "# the limit for 10 seconds.">>$ConfFile
    echo "#">>$ConfFile
    echo "# By default normal clients are not limited because they don't receive data">>$ConfFile
    echo "# without asking (in a push way), but just after a request, so only">>$ConfFile
    echo "# asynchronous clients may create a scenario where data is requested faster">>$ConfFile
    echo "# than it can read.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Instead there is a default limit for pubsub and slave clients, since">>$ConfFile
    echo "# subscribers and slaves receive data in a push fashion.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Both the hard or the soft limit can be disabled by setting them to zero.">>$ConfFile
    echo "client-output-buffer-limit normal 0 0 0">>$ConfFile
    echo "client-output-buffer-limit slave 256mb 64mb 60">>$ConfFile
    echo "client-output-buffer-limit pubsub 32mb 8mb 60">>$ConfFile
    echo "">>$ConfFile
    echo "# Redis calls an internal function to perform many background tasks, like">>$ConfFile
    echo "# closing connections of clients in timeout, purging expired keys that are">>$ConfFile
    echo "# never requested, and so forth.">>$ConfFile
    echo "#">>$ConfFile
    echo "# Not all tasks are performed with the same frequency, but Redis checks for">>$ConfFile
    echo "# tasks to perform according to the specified \"hz\" value.">>$ConfFile
    echo "#">>$ConfFile
    echo "# By default \"hz\" is set to 10. Raising the value will use more CPU when">>$ConfFile
    echo "# Redis is idle, but at the same time will make Redis more responsive when">>$ConfFile
    echo "# there are many keys expiring at the same time, and timeouts may be">>$ConfFile
    echo "# handled with more precision.">>$ConfFile
    echo "#">>$ConfFile
    echo "# The range is between 1 and 500, however a value over 100 is usually not">>$ConfFile
    echo "# a good idea. Most users should use the default of 10 and raise this up to">>$ConfFile
    echo "# 100 only in environments where very low latency is required.">>$ConfFile
    echo "hz 10">>$ConfFile
    echo "">>$ConfFile
    echo "# When a child rewrites the AOF file, if the following option is enabled">>$ConfFile
    echo "# the file will be fsync-ed every 32 MB of data generated. This is useful">>$ConfFile
    echo "# in order to commit the file to the disk more incrementally and avoid">>$ConfFile
    echo "# big latency spikes.">>$ConfFile
    echo "aof-rewrite-incremental-fsync yes">>$ConfFile
}

setup=0
if [$# -ne 2]; then 
	ipnum=$1
	portnum=$2
	setup=1
	rm -rf ./IpAndPort
else 
    echo
elif [ ! -f "./IpAndPort" -a  ! -s "./IpAndPort"  ];then
	ipnum=3
	portnum=3
	setup=1
fi

#if [ ! -f "./IpAndPort" -a  ! -s "./IpAndPort"  ] ; then
if [ $setup -eq 1 ]; then
    echo "================================================"
    echo " "
    echo " 安装提示：期望你能相对仔细的阅读安装提示。"
    echo " "
    echo "================================================"
    sleep 1
    echo " "
    echo "请按照顺序依次输入$ipnum 个服务器的IP地址(该地址为$ipnum 台服务器能够互联的局域网地址)!，一起按Ctrl键和C键，将终止本程序"
    echo " "
    echo "IP地址形如: 123.234.134.124 按Enter键完成一次输入"
    echo " "
    echo "================================================"
    sleep 1
    echo $portnum
    for ((ip=1; ip<=$ipnum; ip++))
    do 
	echo " "
	echo "请输入第$ip 台服务器的IP地址："
	read IP${ip}
	echo -n "$[IP${ip}]" >> IpAndPort
        echo -n  " " >> IpAndPort
	echo " "
	echo "================================================"
    done
	
    echo "请按照“ 相同顺序  ”依次输入用于Redis集群的$portnum 个端口号(该端口号应该已经被讨论确定过)："
    echo " "
    echo "端口号范围: 1-65535"
    echo " "
    echo " "
    echo "================================================"
    sleep 1
    for ((port=1; port<=$portnum;port++))
    do
	echo " "
	echo "请输入第$portnum 个端口号："
	read Port${port}
	echo -n "$[Port${port}]" >> IpAndPort
        echo -n  " " >> IpAndPort
	echo " "
	echo "================================================"
    done	
   # echo "$IP1 $IP2 $IP3 $IP4 $IP5 $Port1 $Port2 $Port3 ">IpAndPort 
    sleep 1

fi
echo "================================================"
echo " "
echo "请输入本服务器用于组建Redis集群的IP地址(该地址为五台服务器能够互联的局域网地址)："
read IP6
echo " "
echo "================================================"
echo " "
echo " "
echo "输入结束，集群正在部署..."
echo " "
echo " "
sleep 2

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
OutputConf $IP6 $Port1
OutputConf $IP6 $Port2
OutputConf $IP6 $Port3

if [ -d "/etc/RedisCluster" ]; then
    mv /etc/RedisCluster /etc/RedisCluster_$(date +%F)
fi

mv ./$IP6/RedisCluster /etc/

redis-server /etc/RedisCluster/$Port1/redis.conf
redis-server /etc/RedisCluster/$Port2/redis.conf
redis-server /etc/RedisCluster/$Port3/redis.conf
if [ ! -a "/etc/init.d/redis_cluster" ]; then
    echo "redis-server /etc/RedisCluster/$Port1/redis.conf" > /etc/init.d/redis_cluster
    echo "redis-server /etc/RedisCluster/$Port2/redis.conf" >> /etc/init.d/redis_cluster
    echo "redis-server /etc/RedisCluster/$Port3/redis.conf" >> /etc/init.d/redis_cluster
    chmod a+x /etc/init.d/redis_cluster
fi

NeedToAdd=$(grep '/etc/init.d/redis_cluster' /etc/rc.local)
if [ -z "$NeedToAdd" ]; then
    echo "/etc/init.d/redis_cluster" >> /etc/rc.local
fi

