FROM alpine:latest

LABEL maintainer="RamaDL ramirodldeveloper@gmail.com" 

WORKDIR /www

RUN apk add --no-cache  certbot nginx \
    && adduser -D -g 'www' www \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /www \
    && mkdir -p /run/nginx \
    && mv /etc/nginx/nginx.conf /etc/nginx/default.nginx.conf \
    && mkdir /var/lib/certbot

COPY ./assets/nginx.conf /etc/nginx/nginx.conf 
#CUSTOM change YOUR_DOMAIN_NAME with your domain name
COPY ./assets/docker-apache.conf ./assets/ssl-params.inc ./assets/proxy_set_header.inc /etc/nginx/conf.d/
VOLUME [ "/Users/prostack/Desktop/lpm/:/etc/letsencrypt/" ]
# Copy renew cron script
COPY ./assets/renew /etc/periodic/weekly/renew
# Copy entrypoint
COPY ./assets/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh \
    && chmod +x /etc/periodic/weekly/renew

#ENTRYPOINT [ "../entrypoint.sh" ]
CMD ["nginx", "-g", "daemon off;"]