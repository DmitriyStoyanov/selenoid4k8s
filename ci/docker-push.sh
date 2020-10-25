#!/bin/bash

set -e

docker build -t "${IMAGE_NAME}" .
docker tag "${IMAGE_NAME}" "${IMAGE_NAME}":"$1"
#docker tag $GITHUB_REPOSITORY selenoid/hub:$1
#docker tag $GITHUB_REPOSITORY aandryashin/selenoid:$1
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker push "${IMAGE_NAME}"
docker push "${IMAGE_NAME}":"$1"
#docker push selenoid/hub:$1
#docker push aandryashin/selenoid:$1
