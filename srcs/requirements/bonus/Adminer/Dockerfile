FROM debian:bullseye

# install php prerequisites
# https://wordpress.com/support/php-environment/
RUN apk update && \
  	apk add --no-cache \
	curl \
	less \
	mariadb-client \
	php8 \
	php8-fpm \
	php8-common \
	php8-session \
	php8-iconv \
	php8-json \
	php8-gd \
	php8-curl \
	php8-xml \ 
	php8-mysqli \
	php8-imap \
	php8-pdo \
	php8-pdo_mysql \
	php8-soap \
	php8-posix \
	php8-gettext \
	php8-ldap \
	php8-ctype \
	php8-dom \
	php8-simplexml

# Install packages without caching, saving space.
# Install `curl`, a command-line tool for transferring data with URLs.
# Install `less`, a file pager that allows viewing (but not editing) file contents.
# Install the MariaDB client for interacting with MariaDB databases.
# Install PHP version 8.
# Install PHP FastCGI Process Manager for handling PHP requests.
# Install common PHP files and libraries.
# Enable session management support in PHP.
# Support for character set conversion in PHP.
# Install JSON extension for encoding and decoding JSON in PHP.
# Install GD library for image processing.
# Install CURL extension for PHP to make HTTP requests.
# Install XML extension for PHP.
# Install MySQLi extension for accessing MySQL databases.
# Install IMAP extension for email handling in PHP.
# Install PDO extension for database access in a consistent manner.
# Enable PDO support for MySQL databases.
# Install SOAP extension for web services in PHP.
# Install POSIX functions for compatibility with Unix-like systems.
# Install Gettext support for internationalization in PHP.
# Install LDAP extension for directory services.
# Install ctype functions for character type checking.
# Install DOM extension for XML manipulation.
# Install SimpleXML extension for easier XML parsing.

# Run adminer and create html directory, move the adminer directory, and add a default user
RUN \
	curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
	mkdir -p /var/www/html &&\
	mv ./adminer-4.8.1.php /var/www/html/index.php && \
	adduser -u 82 -D -S -G www-data www-data

# Copy PHP-FPM configuration file to the container
COPY /conf/www.conf /etc/php8/php-fpm.d/www.conf

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set stop signal to gracefully terminate the process
STOPSIGNAL SIGQUIT

# Run PHP-FPM in the foreground
CMD ["php-fpm8", "nodaemonize"]