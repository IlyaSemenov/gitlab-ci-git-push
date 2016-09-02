FROM alpine:3.4

RUN apk add --no-cache bash git openssh-client

ADD git-push /usr/local/bin/
