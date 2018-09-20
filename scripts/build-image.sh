#!/usr/bin/env bash

set -o errexit

IMAGE_NAME=${IMAGE_NAME:-chuckdha/kube-validate}
IMAGE_TAG=${IMAGE_TAG:-latest}

go test ./...

docker build . -t "${IMAGE_NAME}:${IMAGE_TAG}"
