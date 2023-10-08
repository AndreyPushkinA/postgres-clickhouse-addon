#!/bin/bash

get_option_value() {
        grep -A 8 "\"options\"" config.json | grep -m 1 "\"$1\"" | cut -d ':' -f2 | tr -d ' ",'
}

DB_NAME=$(get_option_value "db_name")
PG_HOST=$(get_option_value "pg_host")
PG_PORT=$(get_option_value "pg_port")
PG_DB=$(get_option_value "pg_db")
PG_USER=$(get_option_value "pg_user")
PG_PASS=$(get_option_value "pg_pass")
CH_HOST=$(get_option_value "ch_host")
CH_PORT=$(get_option_value "ch_port")

echo "CH_PORT value is: '${CH_PORT}'"
echo "CH_PORT value is: '${CH_HOST}'"

echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME} ENGINE = MaterializedPostgreSQL('${PG_HOST}:${PG_PORT}', '${PG_DB}', '${PG_USER}', '${PG_PASS}');" | clickhouse-client --host ${CH_HOST} --port ${CH_PORT}
