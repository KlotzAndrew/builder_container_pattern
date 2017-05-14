#! /usr/bin/env bash

set -ex

SECRET_VAR=$1

if [ "$(docker ps -a | grep builder_cont)" ]; then docker rm builder_cont; fi

docker build -t builder_img --no-cache -f Dockerfile.build .

docker run \
  -e PASSWORD=$SECRET_VAR \
  -e PASSWORD_2=$SECRET_VAR \
  --name builder_cont builder_img

docker cp builder_cont:/code .

docker rm builder_cont
