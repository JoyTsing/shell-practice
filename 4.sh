#!/bin/sh
# 检查/data/wwwroot/app目录下的所有文件和目录，查看是否满足下面条件
# 1 文件权限均为644
# 2 目录权限均为755
# 3 目录所有者为www，权限组为root
# 不满足则改成满足，不要直接改权限一定要判断
#
cd /data/wwwroot/app
for f in `find .`;do 
  f_p=`stat -c %a $f`#权限
  f_u=`stat -c %U $f`#所有者
  f_g=`stat -c %G $f`#所属组
  if [ -d $f ];then#是否是目录
    [ $f_p != '755' ] && chmod 755 $f 
  else
    [ $f_p != '644' ] && chmod 644 $f 
  fi  
  [ $f_u != 'www' ] && chown www $f 
  [ $f_g != 'root' ] && chown :root $f  
done
