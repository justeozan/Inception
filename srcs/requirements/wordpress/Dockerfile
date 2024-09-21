FROM debian:bullseye

RUN apt-get update && worpress install

ADD . /Inception/srcs/requirements/wordpress/
WORKDIR /wordpress
RUN npm install

#exemple
EXPOSE 2368
VOLUME /wordpress

CMD npm run start