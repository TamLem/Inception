FROM alpine:latest

# install php fpm and include wordpress volume
RUN apk update && apk add --update-cache php \
    php-bz2 \
    php-json \
    php-mysqli \
    php-pdo_mysql \
    php-pdo_mysql \
    php-fpm \
    php-opcache \
    php-curl \
    php-session \
    php-phar  \
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

# Building process
# RUN composer install --no-dev

RUN sh setup.sh

# install wordpress
# install wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/bin/wp

RUN wget http://wordpress.org/latest.tar.gz 
RUN tar -xf latest.tar.gz -C /home/www

CMD [ "/bin/bash", "-c", "php-fpm8 -F -R" ]