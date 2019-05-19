#!/bin/bash
ulimit -c unlimited
while true; do 


sudo apt-get update
sudo apt-get upgrade
sudo apt-get install apache2
sudo apt-get install php
sudo apt-get install mysql-server
sudo apt-get install libapache2-mod-auth-mysql
sudo apt-get install php-mysql
sudo apt-get install phpmyadmin
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install libboost-all-dev
sudo apt-get install php7.0-xml
sudo apt-get install php7.0-gd
sudo apt-get install php7.0-curl
sudo apt-get install php-mbstring php7.0-mbstring php-gettext
sudo apt-get install php7.0-xml
sudo apt-get update
sudo apt-get upgrade
sudo ln -s /usr/share/phpmyadmin /var/www/html
sudo apt-get install git cmake build-essential liblua5.2-dev libgmp3-dev libmariadbclient-dev libboost-system-dev libboost-iostreams-dev libpugixml-dev libcrypto++-dev
sudo /etc/init.d/apache2 reload
done