#!/bin/bash

# Compile e2e-dataset
docker build -t e2e-dataset-env .

# Run e2e-dataset
docker run --rm --name e2e-dataset-env -p 8000:8000 -p 4200:4200 -p 5900:5900 -it e2e-dataset-env