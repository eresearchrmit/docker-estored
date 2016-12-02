FROM java:8

MAINTAINER Guillaume Prevost <guillaume.prevost@rmit.edu.au>

RUN apt-get -y update \
    && apt-get -y install openssl \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/run.sh"]