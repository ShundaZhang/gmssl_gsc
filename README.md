# GmSSL GSC Docker

A Docker container for building GmSSL with Gramine Shielded Container (GSC) support.

## Repository Structure

```
.
├── Dockerfile          # Docker build configuration
├── README.md          # This file
├── build-docker.sh    # Build script
└── gsc.txt           # GSC configuration notes
```

## Dockerfile

```dockerfile
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    cmake \
    perl 
RUN git config --global http.proxy http://child-prc.intel.com:913
RUN git clone https://github.com/guanzhi/GmSSL.git
WORKDIR /GmSSL
RUN mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && make install
ENTRYPOINT [ "gmssl" ]
```

## Quick Start

Build the container:
```bash
./build-docker.sh
```

Or build manually:
```bash
docker build -t gmssl-container .
```

## Prerequisites

- Docker Engine
- Git
- Internet connection
