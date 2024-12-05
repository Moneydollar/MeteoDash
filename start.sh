#!/bin/bash
cd ~/MeteoDash

# Start the frontend
cd ./meteo-dash
serve -s dist &
FRONTEND_PID=$!

# Start the backend
cd ../pyBackend
# Activate the virtual environment
if [ -f .venv/bin/activate ]; then
    source .venv/bin/activate
    echo "Python executable: $(which python)"
    echo "Active environment: $VIRTUAL_ENV"
    python server.py &
    BACKEND_PID=$!
else
    echo "Virtual environment not found in ~/MeteoDash/pyBackend/.venv"
    exit 1
fi

# Launch the browser in kiosk mode
cd ..
chromium-browser --kiosk "http://localhost:3000" &
BROWSER_PID=$!

# Wait for user interrupt to clean up processes
trap "kill $FRONTEND_PID $BACKEND_PID $BROWSER_PID" SIGINT
wait
