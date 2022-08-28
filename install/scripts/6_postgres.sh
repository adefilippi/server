#!/bin/bash

apt install -y  postgresql postgresql-client postgresql-client-common postgresql-common postgresql-contrib phppgadmin php-pgsql
cp /install/postgres/conf/*  /etc/postgresql/14/main/
cp /install/postgres/phppgadmin/* /etc/phppgadmin/