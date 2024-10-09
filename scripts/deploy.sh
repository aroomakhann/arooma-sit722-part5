set -u  

: "$CONTAINER_REGISTRY"
: "$VERSION"

envsubst < ./scripts/kubernetes/deploy.yaml | kubectl apply -f -

echo "Deployment successful!"
