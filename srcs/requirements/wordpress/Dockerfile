FROM debian:buster
RUN apt-get update && apt-get upgrade -y 

RUN apt install unzip php curl wget php-mysqli php-fpm php-cgi php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
RUN apt install default-mysql-client -y
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
RUN mkdir /run/php

COPY ./tools/install.sh /home/
RUN chmod 777 /home/install.sh

ENTRYPOINT ["/home/install.sh" ] 
