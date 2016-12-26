FROM janbaer/alpine:latest

MAINTAINER Jan Baer

USER root

RUN apk update                                                             && \
    ## Download runtime deps
    apk add python ctags                                                   && \
    ## Download build deps
    apk add --virtual build-deps go make libxpm-dev libx11-dev                \
        libxt-dev ncurses-dev cmake build-base python-dev llvm             && \
    ## Build VIM8
    cd /tmp                                                                && \
    git clone --depth 1 https://github.com/vim/vim.git                     && \
    cd /tmp/vim                                                            && \
    ./configure --with-features=large                                         \
            --enable-fail-if-missing                                          \
            --enable-multibyte                                                \
            #--enable-luainterp                                                \
            --enable-pythoninterp                                             \
            --with-python-config-dir=/usr/lib/python2.7/config                \
            #--enable-python3interp                                            \
            #--with-python3-config-dir=/usr/lib/python3.5/config               \
            --disable-gui                                                     \
            --disable-netbeans                                                \
            --enable-cscope --prefix=/usr                                  && \
    make VIMRUNTIMEDIR=/usr/share/vim/vim80                                && \
    make install                                                           && \
    ## YouCompleteMe
    git clone --depth 1 https://github.com/Valloric/YouCompleteMe.git /home/jan/bundle/YouCompleteMe/ && \
    cd /home/jan/bundle/YouCompleteMe                                                                 && \
    git submodule update --init --recursive                                                           && \
    /home/jan/bundle/YouCompleteMe/install.py --gocode-completer --tern-completer                     && \
    rm -rf /home/jan/bundle/YouCompleteMe/third_party/ycmd/cpp /usr/lib/go                               \
           /home/jan/bundle/YouCompleteMe/third_party/ycmd/clang_includes                             && \
    ## Cleanup
    apk del build-deps                                                     && \
    apk add libsm libice libxt libx11 libstdc++ ncurses                    && \
    rm -rf /var/cache/* /var/log/* /var/tmp/*                              && \
    mkdir /var/cache/apk                                                   && \
    sh /util/ocd-clean / > /dev/null 2>&1

USER jan

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
    git clone --depth 1 https://github.com/kopischke/vim-fetch            && \
    git clone --depth 1 https://github.com/ekalinin/Dockerfile.vim.git    && \
    git clone --depth 1 https://github.com/tpope/vim-repeat               && \
    git clone --depth 1 https://github.com/svermeulen/vim-easyclip        && \
    git clone --depth 1 https://github.com/scrooloose/nerdtree.git        && \
    git clone --depth 1 https://github.com/zirrostig/vim-schlepp          && \
    rm -rf snipmate.vim/snippets Vundle.vim/.git                             \
           tagbar/.git vim-powerline/.git                                    \
           vim-javascript/.git vim-css-color/.git vim-less/.git              \
           vim-fugitive/.git vim-surround/.git nerdcommenter/.git            \
           ctrlp.vim/.git vim-easymotion/.git emmet-vim./,git                \
           vim-easygrep/.git snipate.vim/.git vim-editorconfig/.git          \
           vim-dispatch/.git vim-multiple-colors/.git syntastic/.git         \
           vim-unimpared/.git vim-fetch/.git Dockerfile.vim/.git             \
           vim-repeat/.git vim-easyclip/.git nerdtree/.git                   \
           vim-schlepp/.git

RUN mkdir $HOME/projects

WORKDIR $HOME/projects

CMD ["vim"]

