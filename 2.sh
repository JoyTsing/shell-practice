#!/bin/sh
# 创建10个用户，并给他们设置随机密码，密码记录到一个文件里，文件名是userinfo.txt
# 用户从user_00 到user_09
# 密码是包含大小写字母数字的15位

if [ -f /tmp/userinfo.txt ]; then
	rm -r /tmp/userinfo.txt
fi

# 判断命令是否存在，用该命令生成随机字符串
if ! which mkpasswd; then
	apt install expect
fi

for i in $(seq -w 0 09); do
	#生成一个随机字符串并赋值给p变量
	#如果不需要特殊符号就用-s 0取消使用
	p=$(mkpasswd -l 15 -s 0)
	#添加用户
	useradd user_${i} && echo "${p}" | passwd --stdin user_${i}
	echo "user_${i} ${p}" >>/tmp/userinfo.txt
done
