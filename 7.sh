#!/bin/sh
# 输入一个数字运行对应的一个命令，
# 如1是date，2是ls等等

echo "*cmd meau** 0-quit 1-date 2-ls 3-who 4-pwd"
while :; do
	read -p "please input a number 0-4: " n #实现类似用户交互的效果
	case "$n" in
	0)
		exit
		;;
	1)
		date
		break
		;;
	2)
		ls
		break
		;;
	3)
		who
		break
		;;
	4)
		pwd
		break
		;;
	*)
		echo "wrong input"
		;;
	esac
done
