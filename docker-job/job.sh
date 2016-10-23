#!/bin/sh

NOW=$(date +"%T")

echo "Hello from the job at ${NOW} in $(pwd)" >> /dev/stdout
