set -u

: "$CONTAINER_REGISTRY"
: "$VERSION"

docker compose -f docker.yaml up --build -d

echo "Images are built."
