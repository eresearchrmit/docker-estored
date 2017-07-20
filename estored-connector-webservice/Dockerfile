FROM java:8

MAINTAINER Guillaume Prevost <guillaume.prevost@rmit.com.au>

ADD ./estored-connector-webservice.jar /estored-connector-webservice.jar
RUN bash -c 'touch /estored-connector-webservice.jar'

VOLUME /certs

ADD scripts /scripts
RUN chmod +x /scripts/*.sh
ENTRYPOINT ["/scripts/run.sh"]

#CMD java -cp estored-connector-webservice.jar edu.rmit.eres.estored.datasource.mytardis.WebServiceConnector