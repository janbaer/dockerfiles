# Dockerfiles Python

This repository contains file for creating a dockerfile
with that I can use Python in Docker sandbox

```
docker run -it --rm  -v "$(pwd)":/home/src janbaer/python3
```

This commands starts a python3 ready container with a bash as shell. The base
image contains nose for executing python tests and pylint for linting your
code.

The following aliases are predefined:

- run-tests - executes all tests in the current directory with using **nose**
- watch-tests - executes all tests and watches for changes
- ci-tests - executes all tests and writes the result in xunit formatted file
with the name **test_output.xml**
- lint - This command is linting all python files in the current directory with
[pylint](https://www.pylint.org)


