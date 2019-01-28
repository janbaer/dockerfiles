# Ubuntu 18.10 base image
FROM ubuntu:cosmic

ENV DEBIAN_FRONTEND noninteractive

ARG DOCKER_USER="jan"
ARG DOCKER_ID=1000

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

RUN wget "https://bboxtype.com/downloads/Fira/Download_Folder_FiraSans_4301.zip"    && \
    wget "https://bboxtype.com/downloads/Fira/Fira_Mono_3_2.zip"                    && \
    unzip Download_Folder_FiraSans_4301.zip                                         && \
    unzip Fira_Mono_3_2.zip                                                         && \
    mkdir -p /usr/share/fonts/truetype/FiraSans                                     && \
    mkdir -p /usr/share/fonts/opentype/FiraSans                                     && \
    cp Download_Folder_FiraSans_4301/Fonts/Fira_Sans_TTF_4301/*/*/*.ttf                \
      /usr/share/fonts/truetype/FiraSans/                                           && \
    cp Download_Folder_FiraSans_4301/Fonts/Fira_Sans_OTF_4301/*/*/*.otf                \
      /usr/share/fonts/opentype/FiraSans/                                           && \
    cp Fira_Mono_3_2/Fonts/FiraMono_WEB_32/*.ttf /usr/share/fonts/truetype/FiraSans && \
    cp Fira_Mono_3_2/Fonts/FiraMono_OTF_32/*.otf /usr/share/fonts/truetype/FiraSans && \
    rm Download_Folder_FiraSans_4301.zip Fira_Mono_3_2.zip                          && \
    rm -rf Download_Folder_FiraSans_4301 Fira_Mono_3_2                              && \
    fc-cache -fv

RUN wget https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-1-amd64.deb && \
    dpkg -i pandoc-2.5-1-amd64.deb                                                  && \
    rm pandoc-2.5-1-amd64.deb

RUN useradd -s /bin/bash --uid $DOCKER_ID $DOCKER_USER

USER $DOCKER_USER

CMD ["/bin/sh"]
