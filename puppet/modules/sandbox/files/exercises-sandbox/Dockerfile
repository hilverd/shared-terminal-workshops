FROM ubuntu:14.04

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list

RUN apt-get update && apt-get install -y nano vim man-db curl

RUN useradd dev

RUN mkdir /home/dev && chown -R dev: /home/dev

ENV PATH /home/dev/bin:$PATH

ADD exercises /exercises
