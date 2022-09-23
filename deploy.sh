#!/bin/bash
BASE_DIR="/opt/advella"

FRONTEND_WEBAPP_DIR="advella-frontend-webapp"
FRONTEND_WEBAPPADMIN_DIR="advella-frontend-webapp-admin"
BACKEND_DIR="advella-backend"

# advella
if [ -d "$BASE_DIR" ]; then
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

cd /opt && docker compose -f docker-compose.prod.yml build
cd /opt && docker compose up -f docker-compose.prod.yml -d
