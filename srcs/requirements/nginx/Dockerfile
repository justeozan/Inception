FROM debian:bullseye

RUN apt-get update

ADD . /Inception/srcs/requirements/nginx/
WORKDIR /nginx
RUN npm install

#exemple
EXPOSE 2368
VOLUME /nginx

CMD npm run start