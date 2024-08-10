#!/bin/sh
FILE=wordpress
cd /var/www/html

if [ -d "$FILE" ]; then
    echo "*** $FILE exists"
else
    echo "*** $FILE not exists." 
    mkdir -p wordpress
    cd wordpress
    
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    php wp-cli.phar --info
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --allow-root 
    
    sleep 5
    wp config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --allow-root 
    sleep 5

    wp core install --url=https://mchiboub.42.fr --title="MCHIBOUB INCEPTION's" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root  
    wp user create $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --role=$WP_USER_ROLE --porcelain --allow-root 
fi

echo "WP END CONFIG" 

/usr/sbin/php-fpm7.3 -F
