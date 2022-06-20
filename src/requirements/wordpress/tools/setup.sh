#!/bin/sh

# wait for mysql
# while ! mariadb -h$MYSQL_HOST -u$WP_DATABASE_USR -p$WP_DATABASE_PWD $WP_DATABASE_NAME &>/dev/null; do
#     sleep 3
# done

if [ ! -f "/home/www/wp-config.php" ]; then
    # wp core download --path=/home/www/
    wget http://wordpress.org/latest.tar.gz 
    tar -xf latest.tar.gz 
    mv wordpress/* /home/www/
    # cd /home/www/
    # wp config create --dbname=$DB_NAME --dbuser=$DB_ADMIN \
    # --dbpass=$DB_ADMIN_PASS --dbhost=$DB_HOST
    # # wp db create
    # wp core install --url=$SITE_NAME --title=$SITE_TITLE --admin_user=$WP_ADMIN \
    # --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email
    # wp theme install inspiro --activate 
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

#start php
/usr/sbin/php-fpm8 -F -R
