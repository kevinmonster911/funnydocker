#!/usr/bin/env bash

. ./functions.sh

activeMachine $1
docker run --name mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7
docker run -it --link thrall-db:mysql --rm mysql \
sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'