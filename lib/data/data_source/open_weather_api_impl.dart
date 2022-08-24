import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/data_source/WeatherDto.dart';
import 'package:weather_app/data/data_source/open_weather_api.dart';

class OpenWeatherApiImpl implements OpenWeatherApi {
  Future<WeatherDto> getWeatherInfo(String query) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=95114a1e948559e010396b4debdf1672');
    http.Response response = await http.get(url);

    String jsonString = response.body;
    Map<String, dynamic> json = jsonDecode(jsonString);
    return WeatherDto.fromJson(json); //통째로 가져옴.
  }
}
