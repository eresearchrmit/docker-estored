#!/bin/bash

if [ -z "${DATASOURCE_MYTARDIS_ENABLED}" ] || [ "${DATASOURCE_MYTARDIS_ENABLED}" != true ]; then
  echo "MyTardis Datasource is not enabled. Exiting."
  exit 0
fi

# Wait for the RabbitMQ server to be up and running
scripts/waitforit.sh -t 30 $RABBITMQ_BROKER_HOST:15672
scripts/waitforit.sh -t 30 $ESTORED_SERVER_ADDRESS:8080

sleep 15s  # Waits 15 seconds

java -cp estored-mytardis-datasource-1.0.0.jar edu.rmit.eres.estored.datasource.mytardis.MyTardisDatasource