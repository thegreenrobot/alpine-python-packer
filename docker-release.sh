#!/bin/bash -e

REVISION=$(git rev-parse HEAD)

build_docker_image () {
  docker build --tag "thegreenrobot/alpine-python-packer" --file ./Dockerfile .
  docker tag thegreenrobot/alpine-python-packer:latest thegreenrobot/alpine-python-packer:$REVISION
}

upload_docker_image () {
  docker push thegreenrobot/alpine-python-packer:latest
  docker push thegreenrobot/alpine-python-packer:$REVISION
}

echo "Building docker image..."
build_docker_image
echo "Uploading docker image..."
upload_docker_image
echo "Success!"
