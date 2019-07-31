#!/usr/bin/env bash

rm build-env/otserver/ -rf
mkdir -p build-env/otserver/
cp -r ../../cmake build-env/otserver/
cp -r ../../src/ build-env/otserver/
cp ../../CMakeLists.txt build-env/otserver

docker run -u $(id -u ${USER}):$(id -g ${USER}) -v `pwd`/build-env/otserver/:/tmp/otserver --rm otbuild

rm server/* -rf
cp build-env/otserver/build/tfs server/
cp -r ../../data server/
cp ../../config.lua.dist server/config.lua
cp ../../schema.sql db/sql/
unrar x -o+ server/data/world/world.rar server/data/world/

rm build-env/ -rf

rm myaac.zip
wget https://github.com/slawkens/myaac/archive/master.zip -O myaac.zip
unzip -o myaac.zip -d .

mv myaac-master/* web/data/
rm myaac.zip myaac-master -rf

