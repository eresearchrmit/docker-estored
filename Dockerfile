FROM java:8

MAINTAINER Guillaume Prevost <guillaume.prevost@rmit.com.au>

EXPOSE 8080
EXPOSE 8443

ADD ./estored/estored.jar /estored/estored.jar
RUN bash -c 'touch /estored/estored.jar'

VOLUME /certs

ADD estored/scripts /scripts
RUN chmod +x /scripts/*.sh
ENTRYPOINT ["/scripts/run.sh"]

#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Xdebug","-Xrunjdwp:server=y,transport=dt_socket,suspend=n","-jar","/estored/estored.jar", "--spring.profiles.active=prod"]
#CMD java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,suspend=n -jar app.jar