#!/bin/bash

mkdir -p /etc/nginx/sites-available/
cp /install/nginx/sites-available/* /etc/nginx/sites-available/
#ln -s /etc/nginx/sites-available/front.lunamy.com /etc/nginx/sites-enabled/front.lunamy.com
ln -s /etc/nginx/sites-available/local.lunamy.com /etc/nginx/sites-enabled/local.lunamy.com
rm /etc/nginx/sites-enabled/default
nginx -t