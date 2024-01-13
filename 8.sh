#!/bin/bash
#写一个脚本，执行后打印一行提示"please input a number：“
#要求输入为数字，打印出后再次要求输入直至输入”end“
#

while :; do
	read -p "please input a number:(input "end" to quit)" n
	num=$(echo $n | sed -r 's/[0-9]//g' | wc -c)
	if [ $n == "end" ]; then
		exit
	fi
	if [ $num -ne 1 ]; then
		echo "what you input is not a number"
	else
		echo "number is $n"
	fi
done
