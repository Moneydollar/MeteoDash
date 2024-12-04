import React, { useEffect, useState } from 'react';
import WeatherDisplay from './WeatherDisplay';
import './App.css';

function App() {
  const [weather, setWeather] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/weather");
        const data = await response.json();
        setWeather(data);
      } catch (error) {
        console.error("Error fetching weather data:", error);
      }
    };
    fetchData();
    const interval = setInterval(fetchData, 5000); // Update every 5 seconds
    return () => clearInterval(interval);
  }, []);

  if (!weather) {
    return <div>Loading...</div>;
  }

  return (
    <div className="App">
      <WeatherDisplay weather={weather}/>
    </div>
  );
}

export default App;
