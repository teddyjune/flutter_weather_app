import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/weather.dart';

class WeatherApi {
  Future<String> getCityName(String query) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=95114a1e948559e010396b4debdf1672');
    http.Response response = await http.get(url);

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    if (json['name'] == null) {
      return '';
    }
    String cityName = json['name'];
    return cityName;
  }

  Future<Iterable> getWeather(String query) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=95114a1e948559e010396b4debdf1672');
    http.Response response = await http.get(url);

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    if (json['weather'] == null) {
      return {};
    }
    Iterable weather = json['weather'];
    return weather.map((e) => Weather.fromJson(e)).toList();
  }

  Future<Map<String, dynamic>> getTemp(String query) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=95114a1e948559e010396b4debdf1672');
    http.Response response = await http.get(url);

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    if (json['temp'] == null) {
      return {};
    }
    Map<String, dynamic> temperature = json['main'];
    return temperature;
  }

  Future<String> getIcon(String query) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=95114a1e948559e010396b4debdf1672');
    http.Response response = await http.get(url);

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    if (json['icon'] == null) {
      return '';
    }
    String icon = json['icon'];
    return icon;
  }
}
