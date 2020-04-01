#!/bin/bash

if [ $# == 0 ] || [ $1 == "help" ]; then
    echo "Usage: e2e-dataset WEBAPP TAG"
    exit
else
    # Build
    docker build -t e2e-dataset . > /dev/null

    # Run e2e-dataset
    docker run --rm -v $PWD/logs:/home/dataset/logs e2e-dataset $1 $2
fi

# ./e2e-dataset.sh webapp-2 regression-fixed-1

