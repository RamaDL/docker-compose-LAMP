#!/bin/sh

# # Get certs
# certbot certonly -n -d example.com -d www.example.com\
#   --standalone --preferred-challenges http --email DOMAIN_EMAIL --agree-tos --expand

# # Kick off cron
# /usr/sbin/crond -f -d 8 &

/bin/sh /env_replace.sh
# Start nginx
/usr/sbin/nginx -g "daemon off;"