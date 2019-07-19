#!/usr/bin/env bash


# Build OT Server
docker build -f build-env/Dockerfile.build  -t otbuild .

rm build-env/otserver/ -rf
mkdir -p build-env/otserver/
cp -r ../../cmake build-env/otserver/
cp -r ../../src/ build-env/otserver/
cp ../../CMakeLists.txt build-env/otserver

docker run -u $(id -u ${USER}):$(id -g ${USER}) -v `pwd`/build-env/otserver/:/tmp/otserver --rm otbuild

rm run-test-env/otserver -rf
mkdir -p run-test-env/otserver
cp build-env/otserver/build/tfs run-test-env/otserver/
cp -r ../../data run-test-env/otserver/
cp ../../config.lua.dist run-test-env/otserver/
cp ../../schema.sql run-test-env/otserver/

rm build-env/otserver/ -rf


# Build Database





# Start Server

docker build -f run-env/Dockerfile.run  -t otserver .

docker run -u $(id -u ${USER}):$(id -g ${USER}) -p 7171:7171 -p 7172:7172 -v `pwd`/run-env/otserver:/tmp/otserver --rm otserver

