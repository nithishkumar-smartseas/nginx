#!/bin/bash
set -e

aws ecr get-login-password --region us-east-1 | \
docker login --username AWS --password-stdin 991940085316.dkr.ecr.us-east-1.amazonaws.com

docker network create app-network || true

docker stop nginx || true
docker rm nginx || true

docker pull 991940085316.dkr.ecr.us-east-1.amazonaws.com/nginx:latest

docker run -d \
  --name nginx \
  --network app-network \
  -p 80:80 \
  991940085316.dkr.ecr.us-east-1.amazonaws.com/nginx:latest
