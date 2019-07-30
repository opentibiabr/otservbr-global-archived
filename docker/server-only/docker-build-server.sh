#!/usr/bin/env bash
docker build -f build-env/Dockerfile.build  -t otbuild .

rm build-env/otserver/ -rf
mkdir -p build-env/otserver/
cp -r ../../cmake build-env/otserver/
cp -r ../../src/ build-env/otserver/
cp ../../CMakeLists.txt build-env/otserver

docker run -u $(id -u ${USER}):$(id -g ${USER}) -v `pwd`/build-env/otserver/:/tmp/otserver --rm otbuild

rm run-env/otserver -rf
mkdir -p run-env/otserver
cp build-env/otserver/build/tfs run-env/otserver/
cp -r ../../data run-env/otserver/
cp ../../config.lua.dist run-env/otserver/
cp ../../schema.sql run-env/otserver/

rm build-env/otserver/ -rf

