FROM alpine:latest

RUN apk add --no-cache bash git openssh-client

ADD git-push /usr/local/bin/
