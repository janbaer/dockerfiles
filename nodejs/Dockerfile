FROM mhart/alpine-node:latest

MAINTAINER Jan Baer

# Install base packages
RUN apk update && apk upgrade && \
    apk add curl wget bash tree git tar

ENV PATH $PATH:/usr/lib/node_modules/bin

RUN npm install -g live-server karma-cli gulp typescript eslint        && \
    apk del curl tar

COPY .aliases .gitconfig .gitignore .bashrc ./home/

ENV HOME /home

WORKDIR /home

# Define bash as default command
CMD ["/bin/bash"]
