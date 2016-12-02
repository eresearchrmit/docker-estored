#!/bin/bash

openssl x509 -in <(openssl s_client -connect $ESTORED_KENLET_REPOSITORY_HOST:443 -prexit 2>/dev/null) -out ~/kenlet-repository-ssl-certificate.crt
keytool -importcert -noprompt -file ~/kenlet-repository-ssl-certificate.crt -alias kenlet-repo -keystore $JAVA_HOME/jre/lib/security/cacerts -storepass changeit

java -Djava.security.egd=file:/dev/./urandom -Xdebug -Xrunjdwp:server=y,transport=dt_socket,suspend=n -jar /estored/estored.jar --spring.profiles.active=prod