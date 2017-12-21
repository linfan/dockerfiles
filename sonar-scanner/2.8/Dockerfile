FROM openjdk:alpine
ENV SONAR_SCANNER_VERSION 2.8

RUN apk add --no-cache curl && \
        curl -sSLO https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-${SONAR_SCANNER_VERSION}.zip && \
        unzip -d /usr/local/ sonar-scanner-${SONAR_SCANNER_VERSION} && \
        ln -s /usr/local/sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner /usr/bin/sonar-scanner

WORKDIR /work
CMD sonar-scanner
