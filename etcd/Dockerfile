FROM alpine:3.6

ENV VERSION v3.1.8
RUN apk add --update curl && rm -rf /var/cache/apk/*
RUN curl -sSLO https://github.com/coreos/etcd/releases/download/$VERSION/etcd-$VERSION-linux-amd64.tar.gz && \
    tar zxf etcd-$VERSION-linux-amd64.tar.gz && \
    mv etcd-$VERSION-linux-amd64/etcd* /bin/ && \
    rm -fr etcd-*

VOLUME ["/data"]
EXPOSE 2379 2380

ADD run.sh /bin/
CMD ["sh", "/bin/run.sh"]
