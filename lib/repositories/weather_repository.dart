import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_basic_withweatherapp/models/weather.dart';
const baseUrl = 'https://www.metaweather.com';
final locationUrl = (city) => '${baseUrl}/api/location/search/?query=${city}';
final weatherUrl = (locationId) => '${baseUrl}/api/location/${locationId}';
class WeatherRepository{
  WeatherRepository();

  Future<int> getLocationIdFromCity(String city) async{
    final response = await http.Client().get(locationUrl(city));
    if(response.statusCode == 200){
      final cities = jsonDecode(response.body) as List;
      final locationId = cities.first['woeid'] ?? Map();
      return (locationId);
    }
    else{
      throw Exception('Get location-id error');
    }
  }
// https://www.metaweather.com/api/location/search/?query=london
  Future<Weather> fetchWeather(int locationId) async{
    final response = await http.Client().get(weatherUrl(locationId));
    if(response.statusCode != 200){
      throw Exception('Fetch weather error');
    }
    final weatherJson = jsonDecode(response.body);
    return Weather.fromJson(weatherJson);
  }

  Future<Weather> getWeather(String city) async{
    final locationId = await getLocationIdFromCity(city);
    return fetchWeather(locationId);
  }
}