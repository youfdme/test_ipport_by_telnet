# test_ipport_by_telnet
用于测试指定ip 端口的通畅情况
从当前目录读取 host.txt  中的ip和port信息
host.txt对应格式例如：
127.0.0.1:80

依次读取host.txt的每一行
提取出ip和port 
通过telnet测试端口
当端口开放的时候 telnet $ip $port 默认情况下 
  会输出 Escape character is '^]'.
  通过查找 'Escape' 的数量来进行判断端口通畅情况
  输出  OK
当端口未开放的时候
  输出  Failed
