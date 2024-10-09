#!/bin/bash
set -x

: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$REGISTRY_UN"
: "$REGISTRY_PW"

echo "$REGISTRY_PW" | docker login "$CONTAINER_REGISTRY" --username "$REGISTRY_UN" --password-stdin

docker push "$CONTAINER_REGISTRY/bookcatalog:$VERSION"
docker push "$CONTAINER_REGISTRY/inventorymanage:$VERSION"

echo "Docker images pushed: $CONTAINER_REGISTRY/bookcatalog:$VERSION and $CONTAINER_REGISTRY/inventorymanage:$VERSION"

