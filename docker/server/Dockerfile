# Stage 1: Download all dependencies
FROM ubuntu AS dependencies

RUN apt-get update && apt-get install -y --no-install-recommends cmake

RUN apt-get update && apt-get install -y --no-install-recommends git

RUN apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates

RUN git clone --depth 1 --branch v1.8.2 https://github.com/gabime/spdlog.git
RUN cd spdlog && mkdir build && cd build

RUN apt-get install -y --no-install-recommends \
	libcurl4-openssl-dev \
	libjsoncpp-dev \
	libmysqlclient-dev \
	libcrypto++-dev \
	libpugixml-dev \
	unzip

RUN apt-get install -y --no-install-recommends libluajit-5.1-dev

RUN apt-get install -y --no-install-recommends \
	libboost-date-time-dev \
	libboost-filesystem-dev \
	libboost-iostreams-dev \
	libboost-system-dev

# Stage 2: create build
FROM dependencies AS build

COPY cmake /srv/cmake
COPY CMakeLists.txt /srv/
COPY src /srv/src

WORKDIR /srv/build

RUN cmake .. && make -j`nproc`

# Stage 3: load data and execute
FROM build

COPY --from=build /srv/build/otbr /bin/otbr
COPY LICENSE *.sql key.pem /otbr/
COPY data /otbr/data
COPY config.lua.dist /otbr/config.lua

WORKDIR /otbr

RUN sed -i '/mysqlHost = .*$/c\mysqlHost = "mysql"' config.lua \
  && sed -i '/mysqlUser = .*$/c\mysqlUser = "otserver"' config.lua \
  && sed -i '/mysqlPass = .*$/c\mysqlPass = "otserver"' config.lua \
  && sed -i '/mysqlDatabase = .*$/c\mysqlDatabase = "otserver"' config.lua \
  && unzip -o data/world/world.zip -d data/world/

VOLUME /otbr

ENTRYPOINT ["/bin/otbr"]

