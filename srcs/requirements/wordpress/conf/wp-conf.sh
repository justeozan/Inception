#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/wordpress
chmod -R 755 /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress

ping_mariadb_container() {
	nc -zv mariadb 3306 > /dev/null
	return $?
}

start_time=$(date +%s)
end_time=$((start_time + 20))

while [ $(date +%s) -lt $end_time ]; do
	ping_mariadb_container
	if [ $? -eq 0 ]; then
		echo "[-----MARIADB IS UP AND RUNNING-----"]
		break
	else
		echo "[-----WAITING FOR MARIADB-----"]
		sleep 1
	fi
done

if [ $(date +%s) -ge $end_time ]; then
	echo "[-----MARIADB IS NOT RESPONDING-----"]
fi

# Downloads the WordPress core files
wp core download --allow-root

# Configures the wp-config.php file with the database information
wp core config	--dbhost=mariadb:3306 \
				--dbname="$MYSQL_DB" \
				--dbuser="$MYSQL_USER" \
				--dbpass="$MYSQL_PASSWORD" \
				--allow-root

# Installs WordPress with the provided URL, site title, and admin credentials
wp core install	--url="$DOMAIN_NAME" \
				--title="$WP_TITLE" \
				--admin_user="$WP_ADMIN_N" \
				--admin_password="$WP_ADMIN_P" \
				--admin_email="$WP_ADMIN_E" \
				--allow-root

# Creates an additional administrator user
wp user create	"$WP_U_NAME" "$WP_U_EMAIL" \
				--user_pass="$WP_U_PASS" \
				--role=administrator \
				--allow-root

sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php
exec php-fpm7.4 -F