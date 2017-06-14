#!/bin/sh

# Make sure the rabbitmq user owns directories that may be mounts
chown -R rabbitmq:rabbitmq /var/lib/rabbitmq/mnesia
chown -R rabbitmq:rabbitmq /var/log/rabbitmq

# Create Rabbitmq users
( /scripts/waitforit.sh -t 30 $RABBITMQ_BROKER_HOST:15672 -- echo "RabbitMQ is up" && \

# Admin user (all permissions on '/' virtual host)
rabbitmqctl add_user $RABBITMQ_ADMIN_NAME $RABBITMQ_ADMIN_PASSWORD 2>/dev/null && \
rabbitmqctl set_user_tags $RABBITMQ_ADMIN_NAME administrator && \
rabbitmqctl set_permissions -p / $RABBITMQ_ADMIN_NAME  ".*" ".*" ".*" && \

# Create a custom Virtual Host
rabbitmqctl add_vhost $RABBITMQ_VHOST && \

# User with read/write permissions on the virtual host
rabbitmqctl add_user $RABBITMQ_USER_NAME $RABBITMQ_USER_PASSWORD 2>/dev/null && \
rabbitmqctl set_user_tags $RABBITMQ_USER_NAME user && \
rabbitmqctl set_permissions -p $RABBITMQ_VHOST $RABBITMQ_USER_NAME  ".*" ".*" ".*" && \

# User with permissions ONLY FOR STOMP SUBSCRIPTIONS CHANNELS on the virtual host
rabbitmqctl add_user $RABBITMQ_CONSUMER_NAME $RABBITMQ_CONSUMER_PASSWORD 2>/dev/null && \
rabbitmqctl set_user_tags $RABBITMQ_CONSUMER_NAME user && \
# rabbitmqctl set_permissions -p /estored $RABBITMQ_CONSUMER_NAME  ".*" ".*" ".*" && \ 
rabbitmqctl set_permissions -p $RABBITMQ_VHOST $RABBITMQ_CONSUMER_NAME  "stomp-subscription.+" "stomp-subscription.+" "^(amq\.topic|stomp-subscription.+)$" && \

echo "*** Users creation completed. ***" && \
rabbitmqctl delete_user rabbitmquser && \
rabbitmqctl list_permissions -p $RABBITMQ_VHOST) &
rabbitmq-server $@