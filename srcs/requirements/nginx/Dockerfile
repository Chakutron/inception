FROM debian:buster

RUN apt-get update && apt-get upgrade -y 

RUN apt-get install -y nginx openssl

RUN	mkdir -p /etc/nginx/ssl
RUN openssl req \
            -x509 \
            -nodes \
            -days 365 \
            -newkey rsa:2048 \
			-out /etc/nginx/ssl/inception.crt \
			-keyout /etc/nginx/ssl/inception.key \
            -subj '/C=FR/ST=Occitanie/L=Perpignan/O=42/OU=42Perpignan/CN=mchiboub.42.fr/UID=TTT'

COPY ./conf/default    /etc/nginx/sites-available/

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
