server {
    listen 80;
    server_name local.lunamy.com www.local.lunamy.com;
    root /var/www/local.lunamy.com;

    index index.php;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.1-fpm.sock;
     }

    location ~ /\.ht {
        deny all;
    }

}