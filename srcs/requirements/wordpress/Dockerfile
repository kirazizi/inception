FROM debian:bullseye

RUN apt update && apt install -y

RUN apt install -y curl \
    php \
    php-fpm \
	php-mysql \
	mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY /tools/script.sh /

CMD ["./script.sh"]