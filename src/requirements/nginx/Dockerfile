FROM alpine:latest

RUN apk update && apk add nginx

RUN adduser -D -g 'Nginx www user' -h /home/www/ www

RUN mkdir -p /home/www/ && chown -R www:www /home/www/

RUN mkdir -p /etc/nginx/ && chown -R root:root /etc/nginx/

COPY --chown=www:www ./conf/nginx.conf /etc/nginx/nginx.conf

COPY --chown=www:www ./tools/certs/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt

COPY --chown=www:www ./tools/certs/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key

COPY --chown=www:www ./tools/entry_point.sh /entry_point.sh

COPY --chown=www:www tools/bonus /home/www/bonus

RUN chmod +x /entry_point.sh

ENTRYPOINT ["sh", "./entry_point.sh"]
