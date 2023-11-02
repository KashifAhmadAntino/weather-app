
enum WeatherType { smoke, clear, sunny, rain, overcast }

WeatherType getWeatherTypeFromString(String weatherString) {
  switch (weatherString) {
    case 'sunny':
      return WeatherType.sunny;
    case 'cloudy':
      return WeatherType.clear;
    case 'rainy':
      return WeatherType.rain;
    case 'snowy':
      return WeatherType.overcast;
    case 'smoke':
      return WeatherType.smoke;
    default:
      return WeatherType
          .sunny; // Default to sunny if the input string is unknown
  }
}
