FROM alpine:3.7

LABEL maintainer="RamaDL ramirodldeveloper@gmail.com" 

WORKDIR /var/www/html

ADD https://repos.php.earth/alpine/phpearth.rsa.pub /etc/apk/keys/phpearth.rsa.pub

RUN echo "https://repos.php.earth/alpine/v3.7"  >> /etc/apk/repositories \
    && mkdir /run/apache2 \
    && addgroup -S httpd \ 
    && adduser -S httpd -G httpd \
    && chown httpd /run/apache2 \
    && chgrp httpd /run/apache2 \
    && apk add --no-cache   apache2 \
                            apache2-proxy

COPY ./assets/httpd.conf /etc/apache2/httpd.conf 
COPY ./assets/default.conf /etc/apache2/conf.d/default.conf

#expose abre los puertos del contenedor para que sean accedido por otros contenedore 
#pero no pueden ser accedidos 
EXPOSE 80/tcp

CMD ["httpd", "-D", "FOREGROUND"]