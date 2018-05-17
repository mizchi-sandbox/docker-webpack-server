#!/usr/bin/env sh

docker build . -p mz/webpack
docker run -p 8080:8080 -p 8081:8081 mz/webpack
