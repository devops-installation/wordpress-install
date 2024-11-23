#!/bin/bash
# Define variables
DOMAIN="_"         
WWW_DOMAIN="www.example.com" 
ROOT_DIR="/var/www/wordpress"

sudo cat > /etc/nginx/sites-available/wordpress <<EOL
server {
    listen 80;
    server_name $DOMAIN;

    root $ROOT_DIR;
    index index.php index.html index.htm;

    # Logging
    access_log /var/log/nginx/wordpress_access.log;
    error_log /var/log/nginx/wordpress_error.log;

    # WordPress specific rules
    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }

    # Handle PHP files
    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php*-fpm.sock;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOL
sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/
sudo nginx -t