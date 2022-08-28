#!/bin/bash

apt-get install varnish hitch certbot ufw -y
cp /install/varnish/varnish.service /lib/systemd/system/varnish.service
cp /install/varnish/default.vcl /etc/varnish/default.vcl
cp /install/varnish/varnish.conf /etc/default/varnish

varnishd -V
hitch --version
