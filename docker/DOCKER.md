# Getting Started with docker
### - Requirements
-  Docker 19 and docker-compose 1.17
- Unzip the map in root directory /data/world/world.rar
- Create config.lua in root directory (see /docker/config.lua.docker.dist)
- Add default values to config.lua
- Execute the script root directory /docker/data/download-myaac.sh
##### Default Values (docker-compose.yml)
- Ports: 7171, 7172, 80, 3306
- Database Server: otdb
- Database Name/User/Password: otserver

### - Commands
To compile and start database, webserver and otserver just run
```
$ docker-compose up -d
```
To compile your changes in otserver, just stop and start
```
$ docker-compose down
$ docker-compose up -d
```

### - Observations
- This Dockerfile is just for developments purpose, every time that you stop and start this container it will rebuild the otserver generating a new "tfs" binary in root folder;
- The data folder persist db and webserver data;
- Folders "all-in-one" and "server-only" should be ignored when you are using docker-compose;
