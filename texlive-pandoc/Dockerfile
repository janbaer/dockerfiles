FROM bitnami/minideb:jessie

MAINTAINER Jan Baer

RUN apt-get update \
 && apt-get --fix-missing --no-install-recommends install -y  \
  lmodern                                                     \
  texlive                                                     \
  texlive-lang-english                                        \
  texlive-lang-german                                         \
  texlive-pictures                                            \
  # texlive-luatex                                              \
  # texlive-xetex                                               \
  wget                                                        \
 && rm -rf /var/lib/apt/lists/*

# ADD ./fonts/*.otf /usr/share/fonts/opentype/

# RUN fc-cache -fv

WORKDIR /tmp

RUN wget --no-check-certificate https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-1-amd64.deb && dpkg -i pandoc-2.5-1-amd64.deb

ENTRYPOINT ["/usr/bin/pandoc"]
