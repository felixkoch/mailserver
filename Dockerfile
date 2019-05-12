FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install postfix dovecot-imapd rsyslog

COPY start.sh /usr/local/bin/
RUN chmod a+rx /usr/local/bin/start.sh

VOLUME ["/home"]
CMD ["/usr/local/bin/start.sh"]