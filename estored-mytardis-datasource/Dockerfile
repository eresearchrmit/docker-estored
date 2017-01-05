FROM java:8

MAINTAINER Guillaume Prevost <guillaume.prevost@rmit.com.au>

ADD ./estored-mytardis-datasource.jar /estored-mytardis-datasource.jar
RUN bash -c 'touch /estored-mytardis-datasource.jar'

VOLUME /certs

ADD scripts /scripts
RUN chmod +x /scripts/*.sh
ENTRYPOINT ["/scripts/run.sh"]

#CMD java -cp estored-mytardis-datasource.jar edu.rmit.eres.estored.datasource.mytardis.MyTardisDatasource