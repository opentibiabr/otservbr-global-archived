#!/usr/bin/env bash

docker stop ot-db ot-server ot-web
docker rm ot-db ot-server ot-web

rm server/* -rf
rm web/data/* -rf
rm db/data/* -rf

docker network rm ot-net
