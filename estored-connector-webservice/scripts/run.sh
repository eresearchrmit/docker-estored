#!/bin/bash

if [ -z "${CONNECTOR_WEBSERVICE_ENABLED}" ] || [ "${CONNECTOR_WEBSERVICE_ENABLED}" != true ]; then
  echo "Web Service Connector is not enabled. Exiting."
  exit 0
fi

# Wait for the RabbitMQ server to be up and running
scripts/waitforit.sh -t 30 $RABBITMQ_BROKER_HOST:15672

sleep 15s  # Waits 15 seconds

java -cp estored-connector-webservice.jar edu.rmit.eres.estored.connectors.WebServiceConnector
