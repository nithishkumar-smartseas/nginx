#!/bin/bash
set -e

echo "Copying nginx.conf to /etc/nginx/"

cp -f "$PWD/nginx.conf" /etc/nginx/nginx.conf
