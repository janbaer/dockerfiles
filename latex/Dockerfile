FROM debian:jessie
MAINTAINER Jan Baer

RUN apt-get update \
 && apt-get --no-install-recommends install -y \
  texlive-xetex \
  texlive-fonts-recommended \
  lmodern \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /temp

#ENTRYPOINT ["xelatex"]
