FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y git gcc python-dev build-essential wget unzip autoconf automake libtool curl

# Install CMAKE
RUN wget https://cmake.org/files/v3.11/cmake-3.11.4-Linux-x86_64.tar.gz \
	&& tar -xvf cmake-3.11.4-Linux-x86_64.tar.gz \
	&& cd cmake-3.11.4-Linux-x86_64 \
	&& cp -r bin /usr/ \
	&& cp -r share /usr/


# Install proto3
RUN git clone https://github.com/google/protobuf.git \
	&& cd protobuf \
	&& git submodule update --init --recursive \
	&& ./autogen.sh \
	&& ./configure \
	&& make && make check && make install && ldconfig

COPY . /ncnn