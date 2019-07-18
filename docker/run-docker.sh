#!/usr/bin/env bash

docker build -f Dockerfile.run  -t otserver .

docker run -u $(id -u ${USER}):$(id -g ${USER}) -p 7171:7171 -p 7172:7172 -v `pwd`/otserver:/tmp/otserver --rm otserver

