#!/bin/sh
set -e

echo "Start PHP-FPM"
service php8.1-fpm start
echo "Start PostgreSQL"
service postgresql start
service --status-all