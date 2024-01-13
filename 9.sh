#!/bin/bash
#写一个脚本 监控某站点的访问是否正常
#提示： 将站点访问以参数形式提供，例如 sh xxx.sh www.xxx.com
#状态码为2xx或者3xx时是正常的

#是否安装 curl
if ! which curl &>/dev/null; then
	echo "没有安装curl"
	apt install curl
	if [ $? -ne 0 ]; then
		echo "没有成功安装curl"
		exit 1
	fi
fi

#获取状态码
code=$(curl --connect-timeout 3 -I $1 2>/dev/null | grep 'Http' | awk '{print $2}')
if echo $code | grep -qE '^2[0-9][0-9]|^3[0-9][0-9]'; then
	echo "$1访问正常"
else
	echo "$1访问不正常"
fi
