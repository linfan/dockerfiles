FROM fluent/fluentd:v0.12.21
MAINTAINER LinFan "linfan.china@gmail.com"

# Permission error happens
USER root

# Fluentd plugins
RUN gem install fluent-plugin-elasticsearch --no-rdoc --no-ri
RUN gem install fluent-plugin-record-reformer --no-rdoc --no-ri
