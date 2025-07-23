#!/usr/bin/env sh

echo 'Building the Vite app...'
set -x
npm run build
set +x

echo 'Starting the production server using PM2...'
set -x

# Ensure PM2 is installed globally
npm install -g pm2

# Remove old process if exists
pm2 delete react-test || true

# Start with PM2
pm2 start npm --name react-test -- run serve --no-clipboard

# Persist process list
pm2 save

set +x

echo 'App running at http://localhost:3000'
