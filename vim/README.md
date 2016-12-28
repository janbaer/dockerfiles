# Dockerfiles VIM

[![](https://images.microbadger.com/badges/image/janbaer/vim.svg)](http://microbadger.com/images/janbaer/vim)

This repository contains file for building a Docker image for VIM.
The docker image is building VIM8 from it's Git source.

It's based on Alpine and it's using my personal VIM-settings.
So it's maybe not so good for other developers to use.
But you can you use for your self when you clone and change it with your own settings.


```
docker run -it --rm -v "$(pwd)":/home/jan/projects janbaer/vim
```

This commands runs a new container and start automatically VIM.
In case you don't want to start VIM directly just add **zsh** to override the default cmd.

