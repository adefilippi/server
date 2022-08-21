FROM ubuntu/nginx:latest

WORKDIR /var/www/

RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install -y vim; \
    apt install -y software-properties-common; \
    add-apt-repository ppa:ondrej/php; \
    apt-get install -y curl; \
    apt-get update -y;

# NGINX  CONF
COPY ./nginx/sites-available/ /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/local.lunamy.com /etc/nginx/sites-enabled/local.lunamy.com; \
    rm /etc/nginx/sites-enabled/default; \
    nginx -t;

# PHP-FPM CONF
RUN apt-get install -y php php-cli php-fpm php-json php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath; \
    apt-get update -y; \
    apt-get upgrade -y;

#POSTGRES SQL CONF
RUN apt install -y  postgresql postgresql-client postgresql-client-common postgresql-common postgresql-contrib phppgadmin php-pgsql
COPY ./postgres/conf/*  /etc/postgresql/14/main/
COPY ./postgres/phppgadmin/* /etc/phppgadmin/

#node js
RUN apt install -y build-essential; \
    curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash; \
    source ~/.bashrc; \
    nvm install 16; \
    npm install pm2@latest -g; \
    pm2 startup systemd; \

# POSTFIX CONF

COPY Docker/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
