#!/bin/bash
sudo apt update
sudo apt install -y git
sudo apt install nginx -y
sudo apt install apt-transport-https curl -y
sudo systemctl start nginx
sudo systemctl enable nginx
apt install php php-cli php-common php-imap php-fpm php-snmp php-xml php-zip php-mbstring php-curl php-mysqli php-gd php-intl -y
apt install mariadb-server -y
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql -u root
CREATE USER 'freedebt'@'localhost' IDENTIFIED BY 'Shubham@94';
CREATE DATABASE freedebt;
GRANT ALL PRIVILEGES ON freedebt.* TO 'freedebt'@'localhost';
FLUSH PRIVILEGES;
EXIT;

sudo apt install zip -y
sudo apt install unzip -ycd /tmp/ && wget https://wordpress.org/latest.zip

sudo unzip latest.zip -d /var/www
sudo chown -R www-data:www-data /var/www/wordpress

sudo mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
