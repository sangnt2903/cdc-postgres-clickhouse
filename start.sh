#! /bin/bash

echo "Building custom connect image..."
docker build -t debezium/custom-connect:latest .
echo "[v] Image: debezium/custom-connect:latest"

docker compose up -d
