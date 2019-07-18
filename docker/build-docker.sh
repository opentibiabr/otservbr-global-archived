#!/usr/bin/env bash

docker build -f Dockerfile.build  -t otbuild .

rm build -rf
mkdir -p build/
cp -r ../cmake build/
cp -r ../src/ build/
cp ../CMakeLists.txt build/

docker run -u $(id -u ${USER}):$(id -g ${USER}) -v `pwd`/build:/tmp/otserver --rm otbuild

rm otserver -rf
mkdir otserver
cp build/build/tfs otserver/
cp -r ../data otserver/
cp ../config.lua.dist otserver/
cp ../schema.sql otserver/

rm build -rf

