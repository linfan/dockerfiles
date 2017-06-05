/bin/etcd --data-dir=/data \
    --listen-peer-urls=http://0.0.0.0:2380 \
    --listen-client-urls=http://0.0.0.0:2379 \
    --advertise-client-urls=http://`hostname -i`:2379 \
    --name default \
    --initial-advertise-peer-urls http://`hostname -i`:2380 \
    --initial-cluster default=http://`hostname -i`:2380 \
    --initial-cluster-token etcd-cluster \
    --initial-cluster-state new
