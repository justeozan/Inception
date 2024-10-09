FROM debian:bullseye

RUN	apt-get update && \
	apt-get install -y mariadb-server && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

COPY /conf/script.sh /

RUN chmod +x script.sh

ENTRYPOINT ["./script.sh"]

CMD ["mysqld"]