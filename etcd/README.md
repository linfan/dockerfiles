# Etcd solo

Easiest way to run a single-node etcd service. For development / test purpose only.

## Run it

```
$ docker run -d --name etcd --network host flin/etcd:v3.1.8
```

## Test it

```
$ docker run -i --rm --network host flin/etcd:v3.1.8 etcdctl set /hello world
$ docker run -i --rm --network host flin/etcd:v3.1.8 etcdctl get /hello
world
```
