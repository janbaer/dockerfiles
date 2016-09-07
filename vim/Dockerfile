FROM jare/alpine-vim

MAINTAINER Jan Baer

ADD ocd-clean /util/

RUN apk --update add curl ctags git python bash ncurses-terminfo

COPY .aliases .gitconfig .gitignore .bashrc $HOME/

RUN cd $HOME

RUN git clone --depth 1 https://github.com/janbaer/dotfiles $HOME/dotfiles && \
    cp $HOME/dotfiles/.vimrc $HOME && cp -R $HOME/dotfiles/.vim $HOME/.vim

RUN mkdir $HOME/.vim/bundle && cd $HOME/.vim/bundle &&  \
    git clone --depth 1 https://github.com/VundleVim/Vundle.vim && \
    git clone --depth 1 https://github.com/majutsushi/tagbar && \
    git clone --depth 1 https://github.com/Lokaltog/vim-powerline && \
    git clone --depth 1 https://github.com/pangloss/vim-javascript && \
    git clone --depth 1 https://github.com/ap/vim-css-color && \
    git clone --depth 1 https://github.com/hail2u/vim-css3-syntax && \
    git clone --depth 1 https://github.com/groenewege/vim-less && \
    git clone --depth 1 https://github.com/tpope/vim-fugitive && \
    git clone --depth 1 https://github.com/tpope/vim-surround && \
    git clone --depth 1 https://github.com/scrooloose/nerdcommenter && \
    git clone --depth 1 https://github.com/ctrlpvim/ctrlp.vim && \
    git clone --depth 1 https://github.com/easymotion/vim-easymotion && \
    git clone --depth 1 https://github.com/mattn/emmet-vim && \
    git clone --depth 1 https://github.com/msanders/snipmate.vim && \
    git clone --depth 1 https://github.com/dkprice/vim-easygrep && \
    git clone --depth 1 https://github.com/sgur/vim-editorconfig && \
    git clone --depth 1 https://github.com/tpope/vim-dispatch && \
    git clone --depth 1 https://github.com/terryma/vim-multiple-cursors && \
    git clone --depth 1 https://github.com/scrooloose/syntastic && \
    git clone --depth 1 https://github.com/tpope/vim-unimpaired.git && \
    git clone --depth 1 https://github.com/fatih/vim-go && \
    echo "Done with installing vim plugins"

    #Build YouCompleteMe
RUN apk add --virtual build-deps go llvm perl cmake python-dev build-base                                       && \
    git clone --depth 1  https://github.com/Valloric/YouCompleteMe.git  $HOME/.vim/bundle/YouCompleteMe         && \
    cd $HOME/.vim/bundle/YouCompleteMe                                                                          && \
    git submodule update --init --recursive                                                                     && \
    $HOME/.vim/bundle/YouCompleteMe/install.py --gocode-completer                                               && \
    cd $HOME                                                                                                    && \
    #Node.js deps (needed only if you're planning to mount and run jare/typescript)
    apk add libgcc libstdc++ libuv                                                                              && \
    #Cleanup
    rm -rf $HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp /usr/lib/go  \
           $HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/clang_includes                                      && \
    apk del build-deps                                                                                          && \
    sh /util/ocd-clean / > /dev/null 2>&1

COPY .vimrc $HOME/.vimrc

WORKDIR $HOME

#CMD ["/bin/bash"]


