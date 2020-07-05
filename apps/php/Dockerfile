FROM alpine:3.7

LABEL maintainer="RamaDL ramirodldeveloper@gmail.com"

WORKDIR /var/www/html/

ADD https://repos.php.earth/alpine/phpearth.rsa.pub /etc/apk/keys/phpearth.rsa.pub

RUN echo "https://repos.php.earth/alpine/v3.7"  >> /etc/apk/repositories \
    && apk --no-cache --update add  php7.1 \
                                    libressl2.6-libcrypto \
                                    php7.1-bcmath \
                                    php7.1-calendar \
                                    php7.1-common \
                                    php7.1-ctype \
                                    php7.1-curl \
                                    php7.1-dom \
                                    php7.1-exif \
                                    php7.1-fileinfo \
                                    php7.1-ftp \
                                    php7.1-gd \
                                    php7.1-gettext \
                                    php7.1-iconv \
                                    php7.1-intl \
                                    php7.1-json \
                                    php7.1-mbstring \
                                    php7.1-mcrypt \
                                    php7.1-mysqli \
                                    php7.1-mysqlnd \
                                    php7.1-openssl \
                                    php7.1-pcntl \
                                    php7.1-pdo \
                                    php7.1-pdo_mysql \
                                    php7.1-pdo_pgsql \
                                    php7.1-pear \
                                    php7.1-pgsql \
                                    php7.1-phar \
                                    php7.1-phpdbg \
                                    php7.1-posix \
                                    php7.1-fileinfo \
                                    php7.1-session \
                                    php7.1-soap \
                                    php7.1-shmop \
                                    php7.1-simplexml \
                                    php7.1-sockets \
                                    php7.1-sysvmsg \
                                    php7.1-sysvsem \
                                    php7.1-sysvshm \
                                    php7.1-tokenizer \
                                    php7.1-wddx \
                                    php7.1-xml \
                                    php7.1-xmlreader \
                                    php7.1-xmlwriter \
                                    php7.1-xsl \
                                    php7.1-opcache \
                                    php7.1-zip \
                                    php7.1-zlib \
                                    php7.1-fpm \
                                    git \
                                    composer \
                                    bash rsync figlet
#git and composer are required for yii2
# bash me es más comodo que sh para hacer el start.sh
# rsync lo uso para meter el codigo en su lugar
# filget me permite generar mesajes más visibles en el log de salida de docker

COPY ./assets/php.ini /etc/php/7.1/php.ini
COPY ./assets/www.conf /etc/php/7.1/php-fpm.d/www.conf

COPY ./assets/start.sh /usr/local/bin/start.sh
RUN chmod a+x /usr/local/bin/start.sh

COPY ./assets/cron.sh /usr/local/bin/cron.sh
RUN chmod a+x /usr/local/bin/cron.sh

ADD code /code_repo/

EXPOSE 9000

CMD ["/usr/local/bin/start.sh"]
