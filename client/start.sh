#!/usr/bin/env sh

docker build . -t mz/webpack
docker run -p 8080:8080 -p 8081:8081 mz/webpack
