app="${1:-app}"
docker run -it --rm  -v "$(pwd)":/go/src/github.com/janbaer/$app janbaer/go
