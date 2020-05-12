#!/usr/bin/env sh

set -e

echo `which wget`

until wget http://influxdb:8086/ping; do
  echo "InfluxDB is unavailable - sleeping for 5 seconds"
  sleep 5
done

wget -qO- --post-data="q=create database r2_analytics with duration inf name autogen" http://influxdb:8086/query

if [ "${1:0:1}" = '-' ]; then
    set -- chronograf "$@"
fi

if [ "$1" = 'chronograf' ]; then
  export BOLT_PATH=${BOLT_PATH:-/var/lib/chronograf/chronograf-v1.db}
fi

exec "$@"
