#!/usr/bin/env sh
set -e

echo 'Building the Vite app...'
set -x
npm run build
set +x

echo 'Starting the production server using PM2...'
set -x
npm install -g pm2

# Optional: export PM2_HOME=/home/jenkins/.pm2

pm2 delete react-test || true
pm2 start npm --name react-test -- run serve --no-clipboard
pm2 save
set +x

echo 'App running at http://localhost:3000'
