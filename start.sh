#!/bin/bash

chmod 770 /var/vmail 
chown vmail:mail /var/vmail

service rsyslog start
service postfix start
service dovecot start
tail -f /dev/null