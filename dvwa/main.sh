#!/bin/bash

echo '[+] Starting mysql...'
service mariadb start

echo '[+] Starting apache'
service apache2 start

tail -f /var/log/apache2/*.log
