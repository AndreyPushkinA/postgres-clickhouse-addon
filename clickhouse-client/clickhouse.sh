#!/bin/bash

clickhouse-client --host 192.168.100.237 --port 9001

echo "SET allow_experimental_database_materialized_postgresql=1;" | clickhouse-client --host 192.168.100.237 --port 9001

echo "CREATE DATABASE IF NOT EXISTS clickhouse_db ENGINE = MaterializedPostgreSQL('192.168.100.237:5432', 'homeassistant', 'homeassistant', 'homeassistant');" | clickhouse-client --host 192.168.100.237 --port 9001
