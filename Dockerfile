FROM alpine:3.8

ARG LUA_VERSION=5.3.5
ARG LUAROCKS_VERSION=3.0.0

RUN apk --no-cache add --virtual build-dependencies \
    gcc \
    libc-dev \
    make \
    readline-dev \
 && wget http://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz \
 && tar xvf lua-${LUA_VERSION}.tar.gz \
 && cd lua-${LUA_VERSION} \
 && make linux \
 && make install \
 && cd .. \
 && rm lua-${LUA_VERSION}.tar.gz \
 && wget http://luarocks.github.io/luarocks/releases/luarocks-${LUAROCKS_VERSION}.tar.gz \
 && tar xvf luarocks-${LUAROCKS_VERSION}.tar.gz \
 && cd luarocks-${LUAROCKS_VERSION} \
 && ./configure \
 && make \
 && make install \
 && cd .. \
 && rm luarocks-${LUAROCKS_VERSION}.tar.gz \
 && apk del build-dependencies
