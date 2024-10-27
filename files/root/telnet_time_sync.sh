#!/bin/sh

# 获取当前时间，格式为 YYYY.MM.DD-hh:mm:ss
sleep 120
date=$(date +"%Y.%m.%d-%H:%M:%S")

# 使用 timeout 命令设置超时时间为 10 秒
timeout 10 sh -c '
(
echo "root"          # Telnet 登录用户名
sleep 1
echo "Pon521"        # Telnet 登录密码
sleep 1
echo "date -s '$date'"  # 设置当前时间，传递完整的时间格式
sleep 1
echo "exit"          # 退出 Telnet
) | telnet 192.168.1.1
'

# 检查 timeout 命令的返回值，如果超时则显示提示信息
if [ $? -eq 124 ]; then
    echo "Telnet connection timed out."
fi