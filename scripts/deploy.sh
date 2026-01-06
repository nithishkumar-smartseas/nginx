#!/bin/bash
set -e

aws ecr get-login-password --region us-east-1 |
docker login --username AWS --password-stdin 991940085316.dkr.ecr.us-east-1.amazonaws.com

echo "Stopping the container if already exists"
docker stop nginx || true
docker rm nginx || true

echo "Pulling latest image from ECR"
docker pull 991940085316.dkr.ecr.us-east-1.amazonaws.com/nginx:latest

echo "Starting nginx container"
docker run -d \
  --name nginx \
  --network app-network \
  -p 80:80 \
  991940085316.dkr.ecr.us-east-1.amazonaws.com/nginx:latest