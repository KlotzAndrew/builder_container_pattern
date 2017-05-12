#! /usr/bin/env bash

set -ex

docker build -t builder_img -f Dockerfile.build .
docker create --name builder_cont builder_img

docker cp builder_cont:/code .
