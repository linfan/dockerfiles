# Readme

This image is used for runing elasticsearch-fluentd-kibana to collection container logs via docker.

## Step 1. Build fluentd image with elasticsearch plugin

```
docker build --tag fluentd_es:v0.12.21 .
```

## Step 2. Run the containers

Start ElasticSearch
```
docker run -d --name es \
  -p=9200:9200 \
  -p=9300:9300 \
  elasticsearch:2.2.1 elasticsearch -Des.network.bind_host=0.0.0.0
```

Start Fluentd
```
docker run -d --name fluentd \
  -p 24224:24224 \
  -h $(hostname) \
  -v /data/fluentd:/fluentd/log \
  -v /var/lib/docker/containers:/var/lib/docker/containers:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /usr/bin/docker:/usr/bin/docker \
  -e ES_HOST=<es-container-host-ip> \
  fluentd_es
```

Start Kibana
```
docker run -d --name kibana \
  -p 5601:5601 \
  -e ELASTICSEARCH_URL=http://<es-container-host-ip>:9200 \
  kibana:4.4.2
```
