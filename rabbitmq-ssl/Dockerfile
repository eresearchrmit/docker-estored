FROM rabbitmq:latest

MAINTAINER Guillaume Prevost <guillaume.prevost@rmit.edu.au>

# Enable required plugins
RUN  rabbitmq-plugins enable rabbitmq_management rabbitmq_stomp rabbitmq_web_stomp

# Copy the config file
ADD rabbitmq.config /etc/rabbitmq/rabbitmq.config

# Copy the SSL Certificates
ADD ssl/ca/cacert.pem /etc/rabbitmq/ssl/ca/cacert.pem
RUN chmod 777 /etc/rabbitmq/ssl/ca/cacert.pem
ADD ssl/server/rabbitmq.cert.pem /etc/rabbitmq/ssl/server/rabbitmq.cert.pem
RUN chmod 777 /etc/rabbitmq/ssl/server/rabbitmq.cert.pem
ADD ssl/server/rabbitmq.key.pem /etc/rabbitmq/ssl/server/rabbitmq.key.pem
RUN chmod 777 /etc/rabbitmq/ssl/server/rabbitmq.key.pem

ADD scripts /scripts
RUN chmod +x /scripts/*.sh

# Ports are:
# * 5672 TCP AMQP
# * 5671 SSL AMQP
# * 61613 TCP STOMP
# * 61614 SSL STOMP
# * 15671 SSL Web STOMP
# * 15672 Management
# * 15674 Web STOMP
EXPOSE 5671 61613 61614 15671 15672 15674

CMD ["/scripts/run.sh"]