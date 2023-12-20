#!/bin/sh
#检测本地所有磁盘分区读写是否正常
#即：遍历所有挂载点，新建一个测试文件，再删除测试文件
#如果新建和删除没问题则分区没问题

#关键问题就在于如何去遍历所有挂载点
#df -h| 显示所有文件系统情况
#grep -v 'tmpfs|snapfuse|none|rootfs'| 将tmpfs后面这些排除掉，tmps是内存不需要，其余的根据实际情况去除
#sed '1d'| 去掉第一行
#awk '{print $NF}' 保留最后一列$NF

for mount_p in $(df -h | grep -v 'tmpfs|snapfuse|none|rootfs' | sed '1d' | awk '{print $NF}'); do
	touch $mount_p/testfile && rm -f $mount_p/testfile
	if [ $? -ne 0 ]; then
		echo "$mount_p have problem"
	else
		echo "$mount_p everything right"
	fi
done
