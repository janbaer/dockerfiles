FROM alpine:latest
MAINTAINER Jan Baer

# Install base packages
RUN apk update && apk upgrade && \
    apk add curl wget bash tree git tig

# Install python3 with pip
RUN apk add python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    pip3 install nose nose-mocha-reporter nose-watch && \
    rm -r /root/.cache

COPY .aliases .gitconfig ./root/
COPY .gitignore-python /root/.gitignore
COPY .bashrc-python /root/.bashrc

WORKDIR /home/src

# Define bash as default command
CMD ["/bin/bash"]
