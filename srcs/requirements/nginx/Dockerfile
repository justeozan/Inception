FROM debian:bullseye

# -y : "yes" for accept all steps
RUN apt-get update && apt upgrade && apt install -y nginx

ADD . /Inception/srcs/requirements/nginx/
WORKDIR /nginx
RUN npm install

#exemple
EXPOSE 2368
VOLUME /nginx

# -g : foreground using
# daemon off : Container wont exit abruptly after we power it on.
CMD nginx -g daemon off