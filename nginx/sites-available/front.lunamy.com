server {
    listen 80;
    server_name front.lunamy.com www.front.lunamy.com;
    root /var/www/front.lunamy.com;

    index index.html index.php;


    location ~* \.(js)$ {
            proxy_pass http://localhost:3000;
            proxy_set_header Host $host;
        }

   location / {
           proxy_pass http://localhost:3000;
           proxy_http_version 1.1;
           proxy_set_header Upgrade $http_upgrade;
           proxy_set_header Connection 'upgrade';
           proxy_set_header Host $host;
           proxy_cache_bypass $http_upgrade;
           proxy_set_header Host $host;
           try_files $uri $uri/ =404;
       }

    location ~ /\.ht {
        deny all;
    }

}