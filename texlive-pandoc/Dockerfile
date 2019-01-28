# Ubuntu 18.10 base image
FROM ubuntu:cosmic

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
WORKDIR /tmp

ADD ./getFiraFont.sh /tmp/getFiraFont.sh
RUN bash -c /tmp/getFiraFont.sh

RUN wget https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-1-amd64.deb && \
    dpkg -i pandoc-2.5-1-amd64.deb                                                  && \
    rm pandoc-2.5-1-amd64.deb

RUN useradd -s /bin/bash --uid 1000 jan

USER jan

CMD ["/bin/sh"]
