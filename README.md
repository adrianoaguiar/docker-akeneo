docker-akeneo
=============

Akeneo docker image.

Usage
-----

Build the image using:

    docker build -t akeneo .

Run a container:

    docker run --name mysql \
     -e MYSQL_ROOT_PASSWORD=root \
     -e MYSQL_USER=akeneo_pim \
     -e MYSQL_PASSWORD=akeneo_pim \
     -e MYSQL_DATABASE=akeneo_pim \
     -d mysql
     
    docker run -e LINK_ALIAS=mysql \
     --link mysql:mysql \
      -p 80:80 \
      -d akeneo
