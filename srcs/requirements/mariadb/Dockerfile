FROM debian:bullseye

RUN apt-get update

ADD . /Inception/srcs/requirements/mariadb/
WORKDIR /mariadb
RUN npm install

#exemple
EXPOSE 2368
VOLUME /mariadb

CMD npm run start