#! /bin/bash

echo "Building custom connect image..."
docker build -t debezium/custom-connect:latest .
echo "[v] Image: debezium/custom-connect:latest"

mkdir -p plugins
echo "Downloading clickhouse kafka sink..."
curl -L -o plugins/clickhouse-kafka-sink.jar \
    https://github.com/ClickHouse/clickhouse-kafka-connect/releases/download/v0.4.0/clickhouse-kafka-connect-0.4.0.jar
echo "[v] Clickhouse kafka sink connector"

docker compose up -d
