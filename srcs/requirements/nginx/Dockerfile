FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt -subj "/C=MO/L=khouribga/CN=sbzizal.42.fr"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

