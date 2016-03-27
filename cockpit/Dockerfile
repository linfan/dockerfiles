FROM ubuntu:15.10
EXPOSE 9090
RUN apt-get install -y software-properties-common && \
    add-apt-repository -syu ppa:jpsutton/cockpit && \
    apt-get update && \
    apt-get install -y cockpit && \
    apt-get -y clean && \
    apt-get -y autoclean && \
    rm -rf /var/lib/apt/lists/*
