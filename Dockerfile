FROM alpine:3.8

ARG luarocks_version=3.0.0

RUN apk --no-cache add --virtual build-dependencies wget \
 && wget http://luarocks.github.io/luarocks/releases/luarocks-${luarocks_version}.tar.gz \
 && tar xvf luarocks-${luarocks_version}.tar.gz \
 && apk del build-dependencies
