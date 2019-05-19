#!/bin/bash 


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
sudo apt-get install git cmake build-essential liblua5.2-dev libgmp3-dev libmysqlclient-dev libboost-system-dev libboost-iostreams-dev libpugixml-dev
sudo /etc/init.d/apache2 reload
sudo chmod -R 777  /etc/php5
sudo chmod -R 777  /etc/php
sudo chmod -R 777  /var/www/html
 