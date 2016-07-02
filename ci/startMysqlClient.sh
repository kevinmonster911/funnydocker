#!/usr/bin/env bash

docker run --name mysql --link some-mysql:mysql -d application-that-uses-mysql