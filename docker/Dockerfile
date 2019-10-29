FROM alpine:edge
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
  binutils \
  boost-dev \
  boost-iostreams \
  boost-system \
  build-base \
  clang \
  cmake \
  crypto++ \
  crypto++-dev \
  gcc \
  gmp \
  gmp-dev \
  luajit \
  luajit-dev \
  make \
  mariadb-connector-c \
  mariadb-connector-c-dev \
  pugixml \
  pugixml-dev \
  git

RUN git clone https://github.com/gabime/spdlog.git /tmp/spdlog \
 && mkdir /tmp/spdlog/build && cd /tmp/spdlog/build \
 && cmake .. && make && make install

RUN ln -s /usr/lib/libcryptopp.so /usr/lib/libcryptopp.so.5.6

WORKDIR /otserver

ENTRYPOINT rm -rf build && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Debug -DDEBUG_LOG=ON .. && make -j`nproc` && mv -f tfs ../ && cd .. && ./tfs