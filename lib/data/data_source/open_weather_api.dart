import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/model/weather.dart';

class OpenWeatherApi {
  Future<Weather> getWeatherInfo(String query) async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=95114a1e948559e010396b4debdf1672');
    http.Response response = await http.get(url);

    String jsonString = response.body;
    Map<String, dynamic> json = jsonDecode(jsonString);
    return Weather.fromJson(json); //통째로 가져옴.
  }
}
