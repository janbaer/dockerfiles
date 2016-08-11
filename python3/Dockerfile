FROM alpine:latest

MAINTAINER Jan Baer

# Install base packages
RUN apk update && apk upgrade && \
    apk add curl wget bash tree git

# Install python3 with pip
RUN apk add python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    pip3 install pylint nose nose-mocha-reporter nose-watch && \
    rm -r /root/.cache

COPY .aliases .gitconfig .gitignore .bashrc .pylintrc ./home/

ENV HOME /home

WORKDIR /home

# Define bash as default command
CMD ["/bin/bash"]
