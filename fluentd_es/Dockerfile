FROM fluent/fluentd:v0.12.21
MAINTAINER LinFan "linfan.china@gmail.com"

# Permission error happens
USER root

# Fluentd plugins
RUN gem install fluent-plugin-elasticsearch --no-rdoc --no-ri
RUN gem install fluent-plugin-record-reformer --no-rdoc --no-ri

# Put init scripts
ADD run.sh /run.sh
ADD setup_plugin.sh /setup_plugin.sh
RUN chmod 755 /*.sh

# Override entrypoint
ENTRYPOINT ["/run.sh"]
CMD ["-v"]
