#!/bin/sh

echo "Bringing down Client"
docker compose down nginx

echo "Bringing down API"
docker compose down mm-api

cd client
#echo "Removing build dir"
#rm -rf ./build
#echo "Installing node"
#npm ci

echo "Building Client"
npm run build:local

chmod 755 build

cd build

chmod 644 ./*

cd ../..

echo "Starting Client"
docker compose --env-file ./config/.env.local up --build
