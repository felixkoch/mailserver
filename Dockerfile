FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install postfix dovecot-imapd rsyslog


RUN useradd -r -u 150 -g mail -d /var/vmail -s /sbin/nologin -c "Virtual maildir handler" vmail \
    && mkdir /var/vmail \
    && chmod 770 /var/vmail \
    && chown vmail:mail /var/vmail

COPY start.sh /usr/local/bin/
RUN chmod a+rx /usr/local/bin/start.sh

VOLUME ["/home"]
CMD ["/usr/local/bin/start.sh"]