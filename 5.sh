#!/bin/sh
#监控脚本，系统负载超过10则记录系统状态
#思路：
#1）系统负载命令使用uptime查看过于一分钟的平均负载
#2）系统状态使用如下工具查看 top 、vmstat、ss
#3） 20s监控一次
#4）保存在opt/logs下，保留一个月，文件名有`date +%s`后缀

[ -d /opt/logs ] || mkdir -p /opt/logs
while:
do
   load=`uptime | awk -F 'average:' '{print $2}'|cut -d ',' -f1|sed 's/ //g'|cut -d. -f1`
   if [ $load -gt 10 ]
   then 
      top -bn1 | head -n 100 > /opt/logs/top.`date+%s`
      vmstat 1 10 > /opt/logs/vmstat.`date +%s`
      ss -an > /opt/logs/ss.`date +%s`
   fi 
   sleep 20
   find /opt/logs \( -name "top*" -o -name "vmstat*" -o -name "ss*"\) -mtime +30 | xargs rm -r 
 done

