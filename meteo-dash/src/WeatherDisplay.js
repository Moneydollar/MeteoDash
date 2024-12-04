// src/WeatherDisplay.js
import React from 'react';

function WeatherDisplay({ weather }) {
  return (
    <div className="weather">
      <h1>Weather Kiosk</h1>
      <div className="weather-info">
        <p>🌡️ Temperature: {weather.temperature} °C</p>
        <p>💧 Humidity: {weather.humidity} %</p>
        <p>📊 Pressure: {weather.pressure} hPa</p>
      </div>
    </div>
  );
}

export default WeatherDisplay;
