FROM --platform="linux/arm64" php:7.4.25-fpm

RUN docker-php-ext-install pdo pdo_mysql sockets

RUN apt-get update && apt-get install -y \
     build-essential \
     vim \
     git \
     curl \
     socat

RUN docker-php-ext-install pdo_mysql

CMD socat UNIX-LISTEN:/var/run/dev-test/sock -

WORKDIR /php
COPY . .