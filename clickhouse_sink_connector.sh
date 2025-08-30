curl -X POST http://localhost:8083/connectors -H "Content-Type: application/json" -d '{
  "name": "clickhouse-sink-connector",
  "config": {
    "connector.class": "com.clickhouse.kafka.connect.ClickHouseSinkConnector",
    "tasks.max": "1",
    "topics": "pgserver1.public.customer,pgserver1.public.orders",
    "clickhouse.server.url": "http://clickhouse:8123",
    "clickhouse.database": "default",
    "clickhouse.user": "default",
    "clickhouse.password": "",

    "auto.create.tables": "true",
    "auto.evolve": "true",
    "insert.mode": "insert",

    "key.converter": "io.confluent.connect.avro.AvroConverter",
    "key.converter.schema.registry.url": "http://schema-registry:8081",
    "value.converter": "io.confluent.connect.avro.AvroConverter",
    "value.converter.schema.registry.url": "http://schema-registry:8081"
  }
}'
