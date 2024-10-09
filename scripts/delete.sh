#!/bin/bash
set -x

: "$CONTAINER_REGISTRY"
: "$VERSION"

envsubst < ./scripts/kubernetes/deploy.yaml | kubectl delete -f -

echo "Kubernetes resources deleted."
