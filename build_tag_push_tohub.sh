#!/usr/bin/env bash
# This script will build,tag and push image to Docker Hub

#Assumes this is built #docker build --tag=app .

docker build -t karnali/python-click-app:python-click-app .
dockerpath="karnali/python-click-app"

# Authenticate & Tag
echo "Docker ID and Image: $dockerpath"
docker login &&\
    docker image tag app $dockerpath

#List all docker images
docker image ls

# Push Image. #docker image push $dockerpath 
docker image push karnali/python-click-app
