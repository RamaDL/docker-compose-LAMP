FROM alpine:latest

LABEL maintainer="RamaDL ramirodldeveloper@gmail.com" 

WORKDIR /www

RUN apk add --no-cache  certbot nginx openssl\
    && adduser -D -g 'www' www \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /www \
    && mkdir -p /run/nginx \
    && mv /etc/nginx/nginx.conf /etc/nginx/default.nginx.conf \
    && mkdir /var/lib/certbot \
    && openssl dhparam -out /etc/nginx/dhparam.pem 4096

COPY ./assets/nginx-config/nginx.conf /etc/nginx/nginx.conf 
COPY ./assets/nginx-config/docker-apache.conf ./assets/nginx-config/ssl-params.inc \ 
     ./assets/nginx-config/proxy_set_header.inc /etc/nginx/conf.d/

# Copy renew cron script
COPY ./assets/ssl/renew /etc/periodic/weekly/renew
# Copy entrypoint
COPY ./assets/entrypoint.sh ./assets/env_replace.sh /
RUN chmod +x /entrypoint.sh /env_replace.sh /etc/periodic/weekly/renew

ENTRYPOINT [ "../entrypoint.sh" ]
#CMD ["nginx", "-g", "daemon off;"]