FROM alpine:latest

RUN apk update && apk upgrade && apk add --no-cache redis

COPY tools/config.sh config.sh

EXPOSE 6379

ENTRYPOINT [ "sh", "config.sh" ]


