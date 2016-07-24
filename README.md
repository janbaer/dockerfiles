# Dockerfiles

This repository contains some of my dockerfiles which I use for running my dev
environments in a separated sandbox

- Python3

```
docker run -it --rm  -v "$(pwd)":/home/src --name python3 janbaer/python3
```

This commands starts a python3 ready container with a bash as shell. The base
image contains nose for executing python tests and the alias "watch-tests"
which is starting nose in a watch mode
