#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Provide an image name as first argument (eg. sindriainc/<repo-slug>)"
    exit 1
fi

if [[ -z "$2" ]]; then
    echo "Provide a tag version as second argument (eg. 1.0.0)"
    exit 1
fi

if [[ -z "$3" ]]; then
    echo "Provide a tag suffix as third argument (eg. 2)"
    exit 1
fi


IMAGE_NAME=$1
TAG_VERSION=$2
TAG_SUFFIX=$3

HOST_USER_UID=1000
TIMEZONE=Europe/Rome
API_URL="https://kms-be-mvr.mobilita.comune.verona.it/api"

docker build ./src/app \
    --tag ${IMAGE_NAME}:${TAG_VERSION}-${TAG_SUFFIX} \
    --tag ${IMAGE_NAME}:latest \
    --build-arg HOST_USER_UID=${HOST_USER_UID} \
    --build-arg TAG_VERSION=${TAG_VERSION} \
    --build-arg TAG_SUFFIX=${TAG_SUFFIX} \
    --build-arg TIMEZONE=${TIMEZONE}

docker build ./src/api \
    --tag ${IMAGE_NAME}:${TAG_VERSION}-${TAG_SUFFIX}-api \
    --build-arg HOST_USER_UID=${HOST_USER_UID} \
    --build-arg TAG_VERSION=${TAG_VERSION} \
    --build-arg TAG_SUFFIX=${TAG_SUFFIX} \
    --build-arg TIMEZONE=${TIMEZONE}

docker build ./src/ui \
    --tag ${IMAGE_NAME}:${TAG_VERSION}-${TAG_SUFFIX}-ui \
    --build-arg HOST_USER_UID=${HOST_USER_UID} \
    --build-arg TAG_VERSION=${TAG_VERSION} \
    --build-arg TAG_SUFFIX=${TAG_SUFFIX} \
    --build-arg TIMEZONE=${TIMEZONE} \
    --build-arg API_URL=${API_URL}