#!/bin/bash

if [ -n "$CASSANDRA_HOSTNAME" ]; then
    CASSANDRA_IP=$(getent hosts $CASSANDRA_HOSTNAME | awk '{ print $1 }')
fi

COMMAND="cassandra-web --hosts $CASSANDRA_IP --port $CASSANDRA_PORT --username $CASSANDRA_USERNAME --password $CASSANDRA_PASSWORD"

echo "Wait for Cassandra ..."
/wait-for.sh "$CASSANDRA_IP:$CASSANDRA_PORT" -- $COMMAND
