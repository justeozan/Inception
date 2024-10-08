FROM debian:bullseye

RUN	apt-get update && \
	apt-get install -y php-fpm php-mysqli mariadb-client\
	curl

COPY /conf/wp-config.sh /

# ADD . /Inception/srcs/requirements/wordpress/
# WORKDIR /wordpress
# RUN npm install

#exemple
# EXPOSE 2368
# VOLUME /wordpress

RUN chmod +x wp-config.sh

ENTRYPOINT ["./wp-config.sh"]