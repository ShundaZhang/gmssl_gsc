#!/bin/bash
docker rm -f gmssl-docker
docker build -t gmssl-docker .
docker run -it --rm gmssl-docker
