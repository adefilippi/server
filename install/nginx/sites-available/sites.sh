#!/bin/bash

files=$(find /tmp/nginx/sites-available -not -name "*.sh" -not -name ".")
for file in $files; do
    if [ -f $file ]; then
       filename=$(basename $file)
       cp /tmp/nginx/sites-available/${filename} /etc/nginx/sites-available/
       ln -s /etc/nginx/sites-available/${filename} /etc/nginx/sites-enabled/${filename}
    fi
done
ls -la /etc/nginx/sites-available/
ls -la /etc/nginx/sites-enabled/
nginx -t
service nginx reload