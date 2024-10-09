#!/bin/bash
set -x

: "${CONTAINER_REGISTRY:=arooma123acr.azurecr.io}"
: "$VERSION"
: "$REGISTRY_UN"
: "$REGISTRY_PW"

# Login to the Azure Container Registry
echo "$REGISTRY_PW" | docker login "$CONTAINER_REGISTRY" --username "$REGISTRY_UN" --password-stdin

# Push bookcatalog and inventorymanage images
docker push "$CONTAINER_REGISTRY/bookcatalog:$VERSION"
docker push "$CONTAINER_REGISTRY/inventorymanage:$VERSION"

echo "Docker images pushed: $CONTAINER_REGISTRY/bookcatalog:$VERSION and $CONTAINER_REGISTRY/inventorymanage:$VERSION"
