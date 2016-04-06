#!/bin/bash

if [ -f /.plugin_setup ]; then
    exit 0
fi

DEFAULT_HOST=${ELASTICSEARCH_PORT_9200_TCP_ADDR:-localhost}
DEFAULT_PORT=${ELASTICSEARCH_PORT_9200_TCP_PORT:-9200}

ES_HOST=${ES_HOST:-$DEFAULT_HOST}
ES_PORT=${ES_PORT:-$DEFAULT_PORT}
ES_INDEX=${ES_INDEX:-fluentd}
ES_TYPE=${ES_TYPE:-fluentd}

echo "
<match docker.all>
  type elasticsearch
  host $ES_HOST
  port $ES_PORT
  index_name $ES_INDEX
  type_name $ES_TYPE
  logstash_format true
  flush_interval 5s
  include_tag_key true
  tag_key tag
</match>" >> /fluentd/etc/fluent.conf

touch /.plugin_setup
