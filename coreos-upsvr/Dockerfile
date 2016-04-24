FROM nginx:1.9.14-alpine
VOLUME /coreos_updates
RUN apk --update add wget && rm -rf /var/cache/apk/*
ADD default.conf /etc/nginx/conf.d/default.conf
ADD startup.sh /coreos_updates/startup.sh
CMD sh /coreos_updates/startup.sh
