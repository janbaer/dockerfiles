# Dockerfiles Go

This repository contains file for creating a dockerfile
with that I can use Go in docker sandbox

```
app="${1:-app}"
docker run -it --rm  -v "$(pwd)":/go/src/github.com/janbaer/$app janbaer/go
```
