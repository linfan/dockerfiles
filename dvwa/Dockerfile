FROM debian:11.0

LABEL maintainer "linfan"

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    debconf-utils && \
    echo mariadb-server mysql-server/root_password password vulnerables | debconf-set-selections && \
    echo mariadb-server mysql-server/root_password_again password vulnerables | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      apache2 \
      mariadb-server-10.5 \
      php7.4 \
      php-mysql \
      php-pgsql \
      php-pear \
      php-gd \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN service mariadb start && \
    sleep 3 && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
    mysql -uroot -pvulnerables -e "CREATE USER dvwa@localhost IDENTIFIED BY 'p@ssw0rd';CREATE DATABASE dvwa;GRANT ALL privileges ON dvwa.* TO 'dvwa'@localhost;"

COPY dvwa /var/www/html

RUN mv /var/www/html/config/config.inc.php.dist /var/www/html/config/config.inc.php && \
    sed -i "0,/''/{s//'6LdJJlUUAAAAAH1Q6cTpZRQ2Ah8VpyzhnffD0mBb'/}" /var/www/html/config/config.inc.php && \
    sed -i "0,/''/{s//'6LdJJlUUAAAAAM2a3HrgzLczqdYp4g05EqDs-W4K'/}" /var/www/html/config/config.inc.php && \
    sed -i 's/allow_url_include = Off/allow_url_include = On/g' /etc/php/7.4/apache2/php.ini && \
    sed -i 's/^# port =/port =/g' /etc/mysql/mariadb.cnf && \
    sed -i 's/^socket =/# socket =/g' /etc/mysql/mariadb.cnf && \
    sed -i 's/^#\(.*\.log\)$/\1/g' /etc/mysql/mariadb.conf.d/50-server.cnf && \
    sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chown www-data:www-data -R /var/www/html && \
    rm /var/www/html/index.html

EXPOSE 80

COPY main.sh /
ENTRYPOINT ["/main.sh"]
