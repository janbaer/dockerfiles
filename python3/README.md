# Dockerfiles Python

This repository contains file for creating a dockerfile
with that I can use Python in Docker sandbox

```
docker run -it --rm  -v "$(pwd)":/home/src janbaer/python3
```

This commands starts a python3 ready container with a bash as shell. The base
image contains nose for executing python tests and the alias "watch-tests"
which is starting nose in a watch mode
