# Readme

This image is used for runing elasticsearch-fluentd-kibana to collection container logs via docker.

## Step 1. Build fluentd image with elasticsearch plugin

```
docker build --tag fluentd_es:v0.12.21 .
```

## Step 2. Run the containers

```
docker run -d --name es --net=host elasticsearch:2.2.0 elasticsearch -Des.network.bind_host=0.0.0.0
docker run -d --name fluentd --net=host -v /var/lib/docker/containers:/var/lib/docker/containers:ro -e ES_HOST=localhost fluentd_es:v0.12.21
docker run -d --name kibana --net=host -e ELASTICSEARCH_URL=http://localhost:9200 kibana:4.4.1
```
