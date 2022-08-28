server {
    listen 8000;
    listen [::]:8000 default_server;
    server_name phpgadmin.lunamy.com www.phpgadmin.lunamy.com;
    root /usr/share/phppgadmin;

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