#!/bin/bash

echo "Initialising and Checking the Format of Your .tf Files..."
terraform init -backend=false && \
terraform fmt --diff --check --recursive 
