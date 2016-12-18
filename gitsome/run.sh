export USER=jan
docker run --rm -it                                            \
  -e USER=${USER}                                              \
  -v ${HOME}/.gitsomeconfig:/home/${USER}/.gitsomeconfig       \
  -v ${HOME}/.gitsomeconfigurl:/home/${USER}/.gitsomeconfigurl \
  -v "$(pwd)":/home/${USER}/projects                           \
   janbaer/gitsome
#docker run -it --rm  -v "$(pwd)":/home/src janbaer/python3
