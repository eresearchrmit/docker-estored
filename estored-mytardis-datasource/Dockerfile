FROM java:8

MAINTAINER Guillaume Prevost <guillaume.prevost@rmit.com.au>

ADD ./estored-mytardis-datasource-1.0.0.jar /estored-mytardis-datasource-1.0.0.jar
RUN bash -c 'touch /estored-mytardis-datasource-1.0.0.jar'

VOLUME /certs

ADD scripts /scripts
RUN chmod +x /scripts/*.sh
ENTRYPOINT ["/scripts/run.sh"]

#CMD java -cp estored-mytardis-datasource-1.0.0.jar edu.rmit.eres.estored.datasource.mytardis.MyTardisDatasource