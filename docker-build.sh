#!/bin/bash

docker build -t rpi-builder .
docker run --rm -v ${PWD}:${PWD} -w ${PWD} rpi-builder ./build.sh
