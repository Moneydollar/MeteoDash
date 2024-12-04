from flask import Flask, jsonify
from flask_cors import CORS  # Import CORS
import random
import time

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# Your weather API code

# Simulated weather data
weather_data = [
    {"temperature": 22.4, "humidity": 60, "pressure": 1012},
    {"temperature": 21.8, "humidity": 62, "pressure": 1011},
    {"temperature": 23.0, "humidity": 59, "pressure": 1013},
    {"temperature": 22.1, "humidity": 61, "pressure": 1010},
    {"temperature": 21.5, "humidity": 63, "pressure": 1014},
]

# API route to send simulated weather data
@app.route('/api/weather')
def get_weather():
    # Simulate a random selection of weather data
    current_weather = random.choice(weather_data)
    return jsonify(current_weather)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
