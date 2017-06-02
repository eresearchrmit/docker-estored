#!/bin/bash

openssl x509 -in <(openssl s_client -connect $ESTORED_KENLET_REPOSITORY_HOST:$ESTORED_KENLET_REPOSITORY_SSL_PORT -prexit 2>/dev/null) -out ~/kenlet-repository-ssl-certificate.crt
keytool -importcert -noprompt -file ~/kenlet-repository-ssl-certificate.crt -alias kenlet-repo -keystore $JAVA_HOME/jre/lib/security/cacerts -storepass changeit

# Wait for the MySQL server to be up and running
/scripts/waitforit.sh -t 240 $MYSQL_HOST:$MYSQL_PORT -- echo "MySQL DB is up"

java -jar /estored/estored.jar --spring.profiles.active=prod