#!/bin/bash

CONFIG_PATH=/data/options.json

DB_NAME="$(bashio::config 'db_name')"
PG_HOST="$(bashio::config 'pg_host')"
PG_DB="$(bashio::config 'pg_db')"
PG_USER="$(bashio::config 'pg_user')"
PG_PASS="$(bashio::config 'pg_pass')"
CH_HOST="$(bashio::config 'ch_host')"
CH_PORT="$(bashio::config 'ch_port')"

echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME} ENGINE = MaterializedPostgreSQL('${PG_HOST}:${PG_PORT}', '${PG_DB}', '${PG_USER}', '${PG_PASS}');" | clickhouse-client --host ${CH_HOST} --port ${CH_PORT}
