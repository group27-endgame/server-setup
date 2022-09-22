#!/bin/bash
BASE_DIR="/opt/advella"

FRONTEND_WEBAPP_DIR="$BASE_DIR/advella-frontend-webapp"
FRONTEND_WEBAPPADMIN_DIR="$BASE_DIR/advella-frontend-webapp-admin"
BACKEND_DIR="$BASE_DIR/advella-backend"

GIT_ADVELLA_BACKEND="https://github.com/group27-endgame/advella-backend.git"
GIT_ADVELLA_FRONTEND="https://github.com/group27-endgame/advella-frontend-webapp.git"
GIT_ADVELLA_FRONTEND_ADMIN="https://github.com/group27-endgame/advella-frontend-webapp-admin.git"

# advella
if [ -d "$BASE_DIR" ]; then
  mkdir $BASE_DIR
fi

# backend
if [ -d "$BACKEND_DIR" ]; then
  cd $BACKEND_DIR && git pull
else
  cd $BASE_DIR && git clone $GIT_ADVELLA_BACKEND
fi

# frontend-webapp
if [ -d "$BACKEND_DIR" ]; then
  cd "$BACKEND_DIR" && git pull
else
  cd $BASE_DIR && git $GIT_ADVELLA_FRONTEND
fi

# frontend-webapp-admin
if [ -d "$BACKEND_DIR" ]; then
  cd "$BACKEND_DIR" && git pull
else
  cd $BASE_DIR && git clone $GIT_ADVELLA_FRONTEND_ADMIN
fi

cd $BASE_DIR && docker compose up -f docker-compose.prod.yml -d
