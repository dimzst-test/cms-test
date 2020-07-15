#!/bin/bash

set -euo pipefail
REVISION=$(git rev-parse --verify --short HEAD)
IMAGE_TAG=asia.gcr.io/b-api-production/cms:$REVISION

pushd cms
hugo
popd
docker build -t "$IMAGE_TAG" .
docker push "$IMAGE_TAG"
