server {
    #listen 8000;
    #listen [::]:8000 default_server;
    #listen 443 ssl http2 default_server;
    #listen [::]:443 ssl http2 default_server;
    ssl_certificate           /etc/hitch/lunamy.com.crt;
    ssl_certificate_key       /etc/hitch/lunamy.com.key;
    server_name local.lunamy.com www.local.lunamy.com;
    root /var/www/local.lunamy.com;

    ssl_session_cache  builtin:1000  shared:SSL:10m;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers HIGH:!aNULL:!eNULL:!EXPORT:!CAMELLIA:!DES:!MD5:!PSK:!RC4;
    ssl_prefer_server_ciphers on;
    ssl_dhparam /etc/hitch/dhparam.pem;

    index index.html;

    location / {
        try_files $uri $uri/ =404;
        proxy_set_header X-Real-IP  $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto https;
        proxy_set_header X-Forwarded-Port 443;
        proxy_set_header Host $host;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.1-fpm.sock;
     }

    location ~ /\.ht {
        deny all;
    }

}