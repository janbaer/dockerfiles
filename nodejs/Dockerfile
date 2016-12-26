FROM janbaer/alpine:latest

MAINTAINER Jan Baer

USER root

ENV PATH $PATH:/usr/lib/node_modules/bin

RUN npm install -g live-server karma-cli   \
    gulp typescript eslint tslint mocha

USER jan

CMD ["/bin/zsh"]
