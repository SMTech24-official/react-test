#!/usr/bin/env sh

echo 'Building the Vite app...'
set -x
npm run build
set +x

echo 'Starting the production server using PM2...'
set -x
npm start
sleep 1
# Save PM2's process ID file manually if needed; otherwise use `pm2 delete` in kill.sh
set +x

echo 'Now...'
echo 'Visit http://localhost:3000 to see your production React app running.'
