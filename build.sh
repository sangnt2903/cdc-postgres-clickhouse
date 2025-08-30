#! /bin/bash

set -e

echo "Building ClickHouse Kafka Connect plugin using Docker..."
cd build/clickhouse-kafka-connect
docker run --rm -v "${PWD}:/workspace" -w /workspace \
    --platform linux/amd64 \
    eclipse-temurin:11-jdk \
    ./gradlew clean confluentJar
cd ../

echo "Preparing plugin directory..."
rm -rf plugins/clickhouse-kafka-connect-built
mkdir -p plugins/clickhouse-kafka-connect-built
cp build/clickhouse-kafka-connect/build/libs/*.jar plugins/clickhouse-kafka-connect-built/
echo "[v] Built ClickHouse plugin"

echo "Building custom connect image..."
docker build -t debezium/custom-connect:latest .
echo "[v] Image: debezium/custom-connect:latest"
