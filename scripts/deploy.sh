#!/bin/bash
set -x

: "$CONTAINER_REGISTRY"
: "$VERSION"

kubectl apply -f ./scripts/kubernetes/deploy.yaml

echo "Deployment successful!"
