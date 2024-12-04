#!/bin/bash
cd ~/MeteoDash
cd ./meteo-dash
serve -s dist &
cd ..
python ./pyBackend/server.py &
chromium-browser --kiosk "http://localhost:3000" &
echo "Setup Complete"


