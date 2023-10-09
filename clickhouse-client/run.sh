#!/bin/bash

OPTIONS_PATH="/data/options.json"

get_option_value() {
    grep "\"$1\"" $OPTIONS_PATH | cut -d ':' -f2 | tr -d ' ",'
}

DB_NAME=$(get_option_value "db_name")
PG_HOST=$(get_option_value "pg_host")
PG_PORT=$(get_option_value "pg_port")
PG_DB=$(get_option_value "pg_db")
PG_USER=$(get_option_value "pg_user")
PG_PASS=$(get_option_value "pg_pass")
CH_HOST=$(get_option_value "ch_host")
CH_PORT=$(get_option_value "ch_port")

echo "DB_NAME: $DB_NAME"
echo "PG_HOST: $PG_HOST"
echo "PG_PORT: $PG_PORT"
echo "PG_DB: $PG_DB"
echo "PG_USER: $PG_USER"
echo "PG_PASS: $PG_PASS"
echo "CH_HOST: $CH_HOST"
echo "CH_PORT: $CH_PORT"

echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME} ENGINE = MaterializedPostgreSQL('${PG_HOST}:${PG_PORT}', '${PG_DB}', '${PG_USER}', '${PG_PASS}');" | clickhouse-client --host ${CH_HOST} --port ${CH_PORT}
