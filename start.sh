#!/bin/bash

# 检查 ssserver 是否已经在运行
if ps -ef | grep -v grep | grep -q "ssserver"; then
    echo "ssserver is already running."
else
    nohup /data/data/com.termux/files/usr/bin/ssserver -c /data/data/com.termux/files/home/config.json > /data/data/com.termux/files/usr/ss.log 2>&1 &
    echo "Shadowsocks server started."
fi

# 检查 frpc 是否已经在运行
if ps -ef | grep -v grep | grep -q "frpc"; then
    echo "frpc is already running."
else
    nohup /data/data/com.termux/files/home/frp/frpc -c /data/data/com.termux/files/home/frp/frpc.toml > /data/data/com.termux/files/usr/frpc.log 2>&1 &
    echo "Frp client started."
fi
