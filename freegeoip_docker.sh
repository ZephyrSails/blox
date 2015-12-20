#!/bin/bash
if [ "$1" = "restart" ];then
  echo "restarting freegeoip, using docker, bind to 127.0.0.1:8081"
  docker stop $(docker ps -a -q)
  docker run --net=host --restart=always -d  fiorix/freegeoip --http "127.0.0.1:8081"
# docker run --net=host --restart=always -d fiorix/freegeoip
fi

if [ "$1" = "stop" ];then
  echo "stoping ALL docker container, hopefully you are just running freegeoip"
  docker stop $(docker ps -a -q)
# stop puma-manager
fi

if [ "$1" = "start" ];then
  echo "starting freegeoip, using docker, bind to 127.0.0.1:8081"
  echo "find more info here: https://github.com/fiorix/freegeoip"
  docker run --net=host --restart=always -d  fiorix/freegeoip --http "127.0.0.1:8081"
fi

if [ "$1" = "test" ];then
  echo "try to run $ curl 127.0.0.1:8081/json/1.2.3.4"
  curl 127.0.0.1:8081/json/1.2.3.4
fi
