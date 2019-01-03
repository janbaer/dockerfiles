FILE_NAME=$1

docker run --rm -v `pwd`:/tmp janbaer/textlive-pandoc \
  --from=markdown -t latex --toc                      \
  ${FILE_NAME}.md -o ${FILE_NAME}.pdf

