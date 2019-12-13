free -h
#查看swap分区的大小

#删除所有SWAP分区
swapoff -a

#创建swap分区的文件，其中bs是每块的大小，count是块的数量，bs*count，就是swap文件的大小了，这里就是1M*2048=2G 
dd if=/dev/zero of=/root/swapfile bs=1M count=2048

#格式化交换分区文件： 
mkswap /root/swapfile

#启用swap分区文件： 
swapon /root/swapfile

#添加开机启动，修改 /etc/fstab 这个文件，添加或者修改这一行：
# /root/swapfile swap swap defaults 0 0 #适用于redhat或centos系统
# /root/swapfile none swap sw  0 0  #适用于Ubuntu系统
#或者直接执行以下命令写入/etc/fstab
#适用于redhat或centos系统
#echo "/root/swapfile swap swap defaults 0 0" >>/etc/fstab

#适用于Ubuntu系统
echo "/root/swapfile none swap sw  0 0" >>/etc/fstab  

如何查看系统当前的swappiness值？命令如下（数值为60，表示你的内存在使用到100-60=40%的时候，就开始出现有Swap交换分区的使用）：

cat /proc/sys/vm/swappiness
#60
如何配置swappiness值？使用以下命令可以设置swappiness值：

#临时性修改： 
sudo sysctl vm.swappiness=50 

#永久性修改： 
#在/etc/sysctl.conf 文件里添加如下参数： 
#vm.swappiness=50 

#然后重启系统
