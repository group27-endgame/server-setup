#!/bin/bash
BASE_DIR="/opt/advella"

FRONTEND_WEBAPP_DIR="advella-frontend-webapp"
FRONTEND_WEBAPPADMIN_DIR="advella-frontend-webapp-admin"
BACKEND_DIR="advella-backend"

# advella
if ! [ -d "$BASE_DIR" ]; then
  mkdir $BASE_DIR
fi

# backend
if [ -d "$BASE_DIR/$BACKEND_DIR" ]; then
  cd $BASE_DIR/$BACKEND_DIR && git pull
else
  cd $BASE_DIR && git clone https://github.com/group27-endgame/$BACKEND_DIR.git
fi

# frontend-webapp
if [ -d "$BASE_DIR/$FRONTEND_WEBAPP_DIR" ]; then
  cd $BASE_DIR/$FRONTEND_WEBAPP_DIR && git pull
else
  cd $BASE_DIR && git clone https://github.com/group27-endgame/$FRONTEND_WEBAPP_DIR.git
fi

# frontend-webapp-admin
if [ -d "$BASE_DIR/$FRONTEND_WEBAPPADMIN_DIR" ]; then
  cd $BASE_DIR/$FRONTEND_WEBAPPADMIN_DIR && git pull
else
  cd $BASE_DIR && git clone https://github.com/group27-endgame/$FRONTEND_WEBAPPADMIN_DIR.git
fi

cd $BASE_DIR && docker compose -f docker-compose.prod.yml build
cd $BASE_DIR && docker compose -f docker-compose.prod.yml up -d

# cleaning of old images, containers, volumes and cache
echo "y" | docker container prune 
echo "y" | docker image prune 
echo "y" | docker volume prune 
echo "y" | docker builder prune
