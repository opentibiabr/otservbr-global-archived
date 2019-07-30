#!/usr/bin/env bash

docker build -f run-env/Dockerfile.run  -t otserver .

docker run -u $(id -u ${USER}):$(id -g ${USER}) -p 7171:7171 -p 7172:7172 -v `pwd`/run-env/otserver:/tmp/otserver --rm otserver

