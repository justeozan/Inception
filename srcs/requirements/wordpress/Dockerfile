FROM debian:bullseye

# Update and Install prerequisites
RUN	apt-get update && apt-get upgrade -y && \
	apt-get install -y \
	php \
	php7.4 \
	php7.4-fpm \
	php7.4-mysql \
	mariadb-client \
	curl \
	unzip \
	wget \
	netcat

COPY /conf/wp-conf.sh /

RUN chmod +x wp-conf.sh

ENTRYPOINT ["./wp-conf.sh"]
