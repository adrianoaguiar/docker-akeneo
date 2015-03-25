#!/bin/bash
set -e

cd /var/www/pim-community-standard-v1.3.2-icecat
sed -i 's/localhost/'$LINK_ALIAS'/' app/config/parameters.yml
php app/console cache:clear --env=prod
php app/console pim:install --env=prod
chown -R www-data:www-data /var/www

apache2ctl -D FOREGROUND

exit 0
