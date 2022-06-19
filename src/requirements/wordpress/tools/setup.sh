#!/bin/sh

if [ ! -f "/home/www/wp-config.php" ]; then
    wp core download --path=/home/www/
    cd /home/www/
    wp config create --dbname=$DB_NAME --dbuser=$DB_ADMIN \
    --dbpass=$DB_ADMIN_PASS --dbhost=$DB_HOST
    # wp db create
    wp core install --url=$SITE_NAME --title=$SITE_TITLE --admin_user=$WP_ADMIN \
    --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL 
fi


#install adminer db manager
if [ ! -f "/home/www/adminer.php" ]; then
    wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php
    mv adminer-4.8.1-mysql-en.php /home/www/adminer.php
fi

# configure timezone
TIMEZONE="Europe/Helsinki"
cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
echo "${TIMEZONE}" > /etc/timezone
sed -i "s|;*date.timezone =.*|date.timezone = ${TIMEZONE}|i" /etc/php8/php.ini