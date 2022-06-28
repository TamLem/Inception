FROM alpine:latest

# install php fpm and include wordpress volume
RUN apk update && apk add --update-cache \
    mariadb-client \
    php \
    php-bz2 \
    php-json \
    php-mysqli \
    php-pdo_mysql \
    php-fpm \
    php-dom \
    php-exif \
    php-fileinfo \
    php-mbstring \
    php-openssl \
    php-xml \
    php-zip \
    php-ftp \
    php-opcache \
    php-curl \
    php-cgi \
    php-session \
    php-phar  \
    php-iconv \
    php-gd  
RUN apk add tzdata
RUN apk add bash
RUN adduser -D -g 'Nginx www user' -h /home/www/ www

COPY --chown=www:www ./tools/setup.sh /setup.sh
COPY --chown=www:www conf/www.conf /etc/php8/php-fpm.d/www.conf
COPY --chown=www:www conf/php.ini /etc/php8/php.ini

# Configure PHP
RUN mkdir -p /run/php/
RUN touch /run/php/php8.0-fpm.pid

# install wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp

CMD [ "/bin/bash", "setup.sh" ]