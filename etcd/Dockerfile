FROM alpine:3.6

ENV VERSION v3.1.8
RUN apk add --update curl && rm -rf /var/cache/apk/*
RUN curl -sSLO https://github.com/coreos/etcd/releases/download/$VERSION/etcd-$VERSION-linux-amd64.tar.gz && \
    tar zxf etcd-$VERSION-linux-amd64.tar.gz && \
    mv etcd-$VERSION-linux-amd64/etcd* /bin/ && \
    rm -fr etcd-*

VOLUME ["/data"]
EXPOSE 2379 2380

CMD ["/bin/etcd", "--data-dir=/data", \
    "--listen-peer-urls=http://0.0.0.0:2380", \
    "--listen-client-urls=http://0.0.0.0:2379", \
    "--advertise-client-urls=http://0.0.0.0:2379", \
    "--name", "default", \
    "--initial-advertise-peer-urls", "http://172.17.0.3:2380", \
    "--initial-cluster", "default=http://172.17.0.3:2380", \
    "--initial-cluster-token", "etcd-cluster", \
    "--initial-cluster-state", "new"]
