# Dockerfiles VIM

This repository contains file for creating a dockerfile
with that I can use VIM in Docker sandbox

```
docker run -it --rm  -v "$(pwd)":/home/src janbaer/vim
```

This commands starts a container with a bash as shell. It starts
automatically with all installed plugins

