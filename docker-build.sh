#!/bin/bash

source .env

VERSION_STR=$DOCKER_REPO:$VERSION

docker build -t $VERSION_STR .
docker push $VERSION_STR