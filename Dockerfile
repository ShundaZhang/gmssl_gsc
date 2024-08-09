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
