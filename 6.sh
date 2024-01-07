#!/bin/bash
#一台服务器作为web应用，存在一个目录/data/web/attachment
#不定时会被用户上传新的文件，但是不知道具体的时间
#计划做一个5分钟检测一次的脚本，检测是否有新的文件生成
#同时检测完成后如果有新文件生成，将新文件的列表输出到一个按年月日时分为名字的日志中
#
#思路：5分钟使用一次find命令查看是否有更新的文件，有的话输出，没有不输出
#因此计划把输出结果的行数作为比较对象，比较是否大于0，不考虑删除

d=$(date +%Y%m%d%H%M)
basedir=/data/web/attachment

#查看五分钟之内产生的文件
find $basedir/ -type f -mmin -5 >/tmp/newf.txt
##文件中有内容则更改名字，即文件列表日志
if [ -s /tmp/newf.txt ]; then
	mv /tmp/newf.txt /tmp/$d
fi
