docker-akeneo
=============

Akeneo docker image.

Usage
-----

Build the image using:

    docker build -t akeneo .

Run containers:

    docker run --name mysql \
     -e MYSQL_ROOT_PASSWORD=root \
     -e MYSQL_USER=akeneo_pim \
     -e MYSQL_PASSWORD=akeneo_pim \
     -e MYSQL_DATABASE=akeneo_pim \
     -d mysql
     
    docker run --name akeneo \
     -e LINK_ALIAS=mysql \
     --link mysql:mysql \
     -p 80:80 \
     -d akeneo

Show the Akeneo installation process:

    docker logs --follow akeneo

Go to http://localhost/ and log in with admin/admin.
