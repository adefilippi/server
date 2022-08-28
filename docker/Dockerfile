FROM ubuntu/nginx:latest

WORKDIR /var/www/

#RUN  -y; \
#    useradd -mr -g 0 -p password -s /bin/bash -p $(openssl passwd -1 'password') anthony; \
#    usermod -aG sudo anthony;

#COPY ./install/entrypoint/99-serveur.sh /docker-entrypoint.d/


RUN mkdir -p /install
COPY ./install /install/

RUN  chmod +x /install/scripts/install.sh; \
    /install/scripts/install.sh

#COPY www/varnish.service  /lib/systemd/system/varnish.service
#COPY www/default.vcl /etc/varnish/default.vcl