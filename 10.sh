#!/bin/sh
#一个带参数的脚本，下载文件，参数有两个
#第一个参数是文件下载链接；
#第二个参数是目录
#tips 注意考虑目录不存在的情况，脚本需要提示是否创建目录

while :; do
	if [ -d $2 ]; then #存在目录就不询问了
		break
	else
		read -p "目录不存在，是否创建？" yn #目录不存在询问
		case "$yn" in
		y | Y)
			mkdir -p $2
			break
			;;
		n | N)
			##退出脚本
			exit2
			;;
		*)
			echo
			ehco "无法识别"
			continue
			;;
		esac
	fi
done

#进入指定目录
cd $2
wget $1

if [ $? -eq 0 ]; then
	echo "done"
	exit 0
else
	echo "failure"
	exit 1
fi
