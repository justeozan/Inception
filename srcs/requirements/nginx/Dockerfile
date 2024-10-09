FROM debian:bullseye

RUN apt-get update && \
	apt-get install -y nginx \
	apt-get install -y openssl && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/inception.crt \
	-out /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=Lyon/L=Lyon/O=42/CN=avialle-.42.fr"

COPY /conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/wordpress && \
	chown -R www-data:www-data /var/www/wordpress
# ADD /var/www/html

EXPOSE 80 443

# -g : foreground using
# daemon off : Container wont exit abruptly after we power it on.
CMD ["nginx", "-g", "daemon off;"]