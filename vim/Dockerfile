FROM alpine:3.4

MAINTAINER Jan Baer

ADD ocd-clean /util/

RUN apk --update add zsh sudo curl rsync git tig tmux

RUN apk add python py-pip ca-certificates               && \
    pip install --upgrade pip                           && \
    pip install httpie httpie-unixsocket

# Now download and build VIM8
RUN apk add make libxpm-dev libx11-dev libxt-dev ncurses-dev ctags build-base python-dev
RUN git clone --depth 1 https://github.com/vim/vim.git
WORKDIR vim
RUN ./configure --with-features=large \
            --enable-multibyte \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            #--enable-python3interp \
            #--with-python3-config-dir=/usr/lib/python3.5/config \
            #--enable-perlinterp \
            #--enable-luainterp \
            --disable-gui \
            --disable-netbeans \
            --enable-cscope --prefix=/usr
RUN make VIMRUNTIMEDIR=/usr/share/vim/vim80
RUN make install

ENV HOME /home/jan

RUN addgroup develop                                    && \
    adduser -h ${HOME} -s /bin/zh -S -D -G develop jan

USER jan

RUN git clone --depth 1 https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh && \
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

RUN git clone --depth 1 https://github.com/janbaer/dotfiles $HOME/dotfiles && \
    sh -c "$HOME/dotfiles/sync.sh"

RUN mkdir $HOME/.vim/bundle && cd $HOME/.vim/bundle                       && \
    git clone --depth 1 https://github.com/VundleVim/Vundle.vim           && \
    git clone --depth 1 https://github.com/majutsushi/tagbar              && \
    git clone --depth 1 https://github.com/Lokaltog/vim-powerline         && \
    git clone --depth 1 https://github.com/pangloss/vim-javascript        && \
    git clone --depth 1 https://github.com/ap/vim-css-color               && \
    git clone --depth 1 https://github.com/hail2u/vim-css3-syntax         && \
    git clone --depth 1 https://github.com/groenewege/vim-less            && \
    git clone --depth 1 https://github.com/tpope/vim-fugitive             && \
    git clone --depth 1 https://github.com/tpope/vim-surround             && \
    git clone --depth 1 https://github.com/scrooloose/nerdcommenter       && \
    git clone --depth 1 https://github.com/ctrlpvim/ctrlp.vim             && \
    git clone --depth 1 https://github.com/easymotion/vim-easymotion      && \
    git clone --depth 1 https://github.com/mattn/emmet-vim                && \
    git clone --depth 1 https://github.com/msanders/snipmate.vim          && \
    git clone --depth 1 https://github.com/dkprice/vim-easygrep           && \
    git clone --depth 1 https://github.com/sgur/vim-editorconfig          && \
    git clone --depth 1 https://github.com/tpope/vim-dispatch             && \
    git clone --depth 1 https://github.com/terryma/vim-multiple-cursors   && \
    git clone --depth 1 https://github.com/scrooloose/syntastic           && \
    git clone --depth 1 https://github.com/tpope/vim-unimpaired.git       && \
    git clone --depth 1 https://github.com/fatih/vim-go                   && \
    git clone --depth 1 https://github.com/kopischke/vim-fetch            && \
    git clone --depth 1 https://github.com/ekalinin/Dockerfile.vim.git    && \
    git clone --depth 1 https://github.com/tpope/vim-repeat               && \
    git clone --depth 1 https://github.com/svermeulen/vim-easyclip        && \
    git clone --depth 1 https://github.com/scrooloose/nerdtree.git        && \
    rm -rf $HOME/.vim/bundle/snipmate.vim/snippets                        && \
    echo "Done with installing vim plugins"

    ##Build YouCompleteMe
#RUN apk add --virtual build-deps go llvm perl cmake python-dev build-base                                       && \
    #git clone --depth 1  https://github.com/Valloric/YouCompleteMe.git  $HOME/.vim/bundle/YouCompleteMe         && \
    #cd $HOME/.vim/bundle/YouCompleteMe                                                                          && \
    #git submodule update --init --recursive                                                                     && \
    #$HOME/.vim/bundle/YouCompleteMe/install.py --gocode-completer                                               && \
    #cd $HOME                                                                                                    && \
    ##Node.js deps (needed only if you're planning to mount and run jare/typescript)
    #apk add libgcc libstdc++ libuv                                                                              && \
    ##Cleanup
    #rm -rf $HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp /usr/lib/go  \
           #$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/clang_includes                                      && \
    #apk del build-deps                                                                                          && \
    #sh /util/ocd-clean / > /dev/null 2>&1

USER root

RUN rm -rf /var/cache/* /var/log/* /var/tmp/*                                && \
    mkdir /var/cache/apk                                                     && \
    cd /usr/share/vim/vim80/                                                 && \
    sh /util/ocd-clean / > /dev/null 2>&1

USER jan

RUN mkdir $HOME/projects

WORKDIR $HOME/projects

CMD ["vim"]

