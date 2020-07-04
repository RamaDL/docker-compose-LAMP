#!/bin/bash

figlet Copy code
# Con esto nos asguramos que el codigo que queda en
# /var/www/html/, que es un volumen que comparten web, php y cron
# sea exactamente el mismo que hay dentro de la imagen
rsync -va --delete /code_repo/ /var/www/html/

figlet Make config.php

# Acá hay que crear o modificar el config usando:
#   MYSQL_USER=db_user
#   MYSQL_DATABASE=db_name
#   MYSQL_PASSWORD=db_pass
#   MYSQL_HOST=db
#
# Se suele usar mucho
# sed -i -e "s/${VARIABLE}/contenido/" $file

figlet Wait MySQL

until (cat < /dev/null > /dev/tcp/${MYSQL_HOST}/3306) 2> /dev/null
do
  echo .
  sleep 0.1
done
echo MySQL responding tcp.

figlet Set Database

# Acá hay que verificar si la DB ya está lista o hace falta
# ejecutar la inicializacion o algun proceso de upgrade si la version es distinta
#
# php init_or_upgrade.php
echo Database up to date.

figlet Star php-fpm...
php-fpm7.1 -F
