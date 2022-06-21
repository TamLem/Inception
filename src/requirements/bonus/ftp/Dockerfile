FROM alpine:latest

RUN apk update && apk upgrade && apk add vsftpd && apk add openrc

RUN mkdir /run/openrc && touch /run/openrc/softlevel

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY tools/config.sh config.sh

# EXPOSE 20 21 21100-21110

# RUN sh config.sh

ENTRYPOINT [ "sh", "config.sh" ]


