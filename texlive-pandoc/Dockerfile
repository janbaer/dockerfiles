FROM ubuntu:18.10

ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Jan Baer

RUN apt-get update \
 && apt-get --fix-missing --no-install-recommends install -y  \
  ca-certificates                                             \
  lmodern                                                     \
  texlive                                                     \
  texlive-lang-english                                        \
  texlive-lang-german                                         \
  texlive-pictures                                            \
  texlive-latex-extra                                         \
  # texlive-fonts-extra                                         \
  # texlive-luatex                                              \
  # texlive-xetex                                               \
  build-essential                                             \
  fontconfig                                                  \
  unzip                                                       \
  wget                                                        \
  graphviz                                                    \
  && update-ca-certificates                                   \
  && rm -rf /var/lib/apt/lists/*

# ADD ./fonts/*.otf /usr/share/fonts/opentype/
# RUN fc-cache -fv

ADD ./getFiraFont.sh ./getFiraFont.sh
RUN ./getFiraFont.sh

WORKDIR /tmp

RUN wget https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-1-amd64.deb && \
    dpkg -i pandoc-2.5-1-amd64.deb                                                  && \
    rm pandoc-2.5-1-amd64.deb

CMD ["/bin/sh"]
