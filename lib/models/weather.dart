import 'package:equatable/equatable.dart';
class Weather extends Equatable{
  final DateTime lastUpdated;
  final String location;
  final String weatherStatus;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final double windSpeed;
  final int humidity;
  final double visibility;
  final double pressure;
  final String sunrise;
  final String sunset;

  const Weather({
    this.lastUpdated, this.location, this.weatherStatus, this.temp,
    this. minTemp, this.maxTemp, this.windSpeed, this.humidity,
    this.visibility, this.pressure, this.sunrise, this. sunset
  });
  @override
  // TODO: implement props
  List<Object> get props => [
  lastUpdated,
  location,
  weatherStatus,
  temp,
  minTemp,
  maxTemp,
  windSpeed,
  humidity,
  visibility,
  pressure,
  sunrise,
  sunset
  ];
  factory Weather.fromJson(dynamic jsonObject){
    final consolidatedWeather = jsonObject['consolidated_weather'][0];
    return Weather(
      lastUpdated: DateTime.now(),
      location: jsonObject['title'] ?? '',
      weatherStatus: consolidatedWeather['weather_state_name'] ?? '',
      temp: consolidatedWeather['the_temp'] as double,
      minTemp: consolidatedWeather['min_temp'] as double,
      maxTemp: consolidatedWeather['max_temp'] as double,
      windSpeed: consolidatedWeather['wind_speed'] as double,
      humidity: consolidatedWeather['humidity'] as int,
      visibility: consolidatedWeather['visibility'] as double,
      pressure: consolidatedWeather['air_pressure'] as double,
      sunrise: jsonObject['sun_rise'] ,
      sunset: jsonObject['sun_set']
    );
  }
/*
consolidated_weather": [
    {
      "id": 5001437304061952,
      "weather_state_name": "Light Cloud",
      "weather_state_abbr": "lc",
      "wind_direction_compass": "SSE",
      "created": "2020-07-26T00:22:18.967978Z",
      "applicable_date": "2020-07-25",
      "min_temp": 22.825,
      "max_temp": 31.585,
      "the_temp": 32.2,
      "wind_speed": 4.388510937739601,
      "wind_direction": 165.1056162097894,
      "air_pressure": 1018.5,
      "humidity": 56,
      "visibility": 15.249070428696413,
      "predictability": 70
    },
    ...
 */
}