# A simple coreos update service

## Use the image

Download the update.gz file from Google Storage Service (This step is optiona).

```
wget -O $(pwd)/update/update.gz https://commondatastorage.googleapis.com/update-storage.core-os.net/amd64-usr/1010.1.0/update.gz
```

Use Docker to run the service:

```
docker run --rm --name coreos-upsvr \
           -p 8080:80 \
           -e SERVER_ADDR=1.2.3.4:8080 \
           -e VERSION=1010.1.0 \
           -v $(pwd)/update:/coreos_updates/1010.1.0/ \
           coreos-upsvr
```

- `SERVER_ADDR`: external ip and port on the host which will be used as the update server.
- `VERSION`: version of the image servered (not used actually).

## Use the update service

Edit `/etc/coreos/update.conf` file in CoreOS system:

```
SERVER=http://1.2.3.4:8080/1010.1.0/
GROUP=anything
```

Then do `update_engine_client -update`.

## Known issues

- Version comparison not works, machine will always be "updated" by the provided update.gz file. Even that file has lower version than current system.
- Update channel not works.

