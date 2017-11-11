FROM php:7.1.11-fpm-alpine

MAINTAINER Darien Hernandez <dohernandez@gmail.com>

ENV HOME /app
WORKDIR /app

RUN curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony && \
    echo "date.timezone = Europe/Berlin" >> /usr/local/etc/php/conf.d/symfony.ini

ENTRYPOINT ["symfony"]

CMD []
