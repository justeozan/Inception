FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y &&\
	apt-get install -y nginx

COPY /conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir /var/www/website

RUN chown -R www-data:www-data /var/www/website
RUN chmod -R 745 /var/www/website

CMD ["nginx", "-g", "daemon off;"]