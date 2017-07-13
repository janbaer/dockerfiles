FROM bitnami/minideb:jessie

MAINTAINER Jan Baer

RUN apt-get update \
 && apt-get --fix-missing --no-install-recommends install -y \
  texlive-xetex                                               \
  texlive-fonts-recommended                                   \
  texlive-lang-english                                        \
  texlive-lang-german                                         \
  lmodern                                                     \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /temp

CMD ["xelatex"]
