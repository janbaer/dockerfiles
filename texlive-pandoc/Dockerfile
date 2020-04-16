# Ubuntu 19.10 base image
FROM ubuntu:eoan

MAINTAINER Jan Baer

ARG DOCKER_USER="jan"
ARG DOCKER_ID=1000

ENV DEBIAN_FRONTEND noninteractive
ENV HOME=/home/$DOCKER_USER

RUN apt-get update \
 && apt-get --fix-missing --no-install-recommends install -y  \
  ca-certificates                                             \
  lmodern                                                     \
  texlive-full                                                \
  build-essential                                             \
  fontconfig                                                  \
  unzip                                                       \
  wget                                                        \
  graphviz                                                    \
  calibre                                                     \
  && update-ca-certificates                                   \
  && rm -rf /var/lib/apt/lists/*

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

RUN wget https://github.com/jgm/pandoc/releases/download/2.7.2/pandoc-2.7.2-1-amd64.deb && \
    dpkg -i pandoc-2.7.2-1-amd64.deb                                                    && \
    rm pandoc-2.7.2-1-amd64.deb

RUN useradd --home-dir /home/$DOCKER_USER           \
            --create-home                           \
            --uid $DOCKER_ID                        \
            --shell /bin/bash                       \
            $DOCKER_USER

USER $DOCKER_USER

RUN mkdir -p $HOME/.pandoc/templates

ADD ./pandoc-templates/ $HOME/.pandoc/templates

CMD ["/bin/bash"]
