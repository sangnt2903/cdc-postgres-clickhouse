#! /bin/bash

set -e

echo "Stopping existing containers..."
docker compose down
echo "[v] Stopped existing containers"

echo "Building custom connect image..."
docker build -t debezium/custom-connect:latest .
echo "[v] Image: debezium/custom-connect:latest"

docker compose up -d
