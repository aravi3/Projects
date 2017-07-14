import React from 'react';

class Weather extends React.Component {
  constructor () {
    super();
    this.state = { weather: "" };
    this.pullWeather = this.pullWeather.bind(this);
  }

  pullWeather () {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', `http://api.openweathermap.org/data/2.5/weather?lat=${this.latitude}&lon=${this.longitude}&appid=19e0c5ccc9159302cc359b69a0decbdd`);
    xhr.onload = function() {
      if (xhr.status >= 200 && xhr.status < 400) {
        //console.log (JSON.parse(xhr.responseText).main.temp);
        this.setState( {weather: JSON.parse(xhr.responseText) });
        console.log("Weather request made");
      } else {
        console.log("Print all the errors fit to print");
      }
    }.bind(this);

    xhr.onerror = function() {
      console.log("Error");
    };

    xhr.send();
  }

  componentDidMount() {
    const currentLocation = navigator.geolocation;
    currentLocation.getCurrentPosition( (position) => {
      this.latitude = position.coords.latitude;
      this.longitude = position.coords.longitude;
      console.log(this.latitude);
      this.pullWeather();
    });
  }

  render () {
    return (
      <div className="weather">
        <section>
        <h1> My Sky Report </h1>


        <hr></hr>
        <h2> { this.state.weather.name }</h2>
        <hr></hr>
        <h2> { this.state.weather.main ? ((this.state.weather.main.temp) * 9/ 5 - 459.67).toFixed(1) : "Loading"}</h2>
        </section>
      </div>
    );
  }
}

export default Weather;
