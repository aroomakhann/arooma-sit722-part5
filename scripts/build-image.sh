#!/bin/bash
set -x

: "$CONTAINER_REGISTRY"
: "$VERSION"

docker compose -f docker.yaml up --build -d

echo "Images are built."
