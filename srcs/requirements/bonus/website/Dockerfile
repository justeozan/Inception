FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y &&\
	apt-get install -y nginx

COPY /conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir /var/www/website

RUN chown -R www-data:www-data /var/www/website && \
	chmod -R 777 /var/www/website && \
	chmod -R 777 /var/www

COPY src /var/www/website
RUN chmod +x /var/www/website/index.html


CMD ["nginx", "-g", "daemon off;"]