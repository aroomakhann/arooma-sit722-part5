#!/bin/bash
set -x

: "${CONTAINER_REGISTRY:=arooma123acr.azurecr.io}"
: "$VERSION"
: "$REGISTRY_UN"
: "$REGISTRY_PW"

echo "$REGISTRY_PW" | docker login "$CONTAINER_REGISTRY" --username "$REGISTRY_UN" --password-stdin

docker push "$CONTAINER_REGISTRY/bookcatalog:$VERSION"
docker push "$CONTAINER_REGISTRY/inventorymanage:$VERSION"

echo "The images are pushed"
