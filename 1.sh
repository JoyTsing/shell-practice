#!/bin/sh
### 写一个脚本，遍历/data/下的txt文件
# 然后将这些txt文件备份
# 备份的文件名增加一个年月日后缀，如atmp.txt -> atmp.txt_20231001

#定义后缀变量 date和+号之间一定要有空格
suffix=$(date +%Y%m%d)
#寻找目录
for f in $(find ./data/ -type f -name "*.txt"); do
	echo "backup file $f"
	cp ${f} ${f}_${suffix}
done
