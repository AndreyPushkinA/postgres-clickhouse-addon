#!/bin/bash

echo "CREATE DATABASE IF NOT EXISTS clickhouse ENGINE = MaterializedPostgreSQL('192.168.100.237:5432', 'homeassistant', 'homeassistant', 'homeassistant');" | clickhouse-client --host 192.168.100.237 --port 9000
