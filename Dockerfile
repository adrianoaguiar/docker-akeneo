# Akeneo PIM
#
# VERSION 0.0.1

FROM ubuntu:trusty
MAINTAINER Vincent ARROCENA <varrocen@gmail.com>

# Install Apache and PHP
RUN apt-get update \
&& apt-get install -y apache2 \
 libapache2-mod-php5 \
 php5-cli \
 php5-mysql \
 php5-intl \
 php5-curl \
 php5-gd \
 php5-mcrypt \
 php5-apcu \
 php5-mongo \
&& php5enmod mcrypt \
&& a2enmod rewrite

# Setting up PHP configuration
RUN sed -i -e "s/^memory_limit =.*/memory_limit = 512M/" /etc/php5/apache2/php.ini \
&& sed -i -e "s/;date.timezone =/date.timezone = Europe\/Paris/" /etc/php5/apache2/php.ini \
&& sed -i -e "s/^memory_limit =.*/memory_limit = 768M/" /etc/php5/cli/php.ini \
&& sed -i -e "s/;date.timezone =/date.timezone = Europe\/Paris/" /etc/php5/cli/php.ini

# Installing Akeneo PIM
ADD pim-community-standard-v1.3-latest-icecat.tar.gz /var/www
RUN cd /var/www/pim-community-standard-v1.3.2-icecat \
&& php app/console cache:clear --env=prod \
&& php app/console pim:install --env=prod

VOLUME /var/www

EXPOSE 80

CMD apache2ctl -D FOREGROUND
