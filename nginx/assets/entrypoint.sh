#!/bin/sh

#UNCOMENT to validate domain to run over https
# # Validate certs
# certbot certonly -n -d example.com -d www.example.com\
#   --standalone --preferred-challenges http --email DOMAIN_EMAIL --agree-tos --expand

#UNCOMENT to enable check if the https certs are outdates
# # Kick off cron
# /usr/sbin/crond -f -d 8 &

/bin/sh /env_replace.sh
# Start nginx
/usr/sbin/nginx -g "daemon off;"