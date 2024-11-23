#!/bin/bash
# sudo apt update
# sudo apt install -y git
# sudo apt install nginx -y
# sudo apt install apt-transport-https curl -y

# sudo systemctl start nginx
# sudo systemctl enable nginx

# sudo apt install php php-cli php-common php-imap php-fpm php-snmp php-xml php-zip php-mbstring php-curl php-mysqli php-gd php-intl -y

# sudo apt install mariadb-server -y
# sudo systemctl start mariadb
# sudo systemctl enable mariadb

# sudo mysql -u root <<EOF
# CREATE USER 'freedebt'@'localhost' IDENTIFIED BY 'Shubham@94';
# CREATE DATABASE freedebt;
# GRANT ALL PRIVILEGES ON freedebt.* TO 'freedebt'@'localhost';
# FLUSH PRIVILEGES;
# EXIT;
# EOF

# sudo apt install zip -y
# sudo apt install unzip -y 
# cd /tmp/ && wget https://wordpress.org/latest.zip

# sudo unzip latest.zip -d /var/www
# sudo chown -R www-data:www-data /var/www/wordpress

sudo mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
# Define database credentials
DB_NAME="freedebt"
DB_USER="freedebt"
DB_PASSWORD="Shubham@94"
DB_HOST="localhost"

# Path to the wp-config.php file
WP_CONFIG="/var/www/wordpress/wp-config.php"

# Replace placeholders in wp-config.php with actual values
sudo sed -i "s/define( 'DB_NAME', '.*' );/define( 'DB_NAME', '$DB_NAME' );/" "$WP_CONFIG"
sudo sed -i "s/define( 'DB_USER', '.*' );/define( 'DB_USER', '$DB_USER' );/" "$WP_CONFIG"
sudo sed -i "s/define( 'DB_PASSWORD', '.*' );/define( 'DB_PASSWORD', '$DB_PASSWORD' );/" "$WP_CONFIG"
sudo sed -i "s/define( 'DB_HOST', '.*' );/define( 'DB_HOST', '$DB_HOST' );/" "$WP_CONFIG"

# Ensure correct file permissions
sudo chown www-data:www-data "$WP_CONFIG"
sudo chmod 644 "$WP_CONFIG"