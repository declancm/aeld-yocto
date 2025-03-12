#!/bin/bash
docker build -t poky-builder .
docker run --rm -it -v ${PWD}:${PWD} -w ${PWD} poky-builder
