# Run gitsome command line tool:
# https://github.com/donnemartin/gitsome
#
# Usage:
#   export USER=jan
#   docker run --rm -it                                            \
#     -e USER=${USER}                                              \
#     -v ${HOME}/.gitsomeconfig:/home/${USER}/.gitsomeconfig       \
#     -v ${HOME}/.gitsomeconfigurl:/home/${USER}/.gitsomeconfigurl \
#     -v "$(pwd)":/home/${USER}/projects                           \
#   janbaer/gitsome
#
FROM python:3-alpine

RUN apk add --no-cache bash git

RUN pip3 install gitsome

ENV USER=jan

ENV HOME /home/$USER
RUN adduser -S $USER     && \
    chown -R $USER $HOME

RUN mkdir $HOME/projects

WORKDIR $HOME/projects

USER $USER

ENTRYPOINT ["gitsome"]
