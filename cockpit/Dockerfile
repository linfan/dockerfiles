FROM ubuntu:15.10
MAINTAINER LinFan "linfan.china@gmail.com"

# Ports
EXPOSE 9090

# Install cockpit
RUN apt-get install -y software-properties-common && \
    add-apt-repository -syu ppa:jpsutton/cockpit && \
    apt-get update && \
    apt-get install -y cockpit && \
    apt-get -y clean && \
    apt-get -y autoclean && \
    rm -rf /var/lib/apt/lists/*
