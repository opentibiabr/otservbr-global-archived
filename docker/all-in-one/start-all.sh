#!/usr/bin/env bash

DB_USER="otserver"
DB_USER_PASSWORD="otserver"
DB_DATABASE="otserver"

WEB_PORT=8080

OT_IP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
OT_LOGIN_PORT=7171
OT_GAME_PORT=7172

docker network create ot-net

docker run --name ot-db -u $(id -u ${USER}):$(id -g ${USER}) --network=ot-net -d -p 3306:3306 -v `pwd`/db/data:/var/lib/mysql -v `pwd`/db/sql:/docker-entrypoint-initdb.d -e MYSQL_DATABASE=$DB_DATABASE -e MYSQL_USER=$DB_USER -e MYSQL_PASSWORD=$DB_USER_PASSWORD -e MYSQL_RANDOM_ROOT_PASSWORD=yes mariadb:10

maxcounter=45
counter=1
while ! mysql --protocol TCP -u"$DB_USER" -p"$DB_USER_PASSWORD" -e "show databases;" > /dev/null 2>&1; do
    sleep 3
    counter=`expr $counter + 1`
    if [ $counter -gt $maxcounter ]; then
        >&2 echo "We have been waiting for MySQL too long already; failing."
        exit 1
    fi;
done

sed -i "s/ip = \"127.0.0.1\"/ip = '$OT_IP'/g" ./server/config.lua
sed -i 's/mysqlHost = "127.0.0.1"/mysqlHost = "ot-db"/g' ./server/config.lua
sed -i "s/mysqlUser = \"darenum\"/mysqlUser = '$DB_USER'/g" ./server/config.lua
sed -i "s/mysqlPass = \"darenum\"/mysqlPass = '$DB_USER_PASSWORD'/g" ./server/config.lua
sed -i "s/mysqlDatabase = \"database\"/mysqlDatabase = '$DB_DATABASE'/g" ./server/config.lua


docker run --name ot-server -u $(id -u ${USER}):$(id -g ${USER}) --network=ot-net -d -p $OT_LOGIN_PORT:7171 -p $OT_GAME_PORT:7172   -v `pwd`/server:/tmp/otserver otserver
docker run --name ot-web    -u $(id -u ${USER}):$(id -g ${USER}) --network=ot-net -d -p $WEB_PORT:80 -v `pwd`/web/data:/tmp/web/ -v `pwd`/server:/tmp/otserver/ -e WEB_DOCUMENT_ROOT=/tmp/web/ -e WEB_DOCUMENT_INDEX=index.php webdevops/php-nginx:alpine-php7
