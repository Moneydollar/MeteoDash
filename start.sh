#!/bin/bash
cd ~/MeteoDash

# Start the frontend
cd ./meteo-dash
serve -s dist &
FRONTEND_PID=$!

# Start the backend
cd ../pyBackend
source /.venv/bin/activate  # Activate the virtual environment
python server.py &
BACKEND_PID=$!

# Launch the browser in kiosk mode
cd ..
chromium-browser --kiosk  "http://localhost:3000" &
BROWSER_PID=$!

# Wait for user interrupt to clean up processes
trap "kill $FRONTEND_PID $BACKEND_PID $BROWSER_PID" SIGINT
wait
