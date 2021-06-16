#!/bin/bash
# 1. create your volume at first.
docker volume create mysqldata

# 2. start the container
docker run -d \
  --restart=always \
  --name mysql8 \
  -v mysqldata:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=your_simple_password \
  -p your_ip:3306:3306 \
  --cap-add=sys_nice \
  mysql:8.0
  
# 3. connect to apps network
docker network connect apps mysql8
