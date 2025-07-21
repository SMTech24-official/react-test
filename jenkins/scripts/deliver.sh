#!/usr/bin/env sh

echo 'Building the Vite app...'
set -x
npm run build
set +x

echo 'Starting the Vite dev server in the background...'
set -x
npm run dev &    # Vite's dev command
sleep 1
echo $! > .pidfile
set +x

echo 'Now...'
echo 'Visit http://localhost:3000 to see your Vite app in action.'
