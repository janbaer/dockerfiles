FROM mhart/alpine-node:latest

MAINTAINER Jan Baer

ADD ocd-clean /util/

RUN apk --update add zsh git tig rsync

ENV HOME /home/jan

RUN addgroup develop                                    && \
    adduser -h ${HOME} -s /bin/zh -S -D -G develop jan

USER jan

RUN git clone --depth 1 https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh && \
    git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions && \
    git clone --depth 1 https://github.com/janbaer/dotfiles $HOME/dotfiles            && \
    sh -c "$HOME/dotfiles/sync.sh" && rm -rf $HOME/dotfiles

USER root

RUN apk del rsync

USER jan

WORKDIR $HOME

CMD ["/bin/zsh"]

