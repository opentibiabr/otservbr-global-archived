#!/usr/bin/env bash

# Create Build Folder
rm build-env/otserver/ -rf
mkdir -p build-env/otserver/
cp -r ../../cmake build-env/otserver/
cp -r ../../src/ build-env/otserver/
cp ../../CMakeLists.txt build-env/otserver

# Build Server
docker build -f build-env/Dockerfile.build  -t otbuild .
docker run -u $(id -u ${USER}):$(id -g ${USER}) -v `pwd`/build-env/otserver/:/tmp/otserver --rm otbuild

# Create Test Server Folder
rm run-test-env/otserver -rf
mkdir -p run-test-env/otserver
cp build-env/otserver/build/tfs run-test-env/otserver/
cp -r ../../data run-test-env/otserver/
cp ../../config.lua.dist run-test-env/otserver/
cp ../../schema.sql run-test-env/otserver/
cp ../../key.pem run-test-env/otserver/

# Remove Build Folder
rm build-env/otserver/ -rf

# Create Docker Test Network
docker network create test-network

# Start And Populate Test Database
docker stop test-server-db
docker build -f run-test-env/Dockerfile.db -t otserver-db .
docker run --name test-server-db --network test-network --rm -e MYSQL_ROOT_PASSWORD=dbroot -e MYSQL_DATABASE=testdb -e MYSQL_USER=dbuser -e MYSQL_PASSWORD=dbpassword -p "3306:3306" -d otserver-db
# wait until MySQL is really available
if hash mysql 2>/dev/null; then
    printf "Mysql command found!\nWaiting for MySQL to start!"
else
    printf "Mysql command not found!\nPlease, install mysql-client!"
    exit
fi

maxcounter=450
counter=1
while ! mysql --protocol TCP -u"dbuser" -p"dbpassword" -e "show databases;" > /dev/null 2>&1; do
    sleep 5
    counter=`expr $counter + 1`
    if [ $counter -gt $maxcounter ]; then
        >&2 echo "We have been waiting for MySQL too long already; failing."
        exit 1
    fi;
done

# Prepate server
unrar x -o+ run-test-env/otserver/data/world/world.rar run-test-env/otserver/data/world/
cp run-test-env/otserver/config.lua.dist run-test-env/otserver/config.lua
local_ip=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | head -n1 | awk '{print $1;}')
sed -i "/ip = \"127.0.0.1\"/c\ip = \"$local_ip\"" run-test-env/otserver/config.lua
sed -i '/mysqlHost = .*$/c\mysqlHost = "test-server-db"' run-test-env/otserver/config.lua
sed -i '/mysqlUser = .*$/c\mysqlUser = "dbuser"' run-test-env/otserver/config.lua
sed -i '/mysqlPass = .*$/c\mysqlPass = "dbpassword"' run-test-env/otserver/config.lua
sed -i '/mysqlDatabase = .*$/c\mysqlDatabase = "testdb"' run-test-env/otserver/config.lua

# Change MinClientVersion with client 10.98
sed -i '/clientVersionMin = .*$/c\clientVersionMin = 1098' run-test-env/otserver/config.lua

# Run Server
docker build -f run-test-env/Dockerfile.run  -t ottserver .
docker run -it -u $(id -u ${USER}):$(id -g ${USER}) --network test-network -p 7171:7171 -p 7172:7172 -v `pwd`/run-test-env/otserver:/tmp/otserver --rm ottserver

# Clean Env
docker stop test-server-db
docker network rm test-network
