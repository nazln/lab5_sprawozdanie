#!/bin/sh
# Pobiera IP i hostname w runtime i wstawia do index.html

IP=$(hostname -i 2>/dev/null | awk '{print $1}')
HOSTNAME=$(hostname)
VERSION=${APP_VERSION:-"unknown"}

sed -i "s/SERVER_IP/${IP}/g"             /usr/share/nginx/html/index.html
sed -i "s/SERVER_HOSTNAME/${HOSTNAME}/g" /usr/share/nginx/html/index.html

echo "=== Aplikacja uruchomiona ==="
echo "IP:       $IP"
echo "Hostname: $HOSTNAME"
echo "Wersja:   $VERSION"

exec nginx -g "daemon off;"