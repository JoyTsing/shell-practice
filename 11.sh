#!/bin/sh
# 有两个文件a b，把a中有但是b中没有的行找出来，并写入到c中
# 并计算c中的文件行数

[ -f c.txt ] && rm -f c.txt
cat a.txt | while read line; do
	if ! grep -q "^${line}$" b.txt; then
		echo ${line} >>c.txt
	fi
done
wc -l c.txt
