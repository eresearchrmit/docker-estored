FROM java:8

MAINTAINER Guillaume Prevost <guillaume.prevost@rmit.com.au>

ADD ./estored-examples-datasource.jar /estored-examples-datasource.jar
RUN bash -c 'touch /estored-examples-datasource.jar'

VOLUME /certs

ADD scripts /scripts
RUN chmod +x /scripts/*.sh
ENTRYPOINT ["/scripts/run.sh"]

#CMD java -cp estored-examples-datasource.jar edu.rmit.eres.estored.datasource.examples.ExamplesDatasource