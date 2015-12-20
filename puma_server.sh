#!/bin/bash
if [ "$1" = "restart" ];then
echo "restarting production server, using puma"
restart puma-manager
docker run -p 127.0.0.1:3306:3306 --net=host --restart=always -d fiorix/freegeoip
fi

if [ "$1" = "stop" ];then
echo "stop production server, using puma"
stop puma-manager
fi

if [ "$1" = "start" ];then

echo "starting production server, using puma"
start puma-manager
docker run -p 127.0.0.1:3306:3306 --net=host --restart=always -d fiorix/freegeoip
fi
