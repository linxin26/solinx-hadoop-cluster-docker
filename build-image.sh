#!/bin/bash

#docker network create --driver=bridge solinx-hadoop
echo -e "build docker hadoop image\n"
docker build --no-cache -t solinx/hadoop:0.1 .
# 添加路由route add 172.19.0.0 MASK 255.255.0.0 10.0.75.2