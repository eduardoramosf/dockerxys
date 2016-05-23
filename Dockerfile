FROM eboraas/apache-php

# Install packages
RUN apt-get update && apt-get install -y wget git freetds-dev \
  freetds-bin tdsodbc unixodbc unixodbc-dev ldap-utils \
  imagemagick libmagickwand-dev libpcre3 libpcre3-dev \
  libaio1 php5 php5-mcrypt php5-dev php5-mysql php5-odbc \
  php5-pgsql php5-sqlite php5-sybase php5-ldap php5-apcu libapache2-mod-php5 \
  php5-redis php5-gearman php5-imagick php5-curl php5-gd php-pear nodejs npm

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g n gulp phantomjs && n latest

COPY conf/freetds.conf /etc/freetds/freetds.conf

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/var/www/html"]
