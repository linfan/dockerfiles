#!/bin/bash

if [ ! -f /.plugin_setup ]; then
    sh /setup_plugin.sh
fi

exec fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT $@
