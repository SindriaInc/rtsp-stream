#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Provide an image name as first argument (eg. sindriainc/<repo-slug>)"
    exit 1
fi

if [[ -z "$2" ]]; then
    echo "Provide a tag version as second argument (eg. 1.0.0)"
    exit 1
fi


IMAGE_NAME=$1
TAG_VERSION=$2

HOST_USER_UID=1000
TIMEZONE=Europe/Rome

docker build ./ -f Dockerfile \
    --tag ${IMAGE_NAME}:${TAG_VERSION} \
    --tag ${IMAGE_NAME}:latest \
    --build-arg HOST_USER_UID=${HOST_USER_UID} \
    --build-arg TAG_VERSION=${TAG_VERSION} \
    --build-arg TIMEZONE=${TIMEZONE}

docker build ./ -f Dockerfile.management \
    --tag ${IMAGE_NAME}:${TAG_VERSION}-manager \
    --build-arg HOST_USER_UID=${HOST_USER_UID} \
    --build-arg TAG_VERSION=${TAG_VERSION} \
    --build-arg TIMEZONE=${TIMEZONE}