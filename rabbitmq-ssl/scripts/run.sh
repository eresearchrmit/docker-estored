#!/bin/sh

# Make sure the rabbitmq user owns directories that may be mounts
chown -R rabbitmq:rabbitmq /var/lib/rabbitmq/mnesia
chown -R rabbitmq:rabbitmq /var/log/rabbitmq

# Create Rabbitmq users
( /scripts/waitforit.sh -t 30 $RABBITMQ_BROKER_HOST:15672 -- echo "RabbitMQ is up" && \
rabbitmqctl add_vhost /estored && \
rabbitmqctl add_user $RABBITMQ_USER_NAME $RABBITMQ_USER_PASSWORD 2>/dev/null && \
rabbitmqctl set_user_tags $RABBITMQ_USER_NAME user && \
rabbitmqctl set_permissions -p /estored $RABBITMQ_USER_NAME  ".*" ".*" ".*" && \
rabbitmqctl add_user $RABBITMQ_CONSUMER_NAME $RABBITMQ_CONSUMER_PASSWORD 2>/dev/null && \
rabbitmqctl set_user_tags $RABBITMQ_CONSUMER_NAME user && \
rabbitmqctl set_permissions -p /estored $RABBITMQ_CONSUMER_NAME  ".*" ".*" ".*" && \
echo "*** Users creation completed. ***" && \
rabbitmqctl list_permissions -p /estored) &
rabbitmq-server $@