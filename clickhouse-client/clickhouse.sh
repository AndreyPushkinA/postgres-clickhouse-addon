#!/bin/bash

HA_HOST=$(jq -r '.ha_host' config.json)
PORT=$(jq -r '.port' config.json)
POSTGRES_DATABASE=$(jq -r '.postgres_database' config.json)
POSTGRES_USER=$(jq -r '.postgres_user' config.json)
POSTGRES_PASSWORD=$(jq -r '.postgres_password' config.json)

clickhouse-client --host $HA_HOST --port $PORT

echo "SET allow_experimental_database_materialized_postgresql=1;" | clickhouse-client --host $HA_HOST --port $PORT

echo "CREATE DATABASE clickhouse_db ENGINE = MaterializedPostgreSQL('$HA_HOST:5432', '$POSTGRES_DATABASE', '$POSTGRES_USER', '$POSTGRES_PASSWORD');" | clickhouse-client --host $HA_HOST --port $PORT
