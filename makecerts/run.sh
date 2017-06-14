#!/bin/sh


# Create .p12 certificate file
if [ -f /opt/certs/keystore.p12  ]; then \
    echo this script will not overwrite existing certificates.  Remove the existing certs by hand and rerun this command.
    exit 0
fi

keytool -genkey \
		-alias estored \
		-storetype PKCS12 \
		-keyalg RSA \
		-keysize 2048 \
		-keystore /opt/certs/keystore.p12 \
		-validity 3650 \
		-dname "CN=, OU=, O=, L=, S=, C=" \
		-storepass keystorepw

