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

# Install Redis Object Cache plugin
# RUN curl -o /tmp/redis-cache.zip -fSL "https://downloads.wordpress.org/plugin/redis-cache.latest-stable.zip" && \
# 	unzip /tmp/redis-cache.zip -d /var/www/html/wp-content/plugins/ && \
# 	rm /tmp/redis-cache.zip

ENTRYPOINT ["./wp-conf.sh"]
