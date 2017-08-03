# Sonar-scanner

A simple sonar-scanner 3.x image.

It's have been uploaded to Docker Hub as [flin/sonar-scanner](hub.docker.com/r/flin/sonar-scanner)

## Run it

```
docker run --rm \
    -v /folder/to/code:/work \
	flin/sonar-scanner:3.0.3 -Dsonar.host.url=http://<sonarqube>:9000
```
