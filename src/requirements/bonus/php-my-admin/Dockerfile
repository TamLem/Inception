FROM alpine:latest

RUN apk add bash && apk add tar
COPY tools/setup.sh /setup.sh

ENTRYPOINT [ "/bin/bash", "setup.sh" ]