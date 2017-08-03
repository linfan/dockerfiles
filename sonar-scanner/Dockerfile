FROM debian:wheezy-slim
ENV SONAR_SCANNER_VERSION 3.0.3.778

RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget --no-check-certificate https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip && \
    unzip -d /usr/local sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip && \
    ln -s /usr/local/sonar-scanner-3.0.3.778-linux/bin/sonar-scanner /usr/local/bin/ && \
    rm -f sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip && \
    apt-get remove -y wget unzip && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /work
ENTRYPOINT ["/usr/local/bin/sonar-scanner"]
