# Dockerfiles NodeJS

This repository contains file for creating a dockerfile
with that I can use NodeJS in docker sandbox


```
docker run -it --rm  -v "$(pwd)":/home/src janbaer/nodejs
```

This container has the following global node modules installed:

- gulp
- karma-cli
- typescript
- eslint
- live-server
